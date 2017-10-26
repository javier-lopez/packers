#!/bin/sh
set -x

VBOX_ISO="/home/vagrant/VBoxGuestAdditions.iso"
VBOX_MNTDIR="$(mktemp --tmpdir=/tmp -q -d -t vbox_mnt_XXXXXX)"

#install tools
mount -o loop "${VBOX_ISO}" "${VBOX_MNTDIR}"
yes|sh "${VBOX_MNTDIR}"/VBoxLinuxAdditions.run

#clean up
umount "${VBOX_MNTDIR}"
rm -rf "${VBOX_MNTDIR}"
rm -f  "${VBOX_ISO}"
