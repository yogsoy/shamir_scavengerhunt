#!/bin/bash

echo "Name:"
read name

echo "Key:"
read key

echo "Objectives:"
read objectives

echo "Threshold:"
read threshold

foldername=$(cat <(printf $name) <(printf _$(date +%Y-%m)))

mkdir $foldername $foldername/qr

echo $key > $foldername/key

echo $key | ssss-split -t $threshold -n $objectives 2>/dev/null | tail -$objectives > $foldername/objectives

while read in; do
	qrencode -o $foldername/qr/$(echo $in | cut -d '-' -f 1).png "$in"
done < $foldername/objectives

