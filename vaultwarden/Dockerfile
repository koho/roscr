FROM golang:latest

RUN git clone https://github.com/koho/bakdav.git

RUN cd bakdav && GO111MODULE=on CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /bakdav .

RUN cd / && arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/x64/) && \
    wget -qO- https://7-zip.org/a/7z2301-linux-$arch.tar.xz | tar Jxf

FROM vaultwarden/server:latest

COPY --from=0 /bakdav /usr/bin/bakdav

COPY --from=0 /7zzs /usr/bin/7z

RUN sed -i '$ibakdav -c /etc/backup.json' /start.sh
