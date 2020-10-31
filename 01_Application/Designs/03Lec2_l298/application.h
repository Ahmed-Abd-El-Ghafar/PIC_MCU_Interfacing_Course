/* 
 * File:   application.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:55 PM
 */

#ifndef APPLICATION_H
#define	APPLICATION_H

#include <stdio.h>
#include <stdlib.h>

#include "device_config.h"
#include "ecu/led/ecu_led.h"
#include "ecu/button/ecu_button.h"
#include "ecu/realy/ecu_relay.h"
#include "ecu/dc_motor/ecu_dc_motor.h"

void robot_move_forward(void);
void robot_move_backward(void);
void robot_move_stop(void);

#endif	/* APPLICATION_H */

