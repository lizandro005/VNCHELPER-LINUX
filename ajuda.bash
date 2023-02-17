#!/bin/bash

# Start the program
nohup anydesk &

# Get the current date and time
current_date=$(date +"%m-%d-%Y %T")

# Get the percentage of disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')

# Get the uptime
uptime=$(uptime -p)

# Get the total RAM
total_ram=$(free -h | awk 'NR==2{printf "%s\t\t", $2}')

# Get the used RAM
used_ram=$(free -h | awk 'NR==2{printf "%s\t\t", $3}')

# Calculate the percentage of RAM usage
ram_usage=$(free | awk '/Mem/{printf("%.2f%%"), $3/$2*100}')

# Get the program that is using the most processes
top_process=$(ps aux --sort=-%cpu | awk 'NR<=3{print $11}')

# Write the information to a file in the documents folder
echo -e "Date and time: $current_date\nDisk usage: $disk_usage\nUptime: $uptime\nRAM usage: $ram_usage\nTop process: $top_process" > ~/Documents/anydeskhelp.txt

# Wait for the program to exit
wait $!

# Delete the file
rm ~/Documents/anydeskhelp.txt
