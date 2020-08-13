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
  base/allocator/allocator_extension
  base/allocator/partition_allocator/address_space_randomization
  base/allocator/partition_allocator/page_allocator
  base/allocator/partition_allocator/page_allocator_constants
  base/allocator/partition_allocator/page_allocator_internal
  base/allocator/partition_allocator/page_allocator_internals_posix
  base/allocator/partition_allocator/partition_alloc_check
  base/allocator/partition_allocator/random
  base/allocator/partition_allocator/spin_lock
  base/at_exit
  base/atomic_ref_count
  base/atomic_sequence_num
  base/atomicops
  base/atomicops_internals_portable
  base/auto_reset
  base/base_export
  base/base_paths
  base/base_paths_posix
  base/base_switches
  base/bind
  base/bind_helpers
  base/bind_internal
  base/bit_cast
  base/bits
  base/callback
  base/callback_forward
  base/callback_helpers
  base/callback_internal
  base/cancelable_callback
  base/check
  base/check_op
  base/command_line
  base/compiler_specific
  base/containers/buffer_iterator
  base/containers/checked_iterators
  base/containers/checked_range
  base/containers/circular_deque
  base/containers/flat_map
  base/containers/flat_set
  base/containers/flat_tree
  base/containers/intrusive_heap
  base/containers/linked_list
  base/containers/mru_cache
  base/containers/queue
  base/containers/span
  base/containers/stack
  base/containers/stack_container
  base/containers/util
  base/containers/vector_buffer
  base/cpu
  base/critical_closure
  base/dcheck_is_on
  base/debug/activity_tracker
  base/debug/alias
  base/debug/crash_logging
  base/debug/debugger
  base/debug/dump_without_crashing
  base/debug/leak_annotations
  base/debug/profiler
  base/debug/stack_trace
  base/debug/task_trace
  base/environment
  base/feature_list
  base/file_descriptor_posix
  base/files/file
  base/files/file_descriptor_watcher_posix
  base/files/file_enumerator
  base/files/file_path
  base/files/file_tracing
  base/files/file_util
  base/files/important_file_writer
  base/files/important_file_writer_cleaner
  base/files/memory_mapped_file
  base/files/platform_file
  base/files/scoped_file
  base/format_macros
  base/gtest_prod_util
  base/hash/hash
  base/hash/md5
  base/hash/md5_boringssl
  base/hash/sha1
  base/immediate_crash
  base/json/json_common
  base/json/json_parser
  base/json/json_reader
  base/json/json_string_value_serializer
  base/json/json_writer
  base/json/string_escape
  base/lazy_instance
  base/lazy_instance_helpers
  base/location
  base/logging
  base/macros
  base/memory/aligned_memory
  base/memory/platform_shared_memory_region
  base/memory/ptr_util
  base/memory/raw_scoped_refptr_mismatch_checker
  base/memory/read_only_shared_memory_region
  base/memory/ref_counted
  base/memory/ref_counted_memory
  base/memory/scoped_refptr
  base/memory/shared_memory_mapping
  base/memory/shared_memory_security_policy
  base/memory/shared_memory_tracker
  base/memory/singleton
  base/memory/unsafe_shared_memory_region
  base/memory/weak_ptr
  base/memory/writable_shared_memory_region
  base/message_loop/message_pump
  base/message_loop/message_pump_default
  base/message_loop/message_pump_for_io
  base/message_loop/message_pump_for_ui
  base/message_loop/message_pump_libevent
  base/message_loop/message_pump_type
  base/message_loop/timer_slack
  base/message_loop/watchable_io_message_pump_posix
  base/message_loop/work_id_provider
  base/metrics/bucket_ranges
  base/metrics/crc32
  base/metrics/dummy_histogram
  base/metrics/field_trial
  base/metrics/field_trial_param_associator
  base/metrics/field_trial_params
  base/metrics/histogram
  base/metrics/histogram_base
  base/metrics/histogram_flattener
  base/metrics/histogram_functions
  base/metrics/histogram_macros
  base/metrics/histogram_macros_internal
  base/metrics/histogram_macros_local
  base/metrics/histogram_samples
  base/metrics/histogram_snapshot_manager
  base/metrics/metrics_hashes
  base/metrics/persistent_histogram_allocator
  base/metrics/persistent_memory_allocator
  base/metrics/persistent_sample_map
  base/metrics/record_histogram_checker
  base/metrics/sample_map
  base/metrics/sample_vector
  base/metrics/sparse_histogram
  base/metrics/statistics_recorder
  base/nix/xdg_util
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
  base/observer_list_threadsafe
  base/observer_list_types
  base/optional
  base/parameter_pack
  base/path_service
  base/pending_task
  base/pickle
  base/posix/eintr_wrapper
  base/posix/file_descriptor_shuffle
  base/posix/global_descriptors
  base/posix/safe_strerror
  base/post_task_and_reply_with_result_internal
  base/power_monitor/power_monitor
  base/power_monitor/power_monitor_source
  base/power_monitor/power_observer
  base/process/launch
  base/process/memory
  base/process/process
  base/process/process_handle
  base/process/process_info
  base/process/process_metrics
  base/rand_util
  base/run_loop
  base/scoped_clear_last_error
  base/scoped_generic
  base/sequence_checker
  base/sequence_checker_impl
  base/sequence_token
  base/sequenced_task_runner
  base/sequenced_task_runner_helpers
  base/single_thread_task_runner
  base/stl_util
  base/strings/char_traits
  base/strings/escape
  base/strings/pattern
  base/strings/strcat
  base/strings/strcat_internal
  base/strings/string16
  base/strings/string_number_conversions
  base/strings/string_number_conversions_internal
  base/strings/string_piece
  base/strings/string_piece_forward
  base/strings/string_split
  base/strings/string_split_internal
  base/strings/string_tokenizer
  base/strings/string_util
  base/strings/string_util_internal
  base/strings/string_util_posix
  base/strings/stringprintf
  base/strings/sys_string_conversions
  base/strings/utf_offset_string_conversions
  base/strings/utf_string_conversion_utils
  base/strings/utf_string_conversions
  base/synchronization/atomic_flag
  base/synchronization/condition_variable
  base/synchronization/lock
  base/synchronization/lock_impl
  base/synchronization/waitable_event
  base/sys_byteorder
  base/system/sys_info
  base/system/sys_info_internal
  base/task/common/checked_lock
  base/task/common/checked_lock_impl
  base/task/common/intrusive_heap
  base/task/common/operations_controller
  base/task/common/scoped_defer_task_posting
  base/task/common/task_annotator
  base/task/current_thread
  base/task/post_job
  base/task/post_task
  base/task/scoped_set_task_priority_for_current_thread
  base/task/sequence_manager/associated_thread_id
  base/task/sequence_manager/atomic_flag_set
  base/task/sequence_manager/enqueue_order
  base/task/sequence_manager/enqueue_order_generator
  base/task/sequence_manager/lazily_deallocated_deque
  base/task/sequence_manager/lazy_now
  base/task/sequence_manager/real_time_domain
  base/task/sequence_manager/sequence_manager
  base/task/sequence_manager/sequence_manager_impl
  base/task/sequence_manager/sequenced_task_source
  base/task/sequence_manager/task_queue
  base/task/sequence_manager/task_queue_impl
  base/task/sequence_manager/task_queue_selector
  base/task/sequence_manager/task_queue_selector_logic
  base/task/sequence_manager/task_time_observer
  base/task/sequence_manager/tasks
  base/task/sequence_manager/thread_controller
  base/task/sequence_manager/thread_controller_impl
  base/task/sequence_manager/thread_controller_power_monitor
  base/task/sequence_manager/thread_controller_with_message_pump_impl
  base/task/sequence_manager/time_domain
  base/task/sequence_manager/work_deduplicator
  base/task/sequence_manager/work_queue
  base/task/sequence_manager/work_queue_sets
  base/task/simple_task_executor
  base/task/single_thread_task_runner_thread_mode
  base/task/task_executor
  base/task/task_features
  base/task/task_observer
  base/task/task_traits
  base/task/task_traits_extension
  base/task/thread_pool
  base/task/thread_pool/delayed_task_manager
  base/task/thread_pool/environment_config
  base/task/thread_pool/job_task_source
  base/task/thread_pool/pooled_parallel_task_runner
  base/task/thread_pool/pooled_sequenced_task_runner
  base/task/thread_pool/pooled_single_thread_task_runner_manager
  base/task/thread_pool/pooled_task_runner_delegate
  base/task/thread_pool/priority_queue
  base/task/thread_pool/sequence
  base/task/thread_pool/sequence_sort_key
  base/task/thread_pool/service_thread
  base/task/thread_pool/task
  base/task/thread_pool/task_source
  base/task/thread_pool/task_tracker
  base/task/thread_pool/task_tracker_posix
  base/task/thread_pool/thread_group
  base/task/thread_pool/thread_group_impl
  base/task/thread_pool/thread_pool_impl
  base/task/thread_pool/thread_pool_instance
  base/task/thread_pool/tracked_ref
  base/task/thread_pool/worker_thread
  base/task/thread_pool/worker_thread_observer
  base/task/thread_pool/worker_thread_stack
  base/task_runner
  base/task_runner_util
  base/template_util
  base/third_party/cityhash/city
  base/third_party/double_conversion/double-conversion/bignum
  base/third_party/double_conversion/double-conversion/bignum-dtoa
  base/third_party/double_conversion/double-conversion/cached-powers
  base/third_party/double_conversion/double-conversion/diy-fp
  base/third_party/double_conversion/double-conversion/double-conversion
  base/third_party/double_conversion/double-conversion/double-to-string
  base/third_party/double_conversion/double-conversion/fast-dtoa
  base/third_party/double_conversion/double-conversion/fixed-dtoa
  base/third_party/double_conversion/double-conversion/ieee
  base/third_party/double_conversion/double-conversion/string-to-double
  base/third_party/double_conversion/double-conversion/strtod
  base/third_party/double_conversion/double-conversion/utils
  base/third_party/dynamic_annotations/dynamic_annotations
  base/third_party/icu/icu_utf
  base/third_party/libevent/event
  base/third_party/libevent/event-config
  base/third_party/libevent/evutil
  base/third_party/libevent/linux/event-config
  base/third_party/nspr/prtime
  base/third_party/xdg_user_dirs/xdg_user_dir_lookup
  base/thread_annotations
  base/threading/hang_watcher
  base/threading/platform_thread
  base/threading/post_task_and_reply_impl
  base/threading/scoped_blocking_call
  base/threading/scoped_blocking_call_internal
  base/threading/sequence_local_storage_map
  base/threading/sequenced_task_runner_handle
  base/threading/simple_thread
  base/threading/thread
  base/threading/thread_checker
  base/threading/thread_checker_impl
  base/threading/thread_collision_warner
  base/threading/thread_id_name_manager
  base/threading/thread_local
  base/threading/thread_local_internal
  base/threading/thread_local_storage
  base/threading/thread_restrictions
  base/threading/thread_task_runner_handle
  base/time/default_tick_clock
  base/time/tick_clock
  base/time/time
  base/time/time_override
  base/timer/elapsed_timer
  base/timer/timer
  base/token
  base/trace_event/base_tracing
  base/trace_event/blame_context
  base/trace_event/builtin_categories
  base/trace_event/category_registry
  base/trace_event/common/trace_event_common
  base/trace_event/event_name_filter
  base/trace_event/heap_profiler
  base/trace_event/heap_profiler_allocation_context
  base/trace_event/heap_profiler_allocation_context_tracker
  base/trace_event/heap_profiler_event_filter
  base/trace_event/log_message
  base/trace_event/malloc_dump_provider
  base/trace_event/memory_allocator_dump
  base/trace_event/memory_allocator_dump_guid
  base/trace_event/memory_dump_manager
  base/trace_event/memory_dump_provider
  base/trace_event/memory_dump_provider_info
  base/trace_event/memory_dump_request_args
  base/trace_event/memory_dump_scheduler
  base/trace_event/memory_infra_background_allowlist
  base/trace_event/memory_usage_estimator
  base/trace_event/process_memory_dump
  base/trace_event/thread_instruction_count
  base/trace_event/trace_arguments
  base/trace_event/trace_buffer
  base/trace_event/trace_category
  base/trace_event/trace_config
  base/trace_event/trace_config_category_filter
  base/trace_event/trace_event
  base/trace_event/trace_event_filter
  base/trace_event/trace_event_impl
  base/trace_event/trace_event_memory_overhead
  base/trace_event/trace_event_stub
  base/trace_event/trace_log
  base/trace_event/traced_value
  base/trace_event/typed_macros
  base/trace_event/typed_macros_embedder_support
  base/trace_event/typed_macros_internal
  base/traits_bag
  base/unguessable_token
  base/updateable_sequenced_task_runner
  base/value_iterators
  base/values
  base/vlog
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
  base/allocator/buildflags
  base/debug/debugging_buildflags
  base/logging_buildflags
  base/partition_alloc_buildflags
  base/tracing_buildflags
  build/lacros_buildflags
  third_party/perfetto/protos/perfetto/common/builtin_clock.pbzero
  third_party/perfetto/protos/perfetto/common/data_source_descriptor.gen
  third_party/perfetto/protos/perfetto/common/track_event_descriptor.pbzero
  third_party/perfetto/protos/perfetto/config/chrome/chrome_config.gen
  third_party/perfetto/protos/perfetto/config/data_source_config.gen
  third_party/perfetto/protos/perfetto/config/test_config.gen
  third_party/perfetto/protos/perfetto/config/track_event/track_event_config.gen
  third_party/perfetto/protos/perfetto/trace/interned_data/interned_data.pbzero
  third_party/perfetto/protos/perfetto/trace/trace_packet.pbzero
  third_party/perfetto/protos/perfetto/trace/trace_packet_defaults.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/chrome_process_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/chrome_thread_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/counter_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/debug_annotation.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/process_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/process_descriptor.pbzero
  third_party/perfetto/protos/perfetto/trace/track_event/thread_descriptor.gen
  third_party/perfetto/protos/perfetto/trace/track_event/thread_descriptor.pbzero
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
  base/time
  ext/base/optional
  ext/base/utils
  ext/base/uuid
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
  tracing/buffer_exhausted_policy
  tracing/core/data_source_config
  tracing/core/forward_decls
  tracing/data_source
  tracing/debug_annotation
  tracing/event_context
  tracing/internal/basic_types
  tracing/internal/data_source_internal
  tracing/internal/tracing_muxer
  tracing/internal/tracing_tls
  tracing/internal/track_event_data_source
  tracing/internal/track_event_internal
  tracing/internal/track_event_macros
  tracing/locked_handle
  tracing/platform
  tracing/trace_writer_base
  tracing/track
  tracing/track_event
  tracing/track_event_category_registry
  tracing/track_event_interned_data_index
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

