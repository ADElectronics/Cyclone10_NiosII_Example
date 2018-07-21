#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

int main ()
{
	unsigned int leds = 0x1;
	unsigned int i = 0;

	printf("Hello\n");

    while(1)
    {
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, leds);
        for (i=0; i<(ALT_CPU_CPU_FREQ/500); i++);
        leds = ((leds<<1) & 0xE) | (!(leds>>3) & 0x1);
    }
    return 0;
}
