#!/bin/bash

url=$1
file=`basename "$url"`
echo $file

wget "$url"
rpm2cpio "$url" | ( cd ~/linux32/; cpio -div )
ldd ../pharo/bin/libSqueakSSL.so
