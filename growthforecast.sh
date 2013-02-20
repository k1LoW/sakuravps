#!/bin/bash

yum groupinstall "Development Tools"
yum -y install pkgconfig glib2-devel gettext libxml2-devel pango-devel cairo-devel

useradd growthforecast
passwd growthforecast

su - growthforecast

curl -kL http://install.perlbrew.pl | bash
echo '[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"' >> .bash_profile
source $HOME/perl5/perlbrew/etc/bashrc