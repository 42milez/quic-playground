#!/bin/bash

set -e
set -u

HOST=quic-pg-vagrant

CHROMIUM_REMOTE_DIR=/home/vagrant/chromium/src
CHROMIUM_LOCAL_DIR=lib/chromium

scp "$HOST:$CHROMIUM_REMOTE_DIR/LICENSE" lib/chromium

mkdir -p $CHROMIUM_LOCAL_DIR/base
mkdir -p $CHROMIUM_LOCAL_DIR/base/containers
mkdir -p $CHROMIUM_LOCAL_DIR/base/debug
mkdir -p $CHROMIUM_LOCAL_DIR/base/files
mkdir -p $CHROMIUM_LOCAL_DIR/base/hash
mkdir -p $CHROMIUM_LOCAL_DIR/base/memory
mkdir -p $CHROMIUM_LOCAL_DIR/base/numerics
mkdir -p $CHROMIUM_LOCAL_DIR/base/process
mkdir -p $CHROMIUM_LOCAL_DIR/base/strings
mkdir -p $CHROMIUM_LOCAL_DIR/base/synchronization
mkdir -p $CHROMIUM_LOCAL_DIR/base/task/common
mkdir -p $CHROMIUM_LOCAL_DIR/base/third_party/nspr
mkdir -p $CHROMIUM_LOCAL_DIR/base/threading
mkdir -p $CHROMIUM_LOCAL_DIR/base/time
mkdir -p $CHROMIUM_LOCAL_DIR/base/trace_event
mkdir -p $CHROMIUM_LOCAL_DIR/base/trace_event/common
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/atomic_ref_count.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/atomicops.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/atomicops_internals_portable.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/base_export.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/bind.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/bind_internal.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/callback.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/callback_forward.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/callback_internal.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check_op.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/check_op.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/compiler_specific.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/dcheck_is_on.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/gtest_prod_util.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/immediate_crash.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/location.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/logging.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/logging.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/macros.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/no_destructor.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/notreached.cc" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/notreached.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/observer_list.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/observer_list_internal.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/observer_list_types.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/optional.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/pending_task.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/pickle.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/post_task_and_reply_with_result_internal.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/scoped_clear_last_error.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/sequence_checker.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/sequence_checker_impl.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/sequence_token.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/sequenced_task_runner.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/sequenced_task_runner_helpers.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/single_thread_task_runner.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/stl_util.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/task_runner.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/template_util.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/thread_annotations.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/value_iterators.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/values.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/circular_deque.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/checked_iterators.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/checked_range.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/flat_map.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/flat_tree.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/linked_list.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/queue.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/span.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/stack.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/util.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/containers/vector_buffer.h" $CHROMIUM_LOCAL_DIR/base/containers
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/files/file_path.h" $CHROMIUM_LOCAL_DIR/base/files
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/hash/hash.h" $CHROMIUM_LOCAL_DIR/base/hash
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/memory/ref_counted.h" $CHROMIUM_LOCAL_DIR/base/memory
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/memory/scoped_refptr.h" $CHROMIUM_LOCAL_DIR/base/memory
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/memory/weak_ptr.h" $CHROMIUM_LOCAL_DIR/base/memory
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/checked_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/checked_math_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/clamped_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/clamped_math_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_conversions.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_conversions_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_math.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_math_clang_gcc_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/numerics/safe_math_shared_impl.h" $CHROMIUM_LOCAL_DIR/base/numerics
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/process/process_handle.h" $CHROMIUM_LOCAL_DIR/base/process
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/char_traits.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece.cc" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_piece_forward.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string_util.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string16.cc" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/string16.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/stringprintf.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/strings/utf_string_conversions.h" $CHROMIUM_LOCAL_DIR/base/strings
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/synchronization/atomic_flag.h" $CHROMIUM_LOCAL_DIR/base/synchronization
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/synchronization/condition_variable.h" $CHROMIUM_LOCAL_DIR/base/synchronization
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/synchronization/lock.h" $CHROMIUM_LOCAL_DIR/base/synchronization
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/synchronization/lock_impl.h" $CHROMIUM_LOCAL_DIR/base/synchronization
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/task/common/task_annotator.h" $CHROMIUM_LOCAL_DIR/base/task/common
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/third_party/nspr/prtime.h" $CHROMIUM_LOCAL_DIR/base/third_party/nspr
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/platform_thread.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_checker.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_checker_impl.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_collision_warner.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_local.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_local_internal.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/threading/thread_local_storage.h" $CHROMIUM_LOCAL_DIR/base/threading
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time_override.h" $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time.cc" $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/time/time.h" $CHROMIUM_LOCAL_DIR/base/time
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/base_tracing.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/blame_context.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/builtin_categories.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/category_registry.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/heap_profiler.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/heap_profiler_allocation_context.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/heap_profiler_allocation_context_tracker.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/log_message.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/memory_allocator_dump_guid.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/memory_dump_provider.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/memory_dump_request_args.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/thread_instruction_count.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_arguments.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_category.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_config.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_config_category_filter.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_event.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_event_impl.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_event_memory_overhead.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_event_stub.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/trace_log.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/traced_value.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/typed_macros.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/typed_macros_embedder_support.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/typed_macros_internal.h" $CHROMIUM_LOCAL_DIR/base/trace_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/base/trace_event/common/trace_event_common.h" $CHROMIUM_LOCAL_DIR/base/trace_event/common
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/base/logging_buildflags.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/base/tracing_buildflags.h" $CHROMIUM_LOCAL_DIR/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/base/debug/debugging_buildflags.h" $CHROMIUM_LOCAL_DIR/base/debug

