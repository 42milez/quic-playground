#!/bin/bash
#shellcheck disable=SC2116

set -e
set -u

CHROMIUM_DIR=$HOME/chromium
TMP_DIR=$HOME/tmp/chromium
mkdir -p "$TMP_DIR"

# --------------------------------------------------

cp -p "$CHROMIUM_DIR/src/LICENSE" "$TMP_DIR"
cp -p "$CHROMIUM_DIR/src/LICENSE.chromium_os" "$TMP_DIR"

# --------------------------------------------------

readonly BASE_FILES=(
  base/atomic_ref_count
  base/atomicops
  base/atomicops_internals_portable
  base/base_export
  base/base_switches
  base/bind
  base/bind_internal
  base/callback
  base/callback_forward
  base/callback_internal
  base/check
  base/check_op
  base/compiler_specific
  base/containers/checked_iterators
  base/containers/checked_range
  base/containers/circular_deque
  base/containers/flat_map
  base/containers/flat_tree
  base/containers/linked_list
  base/containers/queue
  base/containers/span
  base/containers/stack
  base/containers/util
  base/containers/vector_buffer
  base/dcheck_is_on
  base/files/file_path
  base/gtest_prod_util
  base/hash/hash
  base/immediate_crash
  base/location
  base/logging
  base/macros
  base/memory/raw_scoped_refptr_mismatch_checker
  base/memory/ref_counted
  base/memory/scoped_refptr
  base/memory/weak_ptr
  base/no_destructor
  base/notreached
  base/numerics/checked_math
  base/numerics/checked_math_impl
  base/numerics/clamped_math
  base/numerics/clamped_math_impl
  base/numerics/safe_conversions
  base/numerics/safe_conversions_impl
  base/numerics/safe_math
  base/numerics/safe_math_clang_gcc_impl
  base/numerics/safe_math_shared_impl
  base/observer_list
  base/observer_list_internal
  base/observer_list_types
  base/optional
  base/pending_task
  base/pickle
  base/post_task_and_reply_with_result_internal
  base/process/process_handle
  base/rand_util
  base/scoped_clear_last_error
  base/sequence_checker
  base/sequence_checker_impl
  base/sequence_token
  base/sequenced_task_runner
  base/sequenced_task_runner_helpers
  base/single_thread_task_runner
  base/stl_util
  base/strings/char_traits
  base/strings/strcat
  base/strings/string16
  base/strings/string_number_conversions
  base/strings/string_piece
  base/strings/string_piece_forward
  base/strings/string_util
  base/strings/string_util_posix
  base/strings/stringprintf
  base/strings/sys_string_conversions
  base/strings/utf_string_conversions
  base/synchronization/atomic_flag
  base/synchronization/condition_variable
  base/synchronization/lock
  base/synchronization/lock_impl
  base/task/common/task_annotator
  base/task_runner
  base/template_util
  base/third_party/cityhash/city
  base/third_party/nspr/prtime
  base/thread_annotations
  base/threading/platform_thread
  base/threading/thread_checker
  base/threading/thread_checker_impl
  base/threading/thread_collision_warner
  base/threading/thread_local
  base/threading/thread_local_internal
  base/threading/thread_local_storage
  base/time/time
  base/time/time_override
  base/trace_event/base_tracing
  base/trace_event/blame_context
  base/trace_event/builtin_categories
  base/trace_event/category_registry
  base/trace_event/common/trace_event_common
  base/trace_event/heap_profiler
  base/trace_event/heap_profiler_allocation_context
  base/trace_event/heap_profiler_allocation_context_tracker
  base/trace_event/log_message
  base/trace_event/memory_allocator_dump_guid
  base/trace_event/memory_dump_provider
  base/trace_event/memory_dump_request_args
  base/trace_event/thread_instruction_count
  base/trace_event/trace_arguments
  base/trace_event/trace_category
  base/trace_event/trace_config
  base/trace_event/trace_config_category_filter
  base/trace_event/trace_event
  base/trace_event/trace_event_impl
  base/trace_event/trace_event_memory_overhead
  base/trace_event/trace_event_stub
  base/trace_event/trace_log
  base/trace_event/traced_value
  base/trace_event/typed_macros
  base/trace_event/typed_macros_embedder_support
  base/trace_event/typed_macros_internal
  base/value_iterators
  base/values
  build/build_config
  build/buildflag
  testing/gtest/include/gtest/gtest_prod
)

