#!/bin/bash

set -e

# Make debconf not complain about
# us not using terminal.

export DEBIAN_FRONTEND=noninteractive

# Needed for the next command

apt-get install -y lsb-release

# Add additional repo.

echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" \
    > /etc/apt/sources.list

apt-get update

# Install extra tools for aptitude.

apt-get install -y dialog

apt-get install -y python-software-properties

add-apt-repository ppa:nginx/stable
apt-get update
apt-get install -y nginx

# Remove cruft

apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
