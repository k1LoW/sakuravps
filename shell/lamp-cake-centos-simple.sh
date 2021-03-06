#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://raw.github.com/k1LoW/sakuravps/master/shell/"
fi

#common
curl $script_url/common.sh|bash
#iptables
curl $script_url/iptables-simple.sh|bash
/etc/init.d/iptables save
#apache php
curl $script_url/apache-php.sh|bash
#mysql
curl $script_url/mysql.sh|bash

# SElinux
setsebool -P httpd_can_network_connect_db 1
/etc/init.d/httpd restart
/etc/init.d/mysqld restart
