#!/bin/bash
set -ve

# rename partition label in /etc/crypttab from sda#_crypt to system, for aesthetics!

old_name=$(awk '/sda[1-9]_crypt/ {print $1}' /etc/crypttab)
awk '/sda[1-9]_crypt/ {$1="system"; print $0; next} {print $0}' /etc/crypttab > /tmp/crypttab
cp /tmp/crypttab /etc/crypttab
dmsetup rename $old_name system

# success
