FROM alpine:latest

RUN apk add --no-cache logrotate

RUN mkdir -p /var/log/logrotate

COPY logrotate.conf /etc/logrotate.d/
COPY logrotate.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/logrotate.sh"]

CMD ["tail", "-f", "/dev/null"]