/* 
 * File:   application.c
 * Author: Ahmed.Elghafar
 * https://www.linkedin.com/in/ahmedabdelghafarmohammed/
 * Created on October 16, 2020, 7:53 PM
 */

#include "application.h"

segment_t seg_1 = {
  .port = PORTC_INDEX,
  .type = COMMON_ANODE
};

segment_t seg_2 = {
  .port = PORTD_INDEX,
  .type = COMMON_ANODE
};

uint8_t ones = ZERO_INIT, tens = ZERO_INIT;

int main(void) {
    application_init();
    while(TRUE){
        for(tens=ZERO_INIT; tens<= 9; tens++){
            seven_segment_direct_connection_write_number(&seg_2, tens);
            for(ones=ZERO_INIT; ones<= 9; ones++){
                seven_segment_direct_connection_write_number(&seg_1, ones);
                __delay_ms(500);
            }
        }
    }
    return (EXIT_SUCCESS);
}

void application_init(void){
   seven_segment_direct_connection_initialize(&seg_1);
   seven_segment_direct_connection_initialize(&seg_2);
}