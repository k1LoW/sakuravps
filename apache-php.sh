#!/bin/bash
# yum install httpd & php & mysql & postgresql
yum -y install httpd httpd-devel php php-pear php-devel php-dom php-mbstring php-mysql php-pgsql php-gd

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

# timezone setting
echo "[Date]
date.timezone = Asia/Tokyo" > /etc/php.d/timezone.ini

/sbin/chkconfig httpd on
/etc/init.d/httpd start