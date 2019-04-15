#!/bin/bash
set -ve

# arguments: URLs to download; required
echo $@
test -n "$@"

USER_HOME=/home/$(id -nu 1000)

wget -P $USER_HOME $@

# grant ownership of newly created files to the user
chown -cR 1000:1000 $USER_HOME

# success
