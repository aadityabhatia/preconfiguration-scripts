#!/bin/bash
set -ve
test $UID -ne 0 && echo Must be root. && exit 2

tee /etc/sudoers.d/nopasswd-apt-get <<< "%sudo ALL=NOPASSWD: /usr/bin/apt-get"
tee /etc/sudoers.d/nopasswd-ip <<< "%sudo ALL=NOPASSWD: /sbin/ip"
tee /etc/sudoers.d/nopasswd-dhclient <<< "%sudo ALL=NOPASSWD: /sbin/dhclient"
tee /etc/sudoers.d/nopasswd-wpa_supplicant <<< "%sudo ALL=NOPASSWD: /sbin/wpa_supplicant"
tee /etc/sudoers.d/insults <<< "Defaults insults"

# success
