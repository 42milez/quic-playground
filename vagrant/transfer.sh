#!/bin/bash

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

PERFETTO_SYMLINK=$CHROMIUM_DIR/perfetto
if [ ! -e "$PERFETTO_SYMLINK" ]; then
  ln -s "$CHROMIUM_DIR/third_party/perfetto/include/perfetto" "$PERFETTO_SYMLINK"
fi

PERFETTO_PROTO_SYMLINK=$CHROMIUM_DIR/protos
if [ ! -e "$PERFETTO_PROTO_SYMLINK" ]; then
  ln -s "$CHROMIUM_DIR/third_party/perfetto/protos" "$PERFETTO_PROTO_SYMLINK"
fi
