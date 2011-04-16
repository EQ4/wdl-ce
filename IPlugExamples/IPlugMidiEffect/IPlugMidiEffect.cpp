#include "IPlugMidiEffect.h"
#include "IPlug_include_in_plug_src.h"
#include "resource.h"
#include <math.h>

// The number of presets/programs
const int kNumPrograms = 1;

// An enumerated list for all the parameters of the plugin
enum EParams 
{
	kGain = 0,
	kNumParams // the last element is used to store the total number of parameters
};

IPlugMidiEffect::IPlugMidiEffect(IPlugInstanceInfo instanceInfo)
:	IPLUG_CTOR(kNumParams, kNumPrograms, instanceInfo), mGain(0.), mSampleRate(44100.), mSamplePeriod(1./44100.)
{
	TRACE;
  
	// Define parameter ranges, display units, labels.
	//arguments are: name, defaultVal, minVal, maxVal, step, label
	GetParam(kGain)->InitDouble("Gain", 0.0, -44.0, 12.0, 0.1, "dB");
	
	//MakePreset("preset 1", -5.0, 5.0, 17, kReversed);
	MakeDefaultPreset("-", kNumPrograms);
}

// the destructor, where you free any memory you allocated
IPlugMidiEffect::~IPlugMidiEffect() {}

void IPlugMidiEffect::ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames)
{
	// Mutex is already locked for us.
	
	double* in1 = inputs[0];
	double* in2 = inputs[1];
	double* out1 = outputs[0];
	double* out2 = outputs[1];
	
	//double samplesPerBeat = GetSamplesPerBeat();
	//double samplePos = (double) GetSamplePos();
	
	for (int offset = 0; offset < nFrames; ++offset, ++in1, ++in2, ++out1, ++out2)
	{
		int velocity;
    
		while (!mMidiQueue.Empty())
		{
			IMidiMsg* pMsg = mMidiQueue.Peek();
			if (pMsg->mOffset > offset) break;
			
			// Handle the MIDI message.
			int status = pMsg->StatusMsg();
			switch (status)
			{
				case IMidiMsg::kNoteOn:
				case IMidiMsg::kNoteOff:
          
					velocity = pMsg->Velocity();
          
          //Note On
					if (status == IMidiMsg::kNoteOn && velocity)
					{
						mGain = 1.;
					}
					//Note Off
					else 
					{
						mGain = 0.;
					}
        break;
          
				default:
					break;
			}
			
			mMidiQueue.Remove();
		}
		
		
		*out1 = *in1 * mGain;
		*out2 = *in2 * mGain;
		
	}
	
	mMidiQueue.Flush(nFrames);
}

void IPlugMidiEffect::Reset()
{
	TRACE;
	IMutexLock lock(this);
	mMidiQueue.Resize(GetBlockSize());
	
	mSampleRate = GetSampleRate();
	mSamplePeriod = 1./mSampleRate;
}

void IPlugMidiEffect::OnParamChange(int paramIdx)
{
	IMutexLock lock(this);
	
	switch (paramIdx)
	{
		case kGain:
			//mGain = GetParam(kGain)->DBToAmp();
			break;
			
		default:
			break;
	}
}

void IPlugMidiEffect::ProcessMidiMsg(IMidiMsg* pMsg)
{
	mMidiQueue.Add(pMsg);
}

