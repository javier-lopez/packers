#!/bin/sh
set -x

VMWARE_ISO="/tmp/vmware_tools_linux.iso"
VMWARE_MNTDIR="$(mktemp --tmpdir=/tmp -q -d -t vmware_mnt_XXXXXX)"
VMWARE_TMPDIR="$(mktemp --tmpdir=/tmp -q -d -t vmware_XXXXXX)"

#extract tools
mount -o loop "${VMWARE_ISO}" "${VMWARE_MNTDIR}"
tar zxf "${VMWARE_MNTDIR}"/VMwareTools*.tar.gz -C "${VMWARE_TMPDIR}"
umount  "${VMWARE_MNTDIR}"

#install tools
"${VMWARE_TMPDIR}"/vmware-tools-distrib/vmware-install.pl -f -d

#clean up
rm -rf "${VMWARE_ISO}"
rm -rf "${VMWARE_MNTDIR}"
rm -rf "${VMWARE_TMPDIR}"
