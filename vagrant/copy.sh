#!/bin/bash

set -e
set -u

HOST=quic-pg-vagrant

CHROMIUM_REMOTE_DIR=/home/vagrant/chromium/src
CHROMIUM_LOCAL_DIR=lib/chromium

scp "$HOST:$CHROMIUM_REMOTE_DIR/LICENSE" lib/chromium

mkdir -p lib/chromium/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/base_export.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/callback_forward.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check_op.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check_op.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/compiler_specific.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/dcheck_is_on.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/immediate_crash.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/logging.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/logging.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/macros.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/no_destructor.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/notreached.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/notreached.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/optional.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/scoped_clear_last_error.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/template_util.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/base/logging_buildflags.h" $CHROMIUM_LOCAL_DIR/base

mkdir -p $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/checked_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/checked_math_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/clamped_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_conversions.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_math_shared_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics

mkdir -p $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/char_traits.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece.cc" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece_forward.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string16.cc" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string16.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/stringprintf.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/utf_string_conversions.h" $CHROMIUM_LOCAL_DIR/base/strings

mkdir -p $CHROMIUM_LOCAL_DIR/base/third_party/nspr
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/third_party/nspr/prtime.h" $CHROMIUM_LOCAL_DIR/base/third_party/nspr

mkdir -p $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time_override.h" $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time.cc" $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time.h" $CHROMIUM_LOCAL_DIR/base/time

mkdir -p $CHROMIUM_LOCAL_DIR/build
scp "$HOST:$CHROMIUM_REMOTE_DIR/build/buildflag.h" $CHROMIUM_LOCAL_DIR/build
scp "$HOST:$CHROMIUM_REMOTE_DIR/build/build_config.h" $CHROMIUM_LOCAL_DIR/build
