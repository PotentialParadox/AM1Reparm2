cmake_minimum_required(VERSION 3.2)
project(AM1Reparm2)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fopenmp -O3 -ftree-vectorizer-verbose=1 -I /usr/local/Cellar/galib/247/include/ga")


set(SOURCE_FILES src/core/main.cpp)
add_executable(AM1Reparm2 ${SOURCE_FILES} src/core/AM1geneticAlgorithm.cpp src/core/AM1geneticAlgorithm.h src/utils/tools.h src/core/AM1gene.h src/core/AM1gene.cpp src/core/AM1gene.h)