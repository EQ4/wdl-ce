#ifndef __IPLUGEFFECT__
#define __IPLUGEFFECT__

#include "IPlug_include_in_plug_hdr.h"
#include "IVecSliders.h"

// IPlugChunks - an example of storing data in chunks
#define NUM_SLIDERS 16

class IPlugChunks : public IPlug
{
public:

  IPlugChunks(IPlugInstanceInfo instanceInfo);
  ~IPlugChunks();

  void Reset();
  void OnParamChange(int paramIdx);

  void ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames);
  
  bool SerializeState(ByteChunk* pChunk);
	int UnserializeState(ByteChunk* pChunk, int startPos);
	//void MakePresetState(ByteChunk *pChunk,va_list vp);

private:

  double mSteps[NUM_SLIDERS];
  
  double mGain;
	unsigned long mCount, mPrevCount;
	
	double mSampleRate;
	double mSamplePeriod; // 1/sr
	MultiSliderControlV *mMSlider;
};

#endif
