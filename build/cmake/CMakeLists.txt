cmake_minimum_required(VERSION 3.2)

project(Pomdog CXX)

include(pomdog.cmake)
install(TARGETS pomdog DESTINATION lib)

include(PomdogTest.cmake)
