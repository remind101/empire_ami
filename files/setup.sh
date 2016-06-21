#!/bin/sh
# Initial setup script

echo "deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list.d/trusty-backports.list

cat >>/etc/apt/preferences.d/trusty-backports<<EOF
Package: *
Pin: release a=trusty-backports
Pin-Priority: 100

Package: ansible
Pin: release a=trusty-backports
Pin-Priority: 750
EOF

# Install ansible 2.1
apt-get update
apt-get install -y software-properties-common python-setuptools
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible

easy_install -U pip

pip install boto
pip install requests

mv /tmp/packer_files/hosts /etc/ansible/hosts
chmod +x /etc/ansible/hosts

mv /tmp/packer_files/ansible.conf /etc/init/ansible.conf

mv /tmp/packer_files/make_dockercfg /usr/sbin/make_dockercfg
chmod +x /usr/sbin/make_dockercfg

mkdir -p /etc/empire
mv /tmp/ansible /etc/empire/ansible
