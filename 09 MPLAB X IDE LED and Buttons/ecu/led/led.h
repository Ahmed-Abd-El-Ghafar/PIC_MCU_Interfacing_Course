/* 
 * File:   led.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 3:25 PM
 */

#ifndef LED_H
#define	LED_H

#include "../../mcal/gpio/mcal_gpio.h"

typedef enum{
    LED_OFF,
    LED_ON
}led_status_t;

typedef struct{
    port_index port_name;
    uint8_t pin;
    led_status_t led_status;
}led_t;

#define SEQ_LED_LENGTH     8
#define SEQ_LED_DELAY_TIME 250

ret_status led_turn_on(led_t led);
ret_status led_turn_off(led_t led);
ret_status led_turn_toggle(led_t led);
ret_status led_sequence (led_t leds[], uint8_t seq[][SEQ_LED_LENGTH], uint8_t seq_len);

#endif	/* LED_H */

