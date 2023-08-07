FROM dreamacro/clash-premium:2023.07.22

RUN apk --no-cache add iptables

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
