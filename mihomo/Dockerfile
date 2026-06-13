FROM metacubex/mihomo:latest

RUN apk --no-cache add nftables

COPY rules.conf /rules.conf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
