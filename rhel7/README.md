## Packer templates for Red Hat Enterprise 7 x86_64

## Overview

This directory contains templates for [RHEL7](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/index.html)
x86_64 that creates [Vagrant](http://vagrantup.com) boxes using [Packer](http://packer.io).

## Prerequisites

To build the boxes, you will need Packer and VirtualBox or VMware Fusion
depending the target. You will also need the RHEL7 64-bit ISO from Red Hat
and, if using VirtualBox, the guest additions ISO matching the version of
VirtualBox you are using (see [here](http://download.virtualbox.org/virtualbox)).
VMWare Fusion comes packaged with their tools.

Once you've obtained the ISOs, copy all of them into the same directory
(e.g. ~/rhel7/isos).

## Creating the boxes

* Export `ISO_URL` to the location of the installation ISO
* Run packer with the desired template
* Add the box to Vagrant
* Launch the box

### Example

```
$ export ISO_URL=file:///home/user/rhel7/isos/rhel-server-7.4-x86_64-dvd.iso
$ packer build rhel-7.4-vbox.json
$ vagrant box add rhel-7.4 ./rhel-7.4-vbox.box
$ vagrant init rhel-7.4 && vagrant up
```
