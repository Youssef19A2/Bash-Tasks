#!/bin/bash
#dmenu
Selected_color=$(echo -e "red\ngreen\nyellow" | dmenu)
if [ "$Selected_color" = "red" ];then
    echo  -e "\e[31mred\e[0m]]"
elif [ "$Selected_color" = "green" ];then
    echo  -e "\e[32mgreen\e[0m]]"
elif [ "$Selected_color" = "yellow" ];then
    echo  -e "\e[33myellow\e[0m]]"
else
    echo "No color selected"
fi