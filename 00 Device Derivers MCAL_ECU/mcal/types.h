/* 
 * File:   types.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 7, 2020, 1:52 PM
 */

#ifndef TYPES_H
#define	TYPES_H

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char sint8_t;
typedef signed short sint16_t;
typedef signed long sint32_t;

typedef enum{
    R_NOK,
    R_OK
}ret_status;

#define ZERO_INIT 0x0U

#endif	/* TYPES_H */

