cmake_minimum_required(VERSION 3.2)

project(zlib C)

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -O0 -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -DNDEBUG")

include_directories(
  ../../../dependencies/zlib
)

add_library(z STATIC
  ../../../dependencies/zlib/adler32.c
  ../../../dependencies/zlib/compress.c
  ../../../dependencies/zlib/crc32.c
  ../../../dependencies/zlib/crc32.h
  ../../../dependencies/zlib/deflate.c
  ../../../dependencies/zlib/deflate.h
  ../../../dependencies/zlib/gzclose.c
  ../../../dependencies/zlib/gzguts.h
  ../../../dependencies/zlib/gzlib.c
  ../../../dependencies/zlib/gzread.c
  ../../../dependencies/zlib/gzwrite.c
  ../../../dependencies/zlib/infback.c
  ../../../dependencies/zlib/inffast.c
  ../../../dependencies/zlib/inffast.h
  ../../../dependencies/zlib/inffixed.h
  ../../../dependencies/zlib/inflate.c
  ../../../dependencies/zlib/inflate.h
  ../../../dependencies/zlib/inftrees.c
  ../../../dependencies/zlib/inftrees.h
  ../../../dependencies/zlib/trees.c
  ../../../dependencies/zlib/trees.h
  ../../../dependencies/zlib/uncompr.c
  ../../../dependencies/zlib/zconf.h
  ../../../dependencies/zlib/zlib.h
  ../../../dependencies/zlib/zutil.c
  ../../../dependencies/zlib/zutil.h
)