mkdir -p $CHROMIUM_LOCAL_DIR/build
scp "$HOST:$CHROMIUM_REMOTE_DIR/build/buildflag.h" $CHROMIUM_LOCAL_DIR/build
scp "$HOST:$CHROMIUM_REMOTE_DIR/build/build_config.h" $CHROMIUM_LOCAL_DIR/build

mkdir -p $CHROMIUM_LOCAL_DIR/testing/gtest/include/gtest
scp "$HOST:$CHROMIUM_REMOTE_DIR/testing/gtest/include/gtest/gtest_prod.h" $CHROMIUM_LOCAL_DIR/testing/gtest/include/gtest

mkdir -p $CHROMIUM_LOCAL_DIR/third_party/googletest/src/googletest/include/gtest
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing/core
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing/internal
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/common
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/interned_data
mkdir -p $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/track_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/googletest/src/googletest/include/gtest/gtest_prod.h" $CHROMIUM_LOCAL_DIR/third_party/googletest/src/googletest/include/gtest
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/build_config.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/compiler.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/export.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/flat_set.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/logging.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/proc_utils.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/base/thread_utils.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/contiguous_memory_range.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/copyable_ptr.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/cpp_message_obj.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/field.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/message.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/message_handle.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/packed_repeated_fields.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/proto_decoder.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/proto_utils.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/scattered_heap_buffer.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/protozero/scattered_stream_writer.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/protozero
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/debug_annotation.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/event_context.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/trace_writer_base.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/track.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/core/forward_decls.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing/core
scp "$HOST:$CHROMIUM_REMOTE_DIR/third_party/perfetto/include/perfetto/tracing/internal/track_event_internal.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/tracing/internal
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/build_config/perfetto_build_flags.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto/base
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/common/builtin_clock.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/common
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/trace_packet.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/interned_data/interned_data.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/interned_data
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/track_event/debug_annotation.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/track_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/track_event/track_descriptor.gen.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/track_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/track_event/track_descriptor.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/track_event
scp "$HOST:$CHROMIUM_REMOTE_DIR/out/Debug/gen/third_party/perfetto/protos/perfetto/trace/track_event/track_event.pbzero.h" $CHROMIUM_LOCAL_DIR/third_party/perfetto/protos/perfetto/trace/track_event

PERFETTO_SYMLINK=$CHROMIUM_LOCAL_DIR/perfetto
if [ ! -e "$PERFETTO_SYMLINK" ]; then
  ln -s "$(pwd)/$CHROMIUM_LOCAL_DIR/third_party/perfetto/include/perfetto" $PERFETTO_SYMLINK
fi

PERFETTO_PROTO_SYMLINK=$CHROMIUM_LOCAL_DIR/protos
if [ ! -e "$PERFETTO_PROTO_SYMLINK" ]; then
  ln -s "$(pwd)/$CHROMIUM_LOCAL_DIR/third_party/perfetto/protos" $PERFETTO_PROTO_SYMLINK
fi
