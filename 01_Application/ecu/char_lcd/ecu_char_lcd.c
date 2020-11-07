/* 
 * File:   ecu_char_lcd.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on November 6, 2020, 7:42 PM
 */

#include <stdio.h>

#include "ecu_char_lcd.h"

/**
 * 
 * @param _lcd
 */
static void lcd_send_enable(const char_lcd_t *_lcd){
#if CHAR_LCD_MODE==8
    gpio_pin_write_value(_lcd->lcd_en_port, _lcd->lcd_en_pin, PIN_HIGH);
    __delay_us(200);
    gpio_pin_write_value(_lcd->lcd_en_port, _lcd->lcd_en_pin, PIN_LOW);
#elif CHAR_LCD_MODE==4
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_en_pin, PIN_HIGH);
    __delay_us(200);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_en_pin, PIN_LOW);
#endif
}

/**
 * 
 * @param _lcd
 * @param row
 * @param coulmn
 */
static void lcd_set_cursor(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn){
    coulmn--;
    switch(row){
        case 1 : lcd_send_command(_lcd, (0x80 + coulmn)); break;
        case 2 : lcd_send_command(_lcd, (0xC0 + coulmn)); break;
        case 3 : lcd_send_command(_lcd, (0x94 + coulmn)); break;
        case 4 : lcd_send_command(_lcd, (0xD4 + coulmn)); break;
        default : ;
    }
}

/**
 * 
 * @param _lcd
 * @param _data
 */
#if CHAR_LCD_MODE==4
static void lcd_send_4bit(const char_lcd_t *_lcd, uint8_t _data){
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin4, ((_data >> 0) & 0x1));
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin5, ((_data >> 1) & 0x1));
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin6, ((_data >> 2) & 0x1));
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin7, ((_data >> 3) & 0x1));
}
#endif

/**
 * 
 * @param _lcd
 */
#if CHAR_LCD_MODE==8
static void lcd_8bit_intialize(const char_lcd_t *_lcd){
    gpio_port_direction_intialize(_lcd->lcd_data_port, PORT_DIRECTION_OUTPUT);
    gpio_port_write_value(_lcd->lcd_data_port, PORT_ALL_CLEAR);
    gpio_pin_direction_intialize(_lcd->lcd_en_port, _lcd->lcd_en_pin, DIRECTION_OUTPUT);
    gpio_pin_write_value(_lcd->lcd_en_port, _lcd->lcd_en_pin, PIN_LOW);
    gpio_pin_direction_intialize(_lcd->lcd_rs_port, _lcd->lcd_rs_pin, DIRECTION_OUTPUT);
    gpio_pin_write_value(_lcd->lcd_rs_port, _lcd->lcd_rs_pin, PIN_LOW);
    
    __delay_ms(40);
    lcd_send_command(_lcd, _LCD_8BIT_MODE_2_LINE); // 8 Bit Mode
    __delay_ms(5);
    lcd_send_command(_lcd, _LCD_8BIT_MODE_2_LINE); // 8 Bit Mode
    __delay_us(300);
    lcd_send_command(_lcd, _LCD_8BIT_MODE_2_LINE); // 8 Bit Mode

    lcd_send_command(_lcd, _LCD_CLEAR);
    lcd_send_command(_lcd, _LCD_RETURN_HOME);
    lcd_send_command(_lcd, _LCD_ENTRY_MODE);
    lcd_send_command(_lcd, _LCD_CURSOR_OFF_DISPLAY_ON);
    lcd_send_command(_lcd, _LCD_8BIT_MODE_2_LINE);
    lcd_send_command(_lcd, 0x80);
}
#endif

/**
 * 
 * @param _lcd
 */
#if CHAR_LCD_MODE==4
static void lcd_4bit_intialize(const char_lcd_t *_lcd){
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_data_pin4, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_data_pin5, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_data_pin6, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_data_pin7, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_en_pin, DIRECTION_OUTPUT);
    gpio_pin_direction_intialize(_lcd->lcd_data_port, _lcd->lcd_rs_pin, DIRECTION_OUTPUT);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin4, PIN_LOW);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin5, PIN_LOW);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin6, PIN_LOW);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_data_pin7, PIN_LOW);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_en_pin, PIN_LOW);
    gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_rs_pin, PIN_LOW);
    
    lcd_send_command(_lcd, _LCD_CLEAR);
    lcd_send_command(_lcd, _LCD_RETURN_HOME);
    lcd_send_command(_lcd, _LCD_CURSOR_OFF_DISPLAY_ON);
    lcd_send_command(_lcd, _LCD_DISPLAY_SHIFT_RIGHT);
    lcd_send_command(_lcd, _LCD_4BIT_MODE_2_LINE);
    lcd_send_command(_lcd, _LCD_DDRAM_START);
}
#endif

