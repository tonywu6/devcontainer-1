#!/bin/sh

set -ex

if
  command -v apt-get >/dev/null 2>&1
then

  apt-get update -y
  apt-get upgrade -y
  apt-get install -y \
    curl \
    unzip \
    make \
    cmake \
    ninja-build \
    bison \
    which \
    sudo \
    zsh

elif
  command -v yum >/dev/null 2>&1
then

  yum install -y epel-release
  yum install -y \
    curl \
    unzip \
    make \
    cmake \
    ninja-build \
    bison \
    which \
    sudo \
    zsh

else
  echo "unsupported distro for building"
  exit 1
fi
