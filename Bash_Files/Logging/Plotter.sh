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
set title "Moisture Sensor Data"
set autoscale xy
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
set title "Ambient Light Sensor Data"
set autoscale xy
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
set title "Plant Water Alarm Status"
set autoscale xy
set datafile separator "|"
set output "Plots/Plant_Water_Alarm_Plot.png"
plot 'Plot_Plant_Water_Alarm_Data.dat' using 1:2 t "Status" w lines

set xdata time
set style data lines
set term png
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%m-%d\n%H:%M"
set xlabel "Time"
set ylabel "Pump Water Alarm Status"
set title "Pump Resevoir Alarm Status"
set autoscale xy
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
set title "Pump Activation Status"
set autoscale xy
set datafile separator "|"
set output "Plots/Pump_Active_Plot.png"
plot 'Plot_Pump_Active_Data.dat' using 1:2 t "Status" w lines
EOF

