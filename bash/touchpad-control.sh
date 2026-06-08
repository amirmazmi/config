#!/bin/bash

# script to enable disable touchpad


device=$(xinput | grep Touch[pP]ad | grep -Po "(?<=id=)[0-9]{2}")
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ "$state" -eq '1' ];then
  xinput --disable "$device"
  echo -e "\t Touchpad disabled"
else
  xinput --enable "$device"
  echo -e "\t Touchpad enabled"
fi
