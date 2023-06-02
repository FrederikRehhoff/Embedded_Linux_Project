#!/bin/bash



start=$1
block1=$2
block2=$3

if [[ "block1" = 0 && "block2" = 1 && "start" = 1]]; then
	./Start_Pump.sh
	echo "1"
else
	echo "0"
fi
