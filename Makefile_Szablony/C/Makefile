CC = gcc
CFLAGS = -Wall -Wextra -O2 -g -std=c99
LDFLAGS = -l ncurses
TARGET = pro
SRCS = pro.c fun.c
OBJS = $(SRCS:.c=.o)
DBJS = $(SRCS:.c=.d)

.PHONY: all
all: $(TARGET)

%.d: %.c
	$(CC) -MM $< > $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

include $(DBJS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS) $(DBJS)

