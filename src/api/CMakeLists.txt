add_library(api STATIC)
target_sources(api PRIVATE
    quic_ip_address.cc
    quic_ip_address.h
    quic_ip_address_family.h
    quic_socket_address.h)
