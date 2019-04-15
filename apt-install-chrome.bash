#!/bin/bash
set -ve

# ensure that remote repository exists
curl -IfS "https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-$(dpkg --print-architecture)/Release"

# https://www.google.com/chrome/
curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub -o /etc/apt/trusted.gpg.d/google.asc
tee /etc/apt/sources.list.d/google-chrome.list <<< "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main"

apt-get update
apt-get install -y google-chrome-stable

# success
