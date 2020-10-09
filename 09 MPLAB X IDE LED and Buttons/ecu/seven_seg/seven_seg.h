/* 
 * File:   seven_seg.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 4:53 PM
 */

#ifndef SEVEN_SEG_H
#define	SEVEN_SEG_H

#include "../../mcal/gpio/mcal_gpio.h"

typedef struct{
    port_index port_name;
}seven_seg_t;

ret_status seven_seg_display_number(seven_seg_t segment, uint8_t number);

#endif	/* SEVEN_SEG_H */

