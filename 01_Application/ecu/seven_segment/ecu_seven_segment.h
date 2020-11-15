/* 
 * File:   ecu_seven_segment.h
 * Author: Ahmed.Elghafar
 *
 * Created on November 13, 2020, 8:56 PM
 */

#ifndef ECU_SEVEN_SEGMENT_H
#define	ECU_SEVEN_SEGMENT_H

#include "../../mcal/gpio/mcal_gpio.h"

typedef enum{
    COMMON_ANODE,
    COMMON_CATHODE
}segment_type_t;

typedef struct{
    port_index port;
    segment_type_t type;
}segment_t;

void seven_segment_direct_connection_initialize(const segment_t *_seg);
void seven_segment_direct_connection_write_number(const segment_t *_seg, uint8_t value);

#endif	/* ECU_SEVEN_SEGMENT_H */

