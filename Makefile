CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude

APP_NAME = app
TEST_NAME = test

SRC_DIR = src
TEST_DIR = test
INCLUDE_DIR = include
BUILD_DIR = build

APP_SOURCES = $(SRC_DIR)/main.cpp $(SRC_DIR)/funcoes.cpp
TEST_SOURCES = $(TEST_DIR)/main.cpp $(SRC_DIR)/funcoes.cpp

APP_OBJECTS = $(BUILD_DIR)/main.o $(BUILD_DIR)/funcoes.o
TEST_OBJECTS = $(BUILD_DIR)/test_main.o $(BUILD_DIR)/funcoes_test.o

all: $(APP_NAME)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp $(INCLUDE_DIR)/funcoes.hpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/funcoes.o: $(SRC_DIR)/funcoes.cpp $(INCLUDE_DIR)/funcoes.hpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(APP_NAME): $(APP_OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BUILD_DIR)/test_main.o: $(TEST_DIR)/main.cpp $(INCLUDE_DIR)/funcoes.hpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/funcoes_test.o: $(SRC_DIR)/funcoes.cpp $(INCLUDE_DIR)/funcoes.hpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TEST_NAME): $(BUILD_DIR)/test_main.o $(BUILD_DIR)/funcoes_test.o
	$(CXX) $(CXXFLAGS) $^ -o $@

run: $(APP_NAME)
	./$(APP_NAME)

test: $(TEST_NAME)
	./$(TEST_NAME)

clean:
	rm -rf $(BUILD_DIR) $(APP_NAME) $(TEST_NAME)

.PHONY: all run test clean