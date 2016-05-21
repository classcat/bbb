#!/bin/bash

# 22-may-16 : replace the pdf file.

TARGET=/var/www/bigbluebutton-default

# backup
cp -p ${TARGET}/default.pdf ${TARGET}/default.pdf.orig

install -v -o root -g root -m 0755 \
    ../assets/ClassCatCompany_Catalog-20160516.pdf \
    ${TARGET}/default.pdf

#install -v -o root -g root -m 0755 \
#    ../assets/ClassCatServiceCatalog-20150603.pdf \
#    ${TARGET}/default.pdf

exit 0
