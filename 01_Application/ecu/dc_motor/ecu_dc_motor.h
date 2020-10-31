/* 
 * File:   ecu_dc_motor.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 30, 2020, 6:45 PM
 */

#ifndef ECU_DC_MOTOR_H
#define	ECU_DC_MOTOR_H

#include "../realy/ecu_relay.h"

typedef struct{
    relay_t relay1;
    relay_t relay2;
}dc_motor_t;

ret_status dc_motor_initialize(dc_motor_t *dc_mtor);
ret_status dc_motor_rotate_right(dc_motor_t *dc_mtor);
ret_status dc_motor_rotate_left(dc_motor_t *dc_mtor);
ret_status dc_motor_stop(dc_motor_t *dc_mtor);

#endif	/* ECU_DC_MOTOR_H */

