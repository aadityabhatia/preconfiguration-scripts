#!/bin/bash
set -ve

# argument 1: proxy auto-config URL; required
echo $@
test -n "$1"

# verify or create user profile
test -f /etc/dconf/profile/user || tee /etc/dconf/profile/user <<EOF
user-db:user
system-db:local
EOF

mkdir -p /etc/dconf/db/local.d/

tee /etc/dconf/db/local.d/proxy-auto-config <<EOF
[system/proxy]
mode='auto'
autoconfig-url='$1'
EOF

dconf update

# success
