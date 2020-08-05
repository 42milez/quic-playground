#include "server/quic_epoll_server_factory.h"
#include "server/quic_toy_server.h"

int
main(int argc, char *argv[])
{
    quic::QuicToyServer::MemoryCacheBackendFactory backend_factory;
    quic::QuicEpollServerFactory server_factory;
    quic::QuicToyServer server(&backend_factory, &server_factory);

    return server.Start();
}
