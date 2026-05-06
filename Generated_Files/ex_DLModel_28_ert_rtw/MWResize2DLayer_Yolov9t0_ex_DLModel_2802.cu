//
// File: MWResize2DLayer_Yolov9t0_ex_DLModel_2802.cu
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
#include "MWResize2DLayer_Yolov9t0_ex_DLModel_2802.h"

void MWResize2DLayer_Yolov9t0_ex_DLModel_2802::createCustomLayer
  (MWTensorrtTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *tmp,
   MWTensorBase *tmp_0, const char_T *tmp_1, int32_T tmp_2)
{
  boolean_T needsInputReorder[2];
  boolean_T needsOutputReorder;
  MWTensorBase::DIMSLABEL layout[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::W, MWTensorBase::H };

  MWTensorBase::DIMSLABEL layout_0[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL layout_1[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL layout_2[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  setupTensors(2, 1, tmp, tmp_0, tmp_1, tmp_2);
  needsInputReorder[0] = true;
  needsInputReorder[1] = true;
  needsOutputReorder = true;
  setupLayer(targetImpl, &needsInputReorder[0], &needsOutputReorder, layout, 4,
             layout_0, layout_1, layout_2);
}

MWResize2DLayer_Yolov9t0_ex_DLModel_2802::
  MWResize2DLayer_Yolov9t0_ex_DLModel_2802()
{
}

void MWResize2DLayer_Yolov9t0_ex_DLModel_2802::propagateSize()
{
  int32_T batchSize;
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 96, batchSize, 1, 0);
}

void MWResize2DLayer_Yolov9t0_ex_DLModel_2802::cleanupLayer()
{
}

void MWResize2DLayer_Yolov9t0_ex_DLModel_2802::predictEnqueueImpl(real32_T
  **inputs, real32_T **outputs)
{
  dlnetwork_layerPredictWithCo_kr(inputs[0], outputs[0]);
}

//
// File trailer for generated code.
//
// [EOF]
//
