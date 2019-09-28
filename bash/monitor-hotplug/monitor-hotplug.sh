#!/bin/bash

#Adapt this script to your needs.

DEVICES=$(find /sys/class/drm/*/status)

#inspired by /etc/acpd/lid.sh and the function it sources

displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
display=":$displaynum"
export DISPLAY=":$displaynum"

# from https://wiki.archlinux.org/index.php/Acpid#Laptop_Monitor_Power_Off
#export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')


scriptmain(){
	### read the $DEVICES variable
	### this while loop declare the $HDMI1 $VGA-1 $LVDS-1 and others if they are plugged in

	while read l
	do
	  dir=$(dirname $l);
	  status=$(cat $l);
	  dev=$(echo $dir | cut -d\- -f 2-);
	  echo $l

	  if [ $(expr match  $dev "HDMI") != "0" ]
	  then
	  #REMOVE THE -X- part from HDMI-X-n
	    dev=HDMI${dev#HDMI-?-}
	  else
	    dev=$(echo $dev | tr -d '-')
	  fi

	  if [ "connected" == "$status" ]
	  then
	    echo $dev "connected"
	    declare $dev="yes";

	  fi
	done <<< "$DEVICES"

echo
echo $dev
echo
	
	# these should really check xrandr outputs first
	# xrandr -d :0

	if [ ! -z "$HDMI1" -a ! -z "$VGA1" ]; then
	  echo "HDMI1 and VGA-1 are plugged in"
	  xrandr --output LVDS-1 --off
	  xrandr --output VGA-1 --mode 1360x768 --noprimary
	  xrandr --output HDMI-1 --mode 1920x1080 --right-of VGA-1 --primary

	elif [ ! -z "$HDMI1" -a -z "$VGA1" ]; then
	  echo "HDMI1 is plugged in, but not VGA-1"
	  xrandr --output LVDS-1 --off
	  xrandr --output VGA-1 --off
	  xrandr --output HDMI-1 --mode 1920x1080 --primary

	elif [ -z "$HDMI1" -a ! -z "$VGA1" ]; then
	  xrandr --output VGA-1 --primary --mode 1360x768 --rate 60.02
	  xrandr --output LVDS-1 --primary 
	  xrandr --output HDMI-1 --off
	  echo "VGA-1 is plugged in, but not HDMI1"

	else
	  echo "No external monitors are plugged in"
	  xrandr --output LVDS-1 --primary --mode 1366x768 
	  xrandr --output VGA-1 --off
	  xrandr --output HDMI-1 --off
	fi
}

scriptmain >> /home/<username>/Desktop/testdisplay.log
lxpanelctl restart		# fix some residuals

