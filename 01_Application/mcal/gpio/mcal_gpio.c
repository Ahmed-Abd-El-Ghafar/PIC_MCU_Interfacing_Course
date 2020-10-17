/* 
 * File:   mcal_gpio.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 8:11 PM
 */

#include "mcal_gpio.h"

/* Reference to the Data Direction Control Registers */
static volatile uint8_t *tris_register[] = {&TRISA, &TRISB, &TRISC, &TRISD, &TRISE};
/* Reference to the Data Latch Register (Read and Write to Data Latch) */
static volatile uint8_t *lat_register[] = {&LATA, &LATB, &LATC, &LATD, &LATE};
/* Reference to the Port Status Register  */
static volatile uint8_t *port_register[] = {&PORTA, &PORTB, &PORTC, &PORTD, &PORTE};

/**
 * Initialize all the ports to the default states (DIRECTION_INPUT). 
 * @param port_numbers : The available Physical port numbers at the MCU -> PORT_MAX_NUMBERS
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_default_init(uint8_t port_numbers){
    ret_status ret = R_OK;
    uint8_t l_counter = ZERO_INIT;
    for(l_counter=ZERO_INIT; l_counter<PORT_MAX_NUMBERS-1; l_counter++){
        /* Write to all (Data Direction Control Registers) -> DIRECTION_INPUT */
        *tris_register[l_counter] = PORT_DIRECTION_INPUT;
    }
    return ret;
}

/**
 * Initialize the direction of a specific pin to be (DIRECTION_INPUT) or (DIRECTION_OUTPUT)
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param pin   : The pin number -> PIN0, PIN1, PIN2, ....
 * @param direction : The desired pin direction -> DIRECTION_OUTPUT, DIRECTION_INPUT
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_pin_direction_intialize(port_index port, pin_index pin, direction_t direction){
    ret_status ret = R_NOK;
    /* Validating the pin number */
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        switch(direction){
            case DIRECTION_OUTPUT :
                /* Clear the desired bit as indication to be DIRECTION_OUTPUT */
                CLEAR_BIT(*tris_register[port], pin); break;
            case DIRECTION_INPUT : 
                /* Set the desired bit as indication to be DIRECTION_INPUT */
                SET_BIT(*tris_register[port], pin); break;
            default : return R_NOK;
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param port
 * @param pin
 * @param direction
 * @return 
 */
ret_status gpio_pin_get_direction_status(port_index port, pin_index pin, direction_t *direction){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        *direction = ((*tris_register[port] >> pin) & PIN_MASK_VALUE);
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param port
 * @param pin
 * @param logic
 * @return 
 */
ret_status gpio_pin_write_value(port_index port, pin_index pin, pin_logic_t logic){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        switch(logic){
            case PIN_LOW :
                *lat_register[port] &= ~(PIN_MASK_VALUE << pin);
                ret = R_OK;
                break;
            case PIN_HIGH :
                *lat_register[port] |= (PIN_MASK_VALUE << pin);
                ret = R_OK;
                break;
            default : return R_NOK;
        }
    }
    return ret;
}

/**
 * 
 * @param port
 * @param pin
 * @param logic
 * @return 
 */
ret_status gpio_pin_read_value(port_index port, pin_index pin, pin_logic_t *logic){
    
}

/**
 * 
 * @param port
 * @param pin
 * @return 
 */
ret_status gpio_pin_toggle_value(port_index port, pin_index pin){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        *lat_register[port] ^= (PIN_MASK_VALUE << pin);
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param port
 * @param direction
 * @return 
 */
ret_status gpio_port_direction_intialize(port_index port, direction_t direction){
    
}

/**
 * 
 * @param port
 * @param direction
 * @return 
 */
ret_status gpio_port_get_direction_status(port_index port, direction_t *direction){
    
}

/**
 * 
 * @param port
 * @param value
 * @return 
 */
ret_status gpio_port_write_value(port_index port, uint8_t value){
    
}

/**
 * 
 * @param port
 * @param value
 * @return 
 */
ret_status gpio_port_read_value(port_index port, uint8_t *value){
    
}

/**
 * 
 * @param port
 * @return 
 */
ret_status gpio_port_toggle_value(port_index port){
    
}
