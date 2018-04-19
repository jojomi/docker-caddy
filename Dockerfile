# first build the binary so we are compliant with the license
FROM golang:1.10 as builder

ENV CADDY_VERSION=0.10.13

RUN go get -u github.com/mholt/caddy && go get -u github.com/caddyserver/builds
WORKDIR /go/src/github.com/mholt/caddy/caddy
RUN git checkout v${CADDY_VERSION}
WORKDIR /go/src/github.com/mholt/caddy/caddy
RUN CGO_ENABLED=0 GOOS=linux go run build.go -goos=linux -goarch=amd64


FROM alpine:latest
MAINTAINER Johannes Mitlmeier <dev.jojomi@yahoo.com>

COPY Caddyfile /app/
WORKDIR /opt

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates

COPY --from=builder /go/src/github.com/mholt/caddy/caddy/caddy /opt/

VOLUME ["/app"]
CMD ["/opt/caddy", "-conf=/app/Caddyfile"]
