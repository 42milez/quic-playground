add_executable(quic main.cc)
add_subdirectory(core)
add_subdirectory(epoll)
target_link_libraries(quic core epoll)
