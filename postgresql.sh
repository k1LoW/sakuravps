#!/bin/bash
#postgresql yum repogitory
rpm -ivh http://yum.pgsqlrpms.org/reporpms/8.4/pgdg-centos-8.4-2.noarch.rpm

# yum install mysql
yum -y install postgresql-tcl postgresql-server postgresql-contrib postgresql
/etc/init.d/postgresql initdb --no-locale -D /var/lib/pgsql/data/ -E UNICODE
# mkdir /var/log/postgres
# postgres -c "pg_ctl -D /var/lib/pgsql/data -l /var/log/postgres/logfile start"

/sbin/chkconfig postgresql on
/etc/init.d/postgresql start
