FROM dreamacro/clash-premium:2023.08.17

RUN apk --no-cache add nftables

COPY rules.conf /rules.conf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
