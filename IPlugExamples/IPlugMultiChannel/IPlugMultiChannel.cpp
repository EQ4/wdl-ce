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
  
  //printf("%i %i %i %i\n", IsInChannelConnected(0), IsInChannelConnected(1), IsInChannelConnected(2), IsInChannelConnected(3));

  double* in1 = inputs[0];
  double* in2 = inputs[1];
  double* out1 = outputs[0];
  double* out2 = outputs[1];
  
  if (IsInChannelConnected(2) && IsInChannelConnected(3)) // stereo sidechain connected
  {
    double* sc1 = inputs[2];
    double* sc2 = inputs[3];
    
    for (int s = 0; s < nFrames; s++)
    {
      *(out1++) = *(in1++) * *(sc1++);
      *(out2++) = *(in2++) * *(sc2++);
    }	
  }
  else {
    for (int s = 0; s < nFrames; s++)
    {
      *(out1++) = *(in1++);
      *(out2++) = *(in2++);
    }	
  }

}

void IPlugMultiChannel::Reset()
{
  TRACE;
  IMutexLock lock(this);
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


