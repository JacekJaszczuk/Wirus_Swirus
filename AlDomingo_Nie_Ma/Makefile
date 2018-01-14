CC = gcc
CFLAGS = -fPIC -Wall -Wextra -O2 -g -std=c99
LDFLAGS = -shared
TARGET_LIB = libAlDomingo.so
SRCS = AlDomingo.c
OBJS = $(SRCS:.c=.o)
DBJS = $(SRCS:.c=.d)

.PHONY: all
all: $(TARGET_LIB)

$(TARGET_LIB): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

%.d: %.c
	$(CC) -MM $^ > $@

include $(DBJS)

.PHONY: clean
clean:
	rm -f $(TARGET_LIB) $(OBJS) $(DBJS)

