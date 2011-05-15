#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugPitchShift mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugPitchShift.xcodeproj -xcconfig IPlugPitchShift.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugPitchShift.component/Contents/MacOS/IPlugPitchShift 
file /Library/Audio/Plug-Ins/Components/IPlugPitchShift.component/Contents/MacOS/IPlugPitchShift 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugPitchShift.vst/Contents/MacOS/IPlugPitchShift 
file /Library/Audio/Plug-Ins/VST/IPlugPitchShift.vst/Contents/MacOS/IPlugPitchShift 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugPitchShift.component dist/IPlugPitchShift.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugPitchShift.vst dist/IPlugPitchShift.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugPitchShift.component dist/IPlugPitchShift.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugPitchShift.vst dist/IPlugPitchShift.vst

ditto -c -k dist IPlugPitchShift-mac.zip
rm -R dist

echo "done"