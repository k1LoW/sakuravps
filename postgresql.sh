#!/bin/bash

# yum install postgresql
yum -y install postgresql84-tcl postgresql84-server postgresql84-contrib postgresql84
/etc/init.d/postgresql initdb --no-locale -D /var/lib/pgsql/data/ -E UNICODE
# mkdir /var/log/postgres
# postgres -c "pg_ctl -D /var/lib/pgsql/data -l /var/log/postgres/logfile start"

/sbin/chkconfig postgresql on
/etc/init.d/postgresql start
