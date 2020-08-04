add_executable(quic main.cc)
add_subdirectory(core)
target_link_libraries(quic core)
