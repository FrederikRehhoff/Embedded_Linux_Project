#!/bin/bash

button=$(~/Embedded_Linux_Project/Bash_Files/Button_Reader.sh)
alarm1=0
alarm2=1

if [[ "$button" != "0" && "$alarm1" = "0" && "$alarm2" = "1" ]]; then
    ~/Embedded_Linux_Project/Bash_Files/Start_Pump.sh
else
    echo "$button"
    echo "$alarm1"
    echo "$alarm2"
fi
