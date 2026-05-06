//
// File: ex_DLModel_28_types.h
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
#ifndef ex_DLModel_28_types_h_
#define ex_DLModel_28_types_h_
#include "Yolov9t0_ex_DLModel_280.h"
#include "rtwtypes.h"
#include "MW_gstNetworkVideoReceive.h"

// DNN functions
extern void dlnetwork_layerPredictWithColMa(const real32_T varargin_1[1228800],
  real32_T varargout_1[1228800]);
extern void dlnetwork_layerPredictWithCol_k(const real32_T varargin_1[614400],
  real32_T varargout_1[614400]);
extern void dlnetwork_layerPredictWithCo_ky(const real32_T varargin_1[614400],
  real32_T varargout_1[307200], real32_T varargout_2[307200]);
extern void dlnetwork_layerPredictWithC_ky3(const real32_T varargin_1[307200],
  real32_T varargout_1[307200]);
extern void dlnetwork_layerPredictWit_ky3w2(const real32_T varargin_1[307200],
  real32_T varargout_1[153600], real32_T varargout_2[153600]);
extern void dlnetwork_layerPredictWi_ky3w2k(const real32_T varargin_1[76800],
  real32_T varargout_1[76800]);
extern void dlnetwork_layerPredictW_ky3w2k1(const real32_T varargin_1[153600],
  real32_T varargout_1[153600]);
extern void dlnetwork_layerPredict_ky3w2k15(const real32_T varargin_1[115200],
  real32_T varargout_1[115200]);
extern void dlnetwork_layerPredic_ky3w2k15c(const real32_T varargin_1[115200],
  real32_T varargout_1[57600], real32_T varargout_2[57600]);
extern void dlnetwork_layerPredi_ky3w2k15cy(const real32_T varargin_1[28800],
  real32_T varargout_1[28800]);
extern void dlnetwork_layerPred_ky3w2k15cyr(const real32_T varargin_1[57600],
  real32_T varargout_1[57600]);
extern void dlnetwork_layerPre_ky3w2k15cyr5(const real32_T varargin_1[38400],
  real32_T varargout_1[38400]);
extern void dlnetwork_layerPr_ky3w2k15cyr5m(const real32_T varargin_1[38400],
  real32_T varargout_1[19200], real32_T varargout_2[19200]);
extern void dlnetwork_layerP_ky3w2k15cyr5mq(const real32_T varargin_1[9600],
  real32_T varargout_1[9600]);
extern void dlnetwork_layer_ky3w2k15cyr5mql(const real32_T varargin_1[19200],
  real32_T varargout_1[19200]);
extern void dlnetwork_layerPredictWithCol_f(const real32_T varargin_1[38400],
  real32_T varargout_1[153600]);
extern void dlnetwork_layerPredictWithCo_kr(const real32_T varargin_1[115200],
  real32_T varargout_1[460800]);
extern void dlnetwork_layerPredictWithCol_j(const real32_T varargin_1[384000],
  real32_T varargout_1[384000]);
extern void dlnetwork_layerPredictWithCol_p(const real32_T varargin_1[96000],
  real32_T varargout_1[96000]);
extern void dlnetwork_layerPredictWithCol_m(const real32_T varargin_1[24000],
  real32_T varargout_1[24000]);

// Custom Type definition for MATLAB Function: '<Root>/Detection and Tracking'
#ifndef struct_sdAmwXbnJnEmimT0NaJRtAD_ex_DL_T
#define struct_sdAmwXbnJnEmimT0NaJRtAD_ex_DL_T

struct sdAmwXbnJnEmimT0NaJRtAD_ex_DL_T
{
  real_T tv_sec;
  real_T tv_nsec;
};

#endif                                // struct_sdAmwXbnJnEmimT0NaJRtAD_ex_DL_T

#ifndef struct_nvidiacoder_common_GstVisionD_T
#define struct_nvidiacoder_common_GstVisionD_T

struct nvidiacoder_common_GstVisionD_T
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  boolean_T Initialized;
  GstElement* Pipeline;
};

#endif                                // struct_nvidiacoder_common_GstVisionD_T

#ifndef struct_codertarget_linux_blocks_SDLV_T
#define struct_codertarget_linux_blocks_SDLV_T

struct codertarget_linux_blocks_SDLV_T
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  int32_T PixelFormatEnum;
};

#endif                                // struct_codertarget_linux_blocks_SDLV_T

#ifndef struct_emxArray_real32_T_100x1_ex_DL_T
#define struct_emxArray_real32_T_100x1_ex_DL_T

struct emxArray_real32_T_100x1_ex_DL_T
{
  real32_T data[100];
  int32_T size[2];
};

#endif                                // struct_emxArray_real32_T_100x1_ex_DL_T

#ifndef struct_emxArray_char_T_ex_DLModel_28_T
#define struct_emxArray_char_T_ex_DLModel_28_T

struct emxArray_char_T_ex_DLModel_28_T
{
  char_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_char_T_ex_DLModel_28_T

#ifndef struct_cell_wrap_0_ex_DLModel_28_T
#define struct_cell_wrap_0_ex_DLModel_28_T

struct cell_wrap_0_ex_DLModel_28_T
{
  emxArray_char_T_ex_DLModel_28_T *f1;
};

#endif                                 // struct_cell_wrap_0_ex_DLModel_28_T

#ifndef struct_emxArray_uint8_T_ex_DLModel_2_T
#define struct_emxArray_uint8_T_ex_DLModel_2_T

struct emxArray_uint8_T_ex_DLModel_2_T
{
  uint8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_uint8_T_ex_DLModel_2_T

#ifndef struct_emxArray_int32_T_ex_DLModel_2_T
#define struct_emxArray_int32_T_ex_DLModel_2_T

struct emxArray_int32_T_ex_DLModel_2_T
{
  int32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_int32_T_ex_DLModel_2_T

#ifndef struct_emxArray_uint16_T_ex_DLModel__T
#define struct_emxArray_uint16_T_ex_DLModel__T

struct emxArray_uint16_T_ex_DLModel__T
{
  uint16_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_uint16_T_ex_DLModel__T

#ifndef struct_emxArray_int8_T_ex_DLModel_28_T
#define struct_emxArray_int8_T_ex_DLModel_28_T

struct emxArray_int8_T_ex_DLModel_28_T
{
  int8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_int8_T_ex_DLModel_28_T

#ifndef struct_emxArray_boolean_T_ex_DLModel_T
#define struct_emxArray_boolean_T_ex_DLModel_T

struct emxArray_boolean_T_ex_DLModel_T
{
  boolean_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_boolean_T_ex_DLModel_T

#ifndef struct_emxArray_real32_T_ex_DLModel__T
#define struct_emxArray_real32_T_ex_DLModel__T

struct emxArray_real32_T_ex_DLModel__T
{
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_real32_T_ex_DLModel__T

#ifndef struct_emxArray_real_T_ex_DLModel_28_T
#define struct_emxArray_real_T_ex_DLModel_28_T

struct emxArray_real_T_ex_DLModel_28_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                // struct_emxArray_real_T_ex_DLModel_28_T
#endif                                 // ex_DLModel_28_types_h_

//
// File trailer for generated code.
//
// [EOF]
//
