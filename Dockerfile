FROM alpine:latest

RUN apk upgrade --update --available && \
    apk add ca-certificates "openssl>=1.0.2d-r0" && \
    rm -f /var/cache/apk/*

VOLUME ["/app"]
COPY caddy /caddy
CMD ["/caddy", "-conf=/app/Caddyfile"]
