# Most useful commands
## Check Particitions
```
lsblk
```

## Check Networking DHCP
```
ss -tunlp // networking
```

## See if a package is properly installed
```
dpkg -l | grep $PACKAGE_NAME
```

## Name of packages i had installed
```
ufw
net-tools
openssh-server
sudo
lighttpd
php-cgi 
php-mysql
mariadb-server
vsftpd
```

## Status apparmor
```
sudo aa-status
```

## Shutdown and reboot the Virtual Machine
```
sudo shutdown -f now
sudo reboot
```

## Add and verify group
```
sudo addgroup user42
sudo adduser user user42
getent group user42
```

## Change hostname
```
sudo nano /etc/hostname
sudo nano /etc/hosts
sudo reboot
```
## Configure ssh
```
sudo nano /etc/ssh/sshd_config
sudo nano /etc/ssh/ssh_config
sudo reboot
sudo service ssh status //check status ssh
```

## Tool to simplify the firewall configuration
### Enable and give allow port
```
sudo ufw enable
sudo ufw allow 4242
sudo ufw status
```
### Two ways to delete a rule
```
sudo ufw status numbered
sudo ufw delete $NUM
```
```
sudo ufw delete allow 8080
```

## Config Sudo 
```
sudo touch /etc/sudoers.d/sudoconfig
```
```
sudo visudo
```

## Strong rules for password
```
sudo apt-get install libpam-pwquality
sudo nano /etc/pam.d/common-password
```
## Change password
```
passwd
sudo passwd
```

## Edit root crontab
```
sudo crontab -u root -e
```

## Check the agenda of crontab
```
sudo crontab -u root -l
```

## Stop crontab
```
sudo systemctl stop cron
sudo systemctl disable cron
```
## Start crontab
```
sudo systemctl start cron
sudo systemctl enable cron
```

# Useful commands to bonus part
## FTP command
### Acess the machine
```
ftp $IP
```
### Send, receive and delete files
```
put
get
delete
```
## Lighttpd Manage
```
systemctl start lighttpd
systemctl enable lighttpd
systemctl status lighttpd
```

## Mariadb manage
```
systemctl start mariadb
systemctl enable mariadb
systemctl status mariadb
systemctl restart mariadb
```
### Access MariaDB
```
mysql -u root -p
```
### Show Database
```
SHOW DATABASES;
```