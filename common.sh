#!/bin/bash
#yum
yum -y update

#/etc/sysconfig/i18n
sed -i.org -e "s/LANG=\"C\"/LANG=\"ja_JP.UTF-8\"/" /etc/sysconfig/i18n

#stop services
chkconfig acpid off
chkconfig auditd off
chkconfig autofs off
chkconfig avahi-daemon off
chkconfig bluetooth off
chkconfig cups off
chkconfig firstboot off
chkconfig gpm off
chkconfig haldaemon off
chkconfig hidd off
chkconfig kudzu off
chkconfig lvm2-monitor off
chkconfig mcstrans off
chkconfig mdmonitor off
chkconfig messagebus off
chkconfig netfs off
chkconfig nfslock off
chkconfig pcscd off
chkconfig portmap off
chkconfig rawdevices off
chkconfig restorecond off
chkconfig rpcgssd off
chkconfig rpcidmapd off
chkconfig smartd off
chkconfig xfs off
chkconfig yum-updatesd off

#stop ip6tables
/etc/init.d/ip6tables stop
/sbin/chkconfig ip6tables off

# yum install subversion
yum -y install subversion
