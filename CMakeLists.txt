cmake_minimum_required(VERSION 3.16.8)

if (CMAKE_VERSION VERSION_GREATER_EQUAL 3.13)
    cmake_policy(SET CMP0076 NEW)
endif ()

project(quic-playground)
set(PROJECT_VERSION 1.0.0)

set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -Wall -DDEBUG -g")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_PATH "/usr/local/include")

find_package(Catch2 CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)

enable_testing()

if ($ENV{COVERAGE})
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fcoverage-mapping -fprofile-instr-generate")
elseif ($ENV{ASAN})
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")
elseif ($ENV{LSAN})
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=leak")
elseif ($ENV{MSAN})
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=memory")
elseif ($ENV{TSAN})
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=thread")
endif ()

if (CMAKE_BUILD_TYPE STREQUAL Debug)
    message(STATUS "CMAKE_CXX_FLAGS_DEBUG: ${CMAKE_CXX_FLAGS_DEBUG}")
endif ()

if (CMAKE_BUILD_TYPE STREQUAL Release)
    message(STATUS "CMAKE_CXX_FLAGS_RELEASE: ${CMAKE_CXX_FLAGS_RELEASE}")
endif ()

include_directories("${PROJECT_SOURCE_DIR}/lib/chromium")
add_subdirectory(lib/chromium)
add_subdirectory(src)
add_subdirectory(test/unit)
