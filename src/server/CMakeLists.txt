add_library(server STATIC)
target_sources(server PRIVATE
    quic_epoll_server_factory.cc
    quic_toy_server.cc)
