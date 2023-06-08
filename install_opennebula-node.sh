#!/bin/bash

### Start from root user

apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon
echo "deb https://downloads.opennebula.io/repo/6.6/Debian/11 stable opennebula" | sudo tee /etc/apt/sources.list.d/opennebula.list
wget -q -O- https://downloads.opennebula.io/repo/repo2.key | sudo apt-key add -
apt update
apt install opennebula-node
systemctl restart libvirtd
systemctl enable libvirtd
systemctl status libvirtd
