BIN_DIR = bin
SRC_DIR = src
BUILD_DIR = build

CC = gcc
CCFLAGS = -Wall -Wextra -O2 -g
LDFLAGS = -lncurses

TARGET = $(BIN_DIR)/program
SRCS   = $(shell find $(SRC_DIR) -name '*.c')
TMP    = $(subst $(SRC_DIR)/,$(BUILD_DIR)/,$(SRCS))
OBJS   = $(TMP:.c=.o)
DBJS   = $(TMP:.c=.d)

.PHONY: all
all: $(TARGET)

$(BUILD_DIR)/%.d: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CCFLAGS) -MM -MT "$(@:.d=.o)" $< > $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CCFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

-include $(DBJS)

.PHONY: clean
clean:
	rm -fr $(BIN_DIR) $(BUILD_DIR)

.PHONY: run
run: $(TARGET)
	@$(TARGET)

