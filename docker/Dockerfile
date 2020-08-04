FROM ubuntu:18.04

ARG PROJECT_ROOT=/var/project

ARG CLANG_VERSION=10
ARG CMAKE_VERSION=3.16.8
ARG BINARY_PATH=/usr/local/bin
ARG INCLUDE_PATH=/usr/local/include

ARG CATCH2_VERSION=2.12.4
ARG CATCH2_URL=https://github.com/catchorg/Catch2/archive/v$CATCH2_VERSION.tar.gz

ARG GITHUB_RELEASE_VERSION=0.8.1
ARG GITHUB_RELEASE_URL=https://github.com/github-release/github-release/releases/download/v$GITHUB_RELEASE_VERSION/linux-amd64-github-release.bz2

ARG LYRA_VERSION=1.4
ARG LYRA_URL=https://github.com/bfgroup/Lyra/archive/$LYRA_VERSION.tar.gz

ENV CC clang-$CLANG_VERSION
ENV CXX clang++-$CLANG_VERSION
ENV CMAKE /usr/local/bin/cmake
ENV CTEST /usr/local/bin/ctest
ENV SAN_SYMBOLIZER_PATH /usr/bin/llvm-symbolizer-$CLANG_VERSION

#  Install packages
# --------------------------------------------------
RUN \
  apt-get update && apt-get install -y \
    build-essential \
    clang-$CLANG_VERSION \
    curl \
    gdb \
    gdbserver \
    git \
    openssh-server \
    rsync

#  Install github-release
# --------------------------------------------------
RUN \
  curl -L $GITHUB_RELEASE_URL -o linux-amd64-github-release.bz2 \
  && bzip2 -d linux-amd64-github-release.bz2 \
  && mv linux-amd64-github-release $BINARY_PATH/github-release \
  && chmod 0700 $BINARY_PATH/github-release

#  Enable SSH service: https://docs.docker.com/engine/examples/running_ssh_service/
# --------------------------------------------------
RUN \
  echo root:root | chpasswd \
  && mkdir -p /var/run/sshd \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
  && mkdir -p /root/.ssh
COPY docker/id_ed25519.pub /root/.ssh/authorized_keys
RUN chmod 0400 /root/.ssh/authorized_keys

#  Install CMake
# --------------------------------------------------
RUN \
  apt-get install -y \
    python3-pip \
  && python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install --no-cache-dir cmake==$CMAKE_VERSION

#  Install libraries
# --------------------------------------------------
RUN \
  # spdlog
  apt-get install -y \
    libspdlog-dev \
  # Catch2
  && git clone https://github.com/catchorg/Catch2.git \
  && cd Catch2 \
  && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
  && cmake --build build/ --target install \
  # Lyra
  && curl -L $LYRA_URL | tar zx -C /root \
  && cp -pR /root/Lyra-$LYRA_VERSION/data/single_include/lyra $INCLUDE_PATH/lyra \
  && rm -rf /root/Lyra-$LYRA_VERSION

#  Clean up the apt cache
# --------------------------------------------------
RUN rm -rf /var/lib/apt/lists/*

WORKDIR $PROJECT_ROOT

EXPOSE 22 7777

CMD [ "/usr/sbin/sshd", "-D" ]
