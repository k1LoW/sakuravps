#!/bin/bash

# add repo
cat <<EOF  > /etc/yum.repos.d/td.repo
[treasuredata]
name=TreasureData
baseurl=http://packages.treasure-data.com/redhat/\$basearch
gpgcheck=0
EOF

yum update
yum -y install td-agent
/etc/init.d/td-agent start
chkconfig td-agent on
