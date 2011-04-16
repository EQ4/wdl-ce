#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugVerbEngine mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugVerbEngine.xcodeproj -xcconfig IPlugVerbEngine.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugVerbEngine.component/Contents/MacOS/IPlugVerbEngine 
file /Library/Audio/Plug-Ins/Components/IPlugVerbEngine.component/Contents/MacOS/IPlugVerbEngine 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugVerbEngine.vst/Contents/MacOS/IPlugVerbEngine 
file /Library/Audio/Plug-Ins/VST/IPlugVerbEngine.vst/Contents/MacOS/IPlugVerbEngine 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugVerbEngine.component dist/IPlugVerbEngine.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugVerbEngine.vst dist/IPlugVerbEngine.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugVerbEngine.component dist/IPlugVerbEngine.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugVerbEngine.vst dist/IPlugVerbEngine.vst

ditto -c -k dist IPlugVerbEngine-mac.zip
rm -R dist

echo "done"