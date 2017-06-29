FROM alpine:latest
MAINTAINER Johannes Mitlmeier <dev.jojomi@yahoo.com>

WORKDIR /opt

ENV CADDY_VERSION=0.10.4

ADD https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_v${CADDY_VERSION}_linux_amd64.tar.gz /opt
RUN tar xzf *.tar.gz && \
  rm -r *.tar.gz

COPY Caddyfile /app/

VOLUME ["/app"]
CMD ["/opt/caddy", "-conf=/app/Caddyfile"]
