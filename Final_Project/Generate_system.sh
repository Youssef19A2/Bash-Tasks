#!/bin/bash

#***********************************************************************************************************************
#***************************      File: Csystem-d-v.sh                                       ***************************
#***************************      breif: Project to generate init of systemD or systemV      ***************************
#***************************      author: Eng-Youssef Ahmed Bahansi                          ***************************
#***********************************************************************************************************************


# we used rofi to select betweensystemd and systemv
select_system=$( echo -e "systemD\nsystemV\n" | rofi -dmenu -p "PLease Choose System You Want To Generate: " )
if [ "$select_system" = "systemD" ];then
    echo "You choose systemD"m
elif [ "$select_system" = "systemV" ];then
    echo "You choose systemV"
else 
    rofi -e "Invalid choice. Please choose systemd or systemv."
    
fi 

#switch case if you select ant system
case $select_system in 
systemD | systemd) 
    read -p "Please Enter The Service Name: " Service_Name 
    if [ -z "$Service_Name" ]; then #check the service name is empty or not
        echo "Service name cannot be empty!"
        exit 1
    fi
    read -p "Please Enter The Description Name: " Description_Name
    read -p "Please Enter The Path: " Path_Dir 
    if [ -z "$Path_Dir" ]; then #check path is empty or not 
        echo "Path cannot be empty!"
        exit 1
    fi
    touch "$Service_Name".service #create service name 
    echo "[Unit]">"$Service_Name.service" #print [Unit] in file
    echo "Description=$Description_Name">>"$Service_Name".service #print Description
    echo "[Service]">>"$Service_Name.service" #print [Service] in file
    echo "ExecStart=$Path_Dir">>"$Service_Name".service #print_Path
    echo "[Install]">>"$Service_Name".service #print[Install] in file
    echo "WantedBy=multi-user.target">>"$Service_Name".service


    echo -e "\e[36m\e[4mSystemD service file created successfully at $Service_Name.service (^-^)\e[0m"
    echo -e "\e[36m\e[4mUse 'sudo cp $Service_Name.service /lib/systemd/system' to make a copy to lib/systemd/system\e[0m"
    echo -e "\e[36m\e[4mRun 'sudo systemctl daemon-reload'\e[0m"
    echo -e "\e[36m\e[4mUse 'sudo systemctl enable $Service_Name.service' to enable the service at startup.\e[0m" 
    echo -e "\e[36m\e[4mUse 'sudo systemctl status $Service_Name.service' to know the status of script before start\e[0m" 
    echo -e "\e[36m\e[4mUse 'sudo systemctl start $Service_Name.service' to start\e[0m"
    echo -e "\e[30m\e[4mUSe 'sudo systemctl status $Service_Name.service' to know the status of script after start\e[0m"  
    ;;
    
systemV | systemv)
    read -p "Please Enter The Service Name: " Service_Name2
    touch "${Service_Name2}".sh
    if [ -z "$Service_Name2" ]; then #check the service name is empty or not
        echo "Service name cannot be empty!"
        exit 1
    fi
    
    echo "#!/bin/bash" > "$Service_Name2".sh
    echo "### BEGIN INIT INFO" >> "$Service_Name2".sh
    echo "# Provides:          My Startup" >>"$Service_Name2".sh
    echo "# Required-Start:    \$remote_fs \$syslog" >>"$Service_Name2".sh
    echo "# Required-Stop:     \$remote_fs \$syslog" >>"$Service_Name2".sh
    echo "# Default-Start:     2 3 4 5" >>"$Service_Name2".sh
    echo "# Default-Stop:      0 1 6">>"$Service_Name2".sh
    echo "# Short-Description: My custom startup script">>"$Service_Name2".sh
    echo "### END INIT INFO">>"$Service_Name2".sh

    echo "case $1 in" >>"$Service_Name2".sh
    echo "start)" >>"$Service_Name2".sh
    echo        "echo "Hello, World script..."">>"$Service_Name2".sh
    echo  ";;">>"$Service_Name2".sh
    echo  "stop)">>"$Service_Name2".sh
    echo        "echo "Good, bye...." ">>"$Service_Name2".sh
    echo  ";;">>"$Service_Name2".sh
    echo  "restart)">>"$Service_Name2".sh
    echo           "s0 stop">>"$Service_Name2".sh
    echo           "s0 start">>"$Service_Name2".sh
    echo  ";;">>"$Service_Name2".sh
    echo  "*)">>"$Service_Name2".sh
    echo    " exit 1" >>"$Service_Name2".sh
    echo  ";;">>"$Service_Name2".sh
    echo  "esac">>"$Service_Name2".sh


    echo -e "\e[36m\e[4mYour systemV is successfully Created and save as ${Service_Name2}.sh\e[0m"
    echo -e "\e[36m\e[4mUse 'cp ${Service_Name2}.sh /etc/init.d/' to copy\e[0m"
    echo -e "\e[36m\e[4mUse 'chmod +x /etc/init.d/${Service_Name2}.sh' to change mod\e[0m"
    echo -e "\e[36m\e[4mUse 'sudo update-rc.d ${Service_Name2}.sh defaults' it will create symlink to rc3.d/\e[0m"

    ;;
*)
    echo "Try again!!!!!!!"
esac
