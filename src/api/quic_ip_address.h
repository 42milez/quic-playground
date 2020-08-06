#ifndef API_QUIC_IP_ADDRESS_H_
#define API_QUIC_IP_ADDRESS_H_

#include "quic_ip_address_family.h"
#include <netinet/in.h>

namespace quic
{
class QuicIpAddress {
public:
    enum : size_t {
        kIPv4AddressSize = 32 / 8,
        kIPv6AddressSize = 128 / 8,
        kMaxAddressSize = kIPv6AddressSize
    };

    QuicIpAddress();
    QuicIpAddress(const QuicIpAddress &other) = default;
    explicit QuicIpAddress(const in_addr &ipv4_address);
    explicit QuicIpAddress(const in6_addr &ipv6_address);

private:
    union {
        in_addr v4;
        in6_addr v6;
        uint8_t bytes[kMaxAddressSize];
        char chars[kMaxAddressSize];
    } address_;
    IpAddressFamily family_;
};
} // namespace quic

#endif // API_QUIC_IP_ADDRESS_H_
