#ifndef __IPLUGMIDIEFFECT__
#define __IPLUGMIDIEFFECT__

#include "IPlug_include_in_plug_hdr.h"
#include "IMidiQueue.h"


class IPlugMidiEffect : public IPlug
{
public:
	
	IPlugMidiEffect(IPlugInstanceInfo instanceInfo);
	~IPlugMidiEffect();
	
	// Implement these if your audio or GUI logic requires doing something, when params change or when audio processing stops/starts.
	void Reset();
	void OnParamChange(int paramIdx);
  
	void ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames);
	
	void ProcessMidiMsg(IMidiMsg* pMsg);
	
private:
	
	double mGain;
  
	//these are two things that are often needed
	double mSampleRate;
	double mSamplePeriod; // 1/sr
	IMidiQueue mMidiQueue;
	
};

////////////////////////////////////////

#endif
