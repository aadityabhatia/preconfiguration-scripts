#!/bin/bash
set -ve
test $UID -ne 0 && echo Must be root. && exit 2

# customize boot splash animation
update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/solar/solar.plymouth 900

# success
