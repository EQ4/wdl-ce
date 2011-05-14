#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugChunks mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugChunks.xcodeproj -xcconfig IPlugChunks.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugChunks.component/Contents/MacOS/IPlugChunks 
file /Library/Audio/Plug-Ins/Components/IPlugChunks.component/Contents/MacOS/IPlugChunks 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugChunks.vst/Contents/MacOS/IPlugChunks 
file /Library/Audio/Plug-Ins/VST/IPlugChunks.vst/Contents/MacOS/IPlugChunks 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugChunks.component dist/IPlugChunks.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugChunks.vst dist/IPlugChunks.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugChunks.component dist/IPlugChunks.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugChunks.vst dist/IPlugChunks.vst

ditto -c -k dist IPlugChunks-mac.zip
rm -R dist

echo "done"