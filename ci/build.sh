#! /bin/bash

./init-repository -f --mirror https://github.com/qt/;
./configure -prefix $WORKSPACE/../qt5 -opensource -confirm-license -nomake tests -nomake examples;
make -j 4
make install
