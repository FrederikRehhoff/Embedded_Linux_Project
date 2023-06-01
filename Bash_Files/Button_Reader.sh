#!/bin/bash

var = curl -s "http://10.42.0.222/button/a/count" >/dev/null > 0

if [$var > 0]
then
	echo "Button Presses" var
	return 1
else
	return 0
fi
