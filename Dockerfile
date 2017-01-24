FROM alpine:latest
MAINTAINER Johannes Mitlmeier <dev.jojomi@yahoo.com>

ENV CADDY_VERSION=0.9.5
RUN apk add --update wget ca-certificates && \
  wget https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_linux_amd64.tar.gz && \
  tar xzf caddy_linux_amd64.tar.gz && \
  rm -r caddy_linux_amd64.tar.gz && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

COPY Caddyfile /app/

VOLUME ["/app"]
CMD ["/caddy", "-conf=/app/Caddyfile"]
