#ifndef EPOLL_SERVER_SIMPLE_EPOLL_SERVER_H_
#define EPOLL_SERVER_SIMPLE_EPOLL_SERVER_H_

#include <map>

namespace quic
{
class SimpleEpollServer;
class EpollAlarmCallbackInterface;
class ReadPipeCallback;

struct EpollEvent
{
    EpollEvent(int events)
        : in_events(events)
        , out_ready_mask(0)
    {}

    int in_events;
    int out_ready_mask;
};

class EpollCallbackInterface {
public:
    virtual void OnRegistration(SimpleEpollServer *eps, int fd, int event_mask) = 0;
    virtual void OnModification(int fd, int event_mask)                         = 0;
    virtual void OnEvent(int fd, EpollEvent *event)                             = 0;
    virtual void Unregistration(int fd, bool replaced)                          = 0;
    virtual void OnShutdown(SimpleEpollServer *eps, int fd)                     = 0;

    virtual std::string Name() const = 0;

    virtual ~EpollCallbackInterface() {}

protected:
    EpollCallbackInterface() {}
};

class SimpleEpollServer {
public:
    using AlarmCB = EpollAlarmCallbackInterface;
    using CB      = EpollCallbackInterface;

    using TimeToAlarmCBMap = std::multimap<int64_t, AlarmCB *>;
    using AlarmRegToken    = TimeToAlarmCBMap::iterator;

    SimpleEpollServer();

    SimpleEpollServer(const SimpleEpollServer &) = delete;
    SimpleEpollServer operator=(const SimpleEpollServer &) = delete;

    virtual ~SimpleEpollServer();

    virtual void RegisterFD(int fd, CB *cb, int event_mask);
    virtual void RegisterFDForWrite(int fd, CB *cb);
    virtual void RegisterFDForReadWrite(int fd, CB *cb);
    virtual void RegisterFDForRead(int fd, CB *cb);
    virtual void UnregisterFD(int fd);
    virtual void ModifyCallback(int fd, int event_mask);
    virtual void StopRead(int fd);
    virtual void StartRead(int fd);
    virtual void StopWrite(int fd);
    virtual void StartWrite(int fd);

    void HandleEvent(int fd, int event_mask);

    virtual void WaitForEventsAndExecuteCallbacks();
    virtual void SetFDReady(int fd, int events_to_fake);
    virtual void SetFDNotReady(int fd);
    virtual bool IsFDReady(int fd) const;

    size_t ReadyListSize() const { return ready_list_size_; }

    void VerifyReadyList() const;

    virtual void RegisterAlarm(int64_t timeout_time_in_us, AlarmCB *ac);

    void RegisterAlarmApproximateDelta(int64_t delta_in_us, AlarmCB *ac)
    {
        RegisterAlarm(ApprozimateNowInUsec() + delta_in_us, ac);
    }

    virtual void UnregisterAlarm(const SimpleEpollServer::AlarmRegToken &iterator_token);
    virtual SimpleEpollServer::AlarmRegToken ReregisterAlarm(SimpleEpollServer::AlarmRegToken iterator_token,
                                                             int64_t timeout_time_in_us);
    virtual int NumFDsRegistered() const;
    virtual void Wake();
    virtual int64_t NowInUsec() const;
    virtual int64_t ApproximateNowInUsec() const;

    static std::string EventMaskToString(int event_mask);
    void LogStateOnCrash();
    void set_timeout_in_us(int64_t timeout_in_us) {
        timeout_in_us_ = timeout_in_us;
    }
    int timeout_in_us_for_test() const { return timeout_in_us_; }
    bool in_shutdown() const { return in_shutdown_; }
    void Shutdown() {}
    void CallReadyListCallbacks();
    int64_t LastDelayInUsec() const { return last_delay_in_usec_; }

protected:
    virtual void SetNonblocking(int fd);
    virtual int epoll_wait_impl(int epfd, struct epoll_event *events, int max_events, int timeout_in_ms);

    struct CBAndEventMask {
        CBAndEventMask() : cb(nullptr),
            fd(-1),
            event_mask(0),
            events_asserted(0),
            events_to_fake(0),
            in_use(false) {
            entry.le_next = nullptr;
            entry.le_prev = nullptr;
        }

        CBAndEventMask(EpollCallbackInterface *cb, int event_mask, int fd) :
            cb(cb),
            fd(fd),
            event_mask(event_mask),
            events_asserted(0),
            events_to_fake(0),
            in_use(false) {
            entry.le_next = nullptr;
            entry.le_prev = nullptr;
        }

        bool operator==(const CBAndEventMask &cb_and_mask) const {
            return fd == cb_and_mask.fd;
        }

        mutable EpollCallbackInterface *cb;
        mutable LIST_ENTRY(CBAndEventMask) entry;
        int fd;
        mutable int event_mask;
        mutable int events_asserted;
        mutable int events_to_fake;
        mutable bool in_use;
    };
};
} // namespace quic

#endif // EPOLL_SERVER_SIMPLE_EPOLL_SERVER_H_
