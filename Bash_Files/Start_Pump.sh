#!/bin/bash

serial_port="/dev/ttyACM0"  # Update with the correct serial port of the Pico
baud_rate=115200  # Update with the correct baud rate

stty -F $serial_port $baud_rate

#read -p "Enter a message to start the pump: " message
message="p"
echo "$message" > $serial_port
