#!/bin/bash
if [ -z $script_url ];then
    export script_url="http://github.com/k1LoW/sakuravps/raw/master/"
fi

#yum
yum -y update

#/etc/sysconfig/i18n
sed -i.org -e "s/LANG=\"C\"/LANG=\"ja_JP.UTF-8\"/" /etc/sysconfig/i18n

#iptables
curl $script_url/iptables-simple.sh|bash
/etc/init.d/iptables save

#stop ip6tables
/etc/init.d/ip6tables stop
/sbin/chkconfig ip6tables off

# yum install
yum -y install subversion

# yum install httpd & php & mysql
yum -y install httpd httpd-devel php php-pear php-devel php-dom php-mbstring php-mysql php-gd

# virtual host
cat <<EOF  > /etc/httpd/conf.d/virtualhosts.conf
NameVirtualHost *:80
NameVirtualHost *:443

<VirtualHost *:80>
  DocumentRoot /var/www/html
  <Directory "/var/www/html/">
    Options -Indexes FollowSymLinks
    AllowOverride All
    DirectoryIndex index.html index.htm index.php
  </Directory>
</VirtualHost>
EOF

# install APC
yes yes|pecl install apc
echo "extension=apc.so" > /etc/php.d/apc.ini

# pear/pecl command patch
sed -i.org -e 's/16M/512M/' /usr/bin/pear
#chmod +x /usr/bin/pear-extend_memory_limit
sed -i.org -e 's/16M/512M/' /usr/bin/pecl
# chmod +x /usr/bin/pecl-extend_memory_limit

# edit /etc/php.d/my.ini
cat <<EOF > /etc/php.d/my.ini
memory_limit = 256M
short_open_tag = Off

[mbstring]
mbstring.language = Japanese
mbstring.internal_encoding = utf-8
EOF

/sbin/chkconfig httpd on
/etc/init.d/httpd start

# yum install mysql
yum -y install mysql mysql-server
sed -i.org -e "s/\[mysqld\]/\[mysqld\]\ndefault-character-set = utf8/" /etc/my.cnf
cat >> /etc/my.cnf <<EOF
[client]
default-character-set = utf8

[mysqldump]
default-character-set = utf8
EOF

/sbin/chkconfig mysqld on
/etc/init.d/mysqld start
