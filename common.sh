#!/bin/bash
#yum
yum -y update

#/etc/sysconfig/i18n
sed -i.org -e "s/LANG=\"C\"/LANG=\"ja_JP.UTF-8\"/" /etc/sysconfig/i18n

#stop ip6tables
/etc/init.d/ip6tables stop
/sbin/chkconfig ip6tables off

# yum install
yum -y install subversion