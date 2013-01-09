#!/bin/bash
# yum install mysql
yum -y install mysql mysql-server
sed -i.org -e "s/\[mysqld\]/\[mysqld\]\ncharacter-set-server = utf8/" /etc/my.cnf
cat >> /etc/my.cnf <<EOF
[client]
character-set-server = utf8

[mysqldump]
character-set-server = utf8
EOF

/sbin/chkconfig mysqld on
/etc/init.d/mysqld start
