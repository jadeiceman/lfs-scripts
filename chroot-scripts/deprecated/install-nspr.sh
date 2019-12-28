#!/bin/bash

name=nspr
version=4.20

mkdir -pv /tmp/$name
cd /tmp/$name

wget http://ftp.mozilla.org/pub/nspr/releases/v$version/src/$name-$version.tar.gz

tar -xf $name-$version.tar.gz
cd $name-$version

cd nspr
./configure \
    --prefix=/usr \
    --with-mozilla \
    --with-pthreads \
    --disable-silent-rules

make
make install

rm -rf /tmp/$name
