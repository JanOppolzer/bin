#!/usr/bin/env bash

if [ "$(hostname -s)" != "Jans-MacBook-Pro" ]; then
    echo "Not at this host."
    exit 1
fi

sudo ln -s /opt/local/var/run/mysql57/mysqld.sock /tmp/mysql.sock
