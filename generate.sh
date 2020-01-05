#!/bin/bash

if [ "$1" != "" ]; then
	while [ "$1" != "" ]; do
		case $1 in
			-n | --name ) shift
				name=$1
				;;
			-k | --key ) shift
				key=$1
				;;
			-o | --objectives ) shift
				objectives=$1
				;;
			-t | --threshold ) shift
				threshold=$1
				;;
			-p | --print ) shift
				print=$1
			esac
		shift
	done
fi

x="hiya"
if [ -z ${name+x} ]; then
	echo "Name:"
	read name
fi
if [ -z ${key+x} ]; then
	echo "Key:"
	read key
fi
if [ -z ${objectives+x} ]; then
	echo "Objectives:"
	read objectives
fi
if [ -z ${threshold+x} ]; then
	echo "Threshold"
	read threshold
fi

foldername=$(cat <(printf $name) <(printf _$(date +%Y-%m)))

mkdir $foldername $foldername/qr

echo $key > $foldername/key

echo $key | ssss-split -t $threshold -n $objectives 2>/dev/null | tail -$objectives > $foldername/objectives

while read in; do
	qrencode -o $foldername/qr/$(echo $in | cut -d '-' -f 1).png "$in"
done < $foldername/objectives

montage $foldername/qr/* -mode concatenate $foldername/qr/all.png


