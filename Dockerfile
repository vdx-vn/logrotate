FROM alpine:latest

RUN apk add --no-cache logrotate

RUN mkdir -p /var/log/logrotate

COPY logrotate.conf /etc/logrotate.d/
COPY logrotate.sh /etc/logrotate.d/

ENTRYPOINT ["/etc/logrotate.d/logrotate.sh"]

CMD ["tail", "-f", "/dev/null"]