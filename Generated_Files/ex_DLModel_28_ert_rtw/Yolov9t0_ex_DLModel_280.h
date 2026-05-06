//
// File: Yolov9t0_ex_DLModel_280.h
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
#ifndef Yolov9t0_ex_DLModel_280_h_
#define Yolov9t0_ex_DLModel_280_h_
#include "MWTensorrtTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#include "MWCNNLayer.hpp"
#include "MWInputLayer.hpp"
#include "MWConvLayer.hpp"
#include "MWTensorrtCustomLayerBase.hpp"
#include "MWConcatenationLayer.hpp"
#include "MWAvgPoolingLayer.hpp"
#include "MWAdditionLayer.hpp"
#include "MWElementwiseAffineLayer.hpp"
#include "MWMaxPoolingLayer.hpp"
#include "MWOutputLayer.hpp"
#include "MWActivationFunctionType.hpp"
#include "MWRNNParameterTypes.hpp"
#include "MWTargetTypes.hpp"
#include "shared_layers_export_macros.hpp"
#include "MWKernelHeaders.hpp"
#include "MWBatchStream.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtUtils.hpp"
#include "rtwtypes.h"

class Yolov9t0_ex_DLModel_280
{
 public:
  boolean_T isInitialized;
  boolean_T matlabCodegenIsDeleted;
  Yolov9t0_ex_DLModel_280();
  void setSize();
  void resetState();
  void setup();
  void activations(int32_T layerIdx);
  void cleanup();
  real32_T *getLayerOutput(int32_T layerIndex, int32_T portIndex);
  int32_T getLayerOutputSize(int32_T layerIndex, int32_T portIndex);
  real32_T *getInputDataPointer(int32_T index);
  real32_T *getInputDataPointer();
  real32_T *getOutputDataPointer(int32_T index);
  real32_T *getOutputDataPointer();
  int32_T getBatchSize();
  int32_T getOutputSequenceLength(int32_T layerIndex, int32_T portIndex);
  ~Yolov9t0_ex_DLModel_280();
 private:
  int32_T numLayers;
  MWTensorBase *inputTensors;
  MWTensorBase *outputTensors[3];
  MWCNNLayer *layers[584];
  MWTensorrtTarget::MWTargetNetworkImpl *targetImpl;
  void allocate();
  void postsetup();
  void deallocate();
};

#endif                                 // Yolov9t0_ex_DLModel_280_h_

//
// File trailer for generated code.
//
// [EOF]
//
