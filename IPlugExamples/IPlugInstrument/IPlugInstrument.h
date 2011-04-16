#ifndef __IPLUGEFFECT__
#define __IPLUGEFFECT__

#include "IPlug_include_in_plug_hdr.h"
#include "IMidiQueue.h"

// WDL-CE IPlug Instrument example based on code by Theo Niessink (Tale)

class IPlugInstrument : public IPlug
{
public:

  IPlugInstrument(IPlugInstanceInfo instanceInfo);
  ~IPlugInstrument() {};

	void Reset();
	void OnParamChange(int paramIdx);
  
	void ProcessMidiMsg(IMidiMsg* pMsg);
	void ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames);
  
private:
  IMidiQueue mMidiQueue;
	double mVolume;
	bool mVelocity;
	int mNote;
	double mFreq;
	double mGain;
  
	double mPhase; // Value in [0, 1].
	double mSamplePeriod;
};

#endif
