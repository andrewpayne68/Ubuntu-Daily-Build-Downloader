#!/bin/bash
if [ ! -f settings.conf ]; then
echo "No settings.conf found! Look at settings-example.conf for instructions."
else
source settings.conf
fi

# Check to see if zsync is installed, if not, install it.
if ! dpkg-query -W -f='${Status}' zsync | grep "ok installed" &> /dev/null ; then sudo apt install zsync; fi

function download() {
	# Error handling if known flavour
	if [[ ! "${FLAVOURS[*]}" =~ $1 ]]; then
    echo "ERROR: $1 does not exit"
    return
	fi
	# Check if not latest series
	if [[ ! ${SERIES} = "hirsute" ]]; then
	folder="${1}/${SERIES}"
	else
	folder=$1
	fi
	echo ${folder}
	mkdir -p $DEST$1
	cd $DEST$1 || exit
	echo "[Downloading] http://cdimage.ubuntu.com/$folder/daily-live/current/$SERIES-$TYPE-$ARCH.iso"
	zsync http://cdimage.ubuntu.com/$folder/daily-live/current/$SERIES-$TYPE-$ARCH.iso.zsync
	rm *.zs-old &> /dev/null
	cd ..
}

function info() {
	# get remote zsync file
	wget -q http://cdimage.ubuntu.com/$folder/daily-live/current/$SERIES-$TYPE-$ARCH.list -O /tmp/${1}.list
	# get modified date of local file
	if [ -f "$DEST$1/$SERIES-$TYPE-$ARCH.iso" ]; then
    	ml=$(eval "stat -c %y $DEST$1/$SERIES-$TYPE-$ARCH.iso")
		# get first 10 characters of date YYYY-MM-DD put it into $m
		ml=${ml:0:10}
	else
		ml="Missing"
	fi
	# get modified date of remote file
	mr=$(eval "stat -c %y /tmp/${1}.list")
	mr=${mr:0:10}
	#echo "$d:			Local:$ml			Remote:$mr"
	printf "%14s %11s %11s\n" $d $ml $mr
	rm /tmp/${1}.list &> /dev/null
}

if [ $1 == "--info" ];
	then
	printf "%25s\n" "Set to: ${SERIES}"
	printf "%14s %11s %11s\n" "Flavour" "Local" "Remote"
	for d in "${FLAVOURS[@]}"
	do
		info $d
	done
	exit
fi

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
