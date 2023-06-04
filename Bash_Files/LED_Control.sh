#!/bin/bash


# 1 is green, 2 is yellow, 3 is red.
echo "$1" "$2" "$3"

if [ "$1" = "1" ]; then
    curl -s "http://10.42.0.222/led/green/on" >/dev/null
else
    curl -s "http://10.42.0.222/led/green/off" >/dev/null
fi

if [ "$2" = "1" ]; then
    curl -s "http://10.42.0.222/led/yellow/on" >/dev/null
else
    curl -s "http://10.42.0.222/led/yellow/off" >/dev/null
fi

if [ "$3" = "1" ]; then
    curl -s "http://10.42.0.222/led/red/on" >/dev/null
else
    curl -s "http://10.42.0.222/led/red/off" >/dev/null
fi
