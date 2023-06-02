#!/bin/bash

ESP_IP="10.42.0.222"
LED_ENDPOINT="/button/a/count"
curl -s http://$ESP_IP$LED_ENDPOINT
