CWD=$PWD

source $CWD/config
rm -rf $LFS/chroot-scripts
cp -rv $CWD/chroot-scripts $LFS

cp -Lv /etc/resolv.conf $LFS/etc/

