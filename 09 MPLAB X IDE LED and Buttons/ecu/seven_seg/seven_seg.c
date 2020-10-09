/*
 * File:   seven_seg.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 4:53 PM
 */


#include "seven_seg.h"

/**
 * 
 * @param number
 * @return 
 */
ret_status seven_seg_display_number(seven_seg_t segment, uint8_t number){
    ret_status ret = R_NOK;
    if(number > 9){
        return ret;
    }
    else{
        
        ret = R_OK;
    }
    return ret;
}