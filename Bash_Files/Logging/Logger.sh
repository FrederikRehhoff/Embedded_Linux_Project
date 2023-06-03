#!/bin/bash

Date=$(date '+%d/%m/%Y|%H:%M:%S')
Moisture_Level=$1
Ambient_Light=$2
Pump_Active=$3
Pump_Water_Alarm=$4
Plant_Water_Alarm=$5


printf "$(date '+%d/%m/%Y %H:%M:%S')|$Moisture_Level\n">>Plot_Moisture_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Ambient_Light\n">>Plot_Ambient_Light_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Pump_Water_Alarm\n">>Plot_Pump_Water_Alarm_Data.dat
printf "$(date '+%d/%m/%Y %H:%M:%S')|$Plant_Water_Alarm\n">>Plot_Plant_Water_Alarm_Data.dat
if [ $4 = ½ ] && [ $5 = 0 ]
	then
	printf "\n$Date|$Moisture_Level|$Ambient_Light|$Pump_Active|$Pump_Water_Alarm|$Plant_Water_Alarm\n">>Log.dat
	printf "$(date '+%d/%m/%Y %H:%M:%S')|$Pump_Active\n">>Plot_Pump_Active_Data.dat
else
	printf "\n$Date|$Moisture_Level|$Ambient_Light|0|$Pump_Water_Alarm|$Plant_Water_Alarm\n">>Log.dat
	printf "$(date '+%d/%m/%Y %H:%M:%S')|0\n">>Plot_Pump_Active_Data.dat
fi

column Log.dat -t -s "|">Log.csv

txt2html --make_table --infile "Log.csv" --outfile "Plots/Log.html"
./Plotter.sh
