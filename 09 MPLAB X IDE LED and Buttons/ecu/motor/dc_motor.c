/*
 * File:   led.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 3:24 PM
 */

#include "dc_motor.h"

/**
 * 
 * @param motor
 * @return Status of the function
 */
ret_status motor_turn_left(dc_motor_t motor){
    gpio_pin_direction_init(motor.port_name, motor.pin0, PIN_DIRECTION_OUTPUT);
    gpio_pin_direction_init(motor.port_name, motor.pin1, PIN_DIRECTION_OUTPUT);
    gpio_write_pin_value(motor.port_name, motor.pin0, HIGH);
    gpio_write_pin_value(motor.port_name, motor.pin1, LOW);
    return R_OK;
}

/**
 * 
 * @param motor
 * @return Status of the function
 */
ret_status motor_turn_right(dc_motor_t motor){
    gpio_pin_direction_init(motor.port_name, motor.pin0, PIN_DIRECTION_OUTPUT);
    gpio_pin_direction_init(motor.port_name, motor.pin1, PIN_DIRECTION_OUTPUT);
    gpio_write_pin_value(motor.port_name, motor.pin0, LOW);
    gpio_write_pin_value(motor.port_name, motor.pin1, HIGH);
    return R_OK;
}

/**
 * 
 * @param motor
 * @return Status of the function
 */
ret_status motor_turn_stop(dc_motor_t motor){
    gpio_pin_direction_init(motor.port_name, motor.pin0, PIN_DIRECTION_OUTPUT);
    gpio_pin_direction_init(motor.port_name, motor.pin1, PIN_DIRECTION_OUTPUT);
    gpio_write_pin_value(motor.port_name, motor.pin0, LOW);
    gpio_write_pin_value(motor.port_name, motor.pin1, LOW);
    return R_OK;
}

