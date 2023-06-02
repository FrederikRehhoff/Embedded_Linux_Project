#!/bin/bash

Date=$(date '+%d/%m/%Y %H:%M:%S')
Moisture_Level=$1
Ambient_Light=$2
Pump_Active=$3
Pump_Water_Alarm=$4
Plant_Water_Alarm=$5


printf "\n$Date	$Moisture_Level	$Ambient_Light	$Pump_Active	$Pump_Water_Alarm	$Plant_Water_Alarm">>Log.dat

column -t -s' ' Log.dat

txt2html --make_table --infile "Log.dat" --outfile "index.html"
