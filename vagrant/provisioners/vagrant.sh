#!/bin/bash

set -e
set -u

# Checking out and building Chromium on Linux
# https://chromium.googlesource.com/chromium/src/+/master/docs/linux/build_instructions.md

WORK_DIR=/home/vagrant

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $WORK_DIR/depot_tools
export PATH="$PATH:$HOME/depot_tools"

mkdir "$HOME/chromium" && cd "$HOME/chromium" || exit

fetch --nohooks --no-history chromium

cd $WORK_DIR/chromium/src || exit

./build/install-build-deps.sh

gclient runhooks

# Playing with QUIC
# https://www.chromium.org/quic/playing-with-quic

gn gen $WORK_DIR/chromium/src/out/Debug
ninja -C $WORK_DIR/chromium/src/out/Debug quic_server quic_client
