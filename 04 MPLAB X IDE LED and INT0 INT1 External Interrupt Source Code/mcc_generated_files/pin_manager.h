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

// get/set Button1 aliases
#define Button1_TRIS                 TRISBbits.TRISB0
#define Button1_LAT                  LATBbits.LATB0
#define Button1_PORT                 PORTBbits.RB0
#define Button1_WPU                  WPUBbits.WPUB0
#define Button1_ANS                  ANSELHbits.ANS12
#define Button1_SetHigh()            do { LATBbits.LATB0 = 1; } while(0)
#define Button1_SetLow()             do { LATBbits.LATB0 = 0; } while(0)
#define Button1_Toggle()             do { LATBbits.LATB0 = ~LATBbits.LATB0; } while(0)
#define Button1_GetValue()           PORTBbits.RB0
#define Button1_SetDigitalInput()    do { TRISBbits.TRISB0 = 1; } while(0)
#define Button1_SetDigitalOutput()   do { TRISBbits.TRISB0 = 0; } while(0)
#define Button1_SetPullup()          do { WPUBbits.WPUB0 = 1; } while(0)
#define Button1_ResetPullup()        do { WPUBbits.WPUB0 = 0; } while(0)
#define Button1_SetAnalogMode()      do { ANSELHbits.ANS12 = 1; } while(0)
#define Button1_SetDigitalMode()     do { ANSELHbits.ANS12 = 0; } while(0)

// get/set Button2 aliases
#define Button2_TRIS                 TRISBbits.TRISB1
#define Button2_LAT                  LATBbits.LATB1
#define Button2_PORT                 PORTBbits.RB1
#define Button2_WPU                  WPUBbits.WPUB1
#define Button2_ANS                  ANSELHbits.ANS10
#define Button2_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define Button2_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define Button2_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define Button2_GetValue()           PORTBbits.RB1
#define Button2_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define Button2_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)
#define Button2_SetPullup()          do { WPUBbits.WPUB1 = 1; } while(0)
#define Button2_ResetPullup()        do { WPUBbits.WPUB1 = 0; } while(0)
#define Button2_SetAnalogMode()      do { ANSELHbits.ANS10 = 1; } while(0)
#define Button2_SetDigitalMode()     do { ANSELHbits.ANS10 = 0; } while(0)

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