//
// File: MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.h
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
#ifndef MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803_h_
#define MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803_h_
#include "MWTensorrtCustomLayerBase.hpp"
#include "MWTensorrtTargetNetworkImpl.hpp"
#include <cstring>
#include "ex_DLModel_28_types.h"
#include "rtwtypes.h"

class MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803 : public
  MWTensorrtCustomLayerBase
{
 public:
  MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803();
  void createCustomLayer(MWTensorrtTarget::MWTargetNetworkImpl *targetImpl,
    MWTensorBase *tmp, const char_T *tmp_0, const char_T *tmp_1, int32_T tmp_2,
    int32_T tmp_3);
  void propagateSize();
  void cleanupLayer();
  void predictEnqueueImpl(real32_T **inputs, real32_T **outputs);
};

#endif                         // MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803_h_

//
// File trailer for generated code.
//
// [EOF]
//
