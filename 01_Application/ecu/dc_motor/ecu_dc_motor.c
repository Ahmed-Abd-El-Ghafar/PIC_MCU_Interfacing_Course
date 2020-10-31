/*
 * File:   ecu_dc_motor.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 30, 2020, 6:45 PM
 */

#include "ecu_dc_motor.h"

ret_status dc_motor_initialize(dc_motor_t *dc_mtor){
    ret_status ret = R_NOK;
    if(NULL == dc_mtor){
        return ret;
    }
    else{
        relay_initialize(&(dc_mtor->relay1));
        relay_initialize(&(dc_mtor->relay2));
        ret = R_OK;
    }
    return ret;
}

ret_status dc_motor_rotate_right(dc_motor_t *dc_mtor){
    ret_status ret = R_NOK;
    if(NULL == dc_mtor){
        return ret;
    }
    else{
        relay_turn_on(&(dc_mtor->relay1));
        relay_turn_off(&(dc_mtor->relay2));
        ret = R_OK;
    }
    return ret;
}

ret_status dc_motor_rotate_left(dc_motor_t *dc_mtor){
    ret_status ret = R_NOK;
    if(NULL == dc_mtor){
        return ret;
    }
    else{
        relay_turn_off(&(dc_mtor->relay1));
        relay_turn_on(&(dc_mtor->relay2));
        ret = R_OK;
    }
    return ret;
}

ret_status dc_motor_stop(dc_motor_t *dc_mtor){
    ret_status ret = R_NOK;
    if(NULL == dc_mtor){
        return ret;
    }
    else{
        relay_turn_off(&(dc_mtor->relay1));
        relay_turn_off(&(dc_mtor->relay2));
        ret = R_OK;
    }
    return ret;
}

