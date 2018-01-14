SRCS = program.c pros.c
OBJS = $(SRCS:.c=.o)

# Polecenie nie odwołuje się do pliku, tylko do polecenia systemowego.
.PHONY: testo1

pro:

testo1:
	echo "TEST1:" $(OBJS)

testo2: AlaMaKota ArekMaPsa
	echo "Cel: "$@", Zależności: "$^

testo3: AlaMaKota ArekMaPsa
	echo "Cel: "$@", Pierwszy prerekwizyt: "$<

Pliku.xyz:

%.xyz: testo1
	echo "To pliku XYZ"

# Generowanie plików ".d" <- pliki zależności dla 'make'
pro.d:

%.d: %.c
	gcc -MM $^ > $@

include pro.d

AlaMaKota:
	echo "Tu nic nie ma Ala"

ArekMaPsa:
	echo "Tu nic nie ma Arek"
