# Install script for directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local/gromacs")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/opt/rh/devtoolset-11/root/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "RuntimeLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libmuparser.so.2.3.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libmuparser.so.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "\$ORIGIN/../lib64")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE SHARED_LIBRARY FILES
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/lib/libmuparser.so.2.3.4"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/lib/libmuparser.so.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libmuparser.so.2.3.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libmuparser.so.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "::::::::::::::::"
           NEW_RPATH "\$ORIGIN/../lib64")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/opt/rh/devtoolset-11/root/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "RuntimeLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE SHARED_LIBRARY FILES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/lib/libmuparser.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParser.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserBase.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserBytecode.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserCallback.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserDLL.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserDef.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserError.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserFixes.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserInt.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserTemplateMagic.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserTest.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserToken.h"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser/include/muParserTokenReader.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser/muparser-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser/muparser-targets.cmake"
         "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build/CMakeFiles/Export/45a68a068db1a4c8aa91299c0da20349/muparser-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser/muparser-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser/muparser-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser" TYPE FILE FILES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build/CMakeFiles/Export/45a68a068db1a4c8aa91299c0da20349/muparser-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser" TYPE FILE FILES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build/CMakeFiles/Export/45a68a068db1a4c8aa91299c0da20349/muparser-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/muparser" TYPE FILE FILES
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build/muparserConfig.cmake"
    "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build/muparserConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig" TYPE FILE FILES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/muparser.pc")
endif()

