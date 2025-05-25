# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/api/gmxapi/cpp/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[GmxapiExternalInterfaceTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/gmxapi-test" "-ntomp" "2" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/GmxapiExternalInterfaceTests.xml")
set_tests_properties([=[GmxapiExternalInterfaceTests]=] PROPERTIES  LABELS "GTest;IntegrationTest;QuickGpuTest" PROCESSORS "2" TIMEOUT "120" WORKING_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/api/gmxapi/cpp/tests" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/tests/CMakeLists.txt;69;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/tests/CMakeLists.txt;0;")
