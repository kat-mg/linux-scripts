#!/usr/bin/env bash

while true; do
    batterylife=$(cat /sys/class/power_supply/BAT0/capacity)
    batterystatus=$(cat /sys/class/power_supply/BAT0/status)
    fullnotif=0

    if [ $batterylife -lt 25 ] && [ $batterystatus -eq "Discharging" ]; then 
	notify-send "MAG CHARGE KA NA $batterylife% NALANG NATITIRA" 
	fullnotif=0
    fi

    if [ $batterylife -eq 100 ] && [ $batterystatus -eq "Charging" ] && [ $fullnotif -eq 0 ]; then 
	notify-send "100% na yehey";
	fullnotif=1;
    fi

    sleep 30
done
