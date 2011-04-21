#!/bin/bash
yum -y install gcc
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-23.3.tar.gz
tar zxvf emacs-23.3.tar.gz
cd emacs-23.3/
./configure --without-x
make
make install