#!/bin/bash

CWD=$PWD

source $CWD/config

PATH=/tools/bin:/bin:/usr/bin

export LC_ALL=C PATH MAKEFLAGS LFS LFS_TGT

# 6.2.2. Mount and populate /dev
umount -v /dev $LFS/dev

# 6.2.3. Mounting virtual kernel file systems
umount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
umount -vt proc proc $LFS/proc
umount -vt sysfs sysfs $LFS/sys
umount -vt tmpfs tmpfs $LFS/run
