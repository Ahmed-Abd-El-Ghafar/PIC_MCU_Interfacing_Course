/* 
 * File:   application.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:53 PM
 */

#include "application.h"

uint8_t var = ZERO_INIT;

int main() {
    gpio_pin_direction_intialize(PORTC_INDEX, PIN0, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(PORTC_INDEX, PIN1, DIRECTION_OUTPUT);
    gpio_pin_write_value(PORTC_INDEX, PIN0, PIN_LOW);
    gpio_pin_write_value(PORTC_INDEX, PIN1, PIN_LOW);
    while(TRUE){
        gpio_pin_write_value(PORTC_INDEX, PIN0, PIN_HIGH);
        gpio_pin_write_value(PORTC_INDEX, PIN1, PIN_LOW);
        __delay_ms(250);
        gpio_pin_write_value(PORTC_INDEX, PIN0, PIN_LOW);
        gpio_pin_write_value(PORTC_INDEX, PIN1, PIN_HIGH);
        __delay_ms(250);
    }
    return (EXIT_SUCCESS);
}

