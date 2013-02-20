#!/bin/bash

yum groupinstall "Development Tools"
yum -y install pkgconfig glib2-devel gettext libxml2-devel pango-devel cairo-devel

curl -kL http://install.perlbrew.pl | bash
echo '[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"' >> .bash_profile
source $HOME/perl5/perlbrew/etc/bashrc

perlbrew install perl-5.16.2
perlbrew switch perl-5.16.2

perlbrew install-cpanm

cpanm -n GrowthForecast

mkdir -p /var/growthforecast/data
mkdir -p /var/growthforecast/log

growthforecast.pl --port=80 --data-dir=/var/growthforecast/data > /var/growthforecast/log/growthforecast.log 2> /var/growthforecast/log/growthforecast.err &