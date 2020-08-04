#include "world.h"

namespace core
{
    World::World(std::string message)
        : message_(std::move(message))
    {}
} // namespace core
