# Install script for directory: /home/ayush/Work/cychain-poc/include/bicycl/src

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
    set(CMAKE_INSTALL_CONFIG_NAME "Coverage")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/bicycl" TYPE FILE FILES
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/seclevel.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/seclevel.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/gmp_extras.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/gmp_extras.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/openssl_wrapper.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/openssl_wrapper.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/ec.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/ec.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/qfi.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/qfi.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSM_utils.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSM_utils.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSMqk.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSMqk.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSM2k.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/CL_HSM2k.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/Paillier.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/Paillier.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/Joye_Libert.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/Joye_Libert.inl"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/threshold_ECDSA.hpp"
    "/home/ayush/Work/cychain-poc/include/bicycl/src/bicycl/threshold_ECDSA.inl"
    )
endif()

