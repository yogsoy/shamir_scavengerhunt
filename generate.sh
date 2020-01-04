#!/bin/bash

if [ "$1" == "" ]; then
	echo "Name:"
	read name

	echo "Key:"
	read key

	echo "Objectives:"
	read objectives

	echo "Threshold:"
	read threshold
else
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
		esac
		shift
	done
fi

x="hiya"
if [ -z ${name+x} ] || [ -z ${key+x} ] || [ -z ${objectives+x} ] || [ -z ${threshold+x} ]; then
	echo "All or none of name, key, objectives, and threshold must be set (-nknt)."
	exit
fi

foldername=$(cat <(printf $name) <(printf _$(date +%Y-%m)))

mkdir $foldername $foldername/qr

echo $key > $foldername/key

echo $key | ssss-split -t $threshold -n $objectives 2>/dev/null | tail -$objectives > $foldername/objectives

while read in; do
	qrencode -o $foldername/qr/$(echo $in | cut -d '-' -f 1).png "$in"
done < $foldername/objectives

