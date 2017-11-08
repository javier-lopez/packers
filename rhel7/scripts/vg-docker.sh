#!/bin/sh
set -x

echo "Creating vg_docker volume group..."

pvcreate /dev/sdb /dev/sdc /dev/sdd
vgcreate vg_docker /dev/sdb /dev/sdc /dev/sdd
