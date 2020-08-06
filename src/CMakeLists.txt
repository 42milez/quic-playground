add_subdirectory(api)
add_subdirectory(core)

add_executable(quic_client quic_client_bin.cc)
target_link_libraries(quic_client api core)

add_executable(quic_server
    quic_server_bin.cc
    quic_epoll_server_factory.cc
    quic_epoll_server_factory.h
    quic_toy_server.cc
    quic_toy_server.h
    quic_memory_cache_backend.h
    quic_simple_server_backend.h
    quic_spdy_server_base.h)
target_link_libraries(quic_server api core)
