cmake_minimum_required(VERSION 3.15)
project(lb10)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_EXPORT_COMPILE_COMMANDS On)

add_executable(lb10 main.cpp Deck.cpp Deck.h SortedDeck.cpp SortedDeck.h)
include(../PVS-Studio.cmake)

pvs_studio_add_target(TARGET example1.analyze ALL
        OUTPUT FORMAT errorfile
        ANALYZE ${PROJECT_NAME}
        MODE GA:1,2 OP
        LOG target.err)