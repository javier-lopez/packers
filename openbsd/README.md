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

* Run packer with the desired template
* Add the box to Vagrant
* Launch the box

### Example

```
$ packer build openbsd-6.2-amd64-vbox.json
$ vagrant box add openbsd-6.2-amd64 ./openbsd-6.2-amd64-vbox.box
$ vagrant init openbsd-6.2-amd64 && vagrant up
```
