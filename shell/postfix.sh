#!/bin/bash

# install postfix
yum -y install postfix
chkconfig postfix on
service postfix start

# stop sendmail
service sendmail stop
chkconfig sendmail off

# change mta
#alternatives --config mta
rm -f /etc/alternatives/mta
ln -s /usr/sbin/sendmail.postfix /etc/alternatives/mta
rm -f /etc/alternatives/mta-aliasesman
ln -s /usr/share/man/man5/aliases.postfix.5.gz /etc/alternatives/mta-aliasesman
rm -f /etc/alternatives/mta-mailq
ln -s /usr/bin/mailq.postfix /etc/alternatives/mta-mailq
rm -f /etc/alternatives/mta-mailqman
ln -s /usr/share/man/man1/mailq.postfix.1.gz /etc/alternatives/mta-mailqman
rm -f /etc/alternatives/mta-newaliases
ln -s /usr/bin/newaliases.postfix /etc/alternatives/mta-newaliases
rm -f /etc/alternatives/mta-newaliasesman
ln -s /usr/share/man/man1/newaliases.postfix.1.gz /etc/alternatives/mta-newaliasesman
rm -f /etc/alternatives/mta-pam
ln -s /etc/pam.d/smtp.postfix /etc/alternatives/mta-pam
rm -f /etc/alternatives/mta-rmail
ln -s /usr/bin/rmail.postfix /etc/alternatives/mta-rmail
rm -f /etc/alternatives/mta-sendmail
ln -s /usr/lib/sendmail.postfix /etc/alternatives/mta-sendmail
rm -f /etc/alternatives/mta-sendmailman
ln -s /usr/share/man/man1/sendmail.postfix.1.gz /etc/alternatives/mta-sendmailman
