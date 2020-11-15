/* 
 * File:   application.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:53 PM
 */

#include "application.h"

char_lcd_t lcd_1 = {
    .lcd_data_port = PORTC_INDEX,
    .lcd_data_pin4 = PIN0,
    .lcd_data_pin5 = PIN1,
    .lcd_data_pin6 = PIN2,
    .lcd_data_pin7 = PIN3,
    .lcd_rs_pin = PIN4,
    .lcd_en_pin = PIN5
};

keypad_t keypad_1 = {
    .keypad_rows[0].port_name = PORTD_INDEX, .keypad_rows[0].pin_number = PIN4,
    .keypad_rows[1].port_name = PORTD_INDEX, .keypad_rows[1].pin_number = PIN5,
    .keypad_rows[2].port_name = PORTD_INDEX, .keypad_rows[2].pin_number = PIN6,
    .keypad_rows[3].port_name = PORTD_INDEX, .keypad_rows[3].pin_number = PIN7,
    .keypad_columns[0].port_name = PORTD_INDEX, .keypad_columns[0].pin_number = PIN0,
    .keypad_columns[1].port_name = PORTD_INDEX, .keypad_columns[1].pin_number = PIN1,
    .keypad_columns[2].port_name = PORTD_INDEX, .keypad_columns[2].pin_number = PIN2,
    .keypad_columns[3].port_name = PORTD_INDEX, .keypad_columns[3].pin_number = PIN3,
};
uint8_t ret_val = ZERO_INIT;

int main() {
    uint8_t l_pass_col = 8;
    application_init();
    lcd_send_string_data_pos(&lcd_1, 1, 1, "Pass : ");
    while(TRUE){
        ret_val = keypad_read_value(&keypad_1);
        if(ret_val != 0){
            lcd_send_char_data_pos(&lcd_1, 1, l_pass_col, ret_val);
            __delay_ms(250);
            lcd_send_char_data_pos(&lcd_1, 1, l_pass_col++, '*');
        }
    }
    return (EXIT_SUCCESS);
}

void application_init(void){
    ret_status ret = R_NOK;
    ret = lcd_intialize(&lcd_1);
    ret = keypad_initialize(&keypad_1);
}