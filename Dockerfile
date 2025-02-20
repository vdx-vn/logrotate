FROM alpine:latest

RUN apk add --no-cache logrotate dcron tzdata

RUN mkdir -p /var/log/logrotate /conf \
    && chown -R root /var/log/logrotate /etc/logrotate.d /conf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENV CRON_SCHEDULE="0 * * * *"
ENV TZ=UTC

VOLUME ["/var/log/logrotate"]

ENTRYPOINT ["/entrypoint.sh"]
