#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugConvoEngine mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugConvoEngine.xcodeproj -xcconfig IPlugConvoEngine.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugConvoEngine.component/Contents/MacOS/IPlugConvoEngine 
file /Library/Audio/Plug-Ins/Components/IPlugConvoEngine.component/Contents/MacOS/IPlugConvoEngine 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugConvoEngine.vst/Contents/MacOS/IPlugConvoEngine 
file /Library/Audio/Plug-Ins/VST/IPlugConvoEngine.vst/Contents/MacOS/IPlugConvoEngine 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugConvoEngine.component dist/IPlugConvoEngine.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugConvoEngine.vst dist/IPlugConvoEngine.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugConvoEngine.component dist/IPlugConvoEngine.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugConvoEngine.vst dist/IPlugConvoEngine.vst

ditto -c -k dist IPlugConvoEngine-mac.zip
rm -R dist

echo "done"