#!/bin/bash
# shellcheck disable=SC2016

set -e
set -u

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
CHROMIUM_DIR="$SCRIPT_DIR/../lib/chromium"
TMP_DIR="$SCRIPT_DIR/../tmp"
HOST=quic-pg-vagrant

ssh $HOST 'bash -s' < "$SCRIPT_DIR/archive.sh"

mkdir -p "$TMP_DIR"
scp $HOST:/home/vagrant/tmp/chromium.tar.gz "$TMP_DIR"
tar -zxvf "$TMP_DIR/chromium.tar.gz"
rm -rf "$CHROMIUM_DIR"
mv "$TMP_DIR/chromium" "$CHROMIUM_DIR"

OPENSSL_SYMLINK=$CHROMIUM_DIR/openssl
if [ ! -e "$OPENSSL_SYMLINK" ]; then
  ln -s "$CHROMIUM_DIR/third_party/boringssl/src/include/openssl" "$OPENSSL_SYMLINK"
fi

PERFETTO_SYMLINK=$CHROMIUM_DIR/perfetto
if [ ! -e "$PERFETTO_SYMLINK" ]; then
  ln -s "$CHROMIUM_DIR/third_party/perfetto/include/perfetto" "$PERFETTO_SYMLINK"
fi

PERFETTO_PROTO_SYMLINK=$CHROMIUM_DIR/protos
if [ ! -e "$PERFETTO_PROTO_SYMLINK" ]; then
  ln -s "$CHROMIUM_DIR/third_party/perfetto/protos" "$PERFETTO_PROTO_SYMLINK"
fi

{
  echo 'add_library(chromium STATIC'
  find ./lib/chromium -type f -name '*.cc' | sort
  echo ')'
  echo 'target_include_directories(chromium PUBLIC "${PROJECT_SOURCE_DIR}/lib/chromium")'
} >> "$CHROMIUM_DIR/CMakeLists.txt"

sed -i 's/\.\/lib\/chromium\//    /g' "$CHROMIUM_DIR/CMakeLists.txt"
