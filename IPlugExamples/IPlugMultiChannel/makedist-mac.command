#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugMultiChannel mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugMultiChannel.xcodeproj -xcconfig IPlugMultiChannel.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugMultiChannel.component/Contents/MacOS/IPlugMultiChannel 
file /Library/Audio/Plug-Ins/Components/IPlugMultiChannel.component/Contents/MacOS/IPlugMultiChannel 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugMultiChannel.vst/Contents/MacOS/IPlugMultiChannel 
file /Library/Audio/Plug-Ins/VST/IPlugMultiChannel.vst/Contents/MacOS/IPlugMultiChannel 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugMultiChannel.component dist/IPlugMultiChannel.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugMultiChannel.vst dist/IPlugMultiChannel.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugMultiChannel.component dist/IPlugMultiChannel.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugMultiChannel.vst dist/IPlugMultiChannel.vst

ditto -c -k dist IPlugMultiChannel-mac.zip
rm -R dist

echo "done"