
#include "mcc_generated_files/mcc.h"

uint8_t counter = 0, read_value = 0;

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();
    while (1)
    {
        // Add your application code
        DATAEE_WriteByte(0x88, counter);
        counter++;
        __delay_ms(1000);
        read_value = DATAEE_ReadByte(0x88);
        if(10 == read_value){
            PORTCbits.RC0 = 1;
        }
        else{
            PORTCbits.RC0 = 0;
        }
    }
}
/**
 End of File
*/