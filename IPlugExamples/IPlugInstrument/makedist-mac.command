#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugInstrument mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugInstrument.xcodeproj -xcconfig IPlugInstrument.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugInstrument.component/Contents/MacOS/IPlugInstrument 
file /Library/Audio/Plug-Ins/Components/IPlugInstrument.component/Contents/MacOS/IPlugInstrument 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugInstrument.vst/Contents/MacOS/IPlugInstrument 
file /Library/Audio/Plug-Ins/VST/IPlugInstrument.vst/Contents/MacOS/IPlugInstrument 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugInstrument.component dist/IPlugInstrument.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugInstrument.vst dist/IPlugInstrument.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugInstrument.component dist/IPlugInstrument.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugInstrument.vst dist/IPlugInstrument.vst

ditto -c -k dist IPlugInstrument-mac.zip
rm -R dist

echo "done"