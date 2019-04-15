#!/bin/bash
set -ve

# ensure that remote repository exists
curl -IfS "http://deb.nodesource.com/node_10.x/dists/$(lsb_release -sc)/main/binary-$(dpkg --print-architecture)/Release"

# https://nodejs.org/en/download/package-manager/
curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key -o /etc/apt/trusted.gpg.d/nodesource.asc
tee /etc/apt/sources.list.d/nodesource.list <<< "deb http://deb.nodesource.com/node_10.x $(lsb_release -sc) main"

apt-get update
apt-get install -y nodejs

# set nodejs global modules location
npm -g config set prefix /usr/local

# success