# --------------------------------------------------

readonly BORINGSSL_HEADER_DIR=third_party/boringssl/src/include/openssl
readonly BORINGSSL_SOURCE_DIR=third_party/boringssl/src
readonly BORINGSSL_FILES=(
  base
  is_boringssl
  md5
  opensslconf
)

for file in "${BORINGSSL_FILES[@]}"; do
  dir=$(dirname "$file")

  header="$CHROMIUM_DIR/src/$BORINGSSL_HEADER_DIR/$file.h"
  if [ -e "$header" ]; then
    mkdir -p "$TMP_DIR/$BORINGSSL_HEADER_DIR/$dir"
    cp -p "$header" "$TMP_DIR/$BORINGSSL_HEADER_DIR/$dir"
  fi

  source="$CHROMIUM_DIR/src/$BORINGSSL_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    mkdir -p "$TMP_DIR/$BORINGSSL_SOURCE_DIR/$dir"
    cp -p "$source" "$TMP_DIR/$BORINGSSL_SOURCE_DIR/$dir"
  fi
done

# --------------------------------------------------

readonly TCMALLOC_SOURCE_DIR=third_party/tcmalloc/chromium/src
readonly TCMALLOC_FILES=(
  addressmap-inl
  common
  config
  config_linux
  free_list
  getenv_safe
  heap-profile-stats
  heap-profile-table
  internal_logging
  linked_list
  malloc_hook-inl
  malloc_hook_mmap_linux
  maybe_emergency_malloc
  maybe_threads
  memory_region_map
  raw_printer
  stacktrace_impl_setup-inl
  stacktrace_x86-inl
  symbolize
  system-alloc
  tcmalloc_guard
)

