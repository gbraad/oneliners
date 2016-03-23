#!/bin/bash

ENVFILE=/etc/environment
LANGSTR="LANG=en_US.utf-8"
LCALLSTR="LC_ALL=en_US.utf-8"
REPORPM="https://www.rdoproject.org/repos/rdo-release.rpm"
PACKPKG="openstack-packstack"
PACKARG=--allinone

function add_string_to_file {
    grep -Fxq $1 $2
    if [ $? -eq 1 ]; then
        echo $1 >> $2
    fi
}

add_string_to_file $LANGSTR $ENVFILE
add_string_to_file $LCALLSTR $ENVFILE

yum install -y $REPORPM
yum update -y
yum install -y $PACKPKG
packstack $PACKARG
