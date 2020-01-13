#!/bin/bash

#--------------------------------------------------
#
#       Script to set up UFW firewall rules
#
#       Written by Amir
#       Updated by Amir on 2019-09-20
#
#--------------------------------------------------

#echo -e "\n\t##### Enable UFW and set up rules #####\n"

echo -e "\n\t UFW: Enabling UFW\n"
sudo ufw enable

echo -e "\n\t UFW: Apply default rule deny incoming\n"
sudo ufw default deny incoming

echo -e "\n\t UFW: Applying rule - SSH\n"
sudo ufw limit in from 192.168.1.0/24 to any port 22222 proto tcp

echo -e "\n\t UFW: Applying rule - BACnet\n"
sudo ufw allow in from any to any port 47808 proto udp

echo -e "\n\t UFW: Applying rule - VNC\n"
sudo ufw limit in from 192.168.1.0/24 to any port 5901
sudo ufw limit in from 192.168.1.0/24 to any port 5902

echo -e "\n\t UFW: Displaying rules\n"
sudo ufw status verbose


echo -e "\n\t===== UFW set up complete ======\n"

#read -p ' Press any key to continue...'






