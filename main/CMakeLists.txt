add_executable(keyboard keyboard.c)

target_link_libraries(keyboard pico_stdlib tinyusb_device tinyusb_board)
# target_link_libraries(${keyboard} pico_stdlib)
# target_link_libraries(${keyboard} tinyusb_device)
# target_link_libraries(${keyboard} tinyusb_board)

pico_add_extra_outputs(keyboard)
