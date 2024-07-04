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

  if grep -q 'VERSION_ID="7"' /etc/os-release; then

    # https://github.com/pypa/manylinux/blob/7beb9ae220bcf3da425d323817709c1a1e2bd35d/docker/build_scripts/fixup-mirrors.sh#L6-L15

    # Centos 7 is EOL and is no longer available from the usual mirrors, so switch
    # to https://vault.centos.org
    sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf
    sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/*.repo
    sed -i 's;^.*baseurl=http://mirror;baseurl=https://vault;g' /etc/yum.repos.d/*.repo

    if [ "${TARGETPLATFORM}" == "linux/arm64" ]; then
      sed -i 's;/centos/7/;/altarch/7/;g' /etc/yum.repos.d/*.repo
    fi

  fi

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
