CC = gcc
CFLAGS = -Wall -Wextra -O2 -g -std=c99
LDFLAGS = -L AlDomingo -l AlDomingo
TARGET = Program
SRCS = Program.c
OBJS = $(SRCS:.c=.o)
DBJS = $(SRCS:.c=.d)

.PHONY: all
all: $(TARGET)

%.d: %.c
	$(CC) -MM $^ > $@

include $(DBJS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS) $(DBJS)

