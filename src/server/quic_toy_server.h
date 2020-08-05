#ifndef QUIC_PLAYGROUND_SERVER_QUIC_TOY_SERVER_H_
#define QUIC_PLAYGROUND_SERVER_QUIC_TOY_SERVER_H_

#include "../core/proof_source.h"
#include "quic_simple_server_backend.h"
#include "quic_spdy_server_base.h"
#include <memory>

namespace quic
{
class QuicToyServer {
public:
    class ServerFactory {
    public:
        virtual ~ServerFactory() = default;
        virtual std::unique_ptr<QuicSpdyServerBase> CreateServer(QuicSimpleServerBackend *backend,
                                                                 std::unique_ptr<ProofSource> proof_source,
                                                                 const ParsedQuicVersionVector &supported_versions) = 0;
    };

    class BackendFactory {
    public:
        virtual ~BackendFactory() = default;
        virtual std::unique_ptr<QuicSimpleServerBackend> CreateBackend() = 0;
    };

    class MemoryCacheBackendFactory : public BackendFactory {
    public:
        std::unique_ptr<quic::QuicSimpleServerBackend> CreateBackend() override;
    };

    QuicToyServer(BackendFactory *backend_factory, ServerFactory *server_factory);

    int Start();

private:
    BackendFactory *backend_factory_;
    ServerFactory *server_factory_;
};
} // namespace quic

#endif // QUIC_PLAYGROUND_SERVER_QUIC_TOY_SERVER_H_
