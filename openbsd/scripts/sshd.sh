#!/bin/sh
set -xe

echo "Modifying /etc/ssh/sshd_config..."
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
