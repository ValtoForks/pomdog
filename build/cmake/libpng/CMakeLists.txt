cmake_minimum_required(VERSION 3.2)

project(libpng C)
set(PRODUCT_NAME )

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -O0 -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -DNDEBUG")

include_directories(
  ../../../dependencies/libpng
  ../../../dependencies/vendor/libpng
  ../../../dependencies/zlib
)

add_library(
  png STATIC
  ../../../dependencies/vendor/libpng/pnglibconf.h
  ../../../dependencies/libpng/png.c
  ../../../dependencies/libpng/png.h
  ../../../dependencies/libpng/pngconf.h
  ../../../dependencies/libpng/pngdebug.h
  ../../../dependencies/libpng/pngerror.c
  ../../../dependencies/libpng/pngget.c
  ../../../dependencies/libpng/pnginfo.h
  ../../../dependencies/libpng/pngmem.c
  ../../../dependencies/libpng/pngpread.c
  ../../../dependencies/libpng/pngpriv.h
  ../../../dependencies/libpng/pngread.c
  ../../../dependencies/libpng/pngrio.c
  ../../../dependencies/libpng/pngrtran.c
  ../../../dependencies/libpng/pngrutil.c
  ../../../dependencies/libpng/pngset.c
  ../../../dependencies/libpng/pngstruct.h
  ../../../dependencies/libpng/pngtrans.c
  ../../../dependencies/libpng/pngwio.c
  ../../../dependencies/libpng/pngwrite.c
  ../../../dependencies/libpng/pngwtran.c
  ../../../dependencies/libpng/pngwutil.c
)
target_link_libraries(png z)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib)
