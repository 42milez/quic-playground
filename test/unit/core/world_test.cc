#include <memory>
#include <catch2/catch.hpp>
#include "../../../src/core/world.h"

TEST_CASE("Hello", "[hello]") {
    auto message = "Hello C++";
    auto world = std::make_unique<core::World>(message);
    REQUIRE(world->hello() == message);
}
