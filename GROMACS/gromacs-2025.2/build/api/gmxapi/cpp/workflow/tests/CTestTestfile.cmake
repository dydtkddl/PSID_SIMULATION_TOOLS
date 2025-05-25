# CMake generated Testfile for 
# Source directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/workflow/tests
# Build directory: /home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/api/gmxapi/cpp/workflow/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[GmxapiInternalInterfaceTests]=] "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/bin/workflow-details-test" "-ntomp" "2" "--gtest_output=xml:/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/Testing/Temporary/GmxapiInternalInterfaceTests.xml")
set_tests_properties([=[GmxapiInternalInterfaceTests]=] PROPERTIES  LABELS "GTest;IntegrationTest;QuickGpuTest" PROCESSORS "2" TIMEOUT "120" WORKING_DIRECTORY "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/build/api/gmxapi/cpp/workflow/tests" _BACKTRACE_TRIPLES "/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/src/testutils/TestMacros.cmake;346;add_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/workflow/tests/CMakeLists.txt;51;gmx_register_gtest_test;/home/yongsang/Research/PSID_server_room/GROMACS/gromacs-2025.2/api/gmxapi/cpp/workflow/tests/CMakeLists.txt;0;")
