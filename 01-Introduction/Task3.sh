#!/bin/bash
#1- write bash script to create project based on Makefile
# shellcheck disable=SC2188
<<Task3
4- write a wiki bash script to help you on development
- give you example about c++ hello world
- give you example about python hello world
- give you example about linux commands
- give you example about bash hello world
Task3

selected_language=$( echo -e "Cpp\nPython\nLinuxCommand\nBash" | rofi -dmenu -p "Please Select The language:" )
if [ "$selected_language" = "Cpp" ];then
    echo "Creating C++ File<------>"
    sleep 2 
    touch File1.cpp
    echo '#include <iostream>' > File1.cpp
    echo 'int main (){' >> File1.cpp
    echo 'std::cout << "Hello, World!" <<std::endl;' >> File1.cpp
    echo 'return 0;' >> File1.cpp
    echo '}' >>File1.cpp
    g++ File1.cpp && ./a.out
    rm File1.cpp
    rm a.out
    
elif [ "$selected_language" = "Python" ];then
    echo "Creating Python File<------>"
    sleep 2 
    touch File1.py
    echo 'print("Hello, World!")' >>File1.py
    python3 File1.py
    rm File1.py
elif [ "$selected_language" = "LinuxCommand" ];then
    echo "Creating LinuxCommand File<------>"
    sleep 2
    read -p "Enter the Command You want to do: " cmd 
    if [ "$cmd" = "ls" ];then
        ls
    elif [ "$cmd" = "ps" ];then
        ps
    elif [ "$cmd" = "top" ];then
        top
    else
        echo "Sorry!! ,This commands does not exist now ^-^"
    fi
elif [ "$selected_language" = "Bash" ];then
    echo "Creating Bash File<------>"
    sleep 2
    touch File1.sh
    echo 'echo "Hello, World!"' >>File1.sh
    chmod u+x File1.sh
    ./File1.sh
    rm File1.sh
else 
    echo " Failed!, Try again please <-> "
fi