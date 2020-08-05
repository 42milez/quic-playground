#ifndef QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_
#define QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_

#include "quic_epoll_server_factory.h"
#include "quic_simple_server_backend.h"
#include "quic_spdy_server_base.h"
#include <memory>

namespace quic
{
std::unique_ptr<quic::QuicSpdyServerBase>
QuicEpollServerFactory::CreateServer(quic::QuicSimpleServerBackend *backend,
                                     std::unique_ptr<quic::ProofSource> proof_source,
                                     const quic::ParsedQuicVersionVector &supported_versions)
{
    return std::make_unique(quic::QuicServer > (std::move(proof_source), backend, supported_versions));
}
} // namespace quic

#endif // QUIC_PLAYGROUND_SERVER_QUIC_EPOLL_SERVER_FACTORY_H_
