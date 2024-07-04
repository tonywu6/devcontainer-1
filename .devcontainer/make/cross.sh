#!/bin/sh

set -ex

apt-get update -y
apt-get upgrade -y
apt-get install -y \
  curl \
  unzip \
  make \
  cmake \
  ninja-build \
  sudo
