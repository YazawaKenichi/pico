cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 11)	#CMAKE_C_STANDARD という変数に 11 を格納
set(CMAKE_CXX_STANDARD 17)	#CMAKE_CXX_STANDARD という変数に 17 を格納
pico_sdk_init()

#add_executable(hogehoge hogehoge.c) は hogehoge というプログラムを hogehoge.c からビルドする必要があることを宣言する。
#[[
	これはプログラムのビルドに使用されるターゲット名でもある。
	ここでは make test ということができるっぽいが、正直まだピンとこない。
	executable() には複数のターゲットを指定することも可能。
	実際にそれをやったのが pico-example
]]
add_executable(test
	test.c
)

pico_enable_stdio_usb(test 1)
pico_enable_stdio_uart(test 1)

pico_add_extra_outputs(test)

target_link_libraries(test pico_stdlib)	#プログラムが必要とする SDK の機能を引き出す。
#[[
	test が pico_stdlib を使用できるようにしていて、これによってtest.c が pico/stdlib.h を include できるようになる。
	pico/stdlib.h が pico/time.h や hardware/gpio.h を包括するのと同じように、
	pico_stdlib は pico_time や hardware_gpio を包括する。
	つまり / と _ が対応するということ？
]]

# C/C++ SDK 公式 リファレンスによると上記コメントの部分が理解できればあとは理解しなくて大丈夫らしい。
