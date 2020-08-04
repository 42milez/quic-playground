#!/bin/bash
# shellcheck disable=SC2086

source lib/bash-utils/main.sh "$(pwd)/lib/bash-utils"

cd $BUILD_DIR_PATH || exit

$CMAKE .. \
  -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
  -DCMAKE_MAKE_PROGRAM=/usr/bin/make \
  -DCMAKE_C_COMPILER=$CC \
  -DCMAKE_CXX_COMPILER=$CXX \
  -G 'CodeBlocks - Unix Makefiles'

$CMAKE --build . --target all -- -j 8
