/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2012- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */
/*! \internal \file
 * \brief
 * Build information from the build system.
 *
 * Used for log and version output.
 */

/** C compiler used to build */
#define BUILD_C_COMPILER        "/opt/rh/devtoolset-11/root/usr/bin/gcc GNU 11.2.1"

/** C compiler flags for this build configuration */
#define CMAKE_BUILD_CONFIGURATION_C_FLAGS "-O3 -DNDEBUG"

#include "compilerflaginfo-Release-C.h"

/** C++ compiler used to build */
#define BUILD_CXX_COMPILER      "/opt/rh/devtoolset-11/root/usr/bin/g++ GNU 11.2.1"

/** C++ compiler flags for this build configuration */
#define CMAKE_BUILD_CONFIGURATION_CXX_FLAGS "-O3 -DNDEBUG"

#include "compilerflaginfo-Release-CXX.h"

/** Installation prefix (default location of data files) */
#define CMAKE_INSTALL_PREFIX    "/usr/local/gromacs"

/** Source directory for the build */
#define CMAKE_SOURCE_DIR        "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2"

/** Directory for test input files */
#define GMX_TESTSIMULATIONDATABASE_DIR  "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/simulationdatabase"

/** Binary directory for the build */
#define CMAKE_BINARY_DIR        "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build"

/** Location of GROMACS-specific data files */
#define GMX_INSTALL_GMXDATADIR  "share/gromacs"

/** HWLOC version information */
#define GMX_HWLOC_VERSION ""

/** CUDA compiler version information */
#define CUDA_COMPILER_INFO ""

/** CUDA compiler flags (device flags, plus host flags if propagated)*/
#define CUDA_DEVICE_COMPILER_FLAGS ""
#define CUDA_HOST_COMPILER_FLAGS 
#define CUDA_COMPILER_FLAGS CUDA_DEVICE_COMPILER_FLAGS CUDA_HOST_COMPILER_FLAGS

/** HIP compiler version information */
#define HIP_COMPILER_INFO ""

/** HIP compiler flags (device flags)*/
#define HIP_COMPILER_FLAGS ""

/** OpenCL include dir */
#define OPENCL_INCLUDE_DIR ""

/** OpenCL library */
#define OPENCL_LIBRARY ""

/** OpenCL version */
#define OPENCL_VERSION_STRING ""

/** SYCL oneAPI DPC++ flags */
#define SYCL_DPCPP_COMPILER_FLAGS ""
#define SYCL_DPCPP_LINKER_FLAGS ""

/** SYCL AdaptiveCpp flags */
#define SYCL_ACPP_COMPILER_LAUNCHER ""
#define SYCL_ACPP_COMPILER_FLAGS ""
#define SYCL_ACPP_DEVICE_COMPILER_FLAGS ""
#define SYCL_ACPP_TARGETS ""
