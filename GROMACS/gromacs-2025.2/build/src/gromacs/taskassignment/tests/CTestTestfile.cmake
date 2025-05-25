# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/taskassignment/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/gromacs/taskassignment/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[TaskAssignmentUnitTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/taskassignment-test" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/TaskAssignmentUnitTests.xml")
set_tests_properties([=[TaskAssignmentUnitTests]=] PROPERTIES  LABELS "GTest;UnitTest" PROCESSORS "1" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;364;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/taskassignment/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/taskassignment/tests/CMakeLists.txt;0;")
