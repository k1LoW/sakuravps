#!/bin/bash
# yum install mysql
yum -y install mysql mysql-server
sed -i.org -e "s/\[mysqld\]/\[mysqld\]\ndefault-character-set = utf8/" /etc/my.cnf
cat >> /etc/my.cnf <<EOF
[client]
default-character-set = utf8

[mysqldump]
default-character-set = utf8
EOF

/sbin/chkconfig mysqld on
/etc/init.d/mysqld start
