#!/bin/bash

TARGET=/var/www/bigbluebutton-default

# backup
cp -p ${TARGET}/index.html ${TARGET}/index.html.orig

cp -p ${TARGET}/images/favicon.png ${TARGET}/images/favicon.png.orig


# install

install -v -o root -g root -m 0644 \
    ../assets/viewer/index.html \
    ${TARGET}


install -v -o root -g root -m 0644 \
    ../assets/viewer/images/ccwebcon_logo.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/viewer/images/ccwebcon_tejun2.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/viewer/images/ccwebcon_contact.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/viewer/images/sales-info.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/viewer/images/cc-favicon.png \
    ${TARGET}/images


install -v -o root -g root -m 0644 \
    ../assets/viewer/css/ccstyle.css \
    ${TARGET}/css

exit 0


