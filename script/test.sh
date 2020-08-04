#!/bin/bash
# shellcheck disable=SC2086

source lib/bash-utils/main.sh "$(pwd)/lib/bash-utils"

cd $BUILD_DIR_PATH || exit

$CTEST --output-on-failure
