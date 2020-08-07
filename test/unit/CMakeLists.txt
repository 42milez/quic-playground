find_package(Catch2 REQUIRED)

add_executable(unit_test main.cc)
add_subdirectory(core)
add_subdirectory(epoll_server)
target_link_libraries(unit_test Catch2::Catch2 core)

include(CTest)
include(Catch)
catch_discover_tests(unit_test)
