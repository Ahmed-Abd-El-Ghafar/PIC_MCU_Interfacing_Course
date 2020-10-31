/* 
 * File:   ecu_relay.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 30, 2020, 6:45 PM
 */

#ifndef ECU_RELAY_H
#define	ECU_RELAY_H

#include "../../mcal/gpio/mcal_gpio.h"

/* Section: Data Type Definitions */
typedef enum{
    RELAY_OFF,
    RELAY_ON
}relay_status;

typedef struct{
    uint8_t port_name : 4;
    uint8_t pin : 3; 
    uint8_t relay_status : 1;
}relay_t;

ret_status relay_initialize(relay_t *led);
ret_status relay_turn_on(relay_t *led);
ret_status relay_turn_off(relay_t *led);

#endif	/* ECU_RELAY_H */

