#!/bin/bash

# script to execute lubuntu setup
#   1. append alias to bashrc - backup previous file
#   2. edit lxterminal.conf - backup previous file
#   3. install linux packages
#   4. edit grub file for fn key

# get user inputs 
read -p "	Append update alias to bashrc? (y/n)  " append
if [ "$append" != "y" ] && [ "$append" != "n" ]
then 
	echo "Thats not an option!!!"
	exit 1
fi

read -p "	Change lxterminal config? (y/n)  " lxterm
if [ "$lxterm" != "y" ] && [ "$lxterm" != "n" ]
then 
	echo "Thats not an option!!!"
	exit 1
fi
read -p "	Install packages? (y/n)  " instpack
if [ "$instpack" != "y" ] && [ "$instpack" != "n" ]
then 
	echo "Thats not an option!!!"
	exit 1
fi

# ----------------------------------------------------------------
# Execute necessary commands

# 1. append alias to bashrc - backup previous file
if [[ $append = "y" ]]
then
	lxterminal -e 'bash -c "python3 bashrc-update.py; sleep 10"'
fi 

# 2. edit lxterminal.conf - backup previous file
if [[ $lxterm = "y" ]]
then
	echo
	# back up file
	sudo mv -vvv ~/.config/lxterminal/lxterminal.conf ~/.config/lxterminal/lxterminal.conf-backup
	# copy file in
	sudo mv -vvvv lxterminal.conf ~/.config/lxterminal/lxterminal.conf
	echo
fi

if [[ $instpack = "y" ]] 
then
	# 3. install linux packages
	lxterminal -e 'bash -c "xargs -a linux-packages sudo apt install; sleep 10"'
fi

#   4. edit grub file for fn key

echo
echo
sleep 5
echo
echo	### DONE! ###
echo
echo

exit

