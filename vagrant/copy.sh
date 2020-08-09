#!/bin/bash

set -e
set -u

HOST=quic-pg-vagrant
CHROMIUM_REMOTE_SRC_DIR=/home/vagrant/chromium/src
CHROMIUM_REMOTE_GEN_DIR=$CHROMIUM_REMOTE_SRC_DIR/out/Debug/gen

scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/LICENSE" lib/chromium/

mkdir -p lib/chromium/base
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/base_export.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/callback_forward.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/check.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/check_op.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/compiler_specific.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/dcheck_is_on.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/immediate_crash.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/logging.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_GEN_DIR/base/logging_buildflags.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/macros.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/notreached.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/optional.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/scoped_clear_last_error.h" lib/chromium/base/
scp "$HOST:$CHROMIUM_REMOTE_SRC_DIR/base/template_util.h" lib/chromium/base/

mkdir -p lib/chromium/base/numerics
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/checked_math.h lib/chromium/base/numerics/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/checked_math_impl.h lib/chromium/base/numerics/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/clamped_math.h lib/chromium/base/numerics/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/safe_conversions.h lib/chromium/base/numerics/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/safe_math.h lib/chromium/base/numerics/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/numerics/safe_math_shared_impl.h lib/chromium/base/numerics/

mkdir -p lib/chromium/base/strings
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/strings/char_traits.h lib/chromium/base/strings/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/strings/string_piece.h lib/chromium/base/strings/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/strings/string_piece_forward.h lib/chromium/base/strings/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/strings/string16.h lib/chromium/base/strings/

mkdir -p lib/chromium/base/time
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/base/time/time.h lib/chromium/base/time/

mkdir -p lib/chromium/build
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/build/buildflag.h lib/chromium/build/
scp $HOST:$CHROMIUM_REMOTE_SRC_DIR/build/build_config.h lib/chromium/build/
