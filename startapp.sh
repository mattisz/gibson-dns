#!/bin/sh
set -x
if [ ! -f "/config/wine/drive_c/Program Files (x86)/DNSBench/DNSBench.exe" ]
then
    mkdir -p "/config/wine/drive_c/Program Files (x86)/DNSBench"
    cd "/config/wine/drive_c/Program Files (x86)/DNSBench/"
    curl -L "https://www.grc.com/files/DNSBench.exe" --output "DNSBench.exe"
    ls -la
fi

wine "/config/wine/drive_c/Program Files (x86)/DNSBench/DNSBench.exe" &
sleep infinity
