# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/compat/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/src/gromacs/compat/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[CompatibilityHelpersTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/compat-test" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/CompatibilityHelpersTests.xml")
set_tests_properties([=[CompatibilityHelpersTests]=] PROPERTIES  LABELS "GTest;UnitTest" PROCESSORS "1" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;364;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/compat/tests/CMakeLists.txt;35;gmx_add_unit_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/gromacs/compat/tests/CMakeLists.txt;0;")
