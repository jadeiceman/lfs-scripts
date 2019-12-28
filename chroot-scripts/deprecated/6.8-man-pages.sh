name=man-pages
version=5.03
source=https://www.kernel.org/pub/linux/docs/$name/$name-$version.tar.xz

mkdir -pv /tmp/$name
cd /tmp/$name

wget $source

tar -xvf $name-$version.tar.xz

cd $name-$version

make install

rm -rf /tmp/$name
