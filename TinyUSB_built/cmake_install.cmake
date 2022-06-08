# Install script for directory: /home/shiokaze/Documents/pi/pico/tinyusb/examples/device

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/arm-none-eabi-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/pico-sdk/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/audio_4_channel_mic/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/audio_test/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/board_test/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/cdc_dual_ports/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/cdc_msc/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/dfu/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/dfu_runtime/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/dynamic_configuration/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/hid_composite/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/hid_generic_inout/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/hid_multiple_interface/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/midi_test/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/msc_dual_lun/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/net_lwip_webserver/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/uac2_headset/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/usbtmc/cmake_install.cmake")
  include("/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/webusb_serial/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/shiokaze/Documents/pi/pico/tinyusb/examples/device/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
