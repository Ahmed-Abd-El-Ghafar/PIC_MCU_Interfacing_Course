/* 
 * File:   motor.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 4:00 PM
 */

#ifndef DC_MOTOR_H
#define	DC_MOTOR_H

#include "../../mcal/gpio/mcal_gpio.h"

typedef struct{
    port_index port_name;
    uint8_t pin0;
    uint8_t pin1;
}dc_motor_t;

ret_status motor_turn_left(dc_motor_t motor);
ret_status motor_turn_right(dc_motor_t motor);
ret_status motor_turn_stop(dc_motor_t motor);

#endif	/* DC_MOTOR_H */

