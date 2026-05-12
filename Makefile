CXX = g++
CXXFLAGS = -Wall -Iinclude

SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, bin/%.o, $(SRC))

TARGET = bin/exe

TEST_SRC = test/mainTest.cpp src/container.cpp
TEST_OBJ = $(patsubst %.cpp, bin/%.o, $(TEST_SRC))

TEST_TARGET = bin/test

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET)

bin/%.o: src/%.cpp
	@mkdir -p bin
	$(CXX) $(CXXFLAGS) -c $< -o $@

bin/%.o: test/%.cpp
	@mkdir -p bin
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJ)
	$(CXX) $(TEST_OBJ) -o $(TEST_TARGET)

clean:
	rm -rf bin/*