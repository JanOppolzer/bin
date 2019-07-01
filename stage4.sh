#!/usr/bin/env bash

if ! [[ "$(hostname -s)" =~ ^(snotra|sigyn|sjofn|helreginn)$ ]]; then
    echo "Not at this host."
    exit 1
fi

# exclude the following when cloning:
# - /etc/ssh/ssh_host_*

STAGE4="/srv/backup/$(hostname -f)/$(hostname -s)-stage4-$(date +%Y%m%d-%H%M%S).tar.gz"

EXCLUDES="\
--exclude=/$(hostname -s)/* \
--exclude=/chroot/*/dev/* \
--exclude=/chroot/*/home/* \
--exclude=/chroot/*/media/* \
--exclude=/chroot/*/mnt/* \
--exclude=/chroot/*/proc/* \
--exclude=/chroot/*/run/* \
--exclude=/chroot/*/sys/* \
--exclude=/chroot/*/tmp/* \
--exclude=/chroot/*/usr/portage/* \
--exclude=/chroot/*/var/tmp/portage/* \
--exclude=/dev/* \
--exclude=/data/* \
--exclude=/export/* \
--exclude=/home/* \
--exclude=/media/* \
--exclude=/mnt/* \
--exclude=/proc/* \
--exclude=/run/* \
--exclude=/srv/* \
--exclude=/sys/* \
--exclude=/tmp/* \
--exclude=/usr/portage/* \
--exclude=/var/lib/docker/* \
--exclude=/var/lib/libvirt/* \
--exclude=/var/lib/lxd/* \
--exclude=/var/tmp/portage/* \
--exclude=$STAGE4"

sudo tar $EXCLUDES -czpf $STAGE4 /
sha256sum $STAGE4 >> $STAGE4.sha256

gpg2 -u 6B78BA37143C14C3A9699485DBF935FB5101AA6C --output $STAGE4.gpg --recipient jan@oppolzer.cz --encrypt --sign $STAGE4
sha256sum $STAGE4.gpg >> $STAGE4.gpg.sha256

