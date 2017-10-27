#!/bin/sh
set -xe

if [ X"${INSTALL_CHEF}" = X'true' ]; then
    . /root/.profile
    uname_r="$(uname -r)"

    if [   "${uname_r}" = 5.8 ]; then
        pkg_add ruby-1.8.7.374p5
        version=18
    elif [ "${uname_r}" = 5.9 ]; then
        pkg_add ruby-1.8.7.374p5
        version=18
    elif [ "${uname_r}" = 6.0 ]; then
        pkg_add ruby-2.2.5p1
        version=22
    elif [ "${uname_r}" = 6.1 ]; then
        pkg_add ruby-2.4.1
        version=24
    elif [ "${uname_r}" = 6.2 ]; then
        pkg_add ruby-2.4.2
        version=24
    else
        echo "Not installing chef as your version isn't defined as requiring it in ansible.sh"
        exit 1
    fi

    for f in ruby erb irb rdoc ri rake gem testrb \
        chef-apply chef-client chef-shell chef-solo chef-zero \
        knife ohai shef; do
        ln -sf "${f}${version}" /usr/local/bin/"${f}"
    done
    ln -sf /usr/local/bin/testrb"${version}" /usr/local/bin/testrb

    gem install chef --no-ri --no-rdoc --version="${CHEF_VERSION}"
else
    echo "Building box without Chef"
fi
