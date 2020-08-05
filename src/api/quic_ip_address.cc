#include "quic_ip_address.h"

namespace quic
{
QuicIpAddress::QuicIpAddress() : family_(IpAddressFamily::IP_UNSPEC) {}

QuicIpAddress::QuicIpAddress(const in_addr &ipv4_address) : family_(IpAddressFamily::IP_V4)
{
    address_.v4 = ipv4_address;
}

QuicIpAddress::QuicIpAddress(const in6_addr &ipv6_address) : family_(IpAddressFamily::IP_V6)
{
    address_.v6 = ipv6_address;
}
} // namespace quic
