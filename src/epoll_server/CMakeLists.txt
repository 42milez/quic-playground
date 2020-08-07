add_library(epoll_server STATIC)
target_sources(epoll_server PRIVATE
    simple_epoll_server.h
    simple_epoll_server.cc)
