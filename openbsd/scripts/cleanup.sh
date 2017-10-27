#!/bin/sh
set -xe

#zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY

#block until the empty file has been removed, otherwise, Packer
#will try to kill the box while the disk is still full and that's bad
sync
