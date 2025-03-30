#!/usr/bin/env bash

# packages
distribution=$(
  . /etc/os-release
  echo "$ID"
)
if [[ "$distribution" == "centos" ]]; then
  yum update -y && yum install -y \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    unzip \
    vim \
    wget &&
    yum clean all
#elif [[ "$distribution" == "debian" ]]; then
else
  apt-get update && apt-get install --no-install-recommends -y \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    unzip \
    vim \
    wget &&
    apt-get clean &&
    rm -rf /var/lib/apt/lists/*
fi

# customize
# <-- add customizations here
# sudo cp -f /vagrant/scripts/motd /etc/motd

# exit
echo "==> Welcome to Vagrant!"
echo "==> run 'vagrant ssh' to login"
