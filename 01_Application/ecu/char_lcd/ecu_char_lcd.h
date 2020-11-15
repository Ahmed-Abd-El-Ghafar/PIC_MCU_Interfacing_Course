/* 
 * File:   ecu_char_lcd.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on November 6, 2020, 7:42 PM
 */

#ifndef ECU_CHAR_LCD_H
#define	ECU_CHAR_LCD_H

/* Section: Include */
#include "../../mcal/gpio/mcal_gpio.h"

/* Section: Macro Declarations */
#define CHAR_LCD_MODE 4
/********* LCD Commands *********/
#define _LCD_CLEAR              0X01
#define _LCD_RETURN_HOME        0x02
#define _LCD_ENTRY_MODE         0X06
#define _LCD_CURSOR_OFF_DISPLAY_ON      0X0C
#define _LCD_CURSOR_OFF_DISPLAY_OFF     0x08
#define _LCD_CURSOR_ON_BLINK_ON         0x0F
#define _LCD_CURSOR_ON_BLINK_OFF        0x0E
#define _LCD_DISPLAY_SHIFT_RIGHT        0x1C
#define _LCD_DISPLAY_SHIFT_LEFT         0x18
#define _LCD_8BIT_MODE_2_LINE           0x38
#define _LCD_4BIT_MODE_2_LINE           0x28
#define _LCD_CGRAM_START                0x40
#define _LCD_DDRAM_START                0x80

/* Section: Macro Functions Declarations */

/* Section: Data Type Definitions */
typedef struct{
#if CHAR_LCD_MODE==8
    uint8_t lcd_data_port : 4;
    uint8_t lcd_en_port : 4;
    uint8_t lcd_rs_port : 4;
    uint8_t lcd_en_pin : 3;
    uint8_t lcd_rs_pin : 3;
    uint8_t lcd_status : 6;
#elif CHAR_LCD_MODE==4
    uint8_t lcd_data_port : 6;
    uint8_t lcd_data_pin4 : 3;
    uint8_t lcd_data_pin5 : 3;
    uint8_t lcd_data_pin6 : 3;
    uint8_t lcd_data_pin7 : 3;
    uint8_t lcd_en_pin : 3;
    uint8_t lcd_rs_pin : 3;
#else
#error "LCD Mode not valid !!"
#endif
}char_lcd_t;

/* Section: Global variables Declarations */

/* Section: Function declarations */
ret_status lcd_intialize(const char_lcd_t *_lcd);
ret_status lcd_send_command(const char_lcd_t *_lcd, uint8_t command);
ret_status lcd_send_char_data(const char_lcd_t *_lcd, uint8_t _data);
ret_status lcd_send_char_data_pos(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, uint8_t _data);
ret_status lcd_send_string_data_current_pos(const char_lcd_t *_lcd, uint8_t *_data);
ret_status lcd_send_string_data_pos(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, uint8_t *_data);
ret_status lcd_send_custome_char(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, const char arr[], uint8_t _pos);
ret_status lcd_clear_display(const char_lcd_t *_lcd);
void byte_to_string(uint8_t number, uint8_t *_output);
void short_to_string(uint16_t number, uint8_t *_output);
void int_to_string(uint32_t number, uint8_t *_output);

#endif	/* ECU_CHAR_LCD_H */

