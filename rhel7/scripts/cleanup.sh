#!/bin/sh
set -x

#remove traces of MAC address and UUID from network configuration
sed -E -i '/^(HWADDR|UUID)/d' /etc/sysconfig/network-scripts/ifcfg-e*

#add net.ifnames to /etc/default/grub and rebuild grub.cfg
sed -i -e '/GRUB_CMDLINE_LINUX/ s:"$: net.ifnames=0":' /etc/default/grub
/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg

#disable udev network rules
ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules

#lock root account
passwd -d root
passwd -l root

#clean up yum
rpm --rebuilddb
yum clean all

#remove ssh host keys
rm -rf /etc/ssh/ssh_host*_key*

#clean up /root
rm -f /root/anaconda-ks.cfg
rm -f /root/install.log
rm -f /root/install.log.syslog
rm -rf /root/.pki

#clean up /var/log
>/var/log/cron
>/var/log/dmesg
>/var/log/lastlog
>/var/log/maillog
>/var/log/messages
>/var/log/secure
>/var/log/wtmp
>/var/log/audit/audit.log
>/var/log/rhsm/rhsm.log
>/var/log/rhsm/rhsmcertd.log
rm -f /var/log/*.old
rm -f /var/log/*.log
rm -f /var/log/*.syslog

#clean /tmp
rm -rf /tmp/*
rm -rf /tmp/*.*

#zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

#clear history
history -c
