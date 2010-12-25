#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://github.com/k1LoW/sakuravps/raw/master/"
fi

#common
curl $script_url/common.sh|bash
#iptables
curl $script_url/iptables-simple.sh|bash
/etc/init.d/iptables save
#apache php
curl $script_url/apache-php5.3.sh|bash
#mysql
yum -y install --enablerepo=remi mysql-server
sed -i.org -e "s/\[mysqld\]/\[mysqld\]\ndefault-character-set = utf8/" /etc/my.cnf
cat >> /etc/my.cnf <<EOF
[client]
default-character-set = utf8

[mysqldump]
default-character-set = utf8
EOF

/sbin/chkconfig mysqld on
/etc/init.d/mysqld start
