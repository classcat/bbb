#!/bin/bash

cp -p \
    /var/www/bigbluebutton/client/lib/bbb_localization.js \
    /var/www/bigbluebutton/client/lib/bbb_localization.js.orig

install -v -o root -g root -m 0644 \
    ../assets/var/www/bigbluebutton/client/lib/bbb_localization.js \
    /var/www/bigbluebutton/client/lib

cp -p \
    /etc/localtime \
    /etc/localtime.orig

cp -p \
    /usr/share/zoneinfo/Asia/Tokyo \
    /etc/localtime

sed -i.bak -e 's/^JAVA_OPTS\s*=\s*.*/JAVA_OPTS="-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC -Duser.timezone=JST"/' \
    /etc/default/tomcat7

service tomcat7 restart

exit 0
