#!/usr/bin/env bash

if [ "$(hostname -s)" != "Jans-MacBook-Pro" ]; then
    echo "Not at this host."
    exit 1
fi

sudo route delete -inet6 default
sudo route add -inet6 default fe80::215:faff:fe87:3100%vtap0

