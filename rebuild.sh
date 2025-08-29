#!/bin/bash

echo "Cleaning build directory..."
rm -rf build/

echo "Creating build directory..."
mkdir -p build

echo "Entering build directory..."
cd build

echo "Running CMake..."
cmake ..

echo "Building project..."
cmake --build .

echo "Build complete!"