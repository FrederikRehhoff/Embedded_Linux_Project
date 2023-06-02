#!/bin/bash
gnuplot << EOF
set term pngcairo
set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Moisture Level"
set yrange [0:5]
set xrange ['02/06/2023 15:45:18':'02/06/2023 15:45:19']
set datafile separator "|"
set output "Plots/Moisture_Plot.png"
plot 'Plot_Moisture_Data.dat' using 1:2 t "Moisture" w lines

set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Ambient Light"
set yrange [0:5]
set xrange ['02/06/2023 15:45:18':'02/06/2023 15:45:19']
set datafile separator "|"
set output "Plots/Ambient_Light_Plot.png"
plot 'Plot_Ambient_Light_Data.dat' using 1:2 t "Light" w lines

set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Plant Water Alarm Status"
set yrange [0:5]
set xrange ['02/06/2023 15:45:18':'02/06/2023 15:45:19']
set datafile separator "|"
set output "Plots/Plant_Water_Alarm_Plot.png"
plot 'Plot_Plant_Water_Alarm.dat' using 1:2 t "Status" w lines

set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Pump Water Alarm Status"
set yrange [0:5]
set xrange ['02/06/2023 15:45:18':'02/06/2023 15:45:19']
set datafile separator "|"
set output "Plots/Pump_Water_Alarm_Plot.png"
plot 'Plot_Pump_Water_Alarm_Data.dat' using 1:2 t "Status" w lines

set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Pump Activation Status"
set yrange [0:5]
set xrange ['02/06/2023 15:45:18':'02/06/2023 15:45:19']
set datafile separator "|"
set output "Plots/Pump_Active_Plot.png"
plot 'Plot_Pump_Active_Data.dat' using 1:2 t "Status" w lines
EOF

