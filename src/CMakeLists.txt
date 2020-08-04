add_subdirectory(core)

add_executable(quic_client quic_client_bin.cc)
target_link_libraries(quic_client core)

add_executable(quic_server quic_server_bin.cc)
target_link_libraries(quic_server core)
