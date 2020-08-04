#ifndef RUDP_WORLD_H_
#define RUDP_WORLD_H_

#include <string>

namespace core
{
    class World {
    public:
        explicit World(std::string message);

        inline std::string hello() { return message_; };

    private:
        std::string message_;
    };
} // namespace core

#endif // RUDP_WORLD_H_
