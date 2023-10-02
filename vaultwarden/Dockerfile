FROM ubuntu:latest

RUN cd / && apt update && apt install xz-utils wget -y && arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/x64/) && \
    wget -qO- https://7-zip.org/a/7z2301-linux-$arch.tar.xz | tar Jx

FROM vaultwarden/server:latest

COPY --from=0 /7zzs /usr/bin/7z

RUN apt update && apt install jq -y

COPY ./backup.sh /backup.sh

RUN sed -i '$ibash /backup.sh &' /start.sh

ENV ROCKET_ADDRESS=127.0.0.1

ENV ROCKET_PORT=8000
