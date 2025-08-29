#!/bin/bash

# Clean previous coverage data
find . -name "*.gcda" -delete
find . -name "*.gcno" -delete
rm -rf coverage_report
mkdir -p coverage_report

# Rebuild the project
rm -rf build
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make

# Run the tests
./run_tests

# 生成HTML报告
echo "=== Generating HTML coverage report ==="
gcovr --root ../src \
      --object-directory . \
      --html \
      --html-details \
      -o ../coverage_report/index.html

# 显示各种覆盖率信息
echo "=== Line Coverage ==="
gcovr --root ../src --object-directory . 

echo "=== Branch Coverage ==="
gcovr --root ../src --object-directory . --branches

echo "=== Function Coverage ==="
gcovr --root ../src --object-directory . --functions

echo "Coverage report generated: coverage_report/index.html"
echo "Open coverage_report/index.html to see the full report with branch coverage details"