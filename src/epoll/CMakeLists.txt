add_library(epoll STATIC simple_epoll_server.cc)
target_link_libraries(epoll INTERFACE chromium)
