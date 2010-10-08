#!/bin/bash
if [ -z $script_url ];then
    export script_url="http://github.com/k1LoW/sakuravps/raw/master/"
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