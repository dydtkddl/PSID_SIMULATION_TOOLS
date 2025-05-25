# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/coordinateio/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/gromacs/coordinateio/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[CoordinateIOTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/coordinateio-test" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/CoordinateIOTests.xml")
set_tests_properties([=[CoordinateIOTests]=] PROPERTIES  LABELS "GTest;UnitTest" PROCESSORS "1" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;364;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/coordinateio/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/coordinateio/tests/CMakeLists.txt;0;")
