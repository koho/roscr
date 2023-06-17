#!/bin/sh

ulimit -n $(ulimit -n -H)

# TCP traffic
setup_iptables() {
    if iptables -t nat -n --list CLASH >/dev/null 2>&1; then
        return
    fi
    iptables -t nat -N CLASH
    iptables -t nat -A CLASH -d 0.0.0.0/8 -j RETURN
    iptables -t nat -A CLASH -d 10.0.0.0/8 -j RETURN
    iptables -t nat -A CLASH -d 127.0.0.0/8 -j RETURN
    iptables -t nat -A CLASH -d 169.254.0.0/16 -j RETURN
    iptables -t nat -A CLASH -d 172.16.0.0/12 -j RETURN
    iptables -t nat -A CLASH -d 192.168.0.0/16 -j RETURN
    iptables -t nat -A CLASH -d 224.0.0.0/4 -j RETURN
    iptables -t nat -A CLASH -d 240.0.0.0/4 -j RETURN
    iptables -t nat -A CLASH -p tcp -j REDIRECT --to-ports 7892
    iptables -t nat -A PREROUTING -p tcp -j CLASH
}

# UDP traffic
setup_route() {
    sleep 3
    # Setup default route for non-proxy network
    GW=$(ip route | awk '/default/ { print $3 }')
    ip route flush scope global
    [ -z "$SUBNET" ] || ip route add $SUBNET via $GW

    # Route all other traffics to the proxy interface
    ip route add default via $GW metric 1
    ip route add default dev utun metric 0
}

setup_iptables

setup_route &

exec /clash $@
