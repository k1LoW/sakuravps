#!/bin/bash
# yum install mysql
yum -y install mysql mysql-server
sed -i.org -e "s/\[mysqld\]/\[mysqld\]\ncharacter-set-server = utf8\ndefault-storage-engine=innodb/" /etc/my.cnf
cat >> /etc/my.cnf <<EOF

[mysqldump]
character-set-server = utf8
EOF

/sbin/chkconfig mysqld on
/etc/init.d/mysqld start
