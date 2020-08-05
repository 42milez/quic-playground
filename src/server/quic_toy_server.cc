#include "quic_toy_server.h"

namespace quic
{
std::unique_ptr<quic::QuicSimpleServerBackend>
QuicToyServer::MemoryCacheBackendFactory::CreateBackend()
{
    auto memory_cache_backend = std::make_unique<QuicMemoryCacheBackend>();

    if (GetQuicFlag(FLAGS_generate_dynamic_response)) {
        memory_cache_backend->GenerateDynamicResponses();
    }

    if (!GetQuicFlag(FLAGS_quic_response_cache_dir).empty()) {
        memory_cache_backend->InitializeBackend(GetQuicFlag(FLAGS_quic_response_cache_dir));
    }

    return memory_cache_backend;
}
} // namespace quic
