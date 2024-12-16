#!/bin/bash
#change mode
choice=$(echo -e "Reboot\npoweroff\nlogout" | rofi -dmenu -p "Select Your choice:")

if [ "$choice" = "logout" ];then
    # echo "Logout"
    sudo Logout
elif [ "$choice" = "Reboot" ];then        
    # echo "Reboot"
    sudo reboot
elif [ "$choice" = "poweroff" ];then
    #echo "Shutdowm"
    sudo shutdown -h now 
else 
    echo "invalid mode"
fi

