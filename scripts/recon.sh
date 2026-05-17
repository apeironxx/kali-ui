#!/bin/bash

mkdir -p reports

RAW="reports/recon_raw.txt"
SAFE="reports/recon_report.txt"

echo "Generating recon reports..."

# -------- RAW REPORT (full data) --------
echo "RECON RAW REPORT" > $RAW
echo "User: $(whoami)" >> $RAW
echo "Host: $(hostname)" >> $RAW
echo "Kernel: $(uname -r)" >> $RAW
echo "" >> $RAW
echo "[NETWORK FULL]" >> $RAW
ip a >> $RAW
echo "" >> $RAW
echo "[PROCESSES]" >> $RAW
ss -tulnp >> $RAW

# -------- SAFE REPORT (sanitized) --------
echo "RECON SAFE REPORT" > $SAFE
echo "User: USER" >> $SAFE
echo "Host: ENVIRONMENT" >> $SAFE
echo "Kernel: $(uname -r | cut -d'-' -f1)" >> $SAFE
echo "" >> $SAFE
echo "[NETWORK SUMMARY]" >> $SAFE
echo "Interfaces: $(ip -o link show | wc -l) detected" >> $SAFE
echo "Actvie network interfaces hidden for safety" >> $SAFE
echo "" >> $SAFE

echo "[PORT SUMMARY]" >> $SAFE
echo "Listening services: $(ss -tuln | grep LISTEN | wc -l)" >> $SAFE
echo "Raw port data hidden (sanitized view only)" >> $SAFE
echo "" >> $SAFE

echo "[STATUS]" >> $SAFE
echo "System scan completed successfully" >> $SAFE

echo "SAFE: reports/recon_report.txt"
echo "RAW: reports/recon_raw.txt"
