#!/bin/bash

name=nss
version=3.39

mkdir -pv /tmp/nss
cd /tmp/nss
wget http://ftp.mozilla.org/pub/security/nss/releases/NSS_3_39_RTM/src/$name-$version.tar.gz
wget http://www.linuxfromscratch.org/patches/downloads/nss/nss-3.39-standalone-1.patch

tar -xf $name-$version.tar.gz
cd $name-$version
patch -Np1 -i ../nss-3.39-standalone-1.patch && cd nss &&
make -j1 BUILD_OPT=1                  \
  NSPR_INCLUDE_DIR=/tools/include/nspr  \
  USE_SYSTEM_ZLIB=1                   \
  ZLIB_LIBS=-lz                       \
  NSS_ENABLE_WERROR=0                 \
  $([ $(uname -m) = x86_64 ] && echo USE_64=1) \
  $([ -f /tools/include/sqlite3.h ] && echo NSS_USE_SYSTEM_SQLITE=1)

cd ../dist                                                          &&

install -v -m755 Linux*/lib/*.so              /usr/lib              &&
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib              &&

install -v -m755 -d                           /usr/include/nss      &&
cp -v -RL {public,private}/nss/*              /usr/include/nss      &&
chmod -v 644                                  /usr/include/nss/*    &&

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin &&

install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig
