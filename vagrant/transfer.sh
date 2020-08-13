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

cat - << 'EOS' >> "$CHROMIUM_DIR/CMakeLists.txt"
set_source_files_properties(
    base/task/thread_pool/job_task_source.cc
    PROPERTIES COMPILE_FLAGS -Wno-c++11-narrowing
)
set_source_files_properties(
    base/task/current_thread.cc
    base/task/sequence_manager/real_time_domain.cc
    base/task/sequence_manager/sequence_manager.cc
    base/task/sequence_manager/sequence_manager_impl.cc
    base/task/sequence_manager/task_queue.cc
    base/task/sequence_manager/task_queue_impl.cc
    base/task/sequence_manager/task_queue_selector.cc
    base/task/sequence_manager/thread_controller_impl.cc
    base/task/sequence_manager/thread_controller_with_message_pump_impl.cc
    base/task/sequence_manager/time_domain.cc
    base/task/sequence_manager/work_queue.cc
    base/task/sequence_manager/work_queue_sets.cc
    base/threading/thread.cc
    PROPERTIES COMPILE_FLAGS -Wno-final-dtor-non-final-class
)
set_source_files_properties(
    base/json/json_writer.cc
    PROPERTIES COMPILE_FLAGS -Wno-implicit-int-float-conversion
)
set_source_files_properties(
    base/time/time.cc
    PROPERTIES COMPILE_FLAGS -Wno-narrowing
)
set_source_files_properties(
    third_party/tcmalloc/chromium/src/heap-checker.cc
    PROPERTIES COMPILE_FLAGS -Wno-string-compare
)
set_source_files_properties(
    base/check.cc
    base/check_op.cc
    base/debug/alias.cc
    base/logging.cc
    base/notreached.cc
    PROPERTIES COMPILE_FLAGS -Wno-unknown-pragmas
)
set_source_files_properties(
    third_party/tcmalloc/chromium/src/elf_mem_image.cc
    third_party/tcmalloc/chromium/src/system-alloc.cc
    PROPERTIES COMPILE_FLAGS -Wno-unused-const-variable
)
set_source_files_properties(
    third_party/tcmalloc/chromium/src/free_list.cc
    third_party/tcmalloc/chromium/src/heap-profiler.cc
    third_party/tcmalloc/chromium/src/system-alloc.cc
    PROPERTIES COMPILE_FLAGS -Wno-unused-function
)
set_source_files_properties(
    third_party/tcmalloc/chromium/src/system-alloc.cc
    PROPERTIES COMPILE_FLAGS -Wno-unused-variable
)
EOS

sed -i 's/\.\/lib\/chromium\//    /g' "$CHROMIUM_DIR/CMakeLists.txt"
