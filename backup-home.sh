#!/usr/bin/env bash

if [ "$(hostname -s)" != "snotra" ]; then
    echo "Not at this host."
    exit 1
fi

SRC=/home
DST=/srv/backup/$(hostname -f)/

rsync --quiet --archive --progress --exclude="jop/Dropbox" --exclude="jopp" "$@" $SRC $DST

