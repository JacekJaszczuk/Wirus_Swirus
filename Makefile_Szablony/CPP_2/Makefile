BIN_DIR = bin
SRC_DIR = src
BUILD_DIR = build

CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -g
LDFLAGS  = -lncurses

TARGET = $(BIN_DIR)/program
SRCS   = $(shell find $(SRC_DIR) -name '*.cpp')
TMP    = $(subst $(SRC_DIR)/,$(BUILD_DIR)/,$(SRCS))
OBJS   = $(TMP:.cpp=.o)
DBJS   = $(TMP:.cpp=.d)

.PHONY: all
all: $(TARGET)

$(BUILD_DIR)/%.d: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -MM -MT "$(@:.d=.o)" $< > $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(OBJS) $(LDFLAGS) -o $@

-include $(DBJS)

.PHONY: clean
clean:
	rm -fr $(BIN_DIR) $(BUILD_DIR)

.PHONY: run
run: $(TARGET)
	@$(TARGET)
