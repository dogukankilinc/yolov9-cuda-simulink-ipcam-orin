//
// File: MWSwishLayer_Yolov9t0_ex_DLModel_280142.h
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
#ifndef MWSwishLayer_Yolov9t0_ex_DLModel_280142_h_
#define MWSwishLayer_Yolov9t0_ex_DLModel_280142_h_
#include "MWTensorrtCustomLayerBase.hpp"
#include "MWTensorrtTargetNetworkImpl.hpp"
#include <cstring>
#include "ex_DLModel_28_types.h"
#include "rtwtypes.h"

class MWSwishLayer_Yolov9t0_ex_DLModel_280142 : public MWTensorrtCustomLayerBase
{
 public:
  MWSwishLayer_Yolov9t0_ex_DLModel_280142();
  void createCustomLayer(MWTensorrtTarget::MWTargetNetworkImpl *targetImpl,
    MWTensorBase *tmp, const char_T *tmp_0, int32_T tmp_1);
  void propagateSize();
  void cleanupLayer();
  void predictEnqueueImpl(real32_T **inputs, real32_T **outputs);
};

#endif                             // MWSwishLayer_Yolov9t0_ex_DLModel_280142_h_

//
// File trailer for generated code.
//
// [EOF]
//
