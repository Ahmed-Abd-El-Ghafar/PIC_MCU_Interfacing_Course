/* 
 * File:   application.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:53 PM
 */

#include "application.h"

#if CHAR_LCD_MODE==4
char_lcd_t lcd_1 = {
    .lcd_data_port = PORTC_INDEX,
    .lcd_data_pin4 = PIN0,
    .lcd_data_pin5 = PIN1,
    .lcd_data_pin6 = PIN2,
    .lcd_data_pin7 = PIN3,
    .lcd_rs_pin = PIN4,
    .lcd_en_pin = PIN5
};

char_lcd_t lcd_2 = {
    .lcd_data_port = PORTD_INDEX,
    .lcd_data_pin4 = PIN0,
    .lcd_data_pin5 = PIN1,
    .lcd_data_pin6 = PIN2,
    .lcd_data_pin7 = PIN3,
    .lcd_rs_pin = PIN4,
    .lcd_en_pin = PIN5
};
#endif

#if CHAR_LCD_MODE==8
char_lcd_t lcd_1 = {
    .lcd_data_port = PORTC_INDEX,
    .lcd_en_port = PORTD_INDEX,
    .lcd_rs_port = PORTD_INDEX,
    .lcd_rs_pin = PIN0,
    .lcd_en_pin = PIN1
};
#endif

const char character1[] = {14,10,17,17,17,17,31,0};
const char character2[] = {14,10,17,17,17,31,31,0};
const char character3[] = {14,10,17,17,31,31,31,0};
const char character4[] = {14,10,17,31,31,31,31,0};
const char character5[] = {14,10,31,31,31,31,31,0};
const char character6[] = {14,14,31,31,31,31,31,0};
const char blt[] = {6,21,13,6,13,21,6,0};
const char Shab[] = {31,21,14,4,4,4,4,0};
const char shab_bat1[] = {24,24,24,24,24,24,24,0};
const char shab_bat2[] = {28,28,28,28,28,28,28,0};
const char shab_bat3[] = {30,30,30,30,30,30,30,0};
const char mesg1[] = {31,24,22,17,16,31,0,0};
const char mesg2[] = {31,3,13,17,1,31,0,0};

int main() {
    application_init();
    lcd_send_custome_char(&lcd_1, 4, 20, character6, 0);
    lcd_send_custome_char(&lcd_1, 1, 19, blt, 1);
    lcd_send_custome_char(&lcd_1, 4, 1, Shab, 2);
    lcd_send_custome_char(&lcd_1, 3, 1, shab_bat1, 3);
    lcd_send_custome_char(&lcd_1, 3, 20, shab_bat1, 3);
    lcd_send_custome_char(&lcd_1, 2, 1, shab_bat2, 4);
    lcd_send_custome_char(&lcd_1, 2, 20, shab_bat2, 4);
    lcd_send_custome_char(&lcd_1, 1, 20, shab_bat3, 4);
    lcd_send_custome_char(&lcd_1, 1, 2, mesg1, 5);
    lcd_send_custome_char(&lcd_1, 1, 3, mesg2, 6);
    lcd_send_string_data_pos(&lcd_1, 2, 2, "3 messages");
    lcd_send_string_data_pos(&lcd_1, 3, 5, "received");
    lcd_send_string_data_pos(&lcd_1, 4, 9, "Read");
    while(TRUE){
        lcd_send_string_data_pos(&lcd_1, 1, 6, "ES Diploma");
        lcd_send_string_data_pos(&lcd_1, 4, 9, "Read");__delay_ms(500);
        lcd_send_string_data_pos(&lcd_1, 4, 9, "    ");__delay_ms(500);
        #if CHAR_LCD_MODE==4
        lcd_send_string_data_pos(&lcd_2, 1, 8, "Testing");
        lcd_send_string_data_pos(&lcd_2, 2, 4, "LCD 4 Bit Mode");
        #endif
    }
    return (EXIT_SUCCESS);
}

void application_init(void){
#if CHAR_LCD_MODE==4
    lcd_intialize(&lcd_1);
    lcd_intialize(&lcd_2);
#endif
    
#if CHAR_LCD_MODE==8
    lcd_intialize(&lcd_1);
#endif
}