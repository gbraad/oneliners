#!/bin/bash

yum -y install git epel-release python-devel "@Development Tools"
yum -y install python-pip
pip install tox

git clone https://github.com/redhat-openstack/weirdo.git

cd weirdo
cat <<EOF >target
localhost ansible_connection=local
[openstack_nodes]
localhost log_destination=/var/log/weirdo
EOF

tox -e ansible-playbook -- -vv -i target playbooks/packstack-scenario001.yml --extra-vars openstack_release=mitaka
