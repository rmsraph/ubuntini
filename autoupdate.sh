#!/bin/bash
clear
if [ ! -e /etc/cron.weekly/apt-security-updates ]; then
	touch /etc/cron.weekly/apt-security-updates
	echo "#! /bin/sh" >> /etc/cron.weekly/apt-security-updates
	echo "echo "**************" >> /var/log/apt-security-updates" >> /etc/cron.weekly/apt-security-updates
	echo "date >> /var/log/apt-security-updates" >> /etc/cron.weekly/apt-security-updates
	echo "apt-get update >> /var/log/apt-security-updates" >> /etc/cron.weekly/apt-security-updates
	echo "apt-get upgrade -y -t `lsb_release -cs`-security >> /var/log/apt-security-updates" >> /etc/cron.weekly/apt-security-updates
	echo "echo \"Security updates (if any) installed\"" >> /etc/cron.weekly/apt-security-updates
	chmod 700 /etc/cron.weekly/apt-security-updates
else
	echo "Arquivo \"/etc/cron.weekly/apt-security-updates\" já existe. Nada será feito."
	sleep 2
fi
if [ ! -e /etc/logrotate.d/apt-security-updates ]; then
	touch /etc/logrotate.d/apt-security-updates
	echo "/var/log/apt-security-updates {" >> /etc/logrotate.d/apt-security-updates
	echo "        rotate 2" >> /etc/logrotate.d/apt-security-updates
	echo "        weekly" >> /etc/logrotate.d/apt-security-updates
	echo "        size 250k" >> /etc/logrotate.d/apt-security-updates
	echo "        compress" >> /etc/logrotate.d/apt-security-updates
	echo "        notifempty" >> /etc/logrotate.d/apt-security-updates
	echo "}" >> /etc/logrotate.d/apt-security-updates
	chmod 700 /etc/logrotate.d/apt-security-updates
else
	echo "Arquivo \"/etc/logrotate.d/apt-security-updates\" já existe. Nada será feito."
	sleep 2
fi
