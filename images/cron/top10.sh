#!/bin/sh

if [ ! -f /var/log/nginx/top10IPs.log ]; then 
	touch /var/log/nginx/top10IPs.log 
fi

echo "Current date and time is " "$(date +%D-%H:%M:%S)" >> /var/log/nginx/top10IPs.log
awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | tail -n 10 >> /var/log/nginx/top10IPs.log