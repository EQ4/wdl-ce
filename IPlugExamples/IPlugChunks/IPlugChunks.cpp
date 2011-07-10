#include "IPlugChunks.h"
#include "IPlug_include_in_plug_src.h"
#include "IControl.h"
#include "resource.h"
#include <math.h>

// The number of presets/programs
const int kNumPrograms = 1;

// An enumerated list for all the parameters of the plugin
enum EParams 
{
	kGain = 0,
	kNumParams, // the last element is used to store the total number of parameters
};

const int kDummyParamForMultislider = -2;

enum ELayout
{
	kW = 400,
	kH = 300
};

IPlugChunks::IPlugChunks(IPlugInstanceInfo instanceInfo)
:	IPLUG_CTOR(kNumParams, kNumPrograms, instanceInfo), mGain(1.), mSampleRate(44100.), mSamplePeriod(1./44100.)
{
	TRACE;
  
  memset(mSteps, 0, NUM_SLIDERS * sizeof(double));
	
  // Define parameter ranges, display units, labels.
	//arguments are: name, defaultVal, minVal, maxVal, step, label
	GetParam(kGain)->InitDouble("Gain", 0.0, -70.0, 12.0, 0.1, "dB");
	
	//MakePreset("preset 1", -5.0, 5.0, 17, kReversed);
	MakeDefaultPreset("-", kNumPrograms);
	
	IGraphics* pGraphics = MakeGraphics(this, kW, kH);
	pGraphics->AttachPanelBackground(&COLOR_BLUE);
	
	mMSlider = new MultiSliderControlV(this, IRECT(10, 10, 170, 110), kDummyParamForMultislider, NUM_SLIDERS, 10, &COLOR_WHITE, &COLOR_BLACK, &COLOR_RED);
  
	pGraphics->AttachControl(mMSlider);
  
	AttachGraphics(pGraphics);
}

// the destructor, where you free any memory you allocated
IPlugChunks::~IPlugChunks() {}

void IPlugChunks::ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames)
{
	// Mutex is already locked for us.
	
	double* in1 = inputs[0];
	double* in2 = inputs[1];
	double* out1 = outputs[0];
	double* out2 = outputs[1];
	
	int samplesPerBeat = (int) GetSamplesPerBeat();
	int samplePos = (int) GetSamplePos();
	
	int count = mCount;
	int prevcount = mPrevCount;
	
	for (int s = 0; s < nFrames; ++s, ++in1, ++in2, ++out1, ++out2) 
	{
    int mod = (samplePos + s) % (samplesPerBeat * 4);
    
		count = mod / (samplesPerBeat / 4);
    
    //printf("%i\n", count);
   if (count >= NUM_SLIDERS) {
     count = 0;
   }
    
		if (count != prevcount) 
		{
			if (GetGUI()) 
			{
				mMSlider->setHighlight(count);
			}
		}
		
		prevcount = count;
		
		*out1 = *in1 * mSteps[count] * mGain;
		*out2 = *in2 * mSteps[count] * mGain;
	}
	
	mCount = count;
	mPrevCount = prevcount;
	
}

void IPlugChunks::Reset()
{
	TRACE;
	IMutexLock lock(this);
	
	mSampleRate = GetSampleRate();
	mSamplePeriod = 1./mSampleRate;
	mCount = 0;
	mPrevCount = ULONG_MAX;
}


void IPlugChunks::OnParamChange(int paramIdx)
{
	IMutexLock lock(this);
	
	switch (paramIdx)
	{
    case kDummyParamForMultislider:
      mMSlider->getLatestChange(mSteps);
      break;
		case kGain:
			mGain = GetParam(kGain)->DBToAmp();
			break;
			
		default:
			break;
	}
}

bool IPlugChunks::SerializeState(ByteChunk* pChunk)
{
	IMutexLock lock(this);
	
	if ( mMSlider == NULL ) 
	{
		return false;
	}
	else 
	{
		pChunk->Put(mSteps);
	}
  
	return SerializeParams(pChunk);
}

int IPlugChunks::UnserializeState(ByteChunk* pChunk, int startPos)
{
	IMutexLock lock(this);
	
	startPos = pChunk->Get(mSteps, startPos);
  
	if (mMSlider) 
	{
		mMSlider->setState(mSteps);
		mMSlider->SetDirty(false);
	}
	
	return UnserializeParams(pChunk, startPos);
}
/*
 void IPlugChunks::MakePresetState(ByteChunk *pChunk, va_list vp) 
 {
 //	handle the first variable arg to MakePreset()
 char *s = (char *) va_arg(vp, char * );
 pChunk->PutStr(s);
 //	now handle all the other args (the parameters)
 MakePresetParams(pChunk,vp);
 }
 */


