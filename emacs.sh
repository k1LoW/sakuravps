#!/bin/bash
yum -y install gcc
wget http://mirrors.usc.edu/pub/gnu/emacs/emacs-23.2.tar.gz
tar zxvf emacs-23.2.tar.gz
cd emacs-23.2/
./configure
make
make install