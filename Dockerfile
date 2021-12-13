# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN \
  apt-get update && apt-get install -y supervisor rsyslog logrotate cron \
  && mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY rsyslog_server.conf /etc/rsyslog.d/rsyslog_server.conf
COPY logrotate_hosts /etc/logrotate.d/logrotate_hosts

VOLUME /var/log

EXPOSE 1514

CMD ["/usr/bin/supervisord"]
