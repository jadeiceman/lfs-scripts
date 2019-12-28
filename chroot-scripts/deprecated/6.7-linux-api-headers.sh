name=linux
version=4.19.52

mkdir -pv /tmp/$name
cd /tmp/$name

wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-$version.tar.xz

tar -xvf linux-$version.tar.xz

cd linux-$version
make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

rm -rf /tmp/$name
