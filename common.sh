#!/bin/bash
# yum
yum -y update

# /etc/sysconfig/i18n
sed -i.org -e "s/LANG=\"C\"/LANG=\"ja_JP.UTF-8\"/" /etc/sysconfig/i18n

# stop services
chkconfig acpid off
chkconfig auditd off
chkconfig haldaemon off
chkconfig lvm2-monitor off
chkconfig mdmonitor off
chkconfig messagebus off
chkconfig netfs off
chkconfig restorecond off
chkconfig smartd off

# stop ip6tables
/etc/init.d/ip6tables stop
chkconfig ip6tables off

# yum install git
yum -y install git

# yum install subversion
yum -y install subversion
