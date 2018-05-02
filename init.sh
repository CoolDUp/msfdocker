#!/bin/bash
source /usr/local/rvm/scripts/rvm
/etc/init.d/postgresql start
/opt/msf/msfupdate --git-branch master

service ssh start

# keep running
tail -f /dev/null
