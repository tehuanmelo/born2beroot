#!/bin/bash


vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEMTOT=$(free -m | grep Mem | awk '{print $2}')
MEMUSD=$(free -m | grep Mem | awk '{print $3}')
MEMPERC=$(echo $MEMUSD $MEMTOT | awk '{printf"%.2f", $1 / $2 * 100}')
DISKUSD=$(df | awk '{SUM+=$3}END{print SUM / 1000000}' | awk '{printf"%.2f", $1}')
DISKFREE=$(df | awk '{SUM+=$4}END{print SUM / 1000000}' | awk '{printf"%.2f", $1}')
DISKTOT=$(echo $DISKUSD $DISKFREE | awk '{printf"%d", $1 + $2}')
CPULD=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
if cat /etc/fstab | grep /dev/mapper >/dev/null; then LVM=$(echo yes); fi
TCPCONNECTION=$(ss | grep 4242 | wc -l)

echo -e "\t#Architecture: "`uname -a`
echo -e "\t#CPU physical: "`nproc`
echo -e "\t#vCPU: ${vCPU}"
echo -e "\t#Mem usage: ${MEMUSD}/${MEMTOT}MB (${MEMPERC}%)"
echo -e "\t#Disk Usage: `echo $DISKUSD $DISKTOT | awk '{printf"%.2f/%dGB (%.2f%%)", $1, $2, ($1/$2)*100}'`"
echo -e "\t#CPU load: "`echo $CPULD | awk '{printf"%.2f%%", $1}'`
echo -e "\t#LAST boot: "`last reboot | head -1 | awk '{print $5,$6,$7,$8}'`
echo -e "\t#LVM use: ${LVM}"
echo -e "\t#Connections TCP: $TCPCONNECTION ESTABLISHED"
