#!/bin/bash

Date=$(date '+%d/%m/%Y|%H:%M:%S')
Moisture_Level=$1
Ambient_Light=$2
Pump_Active=$3
Pump_Water_Alarm=$4
Plant_Water_Alarm=$5


printf "\n$Date|$Moisture_Level|$Ambient_Light|$Pump_Active|$Pump_Water_Alarm|$Plant_Water_Alarm\n">>Log.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Moisture_Level\n">>Moisture_Plot_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Ambient_Light\n">>Ambient_Light_Plot_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Pump_Active\n">>Pump_Active_Plot_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Pump_Water_Alarm\n">>Pump_Water_Alarm_Plot_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Plant_Water_Alarm\n">>Plant_Water_Alarm_Plot_Data.dat
column Log.dat -t -s "|">Log.csv

txt2html --make_table --infile "Log.csv" --outfile "index.html"
