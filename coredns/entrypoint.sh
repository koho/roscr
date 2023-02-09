#!/bin/sh

export GIN_MODE=release

/dns-board &

exec /coredns $@
