/* 
 * File:   keypad.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 9:33 PM
 */

#ifndef KEYPAD_H
#define	KEYPAD_H

#include "../../mcal/gpio/mcal_gpio.h"

ret_status Keypad_Init(void);
ret_status Keypad_Key_Press(uint8_t kp);
ret_status Keypad_Key_Click(uint8_t kp);

#endif	/* KEYPAD_H */