mkdir -p "$TMP_DIR/$TCMALLOC_SOURCE_DIR"

for file in "${TCMALLOC_FILES[@]}"; do
  header="$CHROMIUM_DIR/src/$TCMALLOC_SOURCE_DIR/$file.h"
  if [ -e "$header" ]; then
    cp -p "$header" "$TMP_DIR/$TCMALLOC_SOURCE_DIR"
  fi

  source="$CHROMIUM_DIR/src/$TCMALLOC_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    cp -p "$source" "$TMP_DIR/$TCMALLOC_SOURCE_DIR"
  fi
done

# --------------------------------------------------

readonly TCMALLOC_BASE_HEADER_DIR=$TCMALLOC_SOURCE_DIR/base
readonly TCMALLOC_BASE_SOURCE_DIR=$TCMALLOC_SOURCE_DIR/base
readonly TCMALLOC_BASE_FILES=(
  abort
  arm_instruction_set_select
  atomicops
  atomicops-internals-x86
  basictypes
  dynamic_annotations
  elf_mem_image
  elfcore
  googleinit
  linux_syscall_support
  logging
  low_level_alloc
  spinlock
  spinlock_internal
  spinlock_linux-inl
  stl_allocator
  sysinfo
  thread_annotations
  thread_lister
  vdso_support
)

