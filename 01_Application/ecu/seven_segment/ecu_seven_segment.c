/* 
 * File:   ecu_seven_segment.c
 * Author: Ahmed.Elghafar
 *
 * Created on November 13, 2020, 8:56 PM
 */

#include "ecu_seven_segment.h"

static uint8_t common_anode_values[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
static uint8_t common_cathode_values[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

void seven_segment_direct_connection_initialize(const segment_t *_seg){
    gpio_port_direction_intialize(_seg->port, PORT_DIRECTION_OUTPUT);
    gpio_port_write_value(_seg->port, PORT_ALL_OFF);
}

void seven_segment_direct_connection_write_number(const segment_t *_seg, uint8_t value){
    if(_seg->type == COMMON_ANODE){
        gpio_port_write_value(_seg->port, common_anode_values[value]);
    }
    else{
        gpio_port_write_value(_seg->port, common_cathode_values[value]);
    }
}