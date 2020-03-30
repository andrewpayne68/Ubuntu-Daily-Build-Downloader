#!/bin/bash
SERIES="focal"
TYPE="desktop"
ARCH="amd64"
FLAVOURS=("lubuntu" "ubuntu" "ubuntu" "ubuntu-budgie" "kubuntu" "ubuntu-mate")

function download() {
	# Error handling if known flavour
	if [[ ! "${FLAVOURS[@]}" =~ "$1" ]]; then
    echo "ERROR: $1 does not exit"
    return
	fi
	echo $1
	mkdir -p ./$1
	cd $1
	zsync http://cdimage.ubuntu.com/$1/daily-live/current/$SERIES-$TYPE-$ARCH.iso.zsync
	cd ..
}

# all flavours
if [ $# == 0 ]
	then
	for d in "${FLAVOURS[@]}";
	do
		download $d
	done
fi

# select flavours 
while [ $# -gt 0 ]; do
	download $1
	shift;
done