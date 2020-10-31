/* 
 * File:   ecu_led.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 8:11 PM
 */

#include "ecu_led.h"

/**
 * @brief Initialize the assigned pin to be OUTPUT and turn the led off.
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_initialize(led_t *led){
    ret_status ret = R_NOK;
    if((NULL == led) || (led->port_name > PORT_MAX_NUMBERS-1) || 
            (led->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_direction_intialize(led->port_name, led->pin, DIRECTION_OUTPUT);
        gpio_pin_write_value(led->port_name, led->pin, PIN_LOW);
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Turn the led on
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_on(led_t *led){
    ret_status ret = R_NOK;
    if((NULL == led) || (led->port_name > PORT_MAX_NUMBERS-1) || 
            (led->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_write_value(led->port_name, led->pin, PIN_HIGH);
        led->led_status = LED_ON;
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Turn the led off
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_off(led_t *led){
    ret_status ret = R_NOK;
    if((NULL == led) || (led->port_name > PORT_MAX_NUMBERS-1) || 
            (led->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_write_value(led->port_name, led->pin, PIN_LOW);
        led->led_status = LED_OFF;
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Toggle the led
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_toggle(led_t *led){
    ret_status ret = R_NOK;
    if((NULL == led) || (led->port_name > PORT_MAX_NUMBERS-1) || 
            (led->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_toggle_value(led->port_name, led->pin);
        ret = R_OK;
    }
    return ret;
}
