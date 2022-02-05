#!/bin/bash
#
#  Startup script to check for connected displays and change if:
# 	2 monitors connected
#
#----------------------------------------------------------------
# add the following line to /.profile (will run on login)
# bash <location of file>
#


sleep 2

moncount=$(xrandr | grep ' connected' | grep -o '^[A-Z]*-[0-9]*\w' | wc -l )

if [ $moncount -eq 2 ]
then
    xrandr --output HDMI-1 --mode 2560x1080 --pos 0x320 --rotate normal --output DP-1 --mode 1920x1080 --pos 2560x0 --rotate left --output eDP-1 --off --output DP-2 --off
    lxpanelctl restart

fi
