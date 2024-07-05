#!/bin/sh

set -ex

if
  command -v apt-get >/dev/null 2>&1
then

  apt-get update -y
  apt-get upgrade -y
  apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    bzip2 \
    make \
    cmake \
    ninja-build \
    bison \
    which \
    sudo \
    openssh-client \
    zsh

  apt-get clean -y
  apt-get autoremove -y

elif
  command -v yum >/dev/null 2>&1
then

  yum install -y epel-release

  yum install -y \
    git \
    curl \
    unzip \
    zip \
    bzip2 \
    make \
    cmake \
    ninja-build \
    bison \
    which \
    sudo \
    openssh-clients \
    zsh

  yum clean all

else
  echo "unsupported distro for building"
  exit 1
fi
