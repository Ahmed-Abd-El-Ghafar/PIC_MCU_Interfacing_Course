/*
 * File:   led.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 3:24 PM
 */

#include <pic18.h>

#include "led.h"

/**
 * Turn on the LED
 * @param led
 * @return Status of the function
 */
ret_status led_turn_on(led_t led){
    gpio_pin_direction_init(led.port_name, led.pin, PIN_DIRECTION_OUTPUT);
    led.led_status = LED_ON;
    gpio_write_pin_value(led.port_name, led.pin, led.led_status);
    return R_OK;
}

/**
 * Turn off the LED
 * @param led
 * @return Status of the function
 */
ret_status led_turn_off(led_t led){
    gpio_pin_direction_init(led.port_name, led.pin, PIN_DIRECTION_OUTPUT);
    led.led_status = LED_OFF;
    gpio_write_pin_value(led.port_name, led.pin, led.led_status);
    return R_OK;
}

/**
 * Toggle the LED
 * @param led
 * @return Status of the function
 */
ret_status led_turn_toggle(led_t led){
    gpio_pin_direction_init(led.port_name, led.pin, PIN_DIRECTION_OUTPUT);
    led.led_status = LED_ON;
    gpio_toggle_pin_value(led.port_name, led.pin);
    return R_OK;
}

/**
 * Show the needed sequence regardless the pin connections and number of LEDs
 * @param leds Array of the LEDs configurations
 * @param seq  Array of the Needed sequence
 * @param seq_len Number of sequence patterns you need
 * @return Status of the function
 */
ret_status led_sequence (led_t leds[], uint8_t seq[][SEQ_LED_LENGTH], uint8_t seq_len){
    uint8_t l_counter = ZERO_INIT, l_leds_count =  ZERO_INIT;
    for(l_counter = ZERO_INIT; l_counter<seq_len; ++l_counter){
        for(l_leds_count = ZERO_INIT; l_leds_count<SEQ_LED_LENGTH; ++l_leds_count){
            gpio_write_pin_value(leds[l_leds_count].port_name, leds[l_leds_count].pin, 
                    seq[l_counter][l_leds_count]);
        }
        __delay_ms(SEQ_LED_DELAY_TIME);
    }
    return R_OK;
}


