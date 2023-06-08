#!/bin/bash


sudo apt update
sudo apt install vim opennebula opennebula-sunstone opennebula-gate opennebula-flow opennebula-provision opennebula-fireedge -y

sudo apt update
sudo apt -y install mariadb-server

sudo systemctl restart opennebula
sudo systemctl restart opennebula-sunstone

sudo systemctl enable opennebula
sudo systemctl enable opennebula-sunstone opennebula-fireedge.service


## Check that the commands can connect to the OpenNebula daemon:
oneuser show
