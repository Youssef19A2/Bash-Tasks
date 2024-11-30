#!/bin/bash
values=$(cat ".notes.txt")

# Prompt user to select a value using Rofi
selected=$(echo -e "$values" | rofi -dmenu -p "ADD/RM/SELECT: ")
case "$selected" in 
 ADD |add)
    added_value=$(rofi -dmenu -p "Please Enter Something")
    if [ -n "$added_value" ];then
    # Print the selected option (entered text) to the terminal
    echo "$added_value"
    echo "$added_value" >>".notes.txt"
    fi 
    ;;

 RM | rm)
    selected=$(echo -e "$values" | rofi -dmenu -p "ADD/RM/SELECT")
    sed -i "/$selected/d" .notes.txt
    ;;
*)
    if [ -n "$selected" ];then
    xdotool type --delay 10 "$selected"
    fi
    ;;
esac