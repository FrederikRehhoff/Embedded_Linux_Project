#!/bin/bash


if [ "$1" == "0" ] && [ "$2" == "1" ] && [ "$3" -gt 30 ]; then
        ./LED_Control 1 0 0
else
        if [ "$1" != "0" ] && [ "$2" != "1" ]; then
                alarm=1
        else
                alarm=0
        fi
        if [ "$3" -gt 30 ]; then
                moisture=1
        else
                moisture=0
        fi
        ./LED_Control 0 "$alarm" "$moisture"
fi
