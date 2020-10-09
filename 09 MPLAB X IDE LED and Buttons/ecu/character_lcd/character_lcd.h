/* 
 * File:   character_lcd.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 7:10 PM
 */

#ifndef CHARACTER_LCD_H
#define	CHARACTER_LCD_H

#include "../../mcal/gpio/mcal_gpio.h"

#define LCD_MODE 4

/* LCD Commands */
#define _LCD_CLEAR               0x01
#define _LCD_RETURN_HOME         0x02
#define _LCD_CURSOR_OFF          0x00
#define _LCD_UNDERLINE_ON        0x00
#define _LCD_BLINK_CURSOR_ON     0x00
#define _LCD_TURN_ON             0x00
#define _LCD_TURN_OFF            0x00
#define _LCD_SHIFT_CURSOR_LEFT   0x04
#define _LCD_SHIFT_CURSOR_RIGHT  0x06
#define _LCD_SHIFT_DISPLAY_RIGHT 0x05
#define _LCD_SHIFT_DISPLAY_LEFT  0x07
#define _LCD_DISPLAY_OFF_CURSOR_OFF  0x08
#define _LCD_DISPLAY_OFF_CURSOR_ON   0x0A

typedef struct{
    port_index port_name;
}char_lcd_t;

ret_status Lcd_character_Init(char_lcd_t *lcd);
ret_status Lcd_character_Out(uint8_t row, uint8_t column, uint8_t *text);
ret_status Lcd_character_Out_Cp(uint8_t *text);
ret_status Lcd_character_Chr(uint8_t row, uint8_t column, uint8_t out_char);
ret_status Lcd_character_Chr_Cp(uint8_t out_char);
ret_status Lcd_character_Cmd(uint8_t command);
ret_status Lcd_character_custome_char(uint8_t command);

#endif	/* CHARACTER_LCD_H */
