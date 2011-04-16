#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugMidiEffect mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugMidiEffect.xcodeproj -xcconfig IPlugMidiEffect.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugMidiEffect.component/Contents/MacOS/IPlugMidiEffect 
file /Library/Audio/Plug-Ins/Components/IPlugMidiEffect.component/Contents/MacOS/IPlugMidiEffect 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugMidiEffect.vst/Contents/MacOS/IPlugMidiEffect 
file /Library/Audio/Plug-Ins/VST/IPlugMidiEffect.vst/Contents/MacOS/IPlugMidiEffect 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugMidiEffect.component dist/IPlugMidiEffect.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugMidiEffect.vst dist/IPlugMidiEffect.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugMidiEffect.component dist/IPlugMidiEffect.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugMidiEffect.vst dist/IPlugMidiEffect.vst

ditto -c -k dist IPlugMidiEffect-mac.zip
rm -R dist

echo "done"