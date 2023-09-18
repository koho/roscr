FROM dreamacro/clash-premium:2023.08.17

RUN apk --no-cache add iptables

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
