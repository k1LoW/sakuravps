#!/bin/bash
if [ -z $script_url ];then
    export script_url="https://github.com/k1LoW/sakuravps/master/"
fi

#common
curl $script_url/common.sh|bash
#iptables
curl $script_url/iptables-simple.sh|bash
/etc/init.d/iptables save
#apache php
curl $script_url/apache-php5.3.sh|bash

#postgresql yum repogitory
rpm -ivh http://yum.pgsqlrpms.org/reporpms/8.4/pgdg-centos-8.4-2.noarch.rpm

# yum install postgresql
yum -y install postgresql-tcl postgresql-server postgresql-contrib postgresql
/etc/init.d/postgresql initdb --no-locale -D /var/lib/pgsql/data/ -E UNICODE
# mkdir /var/log/postgres
# postgres -c "pg_ctl -D /var/lib/pgsql/data -l /var/log/postgres/logfile start"

/sbin/chkconfig postgresql on
/etc/init.d/postgresql start
