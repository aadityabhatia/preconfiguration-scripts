#!/bin/bash
set -ve

# arguments: packages to purge; optional
echo $@

apt-get -y purge $@
apt-get -y purge `deborphan`
apt-get -y autoremove
apt-get purge -y $(dpkg -l | awk '/^rc/ {print $2}')

# success
