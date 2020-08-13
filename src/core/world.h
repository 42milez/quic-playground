#ifndef CORE_WORLD_H_
#define CORE_WORLD_H_

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

#endif // CORE_WORLD_H_
