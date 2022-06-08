# これはないといけないらしい
cmake_minimum_required(VERSION 3.13)

# これもないといけないらしい
project(blink C CXX ASM)

# この2つがないと pico_add_extra_outputs() を呼び出せない。
include(pico_sdk_import.cmake)  #pico_sdk_import.cmake をインクルードする。
pico_sdk_init()
# project() を作ってから pico_sdk_init() する必要があるっぽい

# この2つはなくても通りそう？
#set(CMAKE_C_STANDAERD 11)
#set(CMAKE_CXX_STANDARD 17)

add_executable(blink
blink.c
)
# Pull in our pico_stdlib which pulls in commonly used features
target_link_libraries(blink pico_stdlib)
# create map/bin/hex file etc.
pico_add_extra_outputs(blink)
# add url via pico_set_program_url
# example_auto_set_url(blink)


