// DO NOT EDIT. Autogenerated by Perfetto cppgen_plugin
#ifndef PERFETTO_PROTOS_PROTOS_PERFETTO_CONFIG_CHROME_CHROME_CONFIG_PROTO_CPP_H_
#define PERFETTO_PROTOS_PROTOS_PERFETTO_CONFIG_CHROME_CHROME_CONFIG_PROTO_CPP_H_

#include <stdint.h>
#include <bitset>
#include <vector>
#include <string>
#include <type_traits>

#include "perfetto/protozero/cpp_message_obj.h"
#include "perfetto/protozero/copyable_ptr.h"
#include "perfetto/base/export.h"

namespace perfetto {
namespace protos {
namespace gen {
class ChromeConfig;
}  // namespace perfetto
}  // namespace protos
}  // namespace gen

namespace protozero {
class Message;
}  // namespace protozero

namespace perfetto {
namespace protos {
namespace gen {

class PERFETTO_EXPORT ChromeConfig : public ::protozero::CppMessageObj {
 public:
  enum FieldNumbers {
    kTraceConfigFieldNumber = 1,
    kPrivacyFilteringEnabledFieldNumber = 2,
    kConvertToLegacyJsonFieldNumber = 3,
  };

  ChromeConfig();
  ~ChromeConfig() override;
  ChromeConfig(ChromeConfig&&) noexcept;
  ChromeConfig& operator=(ChromeConfig&&);
  ChromeConfig(const ChromeConfig&);
  ChromeConfig& operator=(const ChromeConfig&);
  bool operator==(const ChromeConfig&) const;
  bool operator!=(const ChromeConfig& other) const { return !(*this == other); }

  bool ParseFromArray(const void*, size_t) override;
  std::string SerializeAsString() const override;
  std::vector<uint8_t> SerializeAsArray() const override;
  void Serialize(::protozero::Message*) const;

  bool has_trace_config() const { return _has_field_[1]; }
  const std::string& trace_config() const { return trace_config_; }
  void set_trace_config(const std::string& value) { trace_config_ = value; _has_field_.set(1); }

  bool has_privacy_filtering_enabled() const { return _has_field_[2]; }
  bool privacy_filtering_enabled() const { return privacy_filtering_enabled_; }
  void set_privacy_filtering_enabled(bool value) { privacy_filtering_enabled_ = value; _has_field_.set(2); }

  bool has_convert_to_legacy_json() const { return _has_field_[3]; }
  bool convert_to_legacy_json() const { return convert_to_legacy_json_; }
  void set_convert_to_legacy_json(bool value) { convert_to_legacy_json_ = value; _has_field_.set(3); }

 private:
  std::string trace_config_{};
  bool privacy_filtering_enabled_{};
  bool convert_to_legacy_json_{};

  // Allows to preserve unknown protobuf fields for compatibility
  // with future versions of .proto files.
  std::string unknown_fields_;

  std::bitset<4> _has_field_{};
};

}  // namespace perfetto
}  // namespace protos
}  // namespace gen

#endif  // PERFETTO_PROTOS_PROTOS_PERFETTO_CONFIG_CHROME_CHROME_CONFIG_PROTO_CPP_H_