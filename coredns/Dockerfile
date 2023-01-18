FROM alpine:latest

# Only need ca-certificates & openssl if want to use DNS over TLS (RFC 7858).
RUN apk --no-cache add ca-certificates openssl jq curl && update-ca-certificates

RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    wget -qO- $(curl --silent https://api.github.com/repos/coredns/coredns/releases/latest | jq -r '.assets[] | select(.name | endswith("'linux_${arch}.tgz'")) | .browser_download_url') | tar zxv

EXPOSE 53 53/udp

ENTRYPOINT ["/coredns"]
