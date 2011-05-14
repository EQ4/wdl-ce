#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugControls mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugControls.xcodeproj -xcconfig IPlugControls.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugControls.component/Contents/MacOS/IPlugControls 
file /Library/Audio/Plug-Ins/Components/IPlugControls.component/Contents/MacOS/IPlugControls 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugControls.vst/Contents/MacOS/IPlugControls 
file /Library/Audio/Plug-Ins/VST/IPlugControls.vst/Contents/MacOS/IPlugControls 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugControls.component dist/IPlugControls.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugControls.vst dist/IPlugControls.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugControls.component dist/IPlugControls.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugControls.vst dist/IPlugControls.vst

ditto -c -k dist IPlugControls-mac.zip
rm -R dist

echo "done"