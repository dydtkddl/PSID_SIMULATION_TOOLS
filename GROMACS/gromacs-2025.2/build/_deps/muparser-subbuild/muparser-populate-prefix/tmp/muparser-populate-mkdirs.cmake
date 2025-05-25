# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/external/muparser"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-build"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/tmp"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/src/muparser-populate-stamp"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/src"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/src/muparser-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/src/muparser-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/_deps/muparser-subbuild/muparser-populate-prefix/src/muparser-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
