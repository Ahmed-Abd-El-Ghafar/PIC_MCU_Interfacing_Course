/* 
 * File:   std_types.h
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:57 PM
 */

#ifndef STD_TYPES_H
#define	STD_TYPES_H

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef signed char sint8_t;
typedef signed short sint16_t;
typedef signed int sint32_t;

#define ZERO_INIT 0
#define TRUE  1
#define FALSE 0

typedef enum{
    R_NOK,
    R_OK
}ret_status;

#endif	/* STD_TYPES_H */

