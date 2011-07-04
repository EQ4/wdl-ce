#include "IPlugMultiChannel.h"
#include "IPlug_include_in_plug_src.h"
#include "IControl.h"
#include "resource.h"

const int kNumPrograms = 1;

enum EParams
{
  kGain = 0,
  kNumParams
};

IPlugMultiChannel::IPlugMultiChannel(IPlugInstanceInfo instanceInfo)
:	IPLUG_CTOR(kNumParams, kNumPrograms, instanceInfo), mGain(1.)
{
  TRACE;

  //arguments are: name, defaultVal, minVal, maxVal, step, label
  GetParam(kGain)->InitDouble("Gain", 0.0, -70.0, 12.0, 0.1, "dB");

  //MakePreset("preset 1", ... );
  MakeDefaultPreset((char *) "-", kNumPrograms);
}

IPlugMultiChannel::~IPlugMultiChannel() {}

void IPlugMultiChannel::ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames)
{
  // Mutex is already locked for us.

  // hope ninchan == noutchan
  for (int c = 0; c < NInChannels(); c++) 
  {
    double* in = inputs[c];
    double* out = outputs[c];

    for (int s = 0; s < nFrames; ++s, ++in, ++out)
    {
        *out = *in * mGain;
    }	
  }
}

void IPlugMultiChannel::Reset()
{
  TRACE;
  IMutexLock lock(this);

  //double sr = GetSampleRate();
}

void IPlugMultiChannel::OnParamChange(int paramIdx)
{
  IMutexLock lock(this);

  switch (paramIdx)
  {
    case kGain:
      mGain = GetParam(kGain)->DBToAmp();
      break;
      
    default:
      break;
  }
}


