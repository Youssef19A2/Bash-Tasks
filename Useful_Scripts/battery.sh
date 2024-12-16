#!/bin/bash
#battery percentage
battery_path="/sys/class/power_supply/BAT0/capacity"
Battery_value=$(cat $battery_path)

notify-send "The Battery Value is : $Battery_value"