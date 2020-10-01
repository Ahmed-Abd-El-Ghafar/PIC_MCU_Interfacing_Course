/*
 * File:   seven_seg.c
 * Author: Ahmed.Elghafar
 *
 * Created on September 19, 2020, 10:59 PM
 */

#include "seven_seg.h"

uint8_t common_anode_seg_table[] = {
	0XC0,	 // 0
	0XF9,	 // 1
	0XA4,	 // 2
	0XB0,	 // 3
	0X99,	 // 4
	0X92,	 // 5
	0X83,	 // 6
	0XF8,	 // 7
	0X80,	 // 8
	0X90	 // 9
};

uint8_t common_cathode_seg_table[] = {
	0XC0,	 // 0
	0XF9,	 // 1
	0XA4,	 // 2
	0XB0,	 // 3
	0X99,	 // 4
	0X92,	 // 5
	0X83,	 // 6
	0XF8,	 // 7
	0X80,	 // 8
	0X90	 // 9
};

function_return_t print_number_seven_seg(uint8_t number){
    function_return_t ret = R_NOK;
    if(number > 9){
        return R_NOK;
    }
    else{
        PORTC = common_anode_seg_table[number];
    }
    return R_OK;
}