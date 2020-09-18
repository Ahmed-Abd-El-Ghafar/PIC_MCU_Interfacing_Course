
#include "mcc_generated_files/mcc.h"

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    while (1)
    {
        // Add your application code
        PORTC =~ PORTC;
        __delay_ms(250);
    }
}
/**
 End of File
*/