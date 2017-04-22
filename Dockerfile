FROM alpine:latest
MAINTAINER Johannes Mitlmeier <dev.jojomi@yahoo.com>

ENV CADDY_VERSION=0.10.0
RUN apk add --update wget ca-certificates && \
  wget https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_v${CADDY_VERSION}_linux_amd64.tar.gz && \
  tar xzf *.tar.gz && \
  rm -r *.tar.gz && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

COPY Caddyfile /app/

VOLUME ["/app"]
CMD ["/caddy", "-conf=/app/Caddyfile"]
