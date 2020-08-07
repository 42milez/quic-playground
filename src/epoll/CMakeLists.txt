add_library(epoll STATIC)
target_sources(epoll PRIVATE
    simple_epoll_server.h
    simple_epoll_server.cc)
