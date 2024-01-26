#!/bin/bash

# bash host discovery scanner with % progress view 
# Insert your target network IP range eg. 192.168.1.0/24
# Feel free to use it in case you don't have access to nmap

LC_NUMERIC=C
echo "Enter network IP range for host discovery (e.g. 192.168.1.0/24):"
read ip_range

IFS='/' read -r base_ip cidr <<< "$ip_range"
IFS='.' read -r i1 i2 i3 i4 <<< "$base_ip"
prefix="$i1.$i2.$i3."

host_bits=$(( 32 - cidr ))
num_hosts=$(( 2 ** host_bits - 2 )) 

echo "Scanning for active hosts in the range $ip_range..."
current_host=0

for host in $(seq 1 $num_hosts); do
    current_ip="$prefix$host"
    current_host=$((current_host + 1))
    progress=$(echo "scale=2; $current_host/$num_hosts*100" | bc)
    printf "Scanning: %s - Progress: %5.2f%%\r" $current_ip $progress

    if ping -c 1 -W 1 $current_ip > /dev/null 2>&1; then
        echo -e "\nHost $current_ip is active"
    fi
done

echo -e "\nScan complete."
