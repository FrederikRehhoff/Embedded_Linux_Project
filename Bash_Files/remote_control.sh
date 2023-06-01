#!/bin/bash

if $0 = 1
then
	red = on
else
	red = off
fi

if $1 = 1
then
        yellow = on
else
        yellow = off
fi

if $2 = 1
then
        green = on
else
        green = off
fi

./LED_Control.sh red $red
./LED_Control.sh yellow $yellow
./LED_Control.sh green  $green
./Button_Reader.sh
