#! /bin/sh

# bash shell script to compile au and vst targets and zip them. 
# If you modified the build location, uncomment/comment out the appropriate lines

BASEDIR=$(dirname $0)

cd $BASEDIR

echo "making IPlugResampler mac distribution..."
echo ""
if [ -d dist ] 
then
	rm -R dist
fi

mkdir dist

#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target VST_32_ub -configuration Release
#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target AU_32_ub -configuration Release
#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target VST_32_intel -configuration Release
#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target AU_32_intel -configuration Release
xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target "VST_32&64_intel" -configuration Release
xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target "AU_32&64_intel" -configuration Release
#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target VST_32&64_ub -configuration Release
#xcodebuild -project IPlugResampler.xcodeproj -xcconfig IPlugResampler.xcconfig -target AU_32&64_ub -configuration Release

# check binarys to see what architechtures are inside
echo "verify architectures..."
echo ""
#file ~/Library/Audio/Plug-Ins/Components/IPlugResampler.component/Contents/MacOS/IPlugResampler 
file /Library/Audio/Plug-Ins/Components/IPlugResampler.component/Contents/MacOS/IPlugResampler 
echo ""
#file ~/Library/Audio/Plug-Ins/VST/IPlugResampler.vst/Contents/MacOS/IPlugResampler 
file /Library/Audio/Plug-Ins/VST/IPlugResampler.vst/Contents/MacOS/IPlugResampler 

echo "copying and zipping binaries..."
echo ""
cp -R /Library/Audio/Plug-Ins/Components/IPlugResampler.component dist/IPlugResampler.component
cp -R /Library/Audio/Plug-Ins/VST/IPlugResampler.vst dist/IPlugResampler.vst
#cp -R ~/Library/Audio/Plug-Ins/Components/IPlugResampler.component dist/IPlugResampler.component
#cp -R ~/Library/Audio/Plug-Ins/VST/IPlugResampler.vst dist/IPlugResampler.vst

ditto -c -k dist IPlugResampler-mac.zip
rm -R dist

echo "done"