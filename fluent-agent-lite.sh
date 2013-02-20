#!/bin/bash

yum -y install perl-devel

git clone git://github.com/tagomoris/fluent-agent-lite.git
cd fluent-agent-lite
bash bin/install.sh

# conf
mv /etc/fluent-agent-lite.conf /etc/fluent-agent-lite.conf.org
cat <<EOC > /etc/fluent-agent-lite.conf
TAG_PREFIX="apache"
LOGS=\$(cat <<"EOF"
raw.access.app /var/log/httpd/access_log
raw.error.app  /var/log/httpd/error_log
EOF
)
PRIMARY_SERVER="log_server:24224"
EOC

echo ""
echo "! Modify /etc/fluent-agent-lite.conf and /etc/init.d/fluent-agent-lite start"
echo ""