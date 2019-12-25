#!/bin/bash

CWD=$PWD

source $CWD/config

PATH=/tools/bin:/bin:/usr/bin

export LC_ALL=C PATH MAKEFLAGS LFS LFS_TGT

chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
