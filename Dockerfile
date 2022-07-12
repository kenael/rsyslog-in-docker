FROM ubuntu:latest
RUN \
  apt-get update && apt-get install -y supervisor rsyslog logrotate cron 
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY rsyslog_server.conf /etc/rsyslog.d/rsyslog_server.conf
COPY logrotate_hosts /etc/logrotate.d/logrotate_hosts

RUN \
  chmod 0644 /etc/logrotate.d/logrotate_hosts \
  && sed -i 's#/usr/lib/rsyslog/rsyslog-rotate#/usr/bin/supervisorctl restart rsyslog#g' /etc/logrotate.d/* \
  && sed -i 's#/var/log/supervisor#/var/log#g' /etc/supervisor/supervisord.conf

VOLUME /var/log

EXPOSE 1514

CMD ["/usr/bin/supervisord"]
