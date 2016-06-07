FROM selenium/base:2.47.1
MAINTAINER Selenium <selenium-developers@googlegroups.com>

#========================
# Selenium Configuration
#========================

EXPOSE 4444

ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 30000
ENV GRID_BROWSER_TIMEOUT 0
ENV GRID_MAX_SESSION 5
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

RUN rm -rf /opt/selenium \
  && mkdir -p /opt/selenium \
  && wget --no-verbose https://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar -O /opt/selenium/selenium-server-standalone.jar

COPY generate_config /opt/selenium/generate_config
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chown -R seluser /opt/selenium
RUN chown seluser /opt/bin/entry_point.sh
RUN chmod 777 /opt/bin/entry_point.sh

USER seluser

CMD ["/opt/bin/entry_point.sh"]

