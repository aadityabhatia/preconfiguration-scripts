#!/bin/bash
set -ve

DIRECTORY=/usr/local/share/backgrounds/
mkdir -p $DIRECTORY

# argument 1: dropbear authorized keys; required
echo $@
test -n "$1"

wget -N -P $DIRECTORY "$1"
file=$DIRECTORY$(basename "$1")

# ensure that file was created as expected
test -f $file

# verify or create user profile
test -f /etc/dconf/profile/user || tee /etc/dconf/profile/user <<EOF
user-db:user
system-db:local
EOF

mkdir -p /etc/dconf/db/local.d/

tee /etc/dconf/db/local.d/wallpaper <<EOF
[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file://$file'
EOF

dconf update

# success
