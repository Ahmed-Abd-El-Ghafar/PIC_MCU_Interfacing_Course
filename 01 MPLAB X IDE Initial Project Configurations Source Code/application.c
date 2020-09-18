/*
 * File:   application.c
 * Author: Ahmed.Abd.El.Ghafar
 *
 * Created on September 12, 2020, 3:47 PM
 */

#include <xc.h>
#include "mcu_config.h"
#define _XTAL_FREQ 4000000UL

void main(void) {
    TRISCbits.RC0 = 0;
    PORTCbits.RC0 = 0;
    while(1){
        PORTCbits.RC0 =~ PORTCbits.RC0;
        __delay_ms(250);
    }
    return;
}
