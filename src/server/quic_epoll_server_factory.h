#ifndef QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_
#define QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_

#include "quic_toy_server.h"

namespace quic
{
class QuicEpollServerFactory : public QuicToyServer::ServerFactory {
public:
    std::unique_ptr<QuicSpdyServerBase> CreateServer(QuicSimpleServerBackend *backend,
                                                     std::unique_ptr<ProofSource> proof_source,
                                                     const quic::ParsedQuicVersionVector &supported_versions) override;

private:
    QuicEpollServer epoll_server_;
};
} // namespace quic

#endif // QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_
