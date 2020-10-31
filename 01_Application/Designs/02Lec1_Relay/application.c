/* 
 * File:   application.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:53 PM
 */

#include "application.h"

/*
relay_t relays[2] = {
    {.port_name = PORTC_INDEX, .pin = PIN0, .relay_status = RELAY_OFF},
    {.port_name = PORTC_INDEX, .pin = PIN1, .relay_status = RELAY_OFF}
};
*/

dc_motor_t dc_motor1_1 = {{.port_name = PORTC_INDEX, .pin = PIN0, .relay_status = RELAY_OFF},
                          {.port_name = PORTC_INDEX, .pin = PIN1, .relay_status = RELAY_OFF}};
dc_motor_t dc_motor1_2 = {{.port_name = PORTC_INDEX, .pin = PIN2, .relay_status = RELAY_OFF},
                          {.port_name = PORTC_INDEX, .pin = PIN3, .relay_status = RELAY_OFF}};

button_t btn1 = {.port_name = PORTD_INDEX, .pin = PIN0, .button_status = BUTTON_NOT_PRESSED};
button_t btn2 = {.port_name = PORTD_INDEX, .pin = PIN1, .button_status = BUTTON_NOT_PRESSED};
button_status btn1_status = 0, btn2_status = 0;

int main() {
    //relay_initialize(&relays[0]);
    //relay_initialize(&relays[1]);
    dc_motor_initialize(&dc_motor1_1);
    dc_motor_initialize(&dc_motor1_2);
    button_initialize(&btn1);
    button_initialize(&btn2);
    while(TRUE){
        /*
        relay_turn_on(&relays[0]);
        relay_turn_off(&relays[1]);
        __delay_ms(3000);
        relay_turn_on(&relays[1]);
        relay_turn_off(&relays[0]);
        __delay_ms(3000);
        */
        
        button_get_status(&btn1, &btn1_status);
        button_get_status(&btn2, &btn2_status);
        if(btn1_status == BUTTON_PRESSED && btn2_status == BUTTON_NOT_PRESSED){
            robot_move_forward();
        }
        else if(btn2_status == BUTTON_PRESSED && btn1_status == BUTTON_NOT_PRESSED){
            robot_move_backward();
        }
        else{
            robot_move_stop();
        }
    }
    return (EXIT_SUCCESS);
}

void robot_move_forward(void){
    dc_motor_rotate_right(&dc_motor1_1);
    dc_motor_rotate_right(&dc_motor1_2);
}

void robot_move_backward(void){
    dc_motor_rotate_left(&dc_motor1_1);
    dc_motor_rotate_left(&dc_motor1_2);
}

void robot_move_stop(void){
    dc_motor_stop(&dc_motor1_1);
    dc_motor_stop(&dc_motor1_2);
}