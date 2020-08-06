#ifndef QUIC_MEMORY_CACHE_BACKEND_H_
#define QUIC_MEMORY_CACHE_BACKEND_H_

#include "quic_simple_server_backend.h"

namespace quic
{
class QuicMemoryCacheBackend : public QuicSimpleServerBackend {
public:
    QuicMemoryCacheBackend();
    QuicMemoryCacheBackend(const QuicMemoryCacheBackend &) = delete;
    ~QuicMemoryCacheBackend() override;
};
} // namespace quic

#endif // QUIC_MEMORY_CACHE_BACKEND_H_
