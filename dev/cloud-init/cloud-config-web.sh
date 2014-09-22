#!/bin/bash -v
yum -y install httpd git php php-mysql php-gd
/etc/init.d/httpd start
chkconfig httpd on

wget http://wordpress.org/latest.tar.gz -P /tmp/
tar -zxf /tmp/latest.tar.gz -C /var/www/html

#Set up iptables
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables-save > /etc/sysconfig/iptables