mkdir -p "$TMP_DIR/$TCMALLOC_BASE_HEADER_DIR"
mkdir -p "$TMP_DIR/$TCMALLOC_BASE_SOURCE_DIR"

for file in "${TCMALLOC_BASE_FILES[@]}"; do
  header="$CHROMIUM_DIR/src/$TCMALLOC_BASE_HEADER_DIR/$file.h"
  if [ -e "$header" ]; then
    cp -p "$header" "$TMP_DIR/$TCMALLOC_BASE_HEADER_DIR"
  fi

  source="$CHROMIUM_DIR/src/$TCMALLOC_BASE_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    cp -p "$source" "$TMP_DIR/$TCMALLOC_SOURCE_DIR"
  fi
done

cp -p "$CHROMIUM_DIR/src/third_party/tcmalloc/chromium/src/base/commandlineflags.h" \
      "$TMP_DIR/$TCMALLOC_BASE_HEADER_DIR/commandlineflags_chromium.h"

cp -p "$CHROMIUM_DIR/src/third_party/tcmalloc/vendor/src/base/commandlineflags.h" \
      "$TMP_DIR/$TCMALLOC_BASE_HEADER_DIR"

# --------------------------------------------------

readonly TCMALLOC_GPERFTOOLS_HEADER_DIR=$TCMALLOC_SOURCE_DIR/gperftools
readonly TCMALLOC_GPERFTOOLS_SOURCE_DIR=$TCMALLOC_SOURCE_DIR
readonly TCMALLOC_GPERFTOOLS_FILES=(
  heap-checker
  heap-profiler
  malloc_extension
  malloc_extension_c
  malloc_hook
  malloc_hook_c
  stacktrace
)

