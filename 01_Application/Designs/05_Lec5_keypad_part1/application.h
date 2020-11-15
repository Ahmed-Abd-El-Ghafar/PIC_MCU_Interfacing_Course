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
#include "ecu/char_lcd/ecu_char_lcd.h"
#include "ecu/keypad/ecu_keypad.h"

void application_init(void);

#endif	/* APPLICATION_H */

