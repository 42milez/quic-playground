FROM ubuntu:18.04

ARG PROJECT_ROOT=/var/project

ARG BINARY_PATH=/usr/local/bin
ARG INCLUDE_PATH=/usr/local/include
ARG DOWNLOAD_PATH=/root

ARG CLANG_VERSION=10
ARG CMAKE_VERSION=3.16.8

ARG CATCH2_VERSION=2.13.0
ARG CATCH2_URL=https://github.com/catchorg/Catch2/archive/v$CATCH2_VERSION.tar.gz
ARG CATCH2_SRC_PATH=/usr/local/src/catch2

ARG GITHUB_RELEASE_VERSION=0.8.1
ARG GITHUB_RELEASE_URL=https://github.com/github-release/github-release/releases/download/v$GITHUB_RELEASE_VERSION/linux-amd64-github-release.bz2

ARG LYRA_VERSION=1.4
ARG LYRA_URL=https://github.com/bfgroup/Lyra/archive/$LYRA_VERSION.tar.gz
ARG LYRA_SRC_PATH=/usr/local/src/lyra

ARG SPDLOG_VERSION=1.7.0
ARG SPDLOG_URL=https://github.com/gabime/spdlog/archive/v$SPDLOG_VERSION.tar.gz
ARG SPDLOG_SRC_PATH=/usr/local/src/spdlog

ENV CC clang-$CLANG_VERSION
ENV CXX clang++-$CLANG_VERSION
ENV CMAKE /usr/local/bin/cmake
ENV CTEST /usr/local/bin/ctest
ENV SAN_SYMBOLIZER_PATH /usr/bin/llvm-symbolizer-$CLANG_VERSION

RUN :'Install packages' \
  && apt-get update \
  && apt-get install -y \
    build-essential \
    clang-$CLANG_VERSION \
    curl \
    gdb \
    gdbserver \
    git \
    openssh-server \
    rsync

RUN :'Install github-release' \
  && curl -L $GITHUB_RELEASE_URL -o linux-amd64-github-release.bz2 \
  && bzip2 -d linux-amd64-github-release.bz2 \
  && mv linux-amd64-github-release $BINARY_PATH/github-release \
  && chmod 0700 $BINARY_PATH/github-release

# https://docs.docker.com/engine/examples/running_ssh_service/
RUN :'Enable SSH service' \
  && echo root:root | chpasswd \
  && mkdir -p /var/run/sshd \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
  && mkdir -p /root/.ssh

RUN :'Install CMake' \
  && apt-get install -y
    python3-pip \
  && python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install --no-cache-dir cmake==$CMAKE_VERSION

RUN :'Install libraries' \
  # Catch2
  && mkdir -p $CATCH2_SRC_PATH \
  && curl -L $CATCH2_URL | tar zx -C $CATCH2_SRC_PATH --strip-components=1 \
  && cd $CATCH2_SRC_PATH \
  && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
  && cmake --build build/ --target install \
  # Lyra
  && mkdir -p $LYRA_SRC_PATH \
  && curl -L $LYRA_URL | tar zx -C $LYRA_SRC_PATH --strip-components=1 \
  && cp -pR $LYRA_SRC_PATH/data/single_include/lyra $INCLUDE_PATH/lyra \
  # spdlog
  && mkdir -p $SPDLOG_SRC_PATH \
  && curl -L $SPDLOG_URL | tar zx -C $SPDLOG_SRC_PATH --strip-components=1 \
  && cd $SPDLOG_SRC_PATH \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make -j

RUN :'Clean up the apt cache' \
  && rm -rf /var/lib/apt/lists/*

WORKDIR $PROJECT_ROOT

EXPOSE 22 7777

CMD [ '/usr/sbin/sshd', '-D' ]
