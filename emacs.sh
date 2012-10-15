#!/bin/bash
yum -y install gcc ncurses-devel
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-23.4.tar.gz
tar zxvf emacs-23.4.tar.gz
cd emacs-23.4/
./configure --without-x
make bootstrap
make
make install