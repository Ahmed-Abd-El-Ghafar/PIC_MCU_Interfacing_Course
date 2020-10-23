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
 * @brief Initialize all the ports to the default states (DIRECTION_INPUT). 
 * @param port_numbers : The available Physical port numbers at the MCU -> PORT_MAX_NUMBERS
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_default_init(uint8_t port_numbers){
    ret_status ret = R_NOK;
    uint8_t l_counter = ZERO_INIT;
    for(l_counter=ZERO_INIT; l_counter<PORT_MAX_NUMBERS-1; l_counter++){
        /* Write to all (Data Direction Control Registers) -> DIRECTION_INPUT */
        *tris_register[l_counter] = PORT_DIRECTION_INPUT;
    }
    ret = R_OK;
    return ret;
}

/**
 * @brief Initialize the direction of a specific pin to be (DIRECTION_INPUT) or (DIRECTION_OUTPUT)
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
 * @brief Get the direction of a specific pin -> (DIRECTION_INPUT) or (DIRECTION_OUTPUT)
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param pin   : The pin number -> PIN0, PIN1, PIN2, ....
 * @param direction : The pin direction status -> DIRECTION_OUTPUT, DIRECTION_INPUT
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_pin_get_direction_status(port_index port, pin_index pin, direction_t *direction){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT || NULL == direction){
        return ret;
    }
    else{
        /* Read the direction status of the (pin) -> (DIRECTION_INPUT) or (DIRECTION_OUTPUT) */
        *direction = READ_BIT(*tris_register[port], pin);
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Write a specific logic on the desired pin
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param pin   : The pin number -> PIN0, PIN1, PIN2, ....
 * @param logic : The desired logic needed to be written to this pin -> PIN_LOW, PIN_HIGH
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_pin_write_value(port_index port, pin_index pin, pin_logic_t logic){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        switch(logic){
            case PIN_LOW :
                /* Logic High 5v or 3.3v written now on the (pin) */
                CLEAR_BIT(*lat_register[port], pin); break;
            case PIN_HIGH :
                /* Logic Low 0v written now on the (pin) */
                SET_BIT(*lat_register[port], pin); break;
            default : return R_NOK;
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Read the logic or the voltage applied on a specific pin
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param pin   : The pin number -> PIN0, PIN1, PIN2, ....
 * @param logic : The logic or the voltage applied on the pin
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_pin_read_value(port_index port, pin_index pin, pin_logic_t *logic){
    ret_status ret;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || NULL == logic){
        return R_NOK;
    }
    else{
        /* Read the logic status of the (pin) -> (PIN_LOW) or (PIN_HIGH) */
        *logic = READ_BIT(*port_register[port], pin);
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Change the logic on a specific pin
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param pin   : The pin number -> PIN0, PIN1, PIN2, ....
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_pin_toggle_value(port_index port, pin_index pin){
    ret_status ret = R_NOK;
    if(pin > PORT_PIN_MAX_NUMBERS-1 || pin < ZERO_INIT){
        return ret;
    }
    else{
        /* Change the logic on the pin */
        TOGGLE_BIT(*lat_register[port], pin);
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Update the direction of each pin of a specific port
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param direction
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_direction_intialize(port_index port, direction_t direction){
    ret_status ret = R_NOK;
    if(port > PORT_MAX_NUMBERS-1){
        return ret;
    }
    else{
        switch(direction){
            case DIRECTION_OUTPUT :
                *tris_register[port] = PORT_DIRECTION_OUTPUT;
                break;
            case DIRECTION_INPUT :
                *tris_register[port] = PORT_DIRECTION_INPUT;
                break;
            default : return ret;
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Get the status direction of each pin of a specific port
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param direction
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_get_direction_status(port_index port, uint8_t *direction){
    ret_status ret = R_NOK;
    if((port > PORT_MAX_NUMBERS-1) || (NULL == direction)){
        return R_NOK;
    }
    else{
        *direction = *tris_register[port];
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Write a voltage level on the port
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param value
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_write_value(port_index port, uint8_t value){
    ret_status ret = R_NOK;
    if(port > PORT_MAX_NUMBERS-1){
        return R_NOK;
    }
    else{
        *lat_register[port] = value;
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Read the voltage level on the port
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @param value : 
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_read_value(port_index port, uint8_t *value){
    ret_status ret = R_NOK;
    if((port > PORT_MAX_NUMBERS-1) || (NULL == value)){
        return ret;
    }
    else{
        *value = *port_register[port];
        ret = R_OK;
    }
    return ret;
}

/**
 * @brief Toggle the port voltage level
 * @param port  : The port that has the pin we need to Initialize -> PORTA_INDEX, PORTB_INDEX, ...
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status gpio_port_toggle_value(port_index port){
    ret_status ret = R_NOK;
    if(port > PORT_MAX_NUMBERS-1){
        return ret;
    }
    else{
        TOGGLE_PORT(*lat_register[port]);
        ret = R_OK;
    }
    return ret;
}
