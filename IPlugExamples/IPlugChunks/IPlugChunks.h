#ifndef __IPLUGEFFECT__
#define __IPLUGEFFECT__

#include "IPlug_include_in_plug_hdr.h"

class IPlugChunks : public IPlug
{
public:

  IPlugChunks(IPlugInstanceInfo instanceInfo);
  ~IPlugChunks();

  void Reset();
  void OnParamChange(int paramIdx);

  void ProcessDoubleReplacing(double** inputs, double** outputs, int nFrames);

  private:

  double mGain;
};

#endif
