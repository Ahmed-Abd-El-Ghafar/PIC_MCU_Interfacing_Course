/* 
 * File:   seven_seg.h
 * Author: Ahmed.Elghafar
 *
 * Created on September 19, 2020, 11:02 PM
 */

#ifndef SEVEN_SEG_H
#define	SEVEN_SEG_H

#include "../mcc_generated_files/mcc.h"

typedef unsigned char uint8_t;

typedef enum function_return{
    R_NOK,
    R_OK
}function_return_t;

typedef enum seven_segment_type{
    ANODE,
    CATODE
}seven_segment_type_t;

typedef enum seven_segment_encoder{
    NO_ENCODER,
    WITH_ENCODER
}seven_segment_encoder_t;

typedef struct seven_segment{
    seven_segment_type_t seg_type;
    seven_segment_encoder_t seg_encoder;
}seven_segment_t;

function_return_t print_number_seven_seg(uint8_t number);

#endif	/* SEVEN_SEG_H */

