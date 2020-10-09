/* 
 * File:   mcal_gpio.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 1:44 PM
 */

#ifndef MCAL_GPIO_H
#define	MCAL_GPIO_H

#include "../pic18f46k20.h"
#include "../../mcal/types.h"

#define HIGH 1
#define LOW  0

#define PIN0 0
#define PIN1 1
#define PIN2 2
#define PIN3 3
#define PIN4 4
#define PIN5 5
#define PIN6 6
#define PIN7 7

#define PIN_DIRECTION_INPUT   0X01
#define PIN_DIRECTION_OUTPUT  0X00
#define PORT_DIRECTION_INPUT  0XFF
#define PORT_DIRECTION_OUTPUT 0X00

#define PORT_NUMBERS    0x05
#define PORT_PIN_NUMBER 0X08

#define _XTAL_FREQ 8000000

typedef enum{
    PORTA_INDEX,
    PORTB_INDEX,
    PORTC_INDEX,   
    PORTD_INDEX,  
    PORTE_INDEX,        
}port_index;

/**
 * Initialize the ports to the default states. 
 * @param port_numbers
 * @return Status of the function
 */
ret_status gpio_default_init(uint8_t port_numbers);

/**
 * Initialize the direction of a specific pin
 * @param index
 * @param pin
 * @param pin_direction
 * @return Status of the function
 */
ret_status gpio_pin_direction_init(port_index index, uint8_t pin, uint8_t pin_direction);

/**
 * Read the direction of a specific pin
 * @param index
 * @param pin
 * @param pin_direction
 * @return Status of the function
 */
ret_status gpio_get_pin_direction_status(port_index index, uint8_t pin, uint8_t *pin_direction);

/**
 * Define the direction of the port : INPUT OR OUTPUT
 * @param index
 * @param port_direction
 * @return Status of the function
 */
ret_status gpio_port_direction_init(port_index index, uint8_t port_direction);

/**
 * Read the direction of the port : INPUT OR OUTPUT
 * @param index
 * @param port_direction
 * @return Status of the function
 */
ret_status gpio_port_direction_status(port_index index, uint8_t *port_direction);

/**
 * Read the status of a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_read_pin_value(port_index index, uint8_t pin, uint8_t *value);

/**
 * Write a value to a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_write_pin_value(port_index index, uint8_t pin, uint8_t value);

/**
 * Toggle a value to a specific pin at specific port
 * @param index
 * @param pin
 * @param value
 * @return Status of the function
 */
ret_status gpio_toggle_pin_value(port_index index, uint8_t pin);

/**
 * Read the port value
 * @param index
 * @param value
 * @return Status of the function
 */
ret_status gpio_read_port_value(port_index index, uint8_t *value);

/**
 * Write value to a specific port
 * @param index
 * @param value
 * @return Status of the function
 */
ret_status gpio_write_port_value(port_index index, uint8_t value);

#endif	/* MCAL_GPIO_H */