mkdir -p "$TMP_DIR/$TCMALLOC_GPERFTOOLS_HEADER_DIR"
mkdir -p "$TMP_DIR/$TCMALLOC_SOURCE_DIR"

for file in "${TCMALLOC_GPERFTOOLS_FILES[@]}"; do
  header="$CHROMIUM_DIR/src/$TCMALLOC_GPERFTOOLS_HEADER_DIR/$file.h"
  if [ -e "$header" ]; then
    cp -p "$header" "$TMP_DIR/$TCMALLOC_GPERFTOOLS_HEADER_DIR"
  fi

  source="$CHROMIUM_DIR/src/$TCMALLOC_GPERFTOOLS_SOURCE_DIR/$file.cc"
  if [ -e "$source" ]; then
    cp -p "$source" "$TMP_DIR/$TCMALLOC_SOURCE_DIR"
  fi
done

# --------------------------------------------------

readonly TCMALLOC_REPLACE_PATTERNS=(
  's/"base/"third_party\/tcmalloc\/chromium\/src\/base/g'
  's/"malloc_hook-inl\.h"/"third_party\/tcmalloc\/chromium\/src\/malloc_hook-inl\.h"/g'
  's/<config\.h>/"third_party\/tcmalloc\/chromium\/src\/config\.h"/g'
  's/<gperftools\/\(.*\)>/"gperftools\/\1"/g'
)

for pattern in "${TCMALLOC_REPLACE_PATTERNS[@]}"; do
  find "$TMP_DIR/$TCMALLOC_SOURCE_DIR" -type f -print0 | xargs -0 sed -i -e "$pattern"
done

sed -i -e "s/commandlineflags\.h/commandlineflags_chromium\.h/" "$TMP_DIR/$TCMALLOC_SOURCE_DIR/symbolize.cc"

# --------------------------------------------------

tar -czvf tmp/chromium.tar.gz tmp/chromium
rm -rf tmp/chromium
