
#include "mcc_generated_files/mcc.h"
#include "ECU Layer/seven_seg.h"

volatile uint8_t counter = 0;

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    function_return_t ret = R_NOK;
    while (1)
    {
        // Add your application code
        for(counter = 0; counter <= 9; counter++){
            ret = print_number_seven_seg(counter);
            __delay_ms(500);
        }  
    }
}
/**
 End of File
*/