/*
 * File:   mcal_gpio.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 1:45 PM
 */

#include "mcal_gpio.h"

static volatile uint8_t *port_reg[] = {&PORTA, &PORTB, &PORTC, &PORTD, &PORTE};
static volatile uint8_t *tris_reg[] = {&TRISA, &TRISB, &TRISC, &TRISD, &TRISE};
static volatile uint8_t *lat_reg[] = {&LATA, &LATB, &LATC, &LATD, &LATE};

/**
 * Initialize the ports to the default states. 
 * @param port_numbers
 * @return Status of the function
 */
ret_status gpio_default_init(uint8_t port_numbers){
    ret_status ret = R_OK;
    uint8_t l_counter = ZERO_INIT;
    for(l_counter=ZERO_INIT; l_counter<PORT_NUMBERS-1; l_counter++){
        *tris_reg[l_counter] = PORT_DIRECTION_INPUT;
    }
    return ret;
}

/**
 * Initialize the direction of a specific pin
 * @param index
 * @param pin
 * @param pin_direction
 * @return Status of the function
 */
ret_status gpio_pin_direction_init(port_index index, uint8_t pin, uint8_t pin_direction){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_NUMBER-1){
        return R_NOK;
    }
    else
    {
        switch (pin_direction){
            case PIN_DIRECTION_OUTPUT :
                *tris_reg[index] &= ~ (1 << pin);
                ret = R_OK;
                break;
            case PIN_DIRECTION_INPUT:
                *tris_reg[index] |= (1 << pin);
                ret = R_OK;
                break;
            default:
                return R_NOK;
        }
    }
    return ret;
}

/**
 * Read the direction of a specific pin
 * @param index
 * @param pin
 * @param pin_direction
 * @return Status of the function
 */
ret_status gpio_get_pin_direction_status(port_index index, uint8_t pin, uint8_t *pin_direction){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_NUMBER-1){
        return R_NOK;
    }
    else
    {
        *pin_direction = ((*tris_reg[index] >> pin) & 1);
        ret = R_OK;
    }
    return ret;
}

/**
 * Define the direction of the port : INPUT OR OUTPUT
 * @param index
 * @param port_direction
 * @return Status of the function
 */
ret_status gpio_port_direction_init(port_index index, uint8_t port_direction){
    *tris_reg[index] = port_direction;
    return R_OK;
}

/**
 * Read the direction of the port : INPUT OR OUTPUT
 * @param index
 * @param port_direction
 * @return Status of the function
 */
ret_status gpio_port_direction_status(port_index index, uint8_t *port_direction){
    *port_direction = *tris_reg[index];
    return R_OK;
}

/**
 * Read the status of a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_read_pin_value(port_index index, uint8_t pin, uint8_t *value){
    ret_status ret;
    if(pin > PORT_PIN_NUMBER-1){
        return R_NOK;
    }
    else
    {
        *value = ((*port_reg[index] >> pin) & 1);
        ret = R_OK;
    }
    return ret;
}

/**
 * Write a value to a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_write_pin_value(port_index index, uint8_t pin, uint8_t value){
    ret_status ret;
    if(pin > PORT_PIN_NUMBER-1){
        return R_NOK;
    }
    else
    {
        switch (value){
            case LOW :
                *lat_reg[index] &= ~ (1 << pin);
                ret = R_OK;
                break;
            case HIGH:
                *lat_reg[index] |= (1 << pin);
                ret = R_OK;
                break;
            default:
                return R_NOK;
        }
    }
    return ret;
}

/**
 * Toggle a value to a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_toggle_pin_value(port_index index, uint8_t pin){
    ret_status ret;
    if(pin > PORT_PIN_NUMBER-1){
        return R_NOK;
    }
    else
    {
        *lat_reg[index] ^= (1 << pin);
        return R_OK;
    }
    return ret;
}

/**
 * Read the port value
 * @param index
 * @param value
 * @return Status of the function
 */
ret_status gpio_read_port_value(port_index index, uint8_t *value){
    ret_status ret = R_OK;
    *value = *port_reg[index];
    return R_OK;
}

/**
 * Write value to a specific port
 * @param index
 * @param value
 * @return Status of the function
 */
ret_status gpio_write_port_value(port_index index, uint8_t value){
    ret_status ret = R_OK;
    gpio_port_direction_init(index, PORT_DIRECTION_OUTPUT);
    *lat_reg[index] = value;
    return R_OK;
}

