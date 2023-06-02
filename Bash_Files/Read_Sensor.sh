#!/bin/bash

serial_port="/dev/ttyACM0"  # Update with the correct serial port of the Pico
baud_rate=115200  # Update with the correct baud rate

#screen -L $serial_port $baud_rate
stty -F $serial_port $baud_rate
#cat $serial_port
echo "Started porgram"
data=""
while [ -z "$data" ]; do
	echo "Ran the while loop"  
	data=$(timeout 5 cat $serial_port)
done
echo "Stoped the while loop"


#data=$(timeout 1 cat $serial_port)
#if [ -n "$data" ]; then
#  echo "$data"
#fi
