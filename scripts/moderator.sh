#!/bin/bash

TARGET=/var/www/bigbluebutton-default


install -v -o root -g root -m 0644 \
    ../assets/moderator/moderator.html \
    ${TARGET}


install -v -o root -g root -m 0644 \
    ../assets/moderator/images/ccm-favicon.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/moderator/images/ccwebcon_logo_blue.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/moderator/images/ccwebcon_mmenu.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/moderator/images/arrow070_02.gif \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/moderator/images/ccwebcon_mcontact.png \
    ${TARGET}/images

install -v -o root -g root -m 0644 \
    ../assets/moderator/images/support.png \
    ${TARGET}/images


install -v -o root -g root -m 0644 \
    ../assets/moderator/css/ccmstyle.css \
    ${TARGET}/css


exit 0
