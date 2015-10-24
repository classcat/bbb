#!/bin/bash

TARGET=/var/lib/tomcat7/webapps/demo


install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-hbar1.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-about.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-hbar2.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-footer.jsp \
    ${TARGET}


install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-create.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-record.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-record-list.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-record_helper.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-activity-monitor.jsp \
    ${TARGET}

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/cc-activity-monitor_helper.jsp \
    ${TARGET}


install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/js/cc-activity-monitor.js \
    ${TARGET}/js


install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/images/ccwebcon_logo_blue.png \
    ${TARGET}/images

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/images/arrow039_02.png \
    ${TARGET}/images

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/images/arrow072_04.png \
    ${TARGET}/images

install -v -o tomcat7 -g tomcat7 -m 0644 \
    ../assets/moderator2/images/ccm-favicon.png \
    ${TARGET}/images


exit 0
