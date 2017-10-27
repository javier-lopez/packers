#!/bin/sh
set -xe

if [ X"${INSTALL_ANSIBLE}" = X'true' ]; then
    . /root/.profile
    uname_r="$(uname -r)"

    if [   "${uname_r}" = 5.8 ]; then
        pkg_add python-2.7.10
    elif [ "${uname_r}" = 5.9 ]; then
        pkg_add python-2.7.11
    elif [ "${uname_r}" = 6.0 ]; then
        pkg_add python-2.7.12
    elif [ "${uname_r}" = 6.1 ]; then
        pkg_add python-2.7.13p0
    elif [ "${uname_r}" = 6.2 ]; then
        pkg_add python-2.7.14
    else
        echo "Not installing python2 as your version isn't defined as requiring it in ansible.sh"
        exit 1
    fi
else
    echo "Building box without Ansible/python2"
fi
