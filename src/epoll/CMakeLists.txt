add_library(epoll STATIC)
target_sources(epoll PRIVATE simple_epoll_server.cc)
target_link_libraries(epoll PUBLIC chromium)
