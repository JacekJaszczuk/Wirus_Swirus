BIN_DIR = bin
SRC_DIR = src
BUILD_DIR = build

CXX = avr-g++
CXXFLAGS = -Wall -Wextra -Os -mmcu=atmega328p -DF_CPU=16000000UL
LDFLAGS = -mmcu=atmega328p

# Bardzo ważne jest prawidłowe linkowanie: https://www.microchip.com/webdoc/AVRLibcReferenceManual/group__demo__project_1demo_project_compile.html

TARGET = $(BIN_DIR)/serial_test
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
	avr-size --format=avr --mcu=atmega328p $@

-include $(DBJS)

.PHONY: clean
clean:
	rm -fr $(BIN_DIR) $(BUILD_DIR)

.PHONY: program_mcu
program_mcu: $(TARGET)
	#avrdude -v -patmega328p -cusbasp -U flash:w:$(TARGET):e
	avrdude -v -patmega328p -carduino -P /dev/ttyACM0 -U flash:w:$(TARGET):e
