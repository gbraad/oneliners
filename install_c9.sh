#!/bin/bash

yum install -y git
yum groupinstall -y "Development Tools"
yum install -y glibc-static
yum install -y tmux

git clone https://github.com/c9/core.git /opt/c9sdk
cd /opt/c9sdk/scripts
./install-sdk.sh
