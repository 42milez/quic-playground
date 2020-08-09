#include "simple_epoll_server.h"
#include <unistd.h>

constexpr int ERROR_BUFFER_SIZE = 256;

namespace quic
{
template <typename T> class AutoReset {
public:
    AutoReset(T *scoped_variable, T new_value)
        : scoped_variable_(scoped_variable)
        , original_value_(std::move(*scoped_variable))
    {
        *scoped_variable_ = std::move(new_value);
    }
    AutoReset(const AutoReset &) = delete;
    AutoReset &operator=(const AutoReset &) = delete;

    ~AutoReset() { *scoped_variable_ = std::move(original_value_); }

private:
    T *scoped_variable_;
    T original_value_;
};

class ReadPipeCallback : public EpollCallbackInterface {
public:
    void OnEvent(int fd, EpollEvent *event) override {
        DCHECK(event->in_events == EPOLLIN);
        int data;
        int data_read = 1;
        while (data_read > 0) {
            data_read = read(fd, &data, sizeof(data));
        }
    }
    void OnShutdown(SimpleEpollServer *eps, int fd) override {}
    void OnRegistration(SimpleEpollServer *, int, int) override {}
    void OnModification(int, int) override {}
    void OnUnregistration(int, bool) override {}
    std::string Name() const override { return "ReadPipeCallback"; }
};
} // namespace quic
