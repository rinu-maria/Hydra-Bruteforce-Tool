# Hydra Brute Force Tool (Lab Project)

This project demonstrates how to perform a brute force attack using Hydra and the rockyou password wordlist in a controlled lab environment.

## Lab Setup

Attacker Machine: Kali Linux  
Target Machine: Metasploitable 2  

## Tools Used

- Hydra
- Nmap
- Rockyou wordlist
- Kali Linux

## Process Overview

1. Extract rockyou.txt wordlist
2. Enumerate usernames using Nmap
3. Perform brute force attack using Hydra
4. Save and analyze results

## Usage

Make the script executable:

chmod +x bruteforce.sh

Run the script with target IP and service name:

./bruteforce.sh <target-ip> <service>

Parameters:

- <target-ip> : IP address of the target system
- <service>   : Service to attack (ftp, ssh, smb, http, etc.)

Example:

./bruteforce.sh 10.0.2.9 ftp

This will perform a brute force attack on the FTP service and save results in results.txt.

## Documentation

See detailed guide here:

hydra-attack-guide.md

## Disclaimer

This project is for educational purposes and authorized lab testing only.
