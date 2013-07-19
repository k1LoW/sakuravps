#!/bin/bash

# yum install postgresql
yum -y install postgresql postgresql-server postgresql-contrib postgresql-tcl
/etc/init.d/postgresql initdb --no-locale -D /var/lib/pgsql/data/ -E UNICODE

/sbin/chkconfig postgresql on
/etc/init.d/postgresql start
