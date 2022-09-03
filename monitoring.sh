#!/bin/bash

ARCH=$(uname -a)
PHYSICAL_CPU=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
VIRTUAL_CPU=$(grep 'processor' /proc/cpuinfo | uniq | wc -l)
FULL_RAM=$(free -m | grep 'Mem.:' | awk '{print $2}')
USED_RAM=$(free -m | grep 'Mem.:' | awk '{print $3}')
PERCENT_RAM=$(free -m | grep 'Mem.:' | awk '{printf ("%.2f"), $3/$2*100}')
FULL_DISK=$(df -H --total | tail -1 | awk -F" " '{print$2}')
USED_DISK=$(df -H --total | tail -1| awk -F" " '{print $3}')
PERCENT_DISK=$(df -H --total | tail -1| awk -F" " '{print$5}')
CPU=$(top -bn1 | grep '^Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
LAST_BOOT=$(who -b | awk '{print $4 " " $5}')
LVM=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
TCP=$(cat /proc/net/sockstat | awk '$1 == "TCP:" {print $3}')
TCPMSSG=$(if [ ${TCP} -eq 0 ]; then echo NOT ESTABLISHED; else echo ESTABLISHED; fi)
USERLOG=$(users | wc -l)
IP=$(hostname -I | awk '{print $1'})
MAC=$(ip link show | awk '$1 == "link/ether" {print $2}')
SUDO=$(grep -c 'COMMAND' /var/log/sudo/sudo.log)


wall "
	#Architecture: ${ARCH}
	#CPU physical: ${PHYSICAL_CPU}
	#vCPU: ${VIRTUAL_CPU}
	#Memory Usage: ${USED_RAM}/${FULL_RAM}MB (${PERCENT_RAM}%)
	#Disk Usage: ${USED_DISK}/${FULL_DISK} (${PERCENT_DISK})
	#CPU load: ${CPU}
	#Last boot: ${LAST_BOOT}
	#LVM use: ${LVM}
	#Connection TCP: ${TCP} ${TCPMSSG}
	#User log: ${USERLOG}
	#Network: ${IP} (${MAC})
	#Sudo: ${SUDO} cmd
"
