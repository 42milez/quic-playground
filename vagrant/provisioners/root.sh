#!/bin/bash

set -e
set -u

apt update
apt install -y \
  build-essential \
  git \
  ninja-build
