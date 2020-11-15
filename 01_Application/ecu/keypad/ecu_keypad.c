/* 
 * File:   ecu_keypad.c
 * Author: Ahmed.Elghafar
 *
 * Created on November 13, 2020, 5:40 PM
 */

#include "ecu_keypad.h"

static uint8_t btn_values[KEYPAD_ROW][KEYPAD_COLUMNS] = {
                                                            {'7','8','9','/'},
                                                            {'4','5','6','*'},
                                                            {'1','2','3','-'},
                                                            {'*','0','=','+'}
                                                        };
/**
 * 
 * @param _keypad
 * @return 
 */
ret_status keypad_initialize(const keypad_t *_keypad){
    ret_status ret = R_NOK;
    uint8_t l_counter = ZERO_INIT;
    if(NULL == _keypad){
        return ret;
    }
    else{
        for(l_counter=ZERO_INIT; l_counter<KEYPAD_ROW; l_counter++){
            gpio_pin_direction_intialize(_keypad->keypad_rows[l_counter].port_name, _keypad->keypad_rows[l_counter].pin_number,
                                         DIRECTION_OUTPUT);
            gpio_pin_write_value(_keypad->keypad_rows[l_counter].port_name, _keypad->keypad_rows[l_counter].pin_number,
                                         PIN_LOW);
        }
        for(l_counter=ZERO_INIT; l_counter<KEYPAD_COLUMNS; l_counter++){
            gpio_pin_direction_intialize(_keypad->keypad_columns[l_counter].port_name, _keypad->keypad_columns[l_counter].pin_number,
                                         DIRECTION_INPUT);
        }
        ret = R_OK;
    }
    return ret;
}

/**
 * 
 * @param _keypad
 * @return 
 */
uint8_t keypad_read_value(const keypad_t *_keypad){
    uint8_t l_row_counter = ZERO_INIT, l_col_counter = ZERO_INIT, l_counter = ZERO_INIT;
    pin_logic_t logic = PIN_LOW;
    for(l_row_counter=ZERO_INIT; l_row_counter<KEYPAD_ROW; l_row_counter++){
        for(l_counter=ZERO_INIT; l_counter<KEYPAD_ROW; l_counter++){
            gpio_pin_write_value(_keypad->keypad_rows[l_counter].port_name, _keypad->keypad_rows[l_counter].pin_number, PIN_LOW);
        }
        gpio_pin_write_value(_keypad->keypad_rows[l_row_counter].port_name, _keypad->keypad_rows[l_row_counter].pin_number, PIN_HIGH);
        __delay_ms(50);
        for(l_col_counter=ZERO_INIT; l_col_counter<KEYPAD_COLUMNS; l_col_counter++){
            gpio_pin_read_value(_keypad->keypad_columns[l_col_counter].port_name, _keypad->keypad_columns[l_col_counter].pin_number, &logic);
            if(PIN_HIGH == logic){
                while(PIN_HIGH == logic){
                    gpio_pin_read_value(_keypad->keypad_columns[l_col_counter].port_name, _keypad->keypad_columns[l_col_counter].pin_number, &logic);
                }
                return btn_values[l_row_counter][l_col_counter];
            }
        }
    }
    return 0;
}
