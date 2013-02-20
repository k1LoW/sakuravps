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

# fluent-plugin-file-alternative
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-file-alternative

/etc/init.d/td-agent start
chkconfig td-agent on

echo ""
echo "! Modify /etc/td-agent/td-agent.conf
echo ""
