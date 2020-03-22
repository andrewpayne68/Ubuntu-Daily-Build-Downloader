#!/bin/bash
SERIES="focal"
TYPE="desktop"
ARCH="amd64"

for d in lubuntu ubuntu xubuntu ubuntu-budgie kubuntu ubuntu-mate;
do
	echo $d
	mkdir -p ./$d
	cd $d
	zsync http://cdimage.ubuntu.com/$d/daily-live/current/$SERIES-$TYPE-$ARCH.iso.zsync
	cd ..
done
