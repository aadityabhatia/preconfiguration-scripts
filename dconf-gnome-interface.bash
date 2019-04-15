#!/bin/bash
set -ve

# verify or create user profile
test -f /etc/dconf/profile/user || tee /etc/dconf/profile/user <<EOF
user-db:user
system-db:local
EOF

mkdir -p /etc/dconf/db/local.d/

tee /etc/dconf/db/local.d/gnome-interface <<EOF
# location is needed for automatic-timezone and night-light
[org/gnome/system/location]
enabled=true

[org/gnome/desktop/interface]
gtk-theme='Ambiance'
show-battery-percentage=true
clock-show-date=true
clock-show-seconds=true
clock-show-weekday=true

[org/gnome/desktop/datetime]
automatic-timezone=true

[org/gnome/shell]
enabled-extensions=['alternate-tab@gnome-shell-extensions.gcampax.github.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com', 'ubuntu-appindicators@ubuntu.com']
favorite-apps=['google-chrome.desktop', 'firefox.desktop', 'org.gnome.Nautilus.desktop', 'byobu.desktop', 'atom.desktop', 'virtualbox.desktop', 'org.gajim.Gajim.desktop']

[org/gnome/desktop/background]
show-desktop-icons=false

[org/gnome/settings-daemon/plugins/color]
night-light-enabled=true
EOF

dconf update

# success
