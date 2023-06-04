#!/bin/bash

#IFS=',' read -ra numbers <<< "$(~/Embedded_Linux_Project/Bash_Files/Read_Sensor.sh)"
#threshold=30
#alarm1=${numbers[0]}
#alarm2=${numbers[1]}
#moisture=${numbers[2]}
#light=${numbers[3]}
source /home/pi/Embedded_Linux_Project/ros2_ws/install/setup.bash

ros2 topic pub -1 /run_pump std_msgs/msg/String "data: 'True'"

#if [[ "$alarm1" = "0" && "$alarm2" = "1" ]]; then
#    ~/Embedded_Linux_Project/Bash_Files/Start_Pump.sh
#fi
