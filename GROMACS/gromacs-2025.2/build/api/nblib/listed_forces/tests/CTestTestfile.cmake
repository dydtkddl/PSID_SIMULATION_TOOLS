# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/nblib/listed_forces/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/api/nblib/listed_forces/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[NbLibListedForcesTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/nblib-listed-forces-test" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/NbLibListedForcesTests.xml")
set_tests_properties([=[NbLibListedForcesTests]=] PROPERTIES  LABELS "GTest;IntegrationTest" PROCESSORS "1" TIMEOUT "120" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/nblib/listed_forces/tests/CMakeLists.txt;64;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/nblib/listed_forces/tests/CMakeLists.txt;0;")
