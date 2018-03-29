CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -g -std=c++11
LDFLAGS = -l ncurses
TARGET = pro
SRCS = pro.cpp fun.cpp
OBJS = $(SRCS:.cpp=.o)
DBJS = $(SRCS:.cpp=.d)

.PHONY: all
all: $(TARGET)

%.d: %.cpp
	$(CXX) $(CXXFLAGS) -MM $< > $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) $(LDFLAGS) -o $@

-include $(DBJS)

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS) $(DBJS)

