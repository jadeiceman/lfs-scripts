CWD=$PWD
source $CWD/config
cd $LFS
rm -rf bin/ boot/ chroot-scripts/ dev/ etc/ home/ lib/ media/ mnt/ opt/ proc/ root/ run/ sbin/ srv/ sys/ tmp/ usr/ var/
cd $CWD
./prepare-virtual-fs.sh

