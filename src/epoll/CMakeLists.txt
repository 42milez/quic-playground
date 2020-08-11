add_library(epoll STATIC
    epoll_bug.h
    epoll_logging.h
    epoll_time.h
    simple_epoll_server.h
    simple_epoll_server.cc)
target_link_libraries(epoll PRIVATE chromium)
