cmake_minimum_required(VERSION 3.31...4.4)
project(myapp VERSION 0.0.1 LANGUAGES CXX)
# The nixpkgs cc-wrapper's -print-resource-dir breaks clang-scan-deps.
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)
add_executable(myapp src/main.cpp)
target_compile_features(myapp PRIVATE cxx_std_23)
install(TARGETS myapp)
