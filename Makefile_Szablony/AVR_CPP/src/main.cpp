#include <avr/io.h>
#include <util/delay.h>
#include "serial.h"

int main()
{
    _delay_ms(10);

    // Kierunek dla LEDa (PB5, Arduino 13):
    DDRB |= _BV(PB5);

    Serial serial;
    while (true)
    {
        _delay_ms(1000);
        PORTB ^= _BV(PB5);
        serial.putstring("Ala ma kota!\n");
    }  

    return 0;
}