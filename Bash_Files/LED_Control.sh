#!/bin/bash

if [ $1 = "red" ]
    then
    if [ $2 = "off" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Red LED turned off"
        curl -s "http://10.42.0.222/led/red/off" >/dev/null
        exit 0
    fi
    if [ $2 = "on" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Red LED turned on"
        curl -s "http://10.42.0.222/led/red/on" >/dev/null
        exit 0
    fi
fi
if [ $1 = "yellow" ]
    then
    if [ $2 = "off" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Yellow LED turned off"
        curl -s "http://10.42.0.222/led/yellow/off" >/dev/null
        exit 0
    fi
    if [ $2 = "on" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Yellow LED turned on"
        curl -s "http://10.42.0.222/led/yellow/on" >/dev/null
        exit 0
    fi
fi
if [ $1 = "green" ]
    then
    if [ $2 = "off" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Green LED turned off"
        curl -s "http://10.42.0.222/led/green/off" >/dev/null
        exit 0
    fi
    if [ $2 = "on" ]
        then
        # Send HTTP GET request to turn on the LED
        #echo "Green LED turned on"
        curl -s "http://10.42.0.222/led/green/on" >/dev/null
        exit 0
    fi
fi
