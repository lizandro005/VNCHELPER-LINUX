#!/bin/bash

nohup anydesk &

current_date=$(date +"%m-%d-%Y %T")

disk_usage=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')

uptime=$(uptime -p)

total_ram=$(free -h | awk 'NR==2{printf "%s\t\t", $2}')

used_ram=$(free -h | awk 'NR==2{printf "%s\t\t", $3}')

ram_usage=$(free | awk '/Mem/{printf("%.2f%%"), $3/$2*100}')

top_process=$(ps aux --sort=-%cpu | awk 'NR<=3{print $11}')

echo -e "Date and time: $current_date\nDisk usage: $disk_usage\nUptime: $uptime\nRAM usage: $ram_usage\nTop process: $top_process" > ~/Documents/anydeskhelp.txt

wait $!

rm ~/Documents/anydeskhelp.txt
