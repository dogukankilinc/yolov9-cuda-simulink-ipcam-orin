//
// File: MWResize2DLayer_Yolov9t0_ex_DLModel_2802.h
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
#ifndef MWResize2DLayer_Yolov9t0_ex_DLModel_2802_h_
#define MWResize2DLayer_Yolov9t0_ex_DLModel_2802_h_
#include "MWTensorrtCustomLayerBase.hpp"
#include "MWTensorrtTargetNetworkImpl.hpp"
#include <cstring>
#include "ex_DLModel_28_types.h"
#include "rtwtypes.h"

class MWResize2DLayer_Yolov9t0_ex_DLModel_2802 : public
  MWTensorrtCustomLayerBase
{
 public:
  MWResize2DLayer_Yolov9t0_ex_DLModel_2802();
  void createCustomLayer(MWTensorrtTarget::MWTargetNetworkImpl *targetImpl,
    MWTensorBase *tmp, MWTensorBase *tmp_0, const char_T *tmp_1, int32_T tmp_2);
  void propagateSize();
  void cleanupLayer();
  void predictEnqueueImpl(real32_T **inputs, real32_T **outputs);
};

#endif                            // MWResize2DLayer_Yolov9t0_ex_DLModel_2802_h_

//
// File trailer for generated code.
//
// [EOF]
//
