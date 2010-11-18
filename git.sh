#!/bin/bash
wget http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm
rpm -ivh epel-release-5-4.noarch.rpm
rm epel-release-5-4.noarch.rpm
yum -y install git subversion-perl
sed -i -e "s/enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo