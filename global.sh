#!/bin/bash
wget http://tamacom.com/global/global-5.9.2.tar.gz
tar zxvf global-5.9.2.tar.gz
cd global-5.9.2/
./configure
make
make install