//
// File: MWSwishLayer_Yolov9t0_ex_DLModel_28055.cu
//
// Code generated for Simulink model 'ex_DLModel_28'.
//
// Model version                  : 12.4
// Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
// C/C++ source code generated on : Tue May  5 18:06:16 2026
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM 64-bit (LP64)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28055.h"

void MWSwishLayer_Yolov9t0_ex_DLModel_28055::createCustomLayer(MWTensorrtTarget::
  MWTargetNetworkImpl *targetImpl, MWTensorBase *tmp, const char_T *tmp_0,
  int32_T tmp_1)
{
  boolean_T needsInputReorder;
  boolean_T needsOutputReorder;
  MWTensorBase::DIMSLABEL layout[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  setupTensors(1, 1, tmp, tmp_0, tmp_1);
  needsInputReorder = false;
  needsOutputReorder = false;
  setupLayer(targetImpl, &needsInputReorder, &needsOutputReorder, layout, 4);
}

MWSwishLayer_Yolov9t0_ex_DLModel_28055::MWSwishLayer_Yolov9t0_ex_DLModel_28055()
{
}

void MWSwishLayer_Yolov9t0_ex_DLModel_28055::propagateSize()
{
  int32_T batchSize;
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, batchSize, 1, 0);
}

void MWSwishLayer_Yolov9t0_ex_DLModel_28055::cleanupLayer()
{
}

void MWSwishLayer_Yolov9t0_ex_DLModel_28055::predictEnqueueImpl(real32_T
  **inputs, real32_T **outputs)
{
  dlnetwork_layerP_ky3w2k15cyr5mq(inputs[0], outputs[0]);
}

//
// File trailer for generated code.
//
// [EOF]
//
