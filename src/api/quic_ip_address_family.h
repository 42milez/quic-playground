#ifndef API_QUIC_IP_ADDRESS_FAMILY_H_
#define API_QUIC_IP_ADDRESS_FAMILY_H_

namespace quic
{
enum class IpAddressFamily {
    IP_V4,
    IP_V6,
    IP_UNSPEC
};
} // namespace quic

#endif // API_QUIC_IP_ADDRESS_FAMILY_H_
