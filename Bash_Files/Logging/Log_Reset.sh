#!/bin/bash

printf "Date|Time|Moisture Level|Ambient Light|Pump Active|Pump Water Alarm|Plant Water Alarm\n">Log.dat
>/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plot_Moisture_Data.dat
>/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plot_Ambient_Light_Data.dat
>/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plot_Pump_Active_Data.dat
>/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plot_Pump_Water_Alarm_Data.dat
>/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plot_Plant_Water_Alarm_Data.dat
column /home/pi/Embedded_Linux_Project/Bash_Files/Logging/Log.dat -t -s "|">/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Log.csv

rm /home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plots/*
rm /home/pi/Embedded_Linux_Project/Bash_Files/Logging/Plots/Health_Logs/*

txt2html --make_table --infile "/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Log.csv" --outfile "/home/pi/Embedded_Linux_Project/Bash_Files/Logging/Log.html"
