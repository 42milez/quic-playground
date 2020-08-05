add_library(core STATIC)
target_sources(core PRIVATE
    proof_source.cc
    proof_source.h
    quic_versions.cc
    quic_versions.h)
