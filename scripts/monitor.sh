#!/bin/bash
#Проверяем диск, если память забита на 80+ процентов, то пишем это в лог
df -h / | awk 'NR==2 {print $5}' | sed 's/%//' | while read usage; do
    if [ "$usage" -gt 80 ]; then
        echo "WARNING: Disk usage is ${usage}%" >> /var/log/monitor.log
    fi
done
