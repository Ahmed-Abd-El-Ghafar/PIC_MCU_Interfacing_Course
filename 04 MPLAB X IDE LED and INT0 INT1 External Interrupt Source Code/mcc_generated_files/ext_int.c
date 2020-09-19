/**
   EXT_INT Generated Driver File
 
   @Company
     Microchip Technology Inc.
 
   @File Name
     ext_int.c
 
   @Summary
     This is the generated driver implementation file for the EXT_INT driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs
 
   @Description
     This source file provides implementations for driver APIs for EXT_INT.
     Generation Information :
         Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.5
         Device            :  PIC18F46K20
         Driver Version    :  1.11
     The generated drivers are tested against the following:
         Compiler          :  XC8 2.20 and above
         MPLAB             :  MPLAB X 5.40
 */ 

 /**
   Section: Includes
 */
#include <xc.h>
#include "ext_int.h"

void (*INT0_InterruptHandler)(void);
void (*INT1_InterruptHandler)(void);

void INT0_ISR(void)
{
    EXT_INT0_InterruptFlagClear();

    // Callback function gets called everytime this ISR executes
    INT0_CallBack();    
}


void INT0_CallBack(void)
{
    // Add your custom callback code here
    if(INT0_InterruptHandler)
    {
        INT0_InterruptHandler();
    }
}

void INT0_SetInterruptHandler(void (* InterruptHandler)(void)){
    INT0_InterruptHandler = InterruptHandler;
}

void INT0_DefaultInterruptHandler(void){
    // add your INT0 interrupt custom code
    PORTCbits.RC1 =~ PORTCbits.RC1;
    // or set custom function using INT0_SetInterruptHandler()
}
void INT1_ISR(void)
{
    EXT_INT1_InterruptFlagClear();

    // Callback function gets called everytime this ISR executes
    INT1_CallBack();    
}


void INT1_CallBack(void)
{
    // Add your custom callback code here
    if(INT1_InterruptHandler)
    {
        INT1_InterruptHandler();
    }
}

void INT1_SetInterruptHandler(void (* InterruptHandler)(void)){
    INT1_InterruptHandler = InterruptHandler;
}

void INT1_DefaultInterruptHandler(void){
    // add your INT1 interrupt custom code
    PORTCbits.RC2 =~ PORTCbits.RC2;
    // or set custom function using INT1_SetInterruptHandler()
}

void EXT_INT_Initialize(void)
{
    
    // Clear the interrupt flag
    // Set the external interrupt edge detect
    EXT_INT0_InterruptFlagClear();   
    EXT_INT0_risingEdgeSet();    
    // Set Default Interrupt Handler
    INT0_SetInterruptHandler(INT0_DefaultInterruptHandler);
    EXT_INT0_InterruptEnable();      

    
    // Clear the interrupt flag
    // Set the external interrupt edge detect
    EXT_INT1_InterruptFlagClear();   
    EXT_INT1_risingEdgeSet();    
    // Set Default Interrupt Handler
    INT1_SetInterruptHandler(INT1_DefaultInterruptHandler);
    EXT_INT1_InterruptEnable();      

}

