#ifndef QUIC_PLAYGROUND_CORE_QUIC_VERSIONS_H_
#define QUIC_PLAYGROUND_CORE_QUIC_VERSIONS_H_

#include <vector>

namespace quic
{
struct ParsedQuicVersion {
    enum QuicTransportVersion {
        QUIC_VERSION_UNSUPPORTED = 0,
        QUIC_VERSION_43 = 43,
        QUIC_VERSION_46 = 46,
        QUIC_VERSION_50 = 50,
        QUIC_VERSION_51 = 51,
        QUIC_VERSION_IETF_DRAFT_25 = 70,
        QUIC_VERSION_IETF_DRAFT_27 = 71,
        QUIC_VERSION_IETF_DRAFT_29 = 73,
        QUIC_VERSION_RESERVED_FOR_NEGOTIATION = 999
    };

    enum HandshakeProtocol {
        PROTOCOL_UNSUPPORTED,
        PROTOCOL_QUIC_CRYPTO,
        PROTOCOL_TLS1_3
    };

    HandshakeProtocol handshake_protocol;
    QuicTransportVersion transport_version;

    constexpr ParsedQuicVersion(HandshakeProtocol handshake_protocol, QuicTransportVersion transport_version) : handshake_protocol(handshake_protocol),
        transport_version(transport_version) {

    }
};

using ParsedQuicVersionVector = std::vector<ParsedQuicVersion>;
} // namespace quic

#endif // QUIC_PLAYGROUND_CORE_QUIC_VERSIONS_H_
