#!/bin/bash

TARGET=/var/www/bigbluebutton-default

# backup
cp -p ${TARGET}/default.pdf ${TARGET}/default.pdf.orig


install -v -o root -g root -m 0755 \
    ../assets/ClassCatServiceCatalog-20150603.pdf \
    ${TARGET}/default.pdf


exit 0
