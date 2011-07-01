#! /bin/sh

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "building all example plugins..."

for file in * 
do
#echo $file
	if [ -d "$file/$file.xcodeproj" ]
	then
		echo "building $file/$file.xcodeproj VST"
		xcodebuild -project "$file/$file.xcodeproj" -target "VST_32&64_intel" -configuration Release
		echo "building $file/$file.xcodeproj AU"
		xcodebuild -project "$file/$file.xcodeproj" -target "AU_32&64_intel" -configuration Release
	fi
done

echo "done"
