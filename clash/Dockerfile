FROM dreamacro/clash-premium:2023.05.29

RUN apk --no-cache add iptables

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
