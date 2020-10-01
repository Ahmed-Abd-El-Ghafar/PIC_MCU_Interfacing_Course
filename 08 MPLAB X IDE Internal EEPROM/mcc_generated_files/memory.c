/**
  MEMORY Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    memory.c

  @Summary
    This is the generated driver implementation file for the MEMORY driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This file provides implementations of driver APIs for MEMORY.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.5
        Device            :  PIC18F46K20
        Driver Version    :  2.03
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.20 and above
        MPLAB             :  MPLAB X 5.40
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

/**
  Section: Included Files
*/

#include <xc.h>
#include "memory.h"


/**
  Section: Flash Module APIs
*/

uint8_t FLASH_ReadByte(uint32_t flashAddr)
{
    TBLPTRU = (uint8_t)((flashAddr & 0x00FF0000) >> 16);
    TBLPTRH = (uint8_t)((flashAddr & 0x0000FF00)>> 8);
    TBLPTRL = (uint8_t)(flashAddr & 0x000000FF);

    asm("TBLRD");

    return (TABLAT);
}

uint16_t FLASH_ReadWord(uint32_t flashAddr)
{
    return ((((uint16_t)FLASH_ReadByte(flashAddr+1))<<8)|(FLASH_ReadByte(flashAddr)));
}

void FLASH_WriteByte(uint32_t flashAddr, uint8_t *flashRdBufPtr, uint8_t byte)
{
    uint32_t blockStartAddr = (uint32_t)(flashAddr & ((END_FLASH-1) ^ (ERASE_FLASH_BLOCKSIZE-1)));
    uint8_t offset = (uint8_t)(flashAddr & (ERASE_FLASH_BLOCKSIZE-1));
    uint8_t i;

    // Entire row will be erased, read and save the existing data
    for (i=0; i<ERASE_FLASH_BLOCKSIZE; i++)
    {
        flashRdBufPtr[i] = FLASH_ReadByte((blockStartAddr+i));
    }

    // Load byte at offset
    flashRdBufPtr[offset] = byte;

    // Writes buffer contents to current block
    FLASH_WriteBlock(blockStartAddr, flashRdBufPtr);
}

int8_t FLASH_WriteBlock(uint32_t writeAddr, uint8_t *flashWrBufPtr)
{
    uint32_t blockStartAddr  = (uint32_t )(writeAddr & ((END_FLASH-1) ^ (ERASE_FLASH_BLOCKSIZE-1)));
    uint8_t GIEBitValue = INTCONbits.GIE;     // Save interrupt enable
    uint8_t i, j, numberOfWriteBlocks;
    uint16_t WriteBlkOffset = 0;
    
    // Flash write must start at the beginning of a row
    if(writeAddr != blockStartAddr)
    {
        return -1;
    }
    
    // Total number of write blocks present in one erase block
    numberOfWriteBlocks = ERASE_FLASH_BLOCKSIZE/WRITE_FLASH_BLOCKSIZE;   

    // Block erase sequence
    FLASH_EraseBlock(writeAddr); 

    for(j=0; j<numberOfWriteBlocks; j++)
    {
        // Calculate starting offset of Write Block
        WriteBlkOffset = (uint16_t)j * WRITE_FLASH_BLOCKSIZE;
        
        // Block Write sequence
        TBLPTRU = (uint8_t)(((writeAddr + WriteBlkOffset) & 0x00FF0000) >> 16);    // Load Table point register
        TBLPTRH = (uint8_t)(((writeAddr + WriteBlkOffset) & 0x0000FF00) >> 8);
        TBLPTRL = (uint8_t)((writeAddr + WriteBlkOffset) & 0x000000FF);
    
        for (i=0; i<WRITE_FLASH_BLOCKSIZE; i++)
        {
            TABLAT = flashWrBufPtr[WriteBlkOffset+i];  // Load data byte

            if (i == (WRITE_FLASH_BLOCKSIZE-1))
            {
                asm("TBLWT");
            }
            else
            {
                asm("TBLWTPOSTINC");
            }
        }
        
        EECON1bits.WREN = 1;
        INTCONbits.GIE = 0; // Disable interrupts
        EECON2 = 0x55;
        EECON2 = 0xAA;
        EECON1bits.WR = 1;  // Start program

        EECON1bits.WREN = 0;    // Disable writes to memory
        INTCONbits.GIE = GIEBitValue;   // Restore interrupt enable
    }

    return 0;
}

void FLASH_EraseBlock(uint32_t baseAddr)
{
    uint8_t GIEBitValue = INTCONbits.GIE;   // Save interrupt enable

    TBLPTRU = (uint8_t)((baseAddr & 0x00FF0000) >> 16);
    TBLPTRH = (uint8_t)((baseAddr & 0x0000FF00)>> 8);
    TBLPTRL = (uint8_t)(baseAddr & 0x000000FF);

    EECON1bits.EEPGD = 1;
    EECON1bits.CFGS = 0;
    EECON1bits.WREN = 1;
    EECON1bits.FREE = 1;
    INTCONbits.GIE = 0; // Disable interrupts
    EECON2 = 0x55;
    EECON2 = 0xAA;
    EECON1bits.WR = 1;
    INTCONbits.GIE = GIEBitValue;   // Restore interrupt enable
}

/**
  Section: Data EEPROM Module APIs
*/

void DATAEE_WriteByte(uint16_t bAdd, uint8_t bData)
{
    uint8_t GIEBitValue = INTCONbits.GIE;

    EEADRH = ((bAdd >> 8) & 0x03);
    EEADR = (bAdd & 0xFF);
    EEDATA = bData;
    EECON1bits.EEPGD = 0;
    EECON1bits.CFGS = 0;
    EECON1bits.WREN = 1;
    INTCONbits.GIE = 0;     // Disable interrupts
    EECON2 = 0x55;
    EECON2 = 0xAA;
    EECON1bits.WR = 1;
    // Wait for write to complete
    while (EECON1bits.WR)
    {
    }

    EECON1bits.WREN = 0;
    INTCONbits.GIE = GIEBitValue;   // restore interrupt enable
}

uint8_t DATAEE_ReadByte(uint16_t bAdd)
{
    EEADRH = ((bAdd >> 8) & 0x03);
    EEADR = (bAdd & 0xFF);
    EECON1bits.CFGS = 0;
    EECON1bits.EEPGD = 0;
    EECON1bits.RD = 1;
    NOP();  // NOPs may be required for latency at high frequencies
    NOP();

    return (EEDATA);
}

void MEMORY_Tasks( void )
{
    /* TODO : Add interrupt handling code */
    PIR2bits.EEIF = 0;
}
/**
 End of File
*/