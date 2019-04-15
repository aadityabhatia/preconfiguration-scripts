#!/bin/bash
set -ve

ln -s /dev/null /etc/systemd/network/99-default.link
sed -i s/enp.*:/eth0:/ /etc/netplan/01-netcfg.yaml

# success
