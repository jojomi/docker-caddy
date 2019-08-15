# First build the binary so we are compliant with the license
# Build instructions here: https://github.com/mholt/caddy#build
FROM golang:1.12 as builder

ENV CADDY_VERSION=1.0.3

ENV GO111MODULE=on
WORKDIR /build/
ADD caddy_main.go /build/
RUN go mod init caddy && \
    go mod edit -require github.com/caddyserver/caddy@v${CADDY_VERSION} && \
    go build -o caddy && \
    ./caddy --version
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build


FROM alpine:latest
LABEL maintainer="Johannes Mitlmeier <dev.jojomi@yahoo.com>"

COPY Caddyfile /app/
WORKDIR /opt

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates

COPY --from=builder /build/caddy /opt/

VOLUME ["/app"]
CMD ["/opt/caddy", "-conf=/app/Caddyfile", '--agree="${ACME_AGREE}"']
