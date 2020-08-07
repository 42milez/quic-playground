add_executable(quic main.cc)
add_subdirectory(core)
add_subdirectory(epoll_server)
target_link_libraries(quic core epoll_server)
