/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides APIs for driver for .
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.5
        Device            :  PIC18F46K20
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.20 and above
        MPLAB 	          :  MPLAB X 5.40	
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

#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

/**
  Section: Included Files
*/

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set LED0 aliases
#define LED0_TRIS                 TRISCbits.TRISC0
#define LED0_LAT                  LATCbits.LATC0
#define LED0_PORT                 PORTCbits.RC0
#define LED0_SetHigh()            do { LATCbits.LATC0 = 1; } while(0)
#define LED0_SetLow()             do { LATCbits.LATC0 = 0; } while(0)
#define LED0_Toggle()             do { LATCbits.LATC0 = ~LATCbits.LATC0; } while(0)
#define LED0_GetValue()           PORTCbits.RC0
#define LED0_SetDigitalInput()    do { TRISCbits.TRISC0 = 1; } while(0)
#define LED0_SetDigitalOutput()   do { TRISCbits.TRISC0 = 0; } while(0)

// get/set LED1 aliases
#define LED1_TRIS                 TRISCbits.TRISC1
#define LED1_LAT                  LATCbits.LATC1
#define LED1_PORT                 PORTCbits.RC1
#define LED1_SetHigh()            do { LATCbits.LATC1 = 1; } while(0)
#define LED1_SetLow()             do { LATCbits.LATC1 = 0; } while(0)
#define LED1_Toggle()             do { LATCbits.LATC1 = ~LATCbits.LATC1; } while(0)
#define LED1_GetValue()           PORTCbits.RC1
#define LED1_SetDigitalInput()    do { TRISCbits.TRISC1 = 1; } while(0)
#define LED1_SetDigitalOutput()   do { TRISCbits.TRISC1 = 0; } while(0)

// get/set LED2 aliases
#define LED2_TRIS                 TRISCbits.TRISC2
#define LED2_LAT                  LATCbits.LATC2
#define LED2_PORT                 PORTCbits.RC2
#define LED2_SetHigh()            do { LATCbits.LATC2 = 1; } while(0)
#define LED2_SetLow()             do { LATCbits.LATC2 = 0; } while(0)
#define LED2_Toggle()             do { LATCbits.LATC2 = ~LATCbits.LATC2; } while(0)
#define LED2_GetValue()           PORTCbits.RC2
#define LED2_SetDigitalInput()    do { TRISCbits.TRISC2 = 1; } while(0)
#define LED2_SetDigitalOutput()   do { TRISCbits.TRISC2 = 0; } while(0)

// get/set LED3 aliases
#define LED3_TRIS                 TRISCbits.TRISC3
#define LED3_LAT                  LATCbits.LATC3
#define LED3_PORT                 PORTCbits.RC3
#define LED3_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define LED3_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define LED3_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define LED3_GetValue()           PORTCbits.RC3
#define LED3_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define LED3_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)

// get/set LED4 aliases
#define LED4_TRIS                 TRISCbits.TRISC4
#define LED4_LAT                  LATCbits.LATC4
#define LED4_PORT                 PORTCbits.RC4
#define LED4_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define LED4_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define LED4_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define LED4_GetValue()           PORTCbits.RC4
#define LED4_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define LED4_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)

// get/set LED5 aliases
#define LED5_TRIS                 TRISCbits.TRISC5
#define LED5_LAT                  LATCbits.LATC5
#define LED5_PORT                 PORTCbits.RC5
#define LED5_SetHigh()            do { LATCbits.LATC5 = 1; } while(0)
#define LED5_SetLow()             do { LATCbits.LATC5 = 0; } while(0)
#define LED5_Toggle()             do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define LED5_GetValue()           PORTCbits.RC5
#define LED5_SetDigitalInput()    do { TRISCbits.TRISC5 = 1; } while(0)
#define LED5_SetDigitalOutput()   do { TRISCbits.TRISC5 = 0; } while(0)

// get/set LED6 aliases
#define LED6_TRIS                 TRISCbits.TRISC6
#define LED6_LAT                  LATCbits.LATC6
#define LED6_PORT                 PORTCbits.RC6
#define LED6_SetHigh()            do { LATCbits.LATC6 = 1; } while(0)
#define LED6_SetLow()             do { LATCbits.LATC6 = 0; } while(0)
#define LED6_Toggle()             do { LATCbits.LATC6 = ~LATCbits.LATC6; } while(0)
#define LED6_GetValue()           PORTCbits.RC6
#define LED6_SetDigitalInput()    do { TRISCbits.TRISC6 = 1; } while(0)
#define LED6_SetDigitalOutput()   do { TRISCbits.TRISC6 = 0; } while(0)

// get/set LED7 aliases
#define LED7_TRIS                 TRISCbits.TRISC7
#define LED7_LAT                  LATCbits.LATC7
#define LED7_PORT                 PORTCbits.RC7
#define LED7_SetHigh()            do { LATCbits.LATC7 = 1; } while(0)
#define LED7_SetLow()             do { LATCbits.LATC7 = 0; } while(0)
#define LED7_Toggle()             do { LATCbits.LATC7 = ~LATCbits.LATC7; } while(0)
#define LED7_GetValue()           PORTCbits.RC7
#define LED7_SetDigitalInput()    do { TRISCbits.TRISC7 = 1; } while(0)
#define LED7_SetDigitalOutput()   do { TRISCbits.TRISC7 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/