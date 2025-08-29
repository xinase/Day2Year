#!/bin/bash

# Clean previous coverage data
find . -name "*.gcda" -delete
find . -name "*.gcno" -delete
rm -rf build/coverage_report

# Rebuild the project
rm -rf build
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make

# Run the tests
./run_tests

# Generate coverage info
lcov --capture --directory . \
     --output-file coverage.info \
     --rc lcov_branch_coverage=1 \
     --ignore-errors mismatch \
     --ignore-errors gcov

# Remove unwanted data
lcov --remove coverage.info \
     '/usr/*' \
     '*/googletest/*' \
     --output-file filtered_coverage.info \
     --ignore-errors empty

# Generate HTML report
genhtml filtered_coverage.info \
        --output-directory coverage_report \
        --title "YearConverter Coverage" \
        --legend \
        --branch-coverage \
        --ignore-errors source

echo "Coverage report generated in build/coverage_report/index.html"