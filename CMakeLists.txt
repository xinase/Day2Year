cmake_minimum_required(VERSION 3.10)
project(YearConverterTutorial)

set(CMAKE_CXX_STANDARD 17)

# Better coverage flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")

# Add policy to handle download timestamp warning
cmake_policy(SET CMP0135 NEW)

# --- GoogleTest ---
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)
FetchContent_MakeAvailable(googletest)

# --- Main library ---
add_library(year_converter_lib src/YearConverter.cpp)
target_include_directories(year_converter_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# --- Tests ---
add_executable(run_tests tests/test_main.cpp)
target_link_libraries(run_tests PRIVATE year_converter_lib gtest_main)

include(GoogleTest)
gtest_discover_tests(run_tests)