/**
 * 
 * @param _lcd
 * @return 
 */
ret_status lcd_intialize(const char_lcd_t *_lcd){
#if CHAR_LCD_MODE==8
    lcd_8bit_intialize(_lcd);
#elif CHAR_LCD_MODE==4
    lcd_4bit_intialize(_lcd);
#endif
}

/**
 * 
 * @param _lcd
 * @param command
 * @return 
 */
ret_status lcd_send_command(const char_lcd_t *_lcd, uint8_t command){
    ret_status ret = R_NOK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        #if CHAR_LCD_MODE==4
        gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_rs_pin, PIN_LOW);
        lcd_send_4bit(_lcd, command>>4);
        lcd_send_enable(_lcd);
        lcd_send_4bit(_lcd, command&0x0F);
        lcd_send_enable(_lcd);
        #elif CHAR_LCD_MODE==8
        gpio_pin_write_value(_lcd->lcd_rs_port, _lcd->lcd_rs_pin, PIN_LOW);
        gpio_port_write_value(_lcd->lcd_data_port, command);
        lcd_send_enable(_lcd);
        __delay_ms(2);
        #endif
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @param _data
 * @return 
 */
ret_status lcd_send_char_data(const char_lcd_t *_lcd, uint8_t _data){
    ret_status ret = R_NOK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        #if CHAR_LCD_MODE==4
        gpio_pin_write_value(_lcd->lcd_data_port, _lcd->lcd_rs_pin, PIN_HIGH);
        lcd_send_4bit(_lcd, _data>>4);
        lcd_send_enable(_lcd);
        lcd_send_4bit(_lcd, _data&0x0F);
        lcd_send_enable(_lcd);
        #elif CHAR_LCD_MODE==8
        gpio_pin_write_value(_lcd->lcd_rs_port, _lcd->lcd_rs_pin, PIN_HIGH);
        gpio_port_write_value(_lcd->lcd_data_port, _data);
        lcd_send_enable(_lcd);
        #endif
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @param row
 * @param coulmn
 * @param _data
 * @return 
 */
ret_status lcd_send_char_data_pos(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, uint8_t _data){
    ret_status ret = R_NOK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        lcd_send_command(_lcd, _LCD_RETURN_HOME);
        lcd_set_cursor(_lcd, row, coulmn);
        lcd_send_char_data(_lcd, _data);
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @param _data
 * @return 
 */
ret_status lcd_send_string_data_current_pos(const char_lcd_t *_lcd, uint8_t *_data){
    ret_status ret = R_NOK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        while(*_data){
            lcd_send_char_data(_lcd, *_data++);
            __delay_ms(1);
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @param row
 * @param coulmn
 * @param _data
 * @return 
 */
ret_status lcd_send_string_data_pos(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, uint8_t *_data){
    ret_status ret = R_NOK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        lcd_send_command(_lcd, _LCD_RETURN_HOME);
        lcd_set_cursor(_lcd, row, coulmn);
        while(*_data){
            lcd_send_char_data(_lcd, *_data++);
            __delay_ms(1);
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @param row
 * @param coulmn
 * @param arr
 * @param _pos
 * @return 
 */
ret_status lcd_send_custome_char(const char_lcd_t *_lcd, uint8_t row, uint8_t coulmn, const char arr[], uint8_t _pos){
     ret_status ret = R_NOK;
     uint8_t l_counter = ZERO_INIT;
    if(NULL == _lcd){
        return ret;
    }
    else{
        lcd_send_command(_lcd, _LCD_CGRAM_START+(_pos*8));
        for(l_counter=0; l_counter<=7; l_counter++){
            lcd_send_char_data(_lcd, arr[l_counter]);
        }
        lcd_send_command(_lcd, _LCD_RETURN_HOME);
        lcd_send_char_data_pos(_lcd, row, coulmn, _pos);
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _lcd
 * @return 
 */
ret_status lcd_clear_display(const char_lcd_t *_lcd){
    ret_status ret = R_OK;
    if(NULL == _lcd){
        return ret;
    }
    else{
        lcd_send_command(_lcd, _LCD_CLEAR);
    }
    return ret;
}

/**
 * 
 * @param number
 * @param _output
 */
void byte_to_string(uint8_t number, uint8_t *_output){
    sprintf(_output, "%i", number);
}

/**
 * 
 * @param number
 * @param _output
 */
void short_to_string(uint16_t number, uint8_t *_output){
    sprintf(_output, "%i", number);
}

/**
 * 
 * @param number
 * @param _output
 */
void int_to_string(uint32_t number, uint8_t *_output){
    sprintf(_output, "%i", number);
}
