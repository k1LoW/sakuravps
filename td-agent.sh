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

chgrp td-agent /var/log/httpd/
chgrp td-agent /var/log/messages
chgrp td-agent /var/log/secure
chgrp td-agent /var/log/cron

chmod g+rx /var/log/httpd/
chmod g+rx /var/log/messages
chmod g+rx /var/log/secure
chmod g+rx /var/log/cron

# fluent-plugins
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-parser
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-file-alternative
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-rewrite
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-forest
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-numeric-monitor
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-numeric-counter
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-s3
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-config-expander
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-file-growthforecast

/etc/init.d/td-agent start
chkconfig td-agent on

echo ""
echo "! Modify /etc/td-agent/td-agent.conf
echo ""
