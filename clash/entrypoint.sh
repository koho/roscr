#!/bin/sh

ulimit -n $(ulimit -n -H)

# TCP/UDP traffic
# Clear old rules
ip rule del fwmark 1 table 100 2>/dev/null
ip route del local default dev lo table 100 2>/dev/null
# Create new rules
ip rule add fwmark 1 table 100
ip route add local default dev lo table 100
nft -f /rules.conf

exec /clash $@
