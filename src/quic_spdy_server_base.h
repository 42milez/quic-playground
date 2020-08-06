#ifndef QUIC_SPDY_SERVER_BASE_H_
#define QUIC_SPDY_SERVER_BASE_H_

#include "api/quic_socket_address.h"

namespace quic
{
class QuicSpdyServerBase {
public:
    virtual ~QuicSpdyServerBase() = default;
    virtual bool CreateUDPSocketAndListen(const QuicSocketAddress &address) = 0;
    virtual void HandleEventsForever() = 0;
};
} // namespace quic

#endif // QUIC_SPDY_SERVER_BASE_H_
