#!/bin/bash

# Simple bash port scanner with % progress view
# First insert your target IP
# Then choose TCP or UDP scan type you want perform
# Script scans all 65535 ports
# Feel free to use it in case you don't have access to nmap


echo "Enter target IP address:"
read target

echo "Choose scan type (TCP/UDP):"
read scantype

echo "Scanning $target for $scantype ports..."

total_ports=65535
current_port=1
LC_NUMERIC=C

if [ "$scantype" = "TCP" ] || [ "$scantype" = "tcp" ]; then
    for port in $(seq 1 $total_ports); do
        progress=$(echo "scale=2; $current_port/$total_ports*100" | bc)
        printf "Scanning Port: %5d - Progress: %6.2f%%\r" $port $progress
        timeout 1 bash -c "echo >/dev/tcp/$target/$port" 2>/dev/null && echo -e "\nPort $port is open"
        ((current_port++))
    done
elif [ "$scantype" = "UDP" ] || [ "$scantype" = "udp" ]; then
    for port in $(seq 1 $total_ports); do
        progress=$(echo "scale=2; $current_port/$total_ports*100" | bc)
        printf "Scanning Port: %5d - Progress: %6.2f%%\r" $port $progress
        timeout 1 bash -c "echo >/dev/udp/$target/$port" 2>/dev/null && echo -e "\nPort $port is open"
        ((current_port++))
    done
else
    echo "Invalid scan type selected. Please choose TCP or UDP."
fi

echo -e "\nScan complete."
