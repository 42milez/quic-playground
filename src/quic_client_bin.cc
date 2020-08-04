#include <iostream>

#include "core/world.h"

int main() {
    auto world = new core::World("Hello C++");

    std::cout << world->hello() << std::endl;

    return 0;
}
