#!/bin/bash

#Define the output file for the report 
Output_file="system_report.txt"

#Create or overwite the output file 
>>"$Output_file"

#Function To Add A Section Header To The Report 
add_section() {
    echo "-------------------------------------------------------">>"$Output_file"
    echo "$1" >>"$Output_file"
    echo "-------------------------------------------------------">>"$Output_file"

}
#Add Header To The Report 
add_section "system Report - $(date)"

#Hostname and User Information
hostname >>"$Output_file"
whoami >>"$Output_file"
echo -e "\n" >>"$Output_file"

#System Information
add_section "System Information"
uname -a >>"$Output_file"
echo -e "\n">>"$Output_file"

#CPU Information
add_section "CPU Information"
lscpu >>"$Output_file"
echo -e "\n" >>"$Output_file"

#Memory Information
add_section "Memory Information"
free -h >> "$Output_file"
echo -e "\n" >> "$Output_file"

#Disk Usage 
add_section "Disk Usage"
df -h >>"$Output_file"
echo -e "\n" >> "$Output_file"

#Network Information
add_section "Network Information"
ifconfig  >> "$Output_file"
echo -e "\n" >>"$Output_file"

#Print a message indicating where the report is saved 
echo "System report saved to $Output_file"