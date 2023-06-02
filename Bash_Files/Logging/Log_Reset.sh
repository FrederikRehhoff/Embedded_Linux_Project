#!/bin/bash

printf "Date|Time|Moisture Level|Ambient Light|Pump Active|Pump Water Alarm|Plant Water Alarm\n">Log.dat
>Moisture_Plot_Data.dat
>Ambient_Light_Plot_Data.dat
>Pump_Active_Plot_Data.dat
>Pump_Water_Alarm_Plot_Data.dat
>Plant_Water_Alarm_Plot_Data.dat
column Log.dat -t -s "|">Log.csv

txt2html --make_table --infile "Log.csv" --outfile "Log.html"





