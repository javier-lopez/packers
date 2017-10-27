## Packer templates for OpenBSD

## Overview

This directory contains templates for [OpenBSD](https://www.openbsd.org/)
x86_64 that creates [Vagrant](http://vagrantup.com) boxes using
[Packer](http://packer.io).

## Prerequisites

To build the boxes, you will need Packer and VirtualBox or VMware Fusion
depending the target. The boxes won't include VirtualBox Guest Additions nor
VMware Tool (as they are not available for the OS). So for synced folders you
need to use e.g. NFS or rsync.

## Creating the boxes

* Run packer with either the `openbsd-$version-$arch-vbox.json` or `openbsd-$version-$arch-vmware.json` template
* Add the local box to vagrant

### Example

```
$ packer build openbsd-6.2-amd64-vbox.json
$ packer build openbsd-6.2-amd64-vmware.json
$ vagrant box add openbsd-6.2-amd64 ./openbsd-6.2-amd64-vbox.box
$ vagrant box add openbsd-6.2-amd64 ./openbsd-6.2-amd64-vmware.box
$ cd .. && $EDITOR VagrantFile
$ vagrant up
```
