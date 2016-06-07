FROM selenium/node-base:2.47.1
MAINTAINER Selenium <selenium-developers@googlegroups.com>

USER root

#=========
# Firefox
#=========
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    bzip2 \
  && rm -rf /var/lib/apt/lists/*

RUN wget ftp.mozilla.org/pub/mozilla.org/firefox/releases/34.0.5/linux-i686/en-US/firefox-34.0.5.tar.bz2 \
  && tar -xjvf firefox-34.0.5.tar.bz2 \
  && rm -rf /opt/firefox* \
  && mv firefox /opt/firefox34.0.5 \
  && ln -sf /opt/firefox34.0.5/firefox /usr/bin/firefox

#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser
