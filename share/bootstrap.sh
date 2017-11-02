#!/usr/bin/env bash

# setup basic features
yum update -y && yum clean all;
yum install -y curl git vim wget;
sudo cp -f /vagrant/share/motd /etc/motd;

# customize
# <-- add customizations here

# exit
echo "==> Welcome to Vagrant!";
echo "==> run 'vagrant ssh' to login";
