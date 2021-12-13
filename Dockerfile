# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN \
  apt-get update && apt-get install -y supervisor rsyslog \
  && mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY rsyslog_server.conf /etc/rsyslog.d/rsyslog_server.conf

VOLUME /var/log

EXPOSE 1514

CMD ["/usr/bin/supervisord"]
