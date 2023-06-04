#!/bin/bash


if [ "$1" == "0" ] && [ "$2" == "1" ] && [ "$3" -gt 30 ]; then
        /home/pi/Embedded_Linux_Project/Bash_Files/LED_Control.sh 1 0 0
else
        if [ "$1" != "0" ] || [ "$2" != "1" ]; then
                alarm=1
        else
                alarm=0
        fi
        if [ "$3" -lt 31 ]; then
                moisture=1
        else
                moisture=0
        fi
        /home/pi/Embedded_Linux_Project/Bash_Files/LED_Control.sh 0 "$moisture" "$alarm"
fi