for file in "${BASE_FILES[@]}"; do
  dir=$(dirname "$file")
  mkdir -p "$TMP_DIR/$dir"

  header="$CHROMIUM_DIR/src/$file.h"
  if [ -e "$header" ]; then
    cp -p "$header" "$TMP_DIR/$dir"
  fi

  source="$CHROMIUM_DIR/src/$file.cc"
  if [ -e "$source" ]; then
    cp -p "$source" "$TMP_DIR/$dir"
  fi
done

# --------------------------------------------------

readonly GEN_FILE_DIR=out/Debug/gen
readonly GEN_FILES=(
  base/debug/debugging_buildflags
  base/logging_buildflags
  base/tracing_buildflags
  third_party/perfetto/protos/perfetto/common/builtin_clock.pbzero
  third_party/perfetto/protos/perfetto/trace/interned_data/interned_data.pbzero
  third_party/perfetto/protos/perfetto/trace/trace_packet.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/debug_annotation.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/track_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/track_descriptor.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/track_event.pbzero
)

for file in "${GEN_FILES[@]}"; do
  dir=$(dirname "$file")
  mkdir -p "$TMP_DIR/$dir"

  header="$CHROMIUM_DIR/src/$GEN_FILE_DIR/$file.h"
  if [ -e "$header" ]; then
    cp -p "$header" "$TMP_DIR/$dir"
  fi

  source="$CHROMIUM_DIR/src/$GEN_FILE_DIR/$file.cc"
  if [ -e "$source" ]; then
    cp -p "$source" "$TMP_DIR/$dir"
  fi
done

# --------------------------------------------------

readonly GTEST_HEADER_DIR=third_party/googletest/src/googletest/include/gtest
readonly GTEST_SOURCE_DIR=third_party/googletest/src/googletest/src
readonly GTEST_FILES=(
  gtest_prod
)

for file in "${GTEST_FILES[@]}"; do
  dir=$(dirname "$file")

  header="$CHROMIUM_DIR/src/$GTEST_HEADER_DIR/$file.h"
  if [ -e "$header" ]; then
    mkdir -p "$TMP_DIR/$GTEST_HEADER_DIR"
    cp -p "$header" "$TMP_DIR/$GTEST_HEADER_DIR/$dir"
  fi

  source="$CHROMIUM_DIR/src/$GTEST_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    mkdir -p "$TMP_DIR/$GTEST_SOURCE_DIR"
    cp -p "$source" "$TMP_DIR/$GTEST_SOURCE_DIR/$dir"
  fi
done

# --------------------------------------------------

readonly PERFETTO_HEADER_DIR=third_party/perfetto/include/perfetto
readonly PERFETTO_SOURCE_DIR=third_party/perfetto/src
readonly PERFETTO_FILES=(
  base/build_config
  base/compiler
  base/export
  base/flat_set
  base/logging
  base/proc_utils
  base/thread_utils
  protozero/contiguous_memory_range
  protozero/copyable_ptr
  protozero/cpp_message_obj
  protozero/field
  protozero/message
  protozero/message_handle
  protozero/packed_repeated_fields
  protozero/proto_decoder
  protozero/proto_utils
  protozero/scattered_heap_buffer
  protozero/scattered_stream_writer
  tracing/core/forward_decls
  tracing/debug_annotation
  tracing/event_context
  tracing/internal/track_event_internal
  tracing/trace_writer_base
  tracing/track
)

for file in "${PERFETTO_FILES[@]}"; do
  dir=$(dirname "$file")

  header="$CHROMIUM_DIR/src/$PERFETTO_HEADER_DIR/$file.h"
  if [ -e "$header" ]; then
    mkdir -p "$TMP_DIR/$PERFETTO_HEADER_DIR/$dir"
    cp -p "$header" "$TMP_DIR/$PERFETTO_HEADER_DIR/$dir"
  fi

  source="$CHROMIUM_DIR/src/$PERFETTO_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    mkdir -p "$TMP_DIR/$PERFETTO_SOURCE_DIR/$dir"
    cp -p "$source" "$TMP_DIR/$PERFETTO_SOURCE_DIR/$dir"
  fi
done

cp -p "$CHROMIUM_DIR/src/out/Debug/gen/third_party/perfetto/build_config/perfetto_build_flags.h" \
      "$TMP_DIR/third_party/perfetto/include/perfetto/base"

tar -czvf tmp/chromium.tar.gz tmp/chromium