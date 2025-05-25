# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild-build"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/tmp"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild-stamp"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src"
  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/external/build-fftw/fftwBuild-prefix/src/fftwBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
