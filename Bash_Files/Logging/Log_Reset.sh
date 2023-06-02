#!/bin/bash

printf "Date	Time	Moisture Level	Ambient Light	Pump Active	Pump Water Alarm	Plant Water Alarm">Log.dat

column -t -s' ' Log.dat

txt2html --make_table --infile "Log.dat" --outfile "index.html"





