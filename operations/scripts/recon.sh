#!/bin/bash

echo "=== RECON ENGINE v1 ===" 
echo "Generating local system profile..."
echo

echo
echo "[+] USER:"
whoami

echo "[+] HOSTNAME:"
hostname

echo "[+] KERNEL:"
uname -r

echo "[+] NETWORK INTERFACES:"
ip a | grep inet

echo "[+] OPEN PORTS (LOCAL ONLY):"
ss -tuln

echo
echo "=== END REPORT ==="
