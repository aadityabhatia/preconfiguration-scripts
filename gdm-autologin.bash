#!/bin/bash
set -ve

# enable automatic login for default user
grep -E '^AutomaticLogin' /etc/gdm3/custom.conf && sed -i "/^AutomaticLogin/d" /etc/gdm3/custom.conf || true
sed -i "/\[daemon\]/a AutomaticLoginEnable=true\nAutomaticLogin=$(id -nu 1000)" /etc/gdm3/custom.conf

# success
