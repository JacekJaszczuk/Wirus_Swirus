#define BAUD 2400
#include <util/setbaud.h>
#include <string.h>

class Serial
{
public:
    Serial()
    {
        // Podstawowa prędkość:
        UBRR0H = UBRRH_VALUE;
        UBRR0L = UBRRL_VALUE;
    
        // Podwójna prędkość:
        #if USE_2X
        UCSR0A |= _BV(U2X0);
        #else
        UCSR0A &= ~(_BV(U2X0));
        #endif

        // Parametry UART:
        UCSR0C = _BV(UCSZ01) | _BV(UCSZ00); // 8 bitów.
        UCSR0B = _BV(RXEN0) | _BV(TXEN0);   // TX i RX.
    }

    void putchar(const char c)
    {
        loop_until_bit_is_set(UCSR0A, UDRE0); // Czekaj, aż rejestr będzie pusty.
        UDR0 = c;
    }

    void putstring(const char s[])
    {
        for(size_t i = 0; i < strlen(s); i++)
        {
            putchar(s[i]);
        }
    }
};