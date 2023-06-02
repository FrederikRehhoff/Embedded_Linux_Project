#!/bin/bash

printf "Date|Time|Moisture Level|Ambient Light|Pump Active|Pump Water Alarm|Plant Water Alarm\n">Log.dat

column Log.dat -t -s "|">Log.csv

txt2html --make_table --infile "Log.csv" --outfile "index.html"





