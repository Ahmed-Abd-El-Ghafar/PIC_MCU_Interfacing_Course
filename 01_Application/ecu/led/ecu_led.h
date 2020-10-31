/* 
 * File:   ecu_led.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 8:16 PM
 */

#ifndef ECU_LED_H
#define	ECU_LED_H

#include "../../mcal/gpio/mcal_gpio.h"

/* Section: Macro Declarations */

/* Section: Data Type Definitions */
typedef enum{
    LED_OFF,
    LED_ON
}led_status;

typedef struct{
    uint8_t port_name : 4;
    uint8_t pin : 3; 
    uint8_t led_status : 1;
}led_t;

/* Section: Function declarations */

/**
 * @brief Initialize the assigned pin to be OUTPUT and turn the led off.
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_initialize(led_t *led);

/**
 * @brief Turn the led on
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_on(led_t *led);

/**
 * @brief Turn the led off
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_off(led_t *led);

/**
 * @brief Toggle the led
 * @param led pointer to the led module
 * @return Status of the function 
 *         (R_OK) : The function done successfully
 */
ret_status led_turn_toggle(led_t *led);

#endif	/* ECU_LED_H */

