cmake_minimum_required(VERSION 3.2)

project(glew C)

add_definitions(-DGLEW_STATIC)
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -O0 -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -DNDEBUG")

include_directories(
  ../../../dependencies/vendor/glew/include
)

add_library(
  glew_static STATIC
  ../../../dependencies/vendor/glew/include/GL/glew.h
  ../../../dependencies/vendor/glew/include/GL/glxew.h
  ../../../dependencies/vendor/glew/include/GL/wglew.h
  ../../../dependencies/vendor/glew/src/glew.c
)
