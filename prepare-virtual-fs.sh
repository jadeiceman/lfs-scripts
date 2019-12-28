#!/bin/bash

CWD=$PWD

source $CWD/config

PATH=/tools/bin:/bin:/usr/bin

export LC_ALL=C PATH MAKEFLAGS LFS LFS_TGT

# Create directories
mkdir -pv $LFS/{dev,proc,sys,run}

# 6.2.1. Create initial device nodes
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

# 6.2.2. Mount and populate /dev
mount -v --bind /dev $LFS/dev

# 6.2.3. Mounting virtual kernel file systems
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

cp -rv $CWD/chroot-scripts $LFS
cp -L /etc/resolv.conf $LFS/etc/
