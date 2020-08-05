#ifndef QUIC_PLAYGROUND_API_QUIC_SOCKET_ADDRESS_H_
#define QUIC_PLAYGROUND_API_QUIC_SOCKET_ADDRESS_H_

#include "quic_ip_address.h"
#include <cstdint>
#include <sys/socket.h>

namespace quic
{
class QuicSocketAddress {
public:
    QuicSocketAddress() {}
    QuicSocketAddress(QuicIpAddress address, uint16_t port);
    explicit QuicSocketAddress(const struct sockaddr_storage &saddr);
    explicit QuicSocketAddress(const sockaddr *saddr, socklen_t len);
    QuicSocketAddress(const QuicSocketAddress &other) = default;
};
} // namespace quic

#endif // QUIC_PLAYGROUND_API_QUIC_SOCKET_ADDRESS_H_
