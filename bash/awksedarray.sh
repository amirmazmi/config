#! /bin/bash

ARAY=$( ps | grep ssh | awk '{print $1}' | sed 'N;N;s/\n/ /g')

echo -e "List of PIDs - " $ARAY

for PID in $RAY
do
	echo $PID
	kill $PID
	sleep 0.5
done