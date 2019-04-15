#!/bin/bash
set -ve

# argument 1: package URL; required
echo $@
test -n "$1"

filename=$(date +%s.%N).deb
wget -O $filename "$1"
dpkg-deb -I $filename
dpkg -i $filename || apt-get install -yf

# note: a broken package can prevent dpkg / apt from working
# this can interfere with other scripts during installation

# success
