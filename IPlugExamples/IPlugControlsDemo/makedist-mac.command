#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugControlsDemo mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugControlsDemo.xcodeproj -xcconfig IPlugControlsDemo.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugControlsDemo.component/Contents/MacOS/IPlugControlsDemo 
file /Library/Audio/Plug-Ins/Components/IPlugControlsDemo.component/Contents/MacOS/IPlugControlsDemo 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugControlsDemo.vst/Contents/MacOS/IPlugControlsDemo 
file /Library/Audio/Plug-Ins/VST/IPlugControlsDemo.vst/Contents/MacOS/IPlugControlsDemo 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugControlsDemo.component dist/IPlugControlsDemo.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugControlsDemo.vst dist/IPlugControlsDemo.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugControlsDemo.component dist/IPlugControlsDemo.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugControlsDemo.vst dist/IPlugControlsDemo.vst

ditto -c -k dist IPlugControlsDemo-mac.zip
rm -R dist

echo "done"