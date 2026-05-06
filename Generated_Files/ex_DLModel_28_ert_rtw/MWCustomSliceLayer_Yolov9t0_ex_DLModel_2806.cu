//
// File: MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.cu
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
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.h"

void MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806::createCustomLayer
  (MWTensorrtTarget::MWTargetNetworkImpl *targetImpl, MWTensorBase *tmp, const
   char_T *tmp_0, const char_T *tmp_1, int32_T tmp_2, int32_T tmp_3)
{
  boolean_T needsOutputReorder[2];
  boolean_T needsInputReorder;
  MWTensorBase::DIMSLABEL layout[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::W, MWTensorBase::H };

  MWTensorBase::DIMSLABEL layout_0[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL layout_1[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL layout_2[4] = { MWTensorBase::N, MWTensorBase::C,
    MWTensorBase::H, MWTensorBase::W };

  setupTensors(1, 2, tmp, tmp_0, tmp_1, tmp_2, tmp_3);
  needsInputReorder = true;
  needsOutputReorder[0] = true;
  needsOutputReorder[1] = true;
  setupLayer(targetImpl, &needsInputReorder, &needsOutputReorder[0], layout, 4,
             layout_0, layout_1, layout_2);
}

MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806::
  MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806()
{
}

void MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806::propagateSize()
{
  int32_T batchSize;
  batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, batchSize, 1, 0);
  resizeOutputTensor(60, 80, 32, batchSize, 1, 1);
}

void MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806::cleanupLayer()
{
}

void MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806::predictEnqueueImpl(real32_T
  **inputs, real32_T **outputs)
{
  dlnetwork_layerPredictWit_ky3w2(inputs[0], outputs[0], outputs[1]);
}

//
// File trailer for generated code.
//
// [EOF]
//
