FROM alpine:3

RUN apk add --update-cache 'squid=~4.12' && rm -rf /var/cache/apk/*

RUN chown -R squid:squid /run && \
    chown -R squid:squid /var/cache/squid && \
    chown -R squid:squid /var/log/squid

COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /entrypoint.sh

USER squid
ENTRYPOINT ["/entrypoint.sh"]
