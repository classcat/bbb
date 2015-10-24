#!/bin/bash

CWD=`pwd`

cp -p ../assets/etc/rc.local /etc/rc.local

chown root.root /etc/rc.local

chmod 0755 /etc/rc.local

exit 0
