# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/simd/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/gromacs/simd/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[SimdUnitTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/simd-test" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/SimdUnitTests.xml")
set_tests_properties([=[SimdUnitTests]=] PROPERTIES  LABELS "GTest;UnitTest" PROCESSORS "1" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;364;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/simd/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/simd/tests/CMakeLists.txt;0;")
