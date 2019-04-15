#!/bin/bash
set -ve

# verify or create user profile
test -f /etc/dconf/profile/user || tee /etc/dconf/profile/user <<EOF
user-db:user
system-db:local
EOF

mkdir -p /etc/dconf/db/local.d/

tee /etc/dconf/db/local.d/gnome-privacy <<EOF
[org/gnome/desktop/privacy]
recent-files-max-age=7
remove-old-trash-files=true
remove-old-temp-files=true
old-files-age=uint32 7

[org/gnome/desktop/media-handling]
automount=false
autorun-never=true
EOF

dconf update

# success
