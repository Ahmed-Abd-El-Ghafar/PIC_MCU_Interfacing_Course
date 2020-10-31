/*
 * File:   ecu_relay.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 30, 2020, 6:45 PM
 */

#include "ecu_relay.h"

ret_status relay_initialize(relay_t *relay){
    ret_status ret = R_NOK;
    if((NULL == relay) || (relay->port_name > PORT_MAX_NUMBERS-1) || 
            (relay->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_direction_intialize(relay->port_name, relay->pin, DIRECTION_OUTPUT);
        gpio_pin_write_value(relay->port_name, relay->pin, PIN_LOW);
        relay->relay_status = RELAY_OFF;
        ret = R_OK;
    }
    return ret;
}

ret_status relay_turn_on(relay_t *relay){
    ret_status ret = R_NOK;
    if((NULL == relay) || (relay->port_name > PORT_MAX_NUMBERS-1) || 
            (relay->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_write_value(relay->port_name, relay->pin, PIN_HIGH);
        relay->relay_status = RELAY_ON;
        ret = R_OK;
    }
    return ret;
}

ret_status relay_turn_off(relay_t *relay){
    ret_status ret = R_NOK;
    if((NULL == relay) || (relay->port_name > PORT_MAX_NUMBERS-1) || 
            (relay->pin > PORT_PIN_MAX_NUMBERS-1)){
        return ret;
    }
    else{
        gpio_pin_write_value(relay->port_name, relay->pin, PIN_LOW);
        relay->relay_status = RELAY_OFF;
        ret = R_OK;
    }
    return ret;
}
