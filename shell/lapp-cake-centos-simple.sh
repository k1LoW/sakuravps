#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://raw.github.com/k1LoW/sakuravps/master/"
fi

#common
curl $script_url/common.sh|bash
#iptables
curl $script_url/iptables-simple.sh|bash
/etc/init.d/iptables save
#apache php
curl $script_url/apache-php.sh|bash
#postgresql
curl $script_url/postgresql.sh|bash

# SElinux
setsebool -P httpd_can_network_connect_db 1
/etc/init.d/httpd restart
/etc/init.d/postgresql restart
