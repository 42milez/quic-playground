FROM ubuntu:18.04

ARG PROJECT_ROOT=/var/project

ARG BINARY_PATH=/usr/local/bin
ARG INCLUDE_PATH=/usr/local/include
ARG SRC_PATH=/usr/local/src

ARG DOWNLOAD_PATH=/root

ARG CATCH2_VERSION=2.13.0
ARG CLANG_VERSION=10
ARG CMAKE_VERSION=3.16.8
ARG GITHUB_RELEASE_VERSION=0.8.1
ARG LYRA_VERSION=1.4
ARG SPDLOG_VERSION=1.7.0

ENV CC clang-$CLANG_VERSION
ENV CXX clang++-$CLANG_VERSION
ENV SAN_SYMBOLIZER_PATH /usr/bin/llvm-symbolizer-$CLANG_VERSION

#  Install packages
# --------------------------------------------------
RUN \
  apt-get update \
  && apt-get install -y \
    build-essential \
    clang-$CLANG_VERSION \
    curl \
    gdb \
    gdbserver \
    git \
    openssh-server \
    python3-pip \
    rsync \
  && rm -rf /var/lib/apt/lists/*

#  Enable SSH service
# --------------------------------------------------
# https://docs.docker.com/engine/examples/running_ssh_service
RUN \
  mkdir -p /var/run/sshd \
  && echo "root:root" | chpasswd \
  && sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config \
  && sed "s@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g" -i /etc/pam.d/sshd

#  Install CMake
# --------------------------------------------------
RUN \
  python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install --no-cache-dir cmake==$CMAKE_VERSION

#  Install libraries
# --------------------------------------------------
RUN \
  # Catch2
  git clone https://github.com/catchorg/Catch2.git $SRC_PATH/catch2 \
  && cd $SRC_PATH/catch2 \
  && git checkout -b v$CATCH2_VERSION refs/tags/v$CATCH2_VERSION \
  && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
  && cmake --build build/ --target install \
  # Lyra
  && git clone https://github.com/bfgroup/Lyra.git $SRC_PATH/lyra \
  && cd $SRC_PATH/lyra \
  && git checkout -b $LYRA_VERSION refs/tags/$LYRA_VERSION \
  && cp -pvR $SRC_PATH/lyra/data/single_include/lyra $INCLUDE_PATH/lyra \
  # spdlog
  && git clone https://github.com/gabime/spdlog.git $SRC_PATH/spdlog \
  && cd $SRC_PATH/spdlog \
  && git checkout -b v$SPDLOG_VERSION refs/tags/v$SPDLOG_VERSION \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make -j \
  && make install

#  Install github-release
# --------------------------------------------------
RUN \
  curl \
    -L https://github.com/github-release/github-release/releases/download/v$GITHUB_RELEASE_VERSION/linux-amd64-github-release.bz2 \
    -o linux-amd64-github-release.bz2 \
  && bzip2 -d linux-amd64-github-release.bz2 \
  && mv linux-amd64-github-release $BINARY_PATH/github-release \
  && chmod 0700 $BINARY_PATH/github-release

WORKDIR $PROJECT_ROOT

EXPOSE 22 7777

CMD [ "/usr/sbin/sshd", "-D" ]
