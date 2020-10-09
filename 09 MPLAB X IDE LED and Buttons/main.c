
//#include "ecu/motor/dc_motor.h"
//#include "ecu/seven_seg/seven_seg.h"
//#include "ecu/character_lcd/character_lcd.h"
//#include "ecu/keypad/keypad.h"

#include "mcc_generated_files/mcc.h"
#include "ecu/led/led.h"
#include "ecu/button/button.h"

led_t leds[SEQ_LED_LENGTH] = {{.port_name=PORTC_INDEX, .pin=PIN0, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN1, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN2, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN3, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN4, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN5, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN6, .led_status=LED_OFF},
                 {.port_name=PORTC_INDEX, .pin=PIN7, .led_status=LED_OFF}
                };
uint8_t leds_seq1[][SEQ_LED_LENGTH] = {{1, 0, 0, 0, 0, 0, 0, 1},
                                       {1, 1, 0, 0, 0, 0, 1, 1},
                                       {1, 1, 1, 0, 0, 1, 1, 1},
                                       {1, 1, 1, 1, 1, 1, 1, 1},
                                      };

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    while (1)
    {
        /* led_sequence(leds, leds_seq1, 4); */
    }
}
