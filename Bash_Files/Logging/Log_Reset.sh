#!/bin/bash

printf "Date|Time|Moisture Level|Ambient Light|Pump Active|Pump Water Alarm|Plant Water Alarm\n">Log.dat
>Plot_Moisture_Data.dat
>Plot_Ambient_Light_Data.dat
>Plot_Pump_Active_Data.dat
>Plot_Pump_Water_Alarm_Data.dat
>Plot_Plant_Water_Alarm_Data.dat
column Log.dat -t -s "|">Log.csv

rm Plots/*
rm Plots/Health_Logs/*

txt2html --make_table --infile "Log.csv" --outfile "Log.html"





