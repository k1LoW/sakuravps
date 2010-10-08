#!/bin/bash
yum install gcc
wget ftp://ftp.ring.gr.jp/pub/GNU/emacs/emacs-23.2.tar.gz
tar zxvf emacs-23.2.tar.gz
cd emacs-23.2/
./configure --without-x
make
make install