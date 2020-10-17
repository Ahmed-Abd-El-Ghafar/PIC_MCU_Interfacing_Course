/* 
 * File:   mcal_gpio.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 8:12 PM
 */

#ifndef MCAL_GPIO_H
#define	MCAL_GPIO_H

/* Section: Include */
#include "../pic18f46k20.h"
#include "../../std_types.h"

/* Section: Macro Declarations */
#define PORT_MAX_NUMBERS            5U
#define PORT_PIN_MAX_NUMBERS        8U
#define PORT_DIRECTION_INPUT        0xFFU
#define PORT_DIRECTION_OUTPUT       0x00U
#define PIN_MASK_VALUE              1U

/* Section: Macro Functions Declarations */
#define CLEAR_BIT(REGISTER,BIT_POS)  (REGISTER &= ~(PIN_MASK_VALUE << BIT_POS))
#define SET_BIT(REGISTER,BIT_POS)    (REGISTER |= (PIN_MASK_VALUE << BIT_POS))
#define TOGGLE_BIT(REGISTER,BIT_POS) (REGISTER ^= (PIN_MASK_VALUE << BIT_POS))
#define READ_BIT(REGISTER,BIT_POS)   ((REGISTER >> BIT_POS) & PIN_MASK_VALUE)

/* Section: Data Type Definitions */
typedef enum{
    PIN_LOW,
    PIN_HIGH        
}pin_logic_t;

typedef enum{
    DIRECTION_OUTPUT,
    DIRECTION_INPUT        
}direction_t;

typedef enum{
    PIN0,
    PIN1,
    PIN2,
    PIN3,    
    PIN4,
    PIN5,
    PIN6,    
    PIN7
}pin_index;

typedef enum{
    PORTA_INDEX,
    PORTB_INDEX,
    PORTC_INDEX,
    PORTD_INDEX,    
    PORTE_INDEX
}port_index;

/* Section: Global variables */

/* Section: Function declarations */
ret_status gpio_pin_direction_intialize(port_index port, pin_index pin, direction_t direction);
ret_status gpio_pin_get_direction_status(port_index port, pin_index pin, direction_t *direction);
ret_status gpio_pin_write_value(port_index port, pin_index pin, pin_logic_t logic);
ret_status gpio_pin_read_value(port_index port, pin_index pin, pin_logic_t *logic);
ret_status gpio_pin_toggle_value(port_index port, pin_index pin);

ret_status gpio_port_default_init(uint8_t port_numbers);
ret_status gpio_port_direction_intialize(port_index port, direction_t direction);
ret_status gpio_port_get_direction_status(port_index port, direction_t *direction);
ret_status gpio_port_write_value(port_index port, uint8_t value);
ret_status gpio_port_read_value(port_index port, uint8_t *value);
ret_status gpio_port_toggle_value(port_index port);

#endif	/* MCAL_GPIO_H */

