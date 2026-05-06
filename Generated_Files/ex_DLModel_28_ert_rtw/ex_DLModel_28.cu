//
// File: ex_DLModel_28.cu
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
#include "ex_DLModel_28.h"
#include "math_constants.h"
#include <stdio.h>
#include <stdlib.h>
#include "MWConstants.h"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "MWShuffleUtility.h"
#include "MWSortFunctors.h"
#include "MWSortWithIndexUtility.h"
#include "rtwtypes.h"
#include "ex_DLModel_28_types.h"
#include "Yolov9t0_ex_DLModel_280.h"
#include <string.h>
#include "ex_DLModel_28_private.h"
#include <stddef.h>
#include "coder_posix_time.h"
#include <math.h>

extern "C"
{

#include "rt_nonfinite.h"

}

// Forward declaration for local functions
static __global__ __launch_bounds__(512, 1) void ex_DL_c5_ex_DLModel_28_kernel67
  (const uint8_T B[307200], const uint8_T G[307200], const uint8_T R[307200],
   uint8_T RGB[921600]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel68
  (int16_T aux1[960]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel69
  (int16_T aux2[1280]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel70
  (const int16_T aux1[960], int16_T ipRowIndices[960], int8_T rowWeights[960]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel71
  (const int16_T aux2[1280], int16_T ipColIndices[1280], int8_T colWeights[1280]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel72
  (const int8_T rowWeights[960], int8_T rowWeightsTotal[480]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel73
  (const int8_T colWeights[1280], int8_T colWeightsTotal[640]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel74
  (const int8_T rowWeightsTotal[480], const int8_T rowWeights[960], const
   uint8_T image[921600], const int16_T ipRowIndices[960], uint8_T
   partialResize[921600]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel75
  (const int8_T colWeightsTotal[640], const int8_T colWeights[1280], const
   uint8_T partialResize[921600], const int16_T ipColIndices[1280], uint8_T out
   [921600]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel76
  (const uint8_T out[921600], uint8_T img[921600]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel77
  (const uint8_T img[921600], uint8_T partialResize[921600]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel78
  (const uint8_T partialResize[921600], uint8_T img[921600]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel79
  (const uint8_T img[921600], real32_T expl_temp_Data[921600]);
static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel153
  (const real32_T varargin_1_Data[921600], real32_T inputDataT_0_f1[921600]);
static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel154
  (const real32_T in[691200], real32_T varargout_1_Data[691200]);
static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel155
  (const real32_T b_in[172800], real32_T varargout_2_Data[172800]);
static __global__ __launch_bounds__(448, 1) void ex__dlnetwork_predict_kernel156
  (const real32_T c_in[43200], real32_T varargout_3_Data[43200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel80
  (const real32_T objX_Data[691200], real32_T objdata[691200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel81
  (const real32_T b_objX_Data[172800], real32_T b_objdata[172800]);
static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel82
  (const real32_T c_objX_Data[43200], real32_T c_objdata[43200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel83
  (const real32_T objdata[691200], real32_T matrixToCat[691200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel84
  (const real32_T matrixToCat[691200], real32_T intermediateResult[907200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel85
  (const real32_T b_objdata[172800], real32_T b_matrixToCat[172800]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel86
  (const real32_T b_matrixToCat[172800], real32_T intermediateResult[907200]);
static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel87
  (const real32_T c_objdata[43200], real32_T c_matrixToCat[43200]);
static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel88
  (const real32_T c_matrixToCat[43200], real32_T intermediateResult[907200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel89
  (const real32_T intermediateResult[907200], real32_T b_out_Data[907200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel90
  (const real32_T b_out_Data[907200], real32_T x[504000]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel91
  (real32_T x[504000]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel92
  (const real32_T b_out_Data[907200], real32_T xdata[403200]);
static __global__ __launch_bounds__(128, 1) void ReduceNonFirstDimLargeFirstDimK
  (const real32_T input[403200], real32_T output[25200], uint32_T
   preReduceDimSize, uint32_T reduceDimSize, uint32_T level, boolean_T
   isLastLevel);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel93
  (const real32_T maxVal[25200], const real32_T xdata[403200], real32_T xdata_0
   [403200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel94
  (const real32_T xdata[403200], real32_T xdata_0[403200]);
static __global__ __launch_bounds__(128, 1) void ReduceNonFirstDimLargeFirstDi_h
  (const real32_T input[403200], real32_T output[25200], uint32_T
   preReduceDimSize, uint32_T reduceDimSize, uint32_T level, boolean_T
   isLastLevel);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel95
  (const real32_T maxVal[25200], const real32_T xdata[403200], real32_T
   obj_Data[403200]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel96
  (const real32_T obj_Data[403200], real32_T xdata[403200]);
static __device__ int64_T ex_DLModel_computeEndIdx_device(int64_T start, int64_T
  end, int64_T stride);
static __global__ __launch_bounds__(64, 12) void ex_DLModel_28_convolutionKernel
  (const real32_T *inputTensor, const real32_T *weights, const real32_T *bias,
   real32_T *outputTensor);
static __global__ __launch_bounds__(256, 1) void ex_DL_c1_ex_DLModel_28_kernel97
  (const real32_T e_objX_Data[25200], real32_T maxVal[25200]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel98
  (real_T centersArray[12600]);
static __global__ __launch_bounds__(32, 1) void ex_DL_c1_ex_DLModel_28_kernel99(
  const int32_T y_data_tmp, real_T y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel100(
  const real_T apnd, const int32_T ndbl, real_T y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel110(
  const real_T apnd, const int32_T nm1d2, real_T y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel102(
  const real_T apnd, const int32_T nm1d2, real_T y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel103(
  const int32_T y_data_tmp, real_T b_y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel104(
  const real_T apnd, const int32_T ndbl, real_T b_y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel109(
  const real_T apnd, const int32_T nm1d2, real_T b_y_data[80]);
static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel106(
  const real_T apnd, const int32_T nm1d2, real_T b_y_data[80]);
static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel111
  (const real_T centersArray[12600], real32_T ConstantArray1[12600]);
static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel112
  (const real32_T maxVal[25200], real32_T sub1[12600], real32_T ConstantArray1
   [12600]);
static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel113
  (const real32_T sub1[12600], real32_T maxVal[25200], real32_T ConstantArray1
   [12600]);
static __global__ __launch_bounds__(256, 1) void ex_D_c1_ex_DLModel_28_kernel114
  (const int8_T fv[6300], const real32_T maxVal[25200], real32_T maxVal_0[25200]);
static __global__ __launch_bounds__(256, 1) void ex_D_c1_ex_DLModel_28_kernel115
  (const real32_T maxVal[25200], real32_T b_intermediateResult[529200]);
static __global__ __launch_bounds__(512, 1) void ex_D_c1_ex_DLModel_28_kernel116
  (const real32_T x[504000], real32_T b_intermediateResult[529200]);
static __global__ __launch_bounds__(512, 1) void ex_D_c1_ex_DLModel_28_kernel117
  (const real32_T b_intermediateResult[529200], real32_T b_x_Data[504000]);
static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel118
  (const real32_T b_intermediateResult[529200], const real32_T b_x_Data[504000],
   real32_T b_xdata[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel101(const real_T apnd, const int32_T ndbl, const
  int32_T tmp, real_T y_data[80]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel105(const real_T apnd, const int32_T ndbl, const
  int32_T tmp, real_T b_y_data[80]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel107(const real_T b_y_data[80], const real_T
  y_data[80], const int32_T X_size_dim0, const int32_T tmp, const int32_T tmp_0,
  real_T Y_data[4800], real_T X_data[4800]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel108(const real_T Y_data[4800], const int32_T tmp,
  emxArray_real_T_ex_DLModel_28_T centers);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel119(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T pred_Data, int32_T pred_Data_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel120(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T c_x_Data, int32_T c_x_Data_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel121(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel122(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp, real32_T b_xdata[6300],
  emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel123(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel124(const emxArray_real32_T_ex_DLModel__T
  pred_Data, const int32_T tmp_size, emxArray_real32_T_ex_DLModel__T d_x,
  int32_T d_x_dim0, int32_T pred_Data_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel125(const int32_T tmp, int8_T ii_data[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel126(const int32_T tmp, real32_T b_xdata[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel127(const real32_T b_xdata[6300], const int8_T
  ii_data[6300], const int32_T tmp, real_T score_data[6300], int8_T
  c_obj_Data_data[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel128(const int8_T c_obj_Data_data[6300], const
  real_T score_data[6300], const int32_T tmp, real_T c_out_data[6300], real_T
  idx_data[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel129(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T output);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel130(const real_T idx_data[6300], const int8_T tmp,
  const int16_T b_sizes_dim0, const int32_T tmp_0,
  emxArray_real32_T_ex_DLModel__T output);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel131(const real_T c_out_data[6300], const int16_T
  b_sizes_dim0, const int8_T tmp, const int8_T tmp_0, const int32_T tmp_1,
  emxArray_real32_T_ex_DLModel__T output);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel132(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel133(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel134(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300],
  int32_T box_dim0, int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel135(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel136(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel137(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T b_xdata[6300], emxArray_real32_T_ex_DLModel__T box);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel138(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel139(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel140(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel141(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel142(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel143(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T b_xdata[6300], emxArray_real32_T_ex_DLModel__T box,
  int32_T box_dim0, int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel144(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel145(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T bboxes_size_dim0, const int32_T tmp, real32_T bboxes_data[],
  int32_T output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel146(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T labelIds_data[], real32_T scores_data[], int32_T
  output_dim0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel147(const real_T score_data[6300], const int32_T
  tmp, real_T idx_data[6300], real_T c_out_data[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel148(const emxArray_real32_T_ex_DLModel__T box,
  const real_T idx_data[6300], const int32_T idx_size,
  emxArray_real32_T_ex_DLModel__T box_0, int32_T box_dim0, int32_T box_dim0_0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel149(const int8_T c_obj_Data_data[6300], const
  real_T idx_data[6300], const int32_T tmp, real32_T b_xdata[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel150(const emxArray_real32_T_ex_DLModel__T box,
  const int16_T iv14_data[6300], const int32_T varargin_1_tmp_size,
  emxArray_real32_T_ex_DLModel__T box_0, int32_T box_dim0, int32_T box_dim0_0);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel151(const int8_T c_obj_Data_data[6300], const
  real_T score_data[6300], const int16_T iv14_data[6300], const int32_T tmp,
  real_T c_out_data[6300], real_T idx_data[6300]);
static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel152(const emxArray_real32_T_ex_DLModel__T d_x,
  const emxArray_real32_T_ex_DLModel__T c_x_Data, const int32_T b, const int32_T
  currentIndex, const int32_T tmp, int8_T ii_data[6300], real32_T b_xdata[6300]);
static __global__ __launch_bounds__(512, 1) void ex_DLModel_28_Outputs_kernel2(
  const uint8_T outB[307200], uint8_T pln3[307200], const uint8_T outG[307200],
  uint8_T pln2[307200], const uint8_T outR[307200], uint8_T pln1[307200]);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel3
  (emxArray_char_T_ex_DLModel_28_T r4_f1, emxArray_char_T_ex_DLModel_28_T r3_f1,
   char_T cv4_dim0, char_T cv4_dim1, char_T cv4_dim2, char_T cv4_dim3, char_T
   cv4_dim4, char_T cv4_dim5, char_T cv4_dim6, char_T cv4_dim7, char_T cv4_dim8,
   char_T cv3_dim0, char_T cv3_dim1, char_T cv3_dim2, char_T cv3_dim3, char_T
   cv3_dim4, char_T cv3_dim5, char_T cv3_dim6, char_T cv3_dim7, char_T cv3_dim8);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel4
  (emxArray_char_T_ex_DLModel_28_T r7_f1, emxArray_char_T_ex_DLModel_28_T r6_f1,
   char_T cv7_dim0, char_T cv7_dim1, char_T cv7_dim2, char_T cv7_dim3, char_T
   cv7_dim4, char_T cv6_dim0, char_T cv6_dim1, char_T cv6_dim2, char_T cv6_dim3,
   char_T cv6_dim4);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel5
  (emxArray_char_T_ex_DLModel_28_T r16_f1, emxArray_char_T_ex_DLModel_28_T
   r15_f1, char_T cv17_dim0, char_T cv17_dim1, char_T cv17_dim2, char_T
   cv16_dim0, char_T cv16_dim1, char_T cv16_dim2);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel6
  (emxArray_char_T_ex_DLModel_28_T r19_f1, emxArray_char_T_ex_DLModel_28_T
   r18_f1, char_T cv19_dim0, char_T cv19_dim1, char_T cv19_dim2, char_T
   cv19_dim3, char_T cv19_dim4, char_T cv18_dim0, char_T cv18_dim1, char_T
   cv18_dim2, char_T cv18_dim3, char_T cv18_dim4);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel7
  (emxArray_char_T_ex_DLModel_28_T r26_f1, emxArray_char_T_ex_DLModel_28_T
   r25_f1, char_T cv26_dim0, char_T cv26_dim1, char_T cv26_dim2, char_T
   cv26_dim3, char_T cv26_dim4, char_T cv26_dim5, char_T cv26_dim6, char_T
   cv26_dim7, char_T cv25_dim0, char_T cv25_dim1, char_T cv25_dim2, char_T
   cv25_dim3, char_T cv25_dim4, char_T cv25_dim5, char_T cv25_dim6, char_T
   cv25_dim7);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel8
  (emxArray_char_T_ex_DLModel_28_T r45_f1, emxArray_char_T_ex_DLModel_28_T
   r44_f1, char_T cv45_dim0, char_T cv45_dim1, char_T cv45_dim2, char_T
   cv45_dim3, char_T cv45_dim4, char_T cv44_dim0, char_T cv44_dim1, char_T
   cv44_dim2, char_T cv44_dim3, char_T cv44_dim4);
static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel9
  (emxArray_char_T_ex_DLModel_28_T r55_f1, emxArray_char_T_ex_DLModel_28_T
   r54_f1, char_T cv55_dim0, char_T cv55_dim1, char_T cv55_dim2, char_T
   cv55_dim3, char_T cv55_dim4, char_T cv54_dim0, char_T cv54_dim1, char_T
   cv54_dim2, char_T cv54_dim3, char_T cv54_dim4);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel10
  (emxArray_char_T_ex_DLModel_28_T r81_f1, emxArray_char_T_ex_DLModel_28_T
   r80_f1, emxArray_char_T_ex_DLModel_28_T r79_f1, char_T cv80_dim0, char_T
   cv80_dim1, char_T cv80_dim2, char_T cv80_dim3, char_T cv80_dim4, char_T
   cv80_dim5, char_T cv80_dim6, char_T cv80_dim7, char_T cv80_dim8, char_T
   cv80_dim9, char_T cv79_dim0, char_T cv79_dim1, char_T cv79_dim2, char_T
   cv79_dim3, char_T cv79_dim4, char_T cv79_dim5, char_T cv79_dim6, char_T
   cv79_dim7, char_T cv79_dim8, char_T cv79_dim9, char_T cv78_dim0, char_T
   cv78_dim1, char_T cv78_dim2, char_T cv78_dim3, char_T cv78_dim4, char_T
   cv78_dim5, char_T cv78_dim6, char_T cv78_dim7, char_T cv78_dim8, char_T
   cv78_dim9);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel11(
  const int32_T b_nbytes, char_T validatedHoleFilling_f1_data[15]);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel14
  (uint8_T b_color_data[3], uint8_T color_data[3], uint8_T uv_dim0, uint8_T
   uv_dim1, uint8_T uv_dim2);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel16(
  const real_T inPosition_data[4], int32_T position_data[4]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel17
  (uint8_T RGB[921600]);
static __global__ __launch_bounds__(128, 1) void ex_DL_c2_ex_DLModel_28_kernel18
  (uint8_T pixCount[640]);
static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel20
  (const uint8_T RGB[921600], uint8_T In[921600]);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel42(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_lenFirstSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel38(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel41(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel25(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_cg);
static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel27
  (const uint8_T RGB[921600], uint8_T In[921600]);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel29(
  const uint16_T uv1[256], const int32_T textLocAndWidth_idx_1, const
  emxArray_uint8_T_ex_DLModel_2_T thisTextU16, uint16_T *tmp3);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel66(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_lenFirstSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel62(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel65(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel48(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_cg);
static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel52(
  const uint16_T uv1[256], const int32_T b_nz, const
  emxArray_uint8_T_ex_DLModel_2_T thisTextU16, uint16_T *tmp3);
static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel56
  (const uint8_T In[921600], uint8_T outB[307200], uint8_T outG[307200], uint8_T
   outR[307200]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel12(const char_T validatedHoleFilling_f1_data[15],
  const int32_T tmp, char_T varargin_1_data[15]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel13(const char_T validatedHoleFilling_f1_data[15],
  const int32_T tmp, char_T varargin_1_data[15]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel15(const real32_T bboxes_data[], const int32_T
  bboxes_size_dim0, const int32_T vlen, const int32_T tmp, real_T
  inPosition_data[4]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel19(const real32_T bboxes_data[], const int32_T
  bboxes_size_dim0, const int32_T vlen, const int32_T tmp, int32_T
  position_data[4]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel21(const emxArray_char_T_ex_DLModel_28_T b_str,
  const int32_T i_vlen, emxArray_uint8_T_ex_DLModel_2_T thisTextU16);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel22(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel23(const emxArray_int32_T_ex_DLModel_2_T b_ii,
  const int32_T tmp, emxArray_int32_T_ex_DLModel_2_T idxNewlineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel24(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b, emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel26(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel28(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel30(const uint8_T uv9[10664], const int32_T g_nz,
  const int32_T tmp, uint8_T uv9_data[10664]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel31(const uint8_T uv9_data[10664], const int8_T
  b_varargin_1_dim0, const int32_T uv9_size_dim0, const int32_T b_varargin_1,
  const int32_T tmp, uint8_T uv9_data_0[144]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel32(const uint8_T uv9_data[144], const int32_T tmp,
  uint8_T b_thisGlyphBitmap_data[144]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel33(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T b_nbytes, emxArray_uint16_T_ex_DLModel__T
  thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel34(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel35(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel36(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T b_nbytes,
  const int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel37(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel39(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T g_nz, const
  int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel40(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel43(const real_T inPosition_data[4], const int32_T
  tmp, int32_T position_data[4]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel44(const emxArray_char_T_ex_DLModel_28_T str,
  const int32_T nbytes, emxArray_uint8_T_ex_DLModel_2_T thisTextU16);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel45(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel46(const emxArray_int32_T_ex_DLModel_2_T b_ii,
  const int32_T tmp, emxArray_int32_T_ex_DLModel_2_T idxNewlineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel47(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b, emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel49(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel50(const int32_T tmp, const int32_T tmp_0,
  uint8_T In[921600]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel51(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel53(const uint8_T uv5[31620], const int32_T
  d_tbWidth, const int32_T tmp, uint8_T uv5_data[31620]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel54(const uint8_T uv5_data[31620], const int8_T
  b_varargin_1_dim0, const int32_T uv5_size_dim0, const int32_T b_varargin_1,
  const int32_T tmp, uint8_T uv5_data_0[441]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel55(const uint8_T uv5_data[441], const int32_T tmp,
  uint8_T thisGlyphBitmap_data[441]);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel57(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T nbytes, emxArray_uint16_T_ex_DLModel__T
  thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel58(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel59(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel60(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T b_nbytes,
  const int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel61(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel63(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T i_vlen, const
  int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b);
static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel64(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar);
static __global__ __launch_bounds__(1024, 1) void ex_DLModel_28_Outputs_kernel1(
  const real32_T tmp_data[400], const int32_T tmp, real32_T bboxes[400]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_h
  (const real32_T varargin_1[1228800], real32_T varargout_1[1228800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_hp
  (const real32_T varargin_1[614400], real32_T varargout_1[614400]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithC_hpj
  (const real32_T varargin_1[614400], real32_T varargout_2[307200], real32_T
   varargout_1[307200]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWith_hpjj
  (const real32_T varargin_1[307200], real32_T varargout_1[307200]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWit_hpjj3
  (const real32_T varargin_1[307200], real32_T varargout_2[153600], real32_T
   varargout_1[153600]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWi_hpjj3v
  (const real32_T varargin_1[76800], real32_T varargout_1[76800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictW_hpjj3vv
  (const real32_T varargin_1[153600], real32_T varargout_1[153600]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredict_hpjj3vvu
  (const real32_T varargin_1[115200], real32_T varargout_1[115200]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredic_hpjj3vvuu
  (const real32_T varargin_1[115200], real32_T varargout_2[57600], real32_T
   varargout_1[57600]);
static __global__ __launch_bounds__(288, 1) void dlnetwork_layerPredi_hpjj3vvuuj
  (const real32_T varargin_1[28800], real32_T varargout_1[28800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPred_hpjj3vvuujy
  (const real32_T varargin_1[57600], real32_T varargout_1[57600]);
static __global__ __launch_bounds__(384, 1) void dlnetwork_layerPre_hpjj3vvuujyh
  (const real32_T varargin_1[38400], real32_T varargout_1[38400]);
static __global__ __launch_bounds__(192, 1) void dlnetwork_layerPr_hpjj3vvuujyhl
  (const real32_T varargin_1[38400], real32_T varargout_2[19200], real32_T
   varargout_1[19200]);
static __global__ __launch_bounds__(128, 1) void dlnetwork_layerP_hpjj3vvuujyhly
  (const real32_T varargin_1[9600], real32_T varargout_1[9600]);
static __global__ __launch_bounds__(192, 1) void dlnetwork_layer_hpjj3vvuujyhlyi
  (const real32_T varargin_1[19200], real32_T varargout_1[19200]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_mk
  (const real32_T varargin_1[38400], const int8_T xq[30], real32_T out[76800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_o
  (const real32_T out[76800], real32_T in[76800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_ms
  (const real32_T in[76800], const int8_T b_xq[40], real32_T b_out[153600]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_g5
  (const real32_T b_out[153600], real32_T varargout_1[153600]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_jk
  (const real32_T varargin_1[115200], const int8_T xq[60], real32_T out[230400]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_l
  (const real32_T out[230400], real32_T in[230400]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_b
  (const real32_T in[230400], const int8_T b_xq[80], real32_T b_out[460800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_jh
  (const real32_T b_out[460800], real32_T varargout_1[460800]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_oo
  (const real32_T varargin_1[384000], real32_T varargout_1[384000]);
static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_hb
  (const real32_T varargin_1[96000], real32_T varargout_1[96000]);
static __global__ __launch_bounds__(224, 1) void dlnetwork_layerPredictWithCo_bl
  (const real32_T varargin_1[24000], real32_T varargout_1[24000]);
void addFPSModelClass::e_GstVisionDataReceive_stepImpl
  (nvidiacoder_common_GstVisionD_T *obj, uint8_T varargout_1[307200], uint8_T
   varargout_2[307200], uint8_T varargout_3[307200])
{
  if (obj->Initialized) {
    int32_T readStatus;

    // Start for MATLABSystem: '<Root>/Network Video Receive'
    readStatus = Pull_frame_RGB(&obj->Pipeline, 640.0, 480.0, &varargout_1[0],
      &varargout_2[0], &varargout_3[0]);
    if (readStatus != 0) {
      obj->Initialized = false;
    }
  }
}

void addFPSModelClass::ex_DLModel_28_SystemCore_step
  (nvidiacoder_common_GstVisionD_T *obj, uint8_T varargout_1[307200], uint8_T
   varargout_2[307200], uint8_T varargout_3[307200])
{
  e_GstVisionDataReceive_stepImpl(obj, varargout_1, varargout_2, varargout_3);
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c5_ex_DLModel_28_kernel67
  (const uint8_T B[307200], const uint8_T G[307200], const uint8_T R[307200],
   uint8_T RGB[921600])
{
  uint64_T gThreadId;
  int32_T RGB_tmp;
  int32_T tmp;
  gThreadId = mwGetGlobalThreadIndex();
  RGB_tmp = static_cast<int32_T>(gThreadId % 480UL);
  tmp = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(RGB_tmp)) /
    480UL);
  if (tmp < 640) {
    int32_T RGB_tmp_0;
    RGB_tmp_0 = 640 * RGB_tmp + tmp;
    RGB_tmp += 480 * tmp;
    RGB[RGB_tmp] = R[RGB_tmp_0];
    RGB[RGB_tmp + 307200] = G[RGB_tmp_0];
    RGB[RGB_tmp + 614400] = B[RGB_tmp_0];
  }
}

// Function for MATLAB Function: '<Root>/RGBToImg'
void addFPSModelClass::ex_DLModel_28_c5_ex_DLModel_28(const uint8_T R[307200],
  const uint8_T G[307200], const uint8_T B[307200], uint8_T RGB[921600])
{
  ex_DL_c5_ex_DLModel_28_kernel67<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>(B,
    G, R, RGB);
}

void addFPSModelClass::ex_DLModel_gpuEmxReset_real32_T
  (emxArray_real32_T_ex_DLModel__T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_real32_T_ex_DLModel__T));
}

void addFPSModelClass::ex_DLModel_2_gpuEmxReset_real_T
  (emxArray_real_T_ex_DLModel_28_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_real_T_ex_DLModel_28_T));
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::ex_DLModel_28_dlnetwork_setup(Yolov9t0_ex_DLModel_280
  *obj)
{
  obj->setup();
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel68
  (int16_T aux1[960])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 960) {
    if (oldIdx + 1 <= 480) {
      aux1[oldIdx] = static_cast<int16_T>(oldIdx + 1);
    } else {
      aux1[oldIdx] = static_cast<int16_T>(960 - oldIdx);
    }
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel69
  (int16_T aux2[1280])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 1280) {
    if (oldIdx + 1 <= 640) {
      aux2[oldIdx] = static_cast<int16_T>(oldIdx + 1);
    } else {
      aux2[oldIdx] = static_cast<int16_T>(1280 - oldIdx);
    }
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel70
  (const int16_T aux1[960], int16_T ipRowIndices[960], int8_T rowWeights[960])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 2UL);
  iv0 = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(b_ix)) / 2UL);
  if (iv0 < 480) {
    int32_T i_i;
    i_i = 480 * b_ix + iv0;
    rowWeights[i_i] = static_cast<int8_T>((1 - b_ix) * static_cast<int32_T>
      (-b_ix < 0) + (b_ix + 1) * static_cast<int32_T>(-b_ix >= 0));
    b_ix = (iv0 + b_ix) + 1;
    iv0 = b_ix - 1;
    if (b_ix - 1 == 0) {
      iv0 = 0;
    }

    ipRowIndices[i_i] = aux1[iv0];
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel71
  (const int16_T aux2[1280], int16_T ipColIndices[1280], int8_T colWeights[1280])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 2UL);
  iv0 = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(b_ix)) / 2UL);
  if (iv0 < 640) {
    int32_T i_i;
    i_i = 640 * b_ix + iv0;
    colWeights[i_i] = static_cast<int8_T>((1 - b_ix) * static_cast<int32_T>
      (-b_ix < 0) + (b_ix + 1) * static_cast<int32_T>(-b_ix >= 0));
    b_ix = (iv0 + b_ix) + 1;
    iv0 = b_ix - 1;
    if (b_ix - 1 == 0) {
      iv0 = 0;
    }

    ipColIndices[i_i] = aux2[iv0];
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel72
  (const int8_T rowWeights[960], int8_T rowWeightsTotal[480])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 480) {
    rowWeightsTotal[oldIdx] = static_cast<int8_T>(static_cast<int32_T>
      (rowWeights[oldIdx + 480]) + static_cast<int32_T>(rowWeights[oldIdx]));
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel73
  (const int8_T colWeights[1280], int8_T colWeightsTotal[640])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 640) {
    colWeightsTotal[oldIdx] = static_cast<int8_T>(static_cast<int32_T>
      (colWeights[oldIdx + 640]) + static_cast<int32_T>(colWeights[oldIdx]));
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel74
  (const int8_T rowWeightsTotal[480], const int8_T rowWeights[960], const
   uint8_T image[921600], const int16_T ipRowIndices[960], uint8_T
   partialResize[921600])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 3UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(b_ix)) / 3UL;
  iv0 = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 480UL;
  if (static_cast<int32_T>(gThreadId) < 640) {
    real_T sumVal;
    sumVal = 0.0;
    for (int32_T i_i = 0; i_i < 2; i_i++) {
      int32_T oldIdx;
      oldIdx = 480 * i_i + iv0;
      sumVal += static_cast<real_T>(image[((480 * static_cast<int32_T>(gThreadId)
        + static_cast<int32_T>(ipRowIndices[oldIdx])) + (2 - b_ix) * 307200) - 1])
        * (static_cast<real_T>(rowWeights[oldIdx]) / static_cast<real_T>
           (rowWeightsTotal[iv0]));
    }

    sumVal = round(sumVal);
    if (sumVal < 256.0) {
      partialResize[(iv0 + 480 * static_cast<int32_T>(gThreadId)) + 307200 *
        b_ix] = static_cast<uint8_T>(sumVal);
    } else {
      partialResize[(iv0 + 480 * static_cast<int32_T>(gThreadId)) + 307200 *
        b_ix] = MAX_uint8_T;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel75
  (const int8_T colWeightsTotal[640], const int8_T colWeights[1280], const
   uint8_T partialResize[921600], const int16_T ipColIndices[1280], uint8_T out
   [921600])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 3UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(b_ix)) / 3UL;
  iv0 = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 480UL;
  if (static_cast<int32_T>(gThreadId) < 640) {
    real_T sumVal;
    sumVal = 0.0;
    for (int32_T i_i = 0; i_i < 2; i_i++) {
      int32_T oldIdx;
      oldIdx = 640 * i_i + static_cast<int32_T>(gThreadId);
      sumVal += static_cast<real_T>(partialResize[((static_cast<int32_T>
        (ipColIndices[oldIdx]) - 1) * 480 + iv0) + 307200 * b_ix]) * (
        static_cast<real_T>(colWeights[oldIdx]) / static_cast<real_T>
        (colWeightsTotal[static_cast<int32_T>(gThreadId)]));
    }

    sumVal = round(sumVal);
    if (sumVal < 256.0) {
      out[(iv0 + 480 * static_cast<int32_T>(gThreadId)) + 307200 * b_ix] =
        static_cast<uint8_T>(sumVal);
    } else {
      out[(iv0 + 480 * static_cast<int32_T>(gThreadId)) + 307200 * b_ix] =
        MAX_uint8_T;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel76
  (const uint8_T out[921600], uint8_T img[921600])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(b_ix)) / 480UL;
  iv0 = static_cast<int32_T>(gThreadId % 640UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 640UL;
  if (static_cast<int32_T>(gThreadId) < 3) {
    b_ix = (480 * iv0 + b_ix) + 307200 * static_cast<int32_T>(gThreadId);
    img[b_ix] = out[b_ix];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel77
  (const uint8_T img[921600], uint8_T partialResize[921600])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 921600) {
    partialResize[oldIdx] = img[oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel78
  (const uint8_T partialResize[921600], uint8_T img[921600])
{
  uint64_T gThreadId;
  int32_T b_ix;
  int32_T iv0;
  gThreadId = mwGetGlobalThreadIndex();
  b_ix = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(b_ix)) / 480UL;
  iv0 = static_cast<int32_T>(gThreadId % 640UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 640UL;
  if (static_cast<int32_T>(gThreadId) < 3) {
    b_ix = (480 * iv0 + b_ix) + 307200 * static_cast<int32_T>(gThreadId);
    img[b_ix] = partialResize[b_ix];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel79
  (const uint8_T img[921600], real32_T expl_temp_Data[921600])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 480UL;
  iv0 = static_cast<int32_T>(gThreadId % 640UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 640UL;
  if (static_cast<int32_T>(gThreadId) < 3) {
    ix += 480 * iv0;
    expl_temp_Data[ix + 307200 * static_cast<int32_T>(gThreadId)] =
      static_cast<real32_T>(img[(2 - static_cast<int32_T>(gThreadId)) * 307200 +
      ix]) / 255.0F;
  }
}

static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel153
  (const real32_T varargin_1_Data[921600], real32_T inputDataT_0_f1[921600])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_0;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_0 = static_cast<int32_T>(gThreadId % 640UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_0)) / 640UL;
  tmp = static_cast<int32_T>(gThreadId % 480UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 480UL;
  if (static_cast<int32_T>(gThreadId) < 3) {
    inputDataT_0_f1[(tmp_0 + 640 * tmp) + 307200 * static_cast<int32_T>
      (gThreadId)] = varargin_1_Data[(480 * tmp_0 + tmp) + 307200 *
      static_cast<int32_T>(gThreadId)];
  }
}

static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel154
  (const real32_T in[691200], real32_T varargout_1_Data[691200])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_0;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_0 = static_cast<int32_T>(gThreadId % 60UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_0)) / 60UL;
  tmp = static_cast<int32_T>(gThreadId % 80UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 80UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    varargout_1_Data[(tmp_0 + 60 * tmp) + 4800 * static_cast<int32_T>(gThreadId)]
      = in[(80 * tmp_0 + tmp) + 4800 * static_cast<int32_T>(gThreadId)];
  }
}

static __global__ __launch_bounds__(512, 1) void ex__dlnetwork_predict_kernel155
  (const real32_T b_in[172800], real32_T varargout_2_Data[172800])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_0;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_0 = static_cast<int32_T>(gThreadId % 30UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_0)) / 30UL;
  tmp = static_cast<int32_T>(gThreadId % 40UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 40UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    varargout_2_Data[(tmp_0 + 30 * tmp) + 1200 * static_cast<int32_T>(gThreadId)]
      = b_in[(40 * tmp_0 + tmp) + 1200 * static_cast<int32_T>(gThreadId)];
  }
}

static __global__ __launch_bounds__(448, 1) void ex__dlnetwork_predict_kernel156
  (const real32_T c_in[43200], real32_T varargout_3_Data[43200])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_0;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_0 = static_cast<int32_T>(gThreadId % 15UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_0)) / 15UL;
  tmp = static_cast<int32_T>(gThreadId % 20UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 20UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    varargout_3_Data[(tmp_0 + 15 * tmp) + 300 * static_cast<int32_T>(gThreadId)]
      = c_in[(20 * tmp_0 + tmp) + 300 * static_cast<int32_T>(gThreadId)];
  }
}

void addFPSModelClass::ex_DLModel_28_gpuThrowError(uint32_T errorCode, const
  char_T *errorName, const char_T *errorString, const char_T *file, int32_T line)
{
  fprintf(stderr,
          "CUDA error [%d,%s] : %s\nFile: \"%s\"\nLine: %d\nTerminating execution...",
          errorCode, errorName, errorString, file, line);
  exit(1);
}

void addFPSModelClass::ex_DLModel_28_checkCudaError(cudaError_t errorCode, const
  char_T *file, int32_T line)
{
  if (errorCode != cudaSuccess) {
    ex_DLModel_28_gpuThrowError(errorCode, cudaGetErrorName(errorCode),
      cudaGetErrorString(errorCode), file, line);
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::ex_DLModel_28_dlnetwork_predict(Yolov9t0_ex_DLModel_280
  *obj, const real32_T varargin_1_Data[921600], real32_T varargout_1_Data[691200],
  real32_T varargout_2_Data[172800], real32_T varargout_3_Data[43200])
{
  real32_T (*gpu_inputDataT_0_f1)[921600];
  real32_T (*gpu_in)[691200];
  real32_T (*gpu_b_in)[172800];
  real32_T (*gpu_c_in)[43200];
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_in, 172800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_in, 691200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_in, 2764800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_inputDataT_0_f1, 3686400UL),
    __FILE__, __LINE__);
  ex__dlnetwork_predict_kernel153<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1_Data, *gpu_inputDataT_0_f1);
  ex_DLModel_28_checkCudaError(cudaMemcpy(obj->getInputDataPointer(0),
    *gpu_inputDataT_0_f1, obj->getLayerOutputSize(0, 0),
    cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
  obj->activations(583);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_in, obj->getLayerOutput(407, 0),
    obj->getLayerOutputSize(407, 0), cudaMemcpyDeviceToDevice), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_b_in, obj->getLayerOutput(495, 0),
    obj->getLayerOutputSize(495, 0), cudaMemcpyDeviceToDevice), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_c_in, obj->getLayerOutput(583, 0),
    obj->getLayerOutputSize(583, 0), cudaMemcpyDeviceToDevice), __FILE__,
    __LINE__);
  ex__dlnetwork_predict_kernel154<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_in, varargout_1_Data);
  ex__dlnetwork_predict_kernel155<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_in, varargout_2_Data);
  ex__dlnetwork_predict_kernel156<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*gpu_c_in, varargout_3_Data);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_inputDataT_0_f1), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_in), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_in), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_in), __FILE__, __LINE__);
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel80
  (const real32_T objX_Data[691200], real32_T objdata[691200])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  iv0 = static_cast<int32_T>(gThreadId % 60UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 60UL;
  ix = static_cast<int32_T>(gThreadId % 80UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 80UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    objdata[(ix + 80 * iv0) + 4800 * static_cast<int32_T>(gThreadId)] =
      objX_Data[(ix * 60 + iv0) + static_cast<int32_T>(gThreadId) * 4800];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel81
  (const real32_T b_objX_Data[172800], real32_T b_objdata[172800])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  iv0 = static_cast<int32_T>(gThreadId % 30UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 30UL;
  ix = static_cast<int32_T>(gThreadId % 40UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 40UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    b_objdata[(ix + 40 * iv0) + 1200 * static_cast<int32_T>(gThreadId)] =
      b_objX_Data[(ix * 30 + iv0) + static_cast<int32_T>(gThreadId) * 1200];
  }
}

static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel82
  (const real32_T c_objX_Data[43200], real32_T c_objdata[43200])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  iv0 = static_cast<int32_T>(gThreadId % 15UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 15UL;
  ix = static_cast<int32_T>(gThreadId % 20UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 20UL;
  if (static_cast<int32_T>(gThreadId) < 144) {
    c_objdata[(ix + 20 * iv0) + 300 * static_cast<int32_T>(gThreadId)] =
      c_objX_Data[(ix * 15 + iv0) + static_cast<int32_T>(gThreadId) * 300];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel83
  (const real32_T objdata[691200], real32_T matrixToCat[691200])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 144UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 144UL);
  if (oldIdx < 4800) {
    matrixToCat[ix + 144 * oldIdx] = objdata[4800 * ix + oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel84
  (const real32_T matrixToCat[691200], real32_T intermediateResult[907200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 691200) {
    intermediateResult[oldIdx] = matrixToCat[oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel85
  (const real32_T b_objdata[172800], real32_T b_matrixToCat[172800])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 144UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 144UL);
  if (oldIdx < 1200) {
    b_matrixToCat[ix + 144 * oldIdx] = b_objdata[1200 * ix + oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel86
  (const real32_T b_matrixToCat[172800], real32_T intermediateResult[907200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 172800) {
    intermediateResult[oldIdx + 691200] = b_matrixToCat[oldIdx];
  }
}

static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel87
  (const real32_T c_objdata[43200], real32_T c_matrixToCat[43200])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 144UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 144UL);
  if (oldIdx < 300) {
    c_matrixToCat[ix + 144 * oldIdx] = c_objdata[300 * ix + oldIdx];
  }
}

static __global__ __launch_bounds__(448, 1) void ex_DL_c1_ex_DLModel_28_kernel88
  (const real32_T c_matrixToCat[43200], real32_T intermediateResult[907200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 43200) {
    intermediateResult[oldIdx + 864000] = c_matrixToCat[oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel89
  (const real32_T intermediateResult[907200], real32_T b_out_Data[907200])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 144) {
    b_out_Data[ix + 6300 * oldIdx] = intermediateResult[144 * ix + oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel90
  (const real32_T b_out_Data[907200], real32_T x[504000])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 80) {
    x[ix + 6300 * oldIdx] = -b_out_Data[(oldIdx + 64) * 6300 + ix];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel91
  (real32_T x[504000])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 504000) {
    x[oldIdx] = 1.0F / (expf(x[oldIdx]) + 1.0F);
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel92
  (const real32_T b_out_Data[907200], real32_T xdata[403200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 403200) {
    xdata[oldIdx] = b_out_Data[oldIdx];
  }
}

static __global__ __launch_bounds__(128, 1) void ReduceNonFirstDimLargeFirstDimK
  (const real32_T input[403200], real32_T output[25200], uint32_T
   preReduceDimSize, uint32_T reduceDimSize, uint32_T level, boolean_T
   isLastLevel)
{
  __shared__ real32_T shared[128];
  int32_T tmp;
  real32_T v_0;
  uint32_T actualElemsPerThread;
  uint32_T blockIdxZ_tmp;
  uint32_T gridSizeX;
  uint32_T loadIdx;
  uint32_T rowIdx;
  uint32_T warpId;
  uint32_T warpId_tmp_tmp;
  actualElemsPerThread = 32U;
  if (reduceDimSize < 128U) {
    actualElemsPerThread = static_cast<uint32_T>(static_cast<int32_T>
      ((reduceDimSize - 1U) >> 2) + 1);
  }

  gridSizeX = static_cast<uint32_T>(static_cast<int32_T>((preReduceDimSize - 1U)
    >> 5) + 1);
  rowIdx = actualElemsPerThread << 2;
  if (rowIdx == 0U) {
    tmp = MAX_int32_T;

    // Divide by zero handler
  } else {
    tmp = static_cast<int32_T>((reduceDimSize - 1U) / rowIdx);
  }

  blockIdxZ_tmp = mwGetBlockIndex();
  rowIdx = static_cast<uint32_T>(tmp + 1) * gridSizeX;
  if (rowIdx == 0U) {
    tmp = MAX_int32_T;

    // Divide by zero handler
  } else {
    tmp = static_cast<int32_T>(blockIdxZ_tmp / rowIdx);
  }

  warpId_tmp_tmp = mwGetThreadIndexWithinBlock();
  warpId = warpId_tmp_tmp >> 5;
  blockIdxZ_tmp %= rowIdx;
  rowIdx = ((blockIdxZ_tmp % gridSizeX) << 5) + warpId_tmp_tmp % 32U;
  gridSizeX = ((blockIdxZ_tmp / gridSizeX * actualElemsPerThread) << 2) + warpId;
  blockIdxZ_tmp = (preReduceDimSize * reduceDimSize * static_cast<uint32_T>(tmp)
                   + preReduceDimSize * gridSizeX) + rowIdx;
  if ((static_cast<int32_T>((static_cast<int32_T>(rowIdx < preReduceDimSize)) &&
        (static_cast<int32_T>(gridSizeX < reduceDimSize)))) &&
      (static_cast<int32_T>(level == 0U))) {
    shared[warpId_tmp_tmp] = input[blockIdxZ_tmp];
  }

  for (loadIdx = 1U; loadIdx < actualElemsPerThread; loadIdx++) {
    blockIdxZ_tmp += preReduceDimSize << 2;
    if ((static_cast<int32_T>(rowIdx < preReduceDimSize)) &&
        (static_cast<int32_T>((loadIdx << 2) + gridSizeX < reduceDimSize))) {
      if (level == 0U) {
        v_0 = input[blockIdxZ_tmp];
      }

      shared[warpId_tmp_tmp] = fmaxf(shared[warpId_tmp_tmp], v_0);
    }
  }

  __syncthreads();
  if ((static_cast<int32_T>(warpId == 0U)) && (static_cast<int32_T>(rowIdx <
        preReduceDimSize))) {
    v_0 = shared[warpId_tmp_tmp];
    loadIdx = 1U;
    while ((static_cast<int32_T>(loadIdx < 4U)) && (static_cast<int32_T>
            (gridSizeX + loadIdx < reduceDimSize))) {
      v_0 = fmaxf(shared[(loadIdx << 5) + warpId_tmp_tmp], v_0);
      loadIdx++;
    }

    if (isLastLevel) {
      output[static_cast<uint32_T>(tmp) * preReduceDimSize + rowIdx] = v_0;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel93
  (const real32_T maxVal[25200], const real32_T xdata[403200], real32_T xdata_0
   [403200])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 6300UL;
  iv0 = static_cast<int32_T>(gThreadId % 16UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 16UL;
  if (static_cast<int32_T>(gThreadId) < 4) {
    iv0 = (6300 * iv0 + ix) + 100800 * static_cast<int32_T>(gThreadId);
    xdata_0[iv0] = xdata[iv0] - maxVal[6300 * static_cast<int32_T>(gThreadId) +
      ix];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel94
  (const real32_T xdata[403200], real32_T xdata_0[403200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 403200) {
    xdata_0[oldIdx] = expf(xdata[oldIdx]);
  }
}

static __global__ __launch_bounds__(128, 1) void ReduceNonFirstDimLargeFirstDi_h
  (const real32_T input[403200], real32_T output[25200], uint32_T
   preReduceDimSize, uint32_T reduceDimSize, uint32_T level, boolean_T
   isLastLevel)
{
  __shared__ real32_T shared[128];
  int32_T tmp;
  real32_T v_0;
  uint32_T actualElemsPerThread;
  uint32_T blockIdxZ_tmp;
  uint32_T gridSizeX;
  uint32_T loadIdx;
  uint32_T rowIdx;
  uint32_T warpId;
  uint32_T warpId_tmp_tmp;
  actualElemsPerThread = 32U;
  if (reduceDimSize < 128U) {
    actualElemsPerThread = static_cast<uint32_T>(static_cast<int32_T>
      ((reduceDimSize - 1U) >> 2) + 1);
  }

  gridSizeX = static_cast<uint32_T>(static_cast<int32_T>((preReduceDimSize - 1U)
    >> 5) + 1);
  rowIdx = actualElemsPerThread << 2;
  if (rowIdx == 0U) {
    tmp = MAX_int32_T;

    // Divide by zero handler
  } else {
    tmp = static_cast<int32_T>((reduceDimSize - 1U) / rowIdx);
  }

  blockIdxZ_tmp = mwGetBlockIndex();
  rowIdx = static_cast<uint32_T>(tmp + 1) * gridSizeX;
  if (rowIdx == 0U) {
    tmp = MAX_int32_T;

    // Divide by zero handler
  } else {
    tmp = static_cast<int32_T>(blockIdxZ_tmp / rowIdx);
  }

  warpId_tmp_tmp = mwGetThreadIndexWithinBlock();
  warpId = warpId_tmp_tmp >> 5;
  blockIdxZ_tmp %= rowIdx;
  rowIdx = ((blockIdxZ_tmp % gridSizeX) << 5) + warpId_tmp_tmp % 32U;
  gridSizeX = ((blockIdxZ_tmp / gridSizeX * actualElemsPerThread) << 2) + warpId;
  blockIdxZ_tmp = (preReduceDimSize * reduceDimSize * static_cast<uint32_T>(tmp)
                   + preReduceDimSize * gridSizeX) + rowIdx;
  if ((static_cast<int32_T>((static_cast<int32_T>(rowIdx < preReduceDimSize)) &&
        (static_cast<int32_T>(gridSizeX < reduceDimSize)))) &&
      (static_cast<int32_T>(level == 0U))) {
    shared[warpId_tmp_tmp] = input[blockIdxZ_tmp];
  }

  for (loadIdx = 1U; loadIdx < actualElemsPerThread; loadIdx++) {
    blockIdxZ_tmp += preReduceDimSize << 2;
    if ((static_cast<int32_T>(rowIdx < preReduceDimSize)) &&
        (static_cast<int32_T>((loadIdx << 2) + gridSizeX < reduceDimSize))) {
      if (level == 0U) {
        v_0 = input[blockIdxZ_tmp];
      }

      shared[warpId_tmp_tmp] += v_0;
    }
  }

  __syncthreads();
  if ((static_cast<int32_T>(warpId == 0U)) && (static_cast<int32_T>(rowIdx <
        preReduceDimSize))) {
    v_0 = shared[warpId_tmp_tmp];
    loadIdx = 1U;
    while ((static_cast<int32_T>(loadIdx < 4U)) && (static_cast<int32_T>
            (gridSizeX + loadIdx < reduceDimSize))) {
      v_0 += shared[(loadIdx << 5) + warpId_tmp_tmp];
      loadIdx++;
    }

    if (isLastLevel) {
      output[static_cast<uint32_T>(tmp) * preReduceDimSize + rowIdx] = v_0;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel95
  (const real32_T maxVal[25200], const real32_T xdata[403200], real32_T
   obj_Data[403200])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 6300UL;
  iv0 = static_cast<int32_T>(gThreadId % 16UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 16UL;
  if (static_cast<int32_T>(gThreadId) < 4) {
    iv0 = (6300 * iv0 + ix) + 100800 * static_cast<int32_T>(gThreadId);
    obj_Data[iv0] = xdata[iv0] / maxVal[6300 * static_cast<int32_T>(gThreadId) +
      ix];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c1_ex_DLModel_28_kernel96
  (const real32_T obj_Data[403200], real32_T xdata[403200])
{
  uint64_T gThreadId;
  int32_T iv0;
  int32_T ix;
  gThreadId = mwGetGlobalThreadIndex();
  iv0 = static_cast<int32_T>(gThreadId % 6300UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(iv0)) / 6300UL;
  ix = static_cast<int32_T>(gThreadId % 16UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(ix)) / 16UL;
  if (static_cast<int32_T>(gThreadId) < 4) {
    xdata[(iv0 + 6300 * static_cast<int32_T>(gThreadId)) + 25200 * ix] =
      obj_Data[(ix * 6300 + iv0) + static_cast<int32_T>(gThreadId) * 100800];
  }
}

static __device__ int64_T ex_DLModel_computeEndIdx_device(int64_T start, int64_T
  end, int64_T stride)
{
  int64_T newEnd;
  newEnd = -1L;
  if ((static_cast<int32_T>(stride > 0L)) && (static_cast<int32_T>(start <= end)))
  {
    newEnd = (end - start) / stride;
  } else if ((static_cast<int32_T>(stride < 0L)) && (static_cast<int32_T>(end <=
    start))) {
    newEnd = (start - end) / -stride;
  }

  return newEnd;
}

static __global__ __launch_bounds__(64, 12) void ex_DLModel_28_convolutionKernel
  (const real32_T *inputTensor, const real32_T *weights, const real32_T *bias,
   real32_T *outputTensor)
{
  __shared__ real32_T sharedMemoryA[256];
  __shared__ real32_T sharedMemoryB[256];
  float4 regA;
  float4 regB;
  int32_T heightIdx_tmp;
  int32_T inputBaseOffset;
  int32_T inputBaseOffset_0;
  int32_T inputBaseOffset_1;
  int32_T inputBaseOffset_2;
  int32_T inputHeightIdx;
  int32_T inputHeightIdx_0;
  int32_T inputHeightIdx_1;
  int32_T inputHeightIdx_2;
  int32_T inputWidthIdx;
  int32_T inputWidthIdx_0;
  int32_T inputWidthIdx_1;
  int32_T inputWidthIdx_2;
  int32_T offset_tmp;
  int32_T tmp;
  int32_T workGroupIdx;
  int32_T workGroupOutputHeightIdx;
  int32_T workItemIdx;
  int32_T workItemOutputHeightIdx;
  int32_T workItemOutputHeightIdxInWorkGr;
  int32_T workItemOutputHeightIdxInWork_0;
  int32_T workItemOutputWidthIdxInWorkGro;
  real32_T biasReg_w;
  real32_T biasReg_x;
  real32_T biasReg_y;
  real32_T biasReg_z;
  real32_T globalLoadRegA;
  real32_T globalLoadRegA_0;
  real32_T globalLoadRegA_1;
  real32_T globalLoadRegA_2;
  real32_T globalLoadRegB;
  real32_T outputReg;
  real32_T outputReg_0;
  real32_T outputReg_1;
  real32_T outputReg_2;
  real32_T outputReg_3;
  real32_T outputReg_4;
  real32_T outputReg_5;
  real32_T outputReg_6;
  real32_T outputReg_7;
  real32_T outputReg_8;
  real32_T outputReg_9;
  real32_T outputReg_a;
  real32_T outputReg_b;
  real32_T outputReg_c;
  real32_T outputReg_d;
  real32_T outputReg_e;
  real32_T *sharedMemoryAPtr;
  real32_T *sharedMemoryBPtr;
  workItemIdx = static_cast<int32_T>(mwGetThreadIndexWithinBlock());
  workGroupIdx = static_cast<int32_T>(mwGetBlockIndex());
  workItemOutputHeightIdxInWork_0 = workItemIdx % 8;
  workItemOutputHeightIdxInWorkGr = workItemOutputHeightIdxInWork_0 << 2;
  workItemOutputWidthIdxInWorkGro = ((workItemIdx / 8 % 4) << 2) + ((workItemIdx
    / 32 % 2) << 4);
  workGroupOutputHeightIdx = (workGroupIdx % 788) << 5;
  workItemOutputHeightIdx = workGroupOutputHeightIdx +
    workItemOutputHeightIdxInWorkGr;
  workGroupIdx = ((workGroupIdx / 788) << 4) + 16;
  outputReg = 0.0F;
  outputReg_0 = 0.0F;
  outputReg_1 = 0.0F;
  outputReg_2 = 0.0F;
  outputReg_3 = 0.0F;
  outputReg_4 = 0.0F;
  outputReg_5 = 0.0F;
  outputReg_6 = 0.0F;
  outputReg_7 = 0.0F;
  outputReg_8 = 0.0F;
  outputReg_9 = 0.0F;
  outputReg_a = 0.0F;
  outputReg_b = 0.0F;
  outputReg_c = 0.0F;
  outputReg_d = 0.0F;
  outputReg_e = 0.0F;
  sharedMemoryAPtr = (real32_T *)sharedMemoryA;
  sharedMemoryBPtr = (real32_T *)sharedMemoryB;
  heightIdx_tmp = workItemOutputHeightIdxInWork_0 + workGroupOutputHeightIdx;
  inputHeightIdx = heightIdx_tmp % 6300;
  inputWidthIdx = heightIdx_tmp / 6300 % 4;
  inputBaseOffset = 6300 * inputWidthIdx + inputHeightIdx;
  inputHeightIdx_0 = (heightIdx_tmp + 8) % 6300;
  inputWidthIdx_0 = (heightIdx_tmp + 8) / 6300 % 4;
  inputBaseOffset_0 = 6300 * inputWidthIdx_0 + inputHeightIdx_0;
  workGroupOutputHeightIdx = (heightIdx_tmp + 16) / 6300;
  inputHeightIdx_1 = (heightIdx_tmp + 16) % 6300;
  inputWidthIdx_1 = workGroupOutputHeightIdx % 4;
  inputBaseOffset_1 = (((workGroupOutputHeightIdx / 4) << 6) + inputWidthIdx_1) *
    6300 + inputHeightIdx_1;
  workGroupOutputHeightIdx = (heightIdx_tmp + 24) / 6300;
  inputHeightIdx_2 = (heightIdx_tmp + 24) % 6300;
  inputWidthIdx_2 = workGroupOutputHeightIdx % 4;
  inputBaseOffset_2 = (((workGroupOutputHeightIdx / 4) << 6) + inputWidthIdx_2) *
    6300 + inputHeightIdx_2;
  if (workItemOutputWidthIdxInWorkGro < 1) {
    biasReg_x = ((float4 *)&bias[workItemOutputWidthIdxInWorkGro])->x;
    biasReg_y = ((float4 *)&bias[workItemOutputWidthIdxInWorkGro])->y;
    biasReg_z = ((float4 *)&bias[workItemOutputWidthIdxInWorkGro])->z;
    biasReg_w = ((float4 *)&bias[workItemOutputWidthIdxInWorkGro])->w;
  }

  workGroupOutputHeightIdx = (workItemIdx / 8 + workGroupIdx) - 16;
  if (workGroupOutputHeightIdx < workGroupIdx) {
    if ((static_cast<int32_T>(inputHeightIdx >= 0)) && (static_cast<int32_T>
         (inputWidthIdx >= 0))) {
      globalLoadRegA = inputTensor[workGroupOutputHeightIdx * 25200 +
        inputBaseOffset];
    } else {
      globalLoadRegA = 0.0F;
    }

    if ((static_cast<int32_T>(inputHeightIdx_0 >= 0)) && (static_cast<int32_T>
         (inputWidthIdx_0 >= 0))) {
      globalLoadRegA_0 = inputTensor[workGroupOutputHeightIdx * 25200 +
        inputBaseOffset_0];
    } else {
      globalLoadRegA_0 = 0.0F;
    }

    if ((static_cast<int32_T>(heightIdx_tmp + 16 < 25200)) &&
        (static_cast<int32_T>((static_cast<int32_T>(inputBaseOffset_1 < 403200))
          && (static_cast<int32_T>((static_cast<int32_T>(inputHeightIdx_1 >= 0))
            && (static_cast<int32_T>(inputWidthIdx_1 >= 0))))))) {
      globalLoadRegA_1 = inputTensor[workGroupOutputHeightIdx * 25200 +
        inputBaseOffset_1];
    } else {
      globalLoadRegA_1 = 0.0F;
    }

    if ((static_cast<int32_T>(heightIdx_tmp + 24 < 25200)) &&
        (static_cast<int32_T>((static_cast<int32_T>(inputBaseOffset_2 < 403200))
          && (static_cast<int32_T>((static_cast<int32_T>(inputHeightIdx_2 >= 0))
            && (static_cast<int32_T>(inputWidthIdx_2 >= 0))))))) {
      globalLoadRegA_2 = inputTensor[workGroupOutputHeightIdx * 25200 +
        inputBaseOffset_2];
    } else {
      globalLoadRegA_2 = 0.0F;
    }
  } else {
    globalLoadRegA = 0.0F;
    globalLoadRegA_0 = 0.0F;
    globalLoadRegA_1 = 0.0F;
    globalLoadRegA_2 = 0.0F;
  }

  if ((static_cast<int32_T>(workGroupOutputHeightIdx < workGroupIdx)) && (
       static_cast<int32_T>(workItemOutputHeightIdxInWork_0 < 1))) {
    globalLoadRegB = weights[workItemOutputHeightIdxInWork_0 +
      workGroupOutputHeightIdx];
  } else {
    globalLoadRegB = 0.0F;
  }

  tmp = static_cast<int32_T>(ex_DLModel_computeEndIdx_device(static_cast<int64_T>
    (workGroupIdx - 16), static_cast<int64_T>(workGroupIdx - 1), 8L));
  for (workGroupOutputHeightIdx = 0; workGroupOutputHeightIdx <= tmp;
       workGroupOutputHeightIdx++) {
    offset_tmp = ((workItemIdx / 8) << 5) + workItemOutputHeightIdxInWork_0;
    sharedMemoryAPtr[offset_tmp] = globalLoadRegA;
    sharedMemoryAPtr[offset_tmp + 8] = globalLoadRegA_0;
    sharedMemoryAPtr[offset_tmp + 16] = globalLoadRegA_1;
    sharedMemoryAPtr[offset_tmp + 24] = globalLoadRegA_2;
    sharedMemoryBPtr[offset_tmp] = globalLoadRegB;
    sharedMemoryBPtr[offset_tmp + 8] = 0.0F;
    sharedMemoryBPtr[offset_tmp + 16] = 0.0F;
    sharedMemoryBPtr[offset_tmp + 24] = 0.0F;
    offset_tmp = (workGroupOutputHeightIdx << 3) + workGroupIdx;
    if (offset_tmp - 8 < workGroupIdx) {
      offset_tmp = (workItemIdx / 8 + offset_tmp) - 8;
      if (offset_tmp < workGroupIdx) {
        if ((static_cast<int32_T>(inputHeightIdx >= 0)) && (static_cast<int32_T>
             (inputWidthIdx >= 0))) {
          globalLoadRegA = inputTensor[offset_tmp * 25200 + inputBaseOffset];
        } else {
          globalLoadRegA = 0.0F;
        }

        if ((static_cast<int32_T>(inputHeightIdx_0 >= 0)) &&
            (static_cast<int32_T>(inputWidthIdx_0 >= 0))) {
          globalLoadRegA_0 = inputTensor[offset_tmp * 25200 + inputBaseOffset_0];
        } else {
          globalLoadRegA_0 = 0.0F;
        }

        if ((static_cast<int32_T>(heightIdx_tmp + 16 < 25200)) &&
            (static_cast<int32_T>((static_cast<int32_T>(inputBaseOffset_1 <
                403200)) && (static_cast<int32_T>((static_cast<int32_T>
                 (inputHeightIdx_1 >= 0)) && (static_cast<int32_T>
                 (inputWidthIdx_1 >= 0))))))) {
          globalLoadRegA_1 = inputTensor[offset_tmp * 25200 + inputBaseOffset_1];
        } else {
          globalLoadRegA_1 = 0.0F;
        }

        if ((static_cast<int32_T>(heightIdx_tmp + 24 < 25200)) &&
            (static_cast<int32_T>((static_cast<int32_T>(inputBaseOffset_2 <
                403200)) && (static_cast<int32_T>((static_cast<int32_T>
                 (inputHeightIdx_2 >= 0)) && (static_cast<int32_T>
                 (inputWidthIdx_2 >= 0))))))) {
          globalLoadRegA_2 = inputTensor[offset_tmp * 25200 + inputBaseOffset_2];
        } else {
          globalLoadRegA_2 = 0.0F;
        }
      } else {
        globalLoadRegA = 0.0F;
        globalLoadRegA_0 = 0.0F;
        globalLoadRegA_1 = 0.0F;
        globalLoadRegA_2 = 0.0F;
      }

      if ((static_cast<int32_T>(offset_tmp < workGroupIdx)) &&
          (static_cast<int32_T>(workItemOutputHeightIdxInWork_0 < 1))) {
        globalLoadRegB = weights[workItemOutputHeightIdxInWork_0 + offset_tmp];
      } else {
        globalLoadRegB = 0.0F;
      }
    }

    __syncthreads();
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 32];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 32];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 64];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 64];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 96];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 96];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 128];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 128];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 160];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 160];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 192];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 192];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    regA = *(float4 *)&sharedMemoryAPtr[workItemOutputHeightIdxInWorkGr + 224];
    regB = *(float4 *)&sharedMemoryBPtr[workItemOutputWidthIdxInWorkGro + 224];
    outputReg += regA.x * regB.x;
    outputReg_0 += regA.y * regB.x;
    outputReg_1 += regA.z * regB.x;
    outputReg_2 += regA.w * regB.x;
    outputReg_3 += regA.x * regB.y;
    outputReg_4 += regA.y * regB.y;
    outputReg_5 += regA.z * regB.y;
    outputReg_6 += regA.w * regB.y;
    outputReg_7 += regA.x * regB.z;
    outputReg_8 += regA.y * regB.z;
    outputReg_9 += regA.z * regB.z;
    outputReg_a += regA.w * regB.z;
    outputReg_b += regA.x * regB.w;
    outputReg_c += regA.y * regB.w;
    outputReg_d += regA.z * regB.w;
    outputReg_e += regA.w * regB.w;
    __syncthreads();
  }

  if (workItemOutputHeightIdx < 25200) {
    workGroupOutputHeightIdx = workItemOutputHeightIdx / 6300;
    workItemIdx = workItemOutputHeightIdx % 6300;
    workItemOutputHeightIdxInWork_0 = workGroupOutputHeightIdx % 4;
    workGroupOutputHeightIdx /= 4;
    if (workItemOutputWidthIdxInWorkGro < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        ((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) << 2))] =
        outputReg + biasReg_x;
    }

    if (workItemOutputWidthIdxInWorkGro < 0) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 1) << 2))]
        = outputReg_3 + biasReg_y;
    }

    if (workItemOutputWidthIdxInWorkGro + 2 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 2) << 2))]
        = outputReg_7 + biasReg_z;
    }

    if (workItemOutputWidthIdxInWorkGro + 3 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 3) << 2))]
        = outputReg_b + biasReg_w;
    }
  }

  if (workItemOutputHeightIdx + 1 < 25200) {
    workGroupOutputHeightIdx = (workItemOutputHeightIdx + 1) / 6300;
    workItemIdx = (workItemOutputHeightIdx + 1) % 6300;
    workItemOutputHeightIdxInWork_0 = workGroupOutputHeightIdx % 4;
    workGroupOutputHeightIdx /= 4;
    if (workItemOutputWidthIdxInWorkGro < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        ((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) << 2))] =
        outputReg_0 + biasReg_x;
    }

    if (workItemOutputWidthIdxInWorkGro < 0) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 1) << 2))]
        = outputReg_4 + biasReg_y;
    }

    if (workItemOutputWidthIdxInWorkGro + 2 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 2) << 2))]
        = outputReg_8 + biasReg_z;
    }

    if (workItemOutputWidthIdxInWorkGro + 3 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 3) << 2))]
        = outputReg_c + biasReg_w;
    }
  }

  if (workItemOutputHeightIdx + 2 < 25200) {
    workGroupOutputHeightIdx = (workItemOutputHeightIdx + 2) / 6300;
    workItemIdx = (workItemOutputHeightIdx + 2) % 6300;
    workItemOutputHeightIdxInWork_0 = workGroupOutputHeightIdx % 4;
    workGroupOutputHeightIdx /= 4;
    if (workItemOutputWidthIdxInWorkGro < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        ((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) << 2))] =
        outputReg_1 + biasReg_x;
    }

    if (workItemOutputWidthIdxInWorkGro < 0) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 1) << 2))]
        = outputReg_5 + biasReg_y;
    }

    if (workItemOutputWidthIdxInWorkGro + 2 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 2) << 2))]
        = outputReg_9 + biasReg_z;
    }

    if (workItemOutputWidthIdxInWorkGro + 3 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 3) << 2))]
        = outputReg_d + biasReg_w;
    }
  }

  if (workItemOutputHeightIdx + 3 < 25200) {
    workGroupOutputHeightIdx = (workItemOutputHeightIdx + 3) / 6300;
    workItemIdx = (workItemOutputHeightIdx + 3) % 6300;
    workItemOutputHeightIdxInWork_0 = workGroupOutputHeightIdx % 4;
    workGroupOutputHeightIdx /= 4;
    if (workItemOutputWidthIdxInWorkGro < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        ((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) << 2))] =
        outputReg_2 + biasReg_x;
    }

    if (workItemOutputWidthIdxInWorkGro < 0) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 1) << 2))]
        = outputReg_6 + biasReg_y;
    }

    if (workItemOutputWidthIdxInWorkGro + 2 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 2) << 2))]
        = outputReg_a + biasReg_z;
    }

    if (workItemOutputWidthIdxInWorkGro + 3 < 1) {
      outputTensor[workItemIdx + 6300 * (workItemOutputHeightIdxInWork_0 +
        (((workItemOutputWidthIdxInWorkGro + workGroupOutputHeightIdx) + 3) << 2))]
        = outputReg_e + biasReg_w;
    }
  }
}

void addFPSModelClass::ex_DLModel_28_convolution(const real32_T *inputTensor,
  const real32_T *weights, const real32_T *bias, real32_T *outputTensor)
{
  ex_DLModel_28_convolutionKernel<<<dim3(788, 1U, 1U), dim3(64, 1U, 1U)>>>
    (inputTensor, weights, bias, outputTensor);
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::conv2dCudaImplicitGemmColMajor(const real32_T X[403200],
  real32_T Z[25200])
{
  static const real32_T cpu_fv[16] = { 0.0F, 1.0F, 2.0F, 3.0F, 4.0F, 5.0F, 6.0F,
    7.0F, 8.0F, 9.0F, 10.0F, 11.0F, 12.0F, 13.0F, 14.0F, 15.0F };

  static const real32_T cpu_fv1[4] = { 0.0F, 0.0F, 0.0F, 0.0F };

  real32_T (*gpu_fv)[16];
  real32_T (*gpu_fv1)[4];
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_fv1, 16UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_fv, 64UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_fv, cpu_fv, 64UL,
    cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_fv1, cpu_fv1, 16UL,
    cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_convolution(&X[0], &(*gpu_fv)[0], &(*gpu_fv1)[0], &Z[0]);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_fv), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_fv1), __FILE__, __LINE__);
}

static __global__ __launch_bounds__(256, 1) void ex_DL_c1_ex_DLModel_28_kernel97
  (const real32_T e_objX_Data[25200], real32_T maxVal[25200])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 4) {
    ix += oldIdx * 6300;
    maxVal[ix] = e_objX_Data[ix];
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c1_ex_DLModel_28_kernel98
  (real_T centersArray[12600])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 12600) {
    centersArray[oldIdx] = 0.0;
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_real_T
  (emxArray_real_T_ex_DLModel_28_T **pEmxArray, int32_T numDimensions)
{
  emxArray_real_T_ex_DLModel_28_T *emxArray;
  *pEmxArray = static_cast<emxArray_real_T_ex_DLModel_28_T *>(malloc(sizeof
    (emxArray_real_T_ex_DLModel_28_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<real_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c1_ex_DLModel_28_kernel99(
  const int32_T y_data_tmp, real_T y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    y_data[y_data_tmp] = 0.5;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel100(
  const real_T apnd, const int32_T ndbl, real_T y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    y_data[ndbl - 1] = apnd;
  }
}

uint64_T addFPSModelClass::ex_DLModel_28_computeNumIters(int32_T ub)
{
  uint64_T numIters;
  numIters = 0UL;
  if (ub >= 0) {
    numIters = static_cast<uint64_T>(ub + 1);
  }

  return numIters;
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel110(
  const real_T apnd, const int32_T nm1d2, real_T y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    y_data[nm1d2] = static_cast<real_T>(nm1d2) + 0.5;
    y_data[nm1d2 + 1] = apnd - static_cast<real_T>(nm1d2);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel102(
  const real_T apnd, const int32_T nm1d2, real_T y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    y_data[nm1d2] = (apnd + 0.5) / 2.0;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel103(
  const int32_T y_data_tmp, real_T b_y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    b_y_data[y_data_tmp] = 0.5;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel104(
  const real_T apnd, const int32_T ndbl, real_T b_y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    b_y_data[ndbl - 1] = apnd;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel109(
  const real_T apnd, const int32_T nm1d2, real_T b_y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    b_y_data[nm1d2] = static_cast<real_T>(nm1d2) + 0.5;
    b_y_data[nm1d2 + 1] = apnd - static_cast<real_T>(nm1d2);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_D_c1_ex_DLModel_28_kernel106(
  const real_T apnd, const int32_T nm1d2, real_T b_y_data[80])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    b_y_data[nm1d2] = (apnd + 0.5) / 2.0;
  }
}

void addFPSModelClass::ex_DLModel_28_gpuThrowError_hp(const char_T *file,
  int32_T line)
{
  fprintf(stderr, "%s\nFile: \"%s\"\nLine: %d\nTerminating execution...",
          "Unable to launch kernel. Loop nest contains too many iterations.",
          file, line);
  exit(1);
}

uint64_T addFPSModelClass::ex_DLModel_28_computeNumIters_h(int32_T ub, int32_T
  ub_0)
{
  uint64_T n;
  uint64_T numIters;
  boolean_T overflow;
  overflow = false;
  n = 0UL;
  if (ub >= 0) {
    n = static_cast<uint64_T>(ub + 1);
  }

  numIters = n;
  n = 0UL;
  if (ub_0 >= 0) {
    n = static_cast<uint64_T>(ub_0 + 1);
    if (numIters > MAX_uint64_T / n) {
      overflow = true;
    }
  }

  numIters *= n;
  if (overflow) {
    ex_DLModel_28_gpuThrowError_hp(__FILE__, __LINE__);
  }

  return numIters;
}

void addFPSModelClass::ex_DLM_emxEnsureCapacity_real_T
  (emxArray_real_T_ex_DLModel_28_T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(real_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(real_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<real_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::ex__gpuEmxEnsureCapacity_real_T(const
  emxArray_real_T_ex_DLModel_28_T *cpu, emxArray_real_T_ex_DLModel_28_T *gpu,
  boolean_T needsCopy)
{
  real_T *newData;
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(real_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(real_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex__gpuEmxMemcpyGpuToCpu_real_T
  (emxArray_real_T_ex_DLModel_28_T *cpu, const emxArray_real_T_ex_DLModel_28_T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(real_T), cudaMemcpyDeviceToHost),
      __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_real_T
  (emxArray_real_T_ex_DLModel_28_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_real_T_ex_DLModel_28_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<real_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_real_T_ex_DLModel_28_T *>(NULL);
  }
}

static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel111
  (const real_T centersArray[12600], real32_T ConstantArray1[12600])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 12600) {
    ConstantArray1[oldIdx] = static_cast<real32_T>(centersArray[oldIdx]);
  }
}

static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel112
  (const real32_T maxVal[25200], real32_T sub1[12600], real32_T ConstantArray1
   [12600])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 2) {
    int32_T iv0;
    real32_T dh;
    iv0 = 6300 * oldIdx + ix;
    dh = ConstantArray1[iv0];
    sub1[iv0] = dh - maxVal[iv0];
    ConstantArray1[iv0] = maxVal[(oldIdx + 2) * 6300 + ix] + dh;
  }
}

static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel113
  (const real32_T sub1[12600], real32_T maxVal[25200], real32_T ConstantArray1
   [12600])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 12600) {
    real32_T ConstantArray1_0;
    real32_T b_xdata;
    real32_T dh;
    b_xdata = sub1[oldIdx];
    ConstantArray1_0 = ConstantArray1[oldIdx];
    dh = ConstantArray1_0;
    ConstantArray1_0 -= b_xdata;
    ConstantArray1[oldIdx] = ConstantArray1_0;
    maxVal[oldIdx] = (b_xdata + dh) / 2.0F;
    maxVal[oldIdx + 12600] = ConstantArray1_0;
  }
}

static __global__ __launch_bounds__(256, 1) void ex_D_c1_ex_DLModel_28_kernel114
  (const int8_T fv[6300], const real32_T maxVal[25200], real32_T maxVal_0[25200])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 4) {
    oldIdx = 6300 * oldIdx + ix;
    maxVal_0[oldIdx] = maxVal[oldIdx] * static_cast<real32_T>(fv[ix]);
  }
}

static __global__ __launch_bounds__(256, 1) void ex_D_c1_ex_DLModel_28_kernel115
  (const real32_T maxVal[25200], real32_T b_intermediateResult[529200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 25200) {
    b_intermediateResult[oldIdx] = maxVal[oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_D_c1_ex_DLModel_28_kernel116
  (const real32_T x[504000], real32_T b_intermediateResult[529200])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 504000) {
    b_intermediateResult[oldIdx + 25200] = x[oldIdx];
  }
}

static __global__ __launch_bounds__(512, 1) void ex_D_c1_ex_DLModel_28_kernel117
  (const real32_T b_intermediateResult[529200], real32_T b_x_Data[504000])
{
  uint64_T gThreadId;
  int32_T ix;
  int32_T oldIdx;
  gThreadId = mwGetGlobalThreadIndex();
  ix = static_cast<int32_T>(gThreadId % 6300UL);
  oldIdx = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(ix)) / 6300UL);
  if (oldIdx < 80) {
    b_x_Data[ix + 6300 * oldIdx] = b_intermediateResult[(oldIdx + 4) * 6300 + ix];
  }
}

static __global__ __launch_bounds__(128, 1) void ex_D_c1_ex_DLModel_28_kernel118
  (const real32_T b_intermediateResult[529200], const real32_T b_x_Data[504000],
   real32_T b_xdata[6300])
{
  int32_T oldIdx;
  oldIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (oldIdx < 6300) {
    b_xdata[oldIdx] = b_x_Data[oldIdx];
    for (int32_T iv0 = 0; iv0 < 79; iv0++) {
      int32_T ix;
      real32_T dh;
      boolean_T b_p;
      ix = ((iv0 + 1) * 6300 + oldIdx) + 1;
      dh = b_x_Data[ix - 1];
      if (isnan(dh)) {
        b_p = false;
      } else {
        real32_T b_xdata_0;
        b_xdata_0 = b_xdata[oldIdx];
        if (isnan(b_xdata_0)) {
          b_p = true;
        } else {
          b_p = (b_xdata_0 < b_intermediateResult[ix + 25199]);
        }
      }

      if (b_p) {
        b_xdata[oldIdx] = dh;
      }
    }
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_real32_T
  (emxArray_real32_T_ex_DLModel__T **pEmxArray, int32_T numDimensions)
{
  emxArray_real32_T_ex_DLModel__T *emxArray;
  *pEmxArray = static_cast<emxArray_real32_T_ex_DLModel__T *>(malloc(sizeof
    (emxArray_real32_T_ex_DLModel__T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<real32_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::e_gpuEmxEnsureCapacity_real32_T(const
  emxArray_real32_T_ex_DLModel__T *cpu, emxArray_real32_T_ex_DLModel__T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  real32_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(real32_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(real32_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex_DLM_emxInitStruct_dlarray_38
  (emxArray_real32_T_ex_DLModel__T **pStruct_Data)
{
  ex_DLModel_28_emxInit_real32_T(pStruct_Data, 2);
}

void addFPSModelClass::ex_D_emxEnsureCapacity_real32_T
  (emxArray_real32_T_ex_DLModel__T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(real32_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(real32_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<real32_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::e_gpuEmxMemcpyGpuToCpu_real32_T
  (emxArray_real32_T_ex_DLModel__T *cpu, const emxArray_real32_T_ex_DLModel__T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(real32_T),
      cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_real32_T
  (emxArray_real32_T_ex_DLModel__T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_real32_T_ex_DLModel__T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<real32_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_real32_T_ex_DLModel__T *>(NULL);
  }
}

void addFPSModelClass::ex_DLM_emxFreeStruct_dlarray_38
  (emxArray_real32_T_ex_DLModel__T **pStruct_Data)
{
  ex_DLModel_28_emxFree_real32_T(pStruct_Data);
}

void addFPSModelClass::e_gpuEmxMemcpyCpuToGpu_real32_T
  (emxArray_real32_T_ex_DLModel__T *gpu, const emxArray_real32_T_ex_DLModel__T
   *cpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (cpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(gpu->data, cpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(real32_T),
      cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex_DLModel_28_binary_expand_op
  (emxArray_real32_T_ex_DLModel__T *in1, const emxArray_real32_T_ex_DLModel__T
   *in2)
{
  int32_T loop_ub;
  int32_T stride_0_0;
  int32_T stride_1_0;
  loop_ub = in1->size[0];
  stride_0_0 = (in1->size[0] != 1);
  stride_1_0 = (in2->size[0] != 1);
  for (int32_T i = 0; i < loop_ub; i++) {
    ex_DLModel_28_B.in1_data[i] = (in1->data[i * stride_0_0 + in1->size[0]] +
      in2->data[i * stride_1_0 + in2->size[0] * 3]) - 1.0F;
    in1->data[i + in1->size[0] * 3] = ex_DLModel_28_B.in1_data[i];
  }
}

void addFPSModelClass::ex_DLModel__gpuEmxFree_real32_T
  (emxArray_real32_T_ex_DLModel__T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel_28_gpuEmxFree_real_T
  (emxArray_real_T_ex_DLModel_28_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::ex_D_selectStrongestBboxCodegen(const
  emxArray_real32_T_ex_DLModel__T *bbox, const real32_T label_data[], boolean_T
  selectedIndex_data[], int32_T *selectedIndex_size)
{
  int32_T b_i;
  int32_T currentBox;
  int32_T loop_ub;
  real32_T height;
  real32_T width;
  loop_ub = bbox->size[0];
  *selectedIndex_size = bbox->size[0];
  for (currentBox = 0; currentBox < loop_ub; currentBox++) {
    selectedIndex_data[currentBox] = true;
    width = bbox->data[(bbox->size[0] << 1) + currentBox];
    height = bbox->data[bbox->size[0] * 3 + currentBox];
    ex_DLModel_28_B.area_data[currentBox] = width * height;
    ex_DLModel_28_B.x2_data[currentBox] = bbox->data[currentBox] + width;
    ex_DLModel_28_B.y2_data[currentBox] = bbox->data[currentBox + bbox->size[0]]
      + height;
  }

  currentBox = -1;
  for (b_i = 0; b_i < loop_ub; b_i++) {
    currentBox = b_i;
    if (rtIsNaNF(label_data[b_i])) {
      selectedIndex_data[b_i] = false;
    } else if (selectedIndex_data[b_i]) {
      int32_T i3;
      i3 = bbox->size[0] - b_i;
      for (int32_T j = 0; j <= i3 - 2; j++) {
        int32_T b_j;
        b_j = (b_i + j) + 1;
        if (selectedIndex_data[b_j] && (!(label_data[b_j] != label_data[b_i])))
        {
          real32_T u1;
          real32_T u1_0;
          height = ex_DLModel_28_B.x2_data[b_i];
          u1 = ex_DLModel_28_B.x2_data[b_j];
          if ((height <= u1) || rtIsNaNF(u1)) {
            u1 = height;
          }

          height = bbox->data[b_i];
          u1_0 = bbox->data[b_j];
          if ((height >= u1_0) || rtIsNaNF(u1_0)) {
            u1_0 = height;
          }

          width = u1 - u1_0;
          if (!(width <= 0.0F)) {
            height = ex_DLModel_28_B.y2_data[b_i];
            u1 = ex_DLModel_28_B.y2_data[b_j];
            if ((height <= u1) || rtIsNaNF(u1)) {
              u1 = height;
            }

            height = bbox->data[b_i + bbox->size[0]];
            u1_0 = bbox->data[b_j + bbox->size[0]];
            if ((height >= u1_0) || rtIsNaNF(u1_0)) {
              u1_0 = height;
            }

            height = u1 - u1_0;
            if (!(height <= 0.0F)) {
              width *= height;
              if (width / ((ex_DLModel_28_B.area_data[b_i] +
                            ex_DLModel_28_B.area_data[b_j]) - width) > 0.7) {
                selectedIndex_data[b_j] = false;
              }
            }
          }
        }
      }
    }
  }

  if (currentBox + 2 > *selectedIndex_size) {
    loop_ub = 0;
    currentBox = 0;
  } else {
    loop_ub = currentBox + 1;
    currentBox = bbox->size[0];
  }

  b_i = currentBox - loop_ub;
  for (currentBox = 0; currentBox < b_i; currentBox++) {
    selectedIndex_data[loop_ub + currentBox] = false;
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel101(const real_T apnd, const int32_T ndbl, const
  int32_T tmp, real_T y_data[80])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    y_data[static_cast<int32_T>(idx) + 1] = (static_cast<real_T>
      (static_cast<int32_T>(idx)) + 1.0) + 0.5;
    y_data[(ndbl - static_cast<int32_T>(idx)) - 2] = apnd - (static_cast<real_T>
      (static_cast<int32_T>(idx)) + 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel105(const real_T apnd, const int32_T ndbl, const
  int32_T tmp, real_T b_y_data[80])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_y_data[static_cast<int32_T>(idx) + 1] = (static_cast<real_T>(static_cast<
      int32_T>(idx)) + 1.0) + 0.5;
    b_y_data[(ndbl - static_cast<int32_T>(idx)) - 2] = apnd -
      (static_cast<real_T>(static_cast<int32_T>(idx)) + 1.0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel107(const real_T b_y_data[80], const real_T
  y_data[80], const int32_T X_size_dim0, const int32_T tmp, const int32_T tmp_0,
  real_T Y_data[4800], real_T X_data[4800])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp_0) + 1UL) * (static_cast<uint64_T>(tmp) +
    1UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T iv0;
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp) + 1UL));
    iv0 = X_size_dim0 * oldIdx + ix;
    X_data[iv0] = y_data[oldIdx];
    Y_data[iv0] = b_y_data[ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel108(const real_T Y_data[4800], const int32_T tmp,
  emxArray_real_T_ex_DLModel_28_T centers)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    centers.data[static_cast<int32_T>(idx)] = Y_data[static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel119(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T pred_Data, int32_T pred_Data_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp_size) + 1UL) * 84UL - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp_size) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp_size) + 1UL));
    pred_Data.data[ix + pred_Data_dim0 * oldIdx] = b_intermediateResult[6300 *
      oldIdx + static_cast<int32_T>(tmp_data[ix])];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel120(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T c_x_Data, int32_T c_x_Data_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp_size) + 1UL) * 80UL - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp_size) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp_size) + 1UL));
    c_x_Data.data[ix + c_x_Data_dim0 * oldIdx] = b_intermediateResult[(oldIdx +
      4) * 6300 + static_cast<int32_T>(tmp_data[ix])];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel121(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp_size,
  emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(tmp_size) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp_size) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp_size) + 1UL));
    box.data[ix + box_dim0 * oldIdx] = b_intermediateResult[6300 * oldIdx +
      static_cast<int32_T>(tmp_data[ix])];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel122(const real32_T b_intermediateResult[529200],
  const int16_T tmp_data[6300], const int32_T tmp, real32_T b_xdata[6300],
  emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    ix = static_cast<int32_T>(tmp_data[static_cast<int32_T>(idx)]);
    box.data[static_cast<int32_T>(idx)] = b_intermediateResult[ix] -
      b_intermediateResult[ix + 12600] / 2.0F;
    b_xdata[static_cast<int32_T>(idx)] = box.data[static_cast<int32_T>(idx) +
      box_dim0] - box.data[box_dim0 * 3 + static_cast<int32_T>(idx)] / 2.0F;
    box.data[static_cast<int32_T>(idx) + box_dim0] = b_xdata[static_cast<int32_T>
      (idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel123(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    box.data[static_cast<int32_T>(idx)] = floorf(box.data[static_cast<int32_T>
      (idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel124(const emxArray_real32_T_ex_DLModel__T
  pred_Data, const int32_T tmp_size, emxArray_real32_T_ex_DLModel__T d_x,
  int32_T d_x_dim0, int32_T pred_Data_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp_size) + 1UL) * 80UL - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp_size) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp_size) + 1UL));
    d_x.data[ix + d_x_dim0 * oldIdx] = pred_Data.data[(oldIdx + 4) *
      pred_Data_dim0 + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel125(const int32_T tmp, int8_T ii_data[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    ii_data[static_cast<int32_T>(idx)] = static_cast<int8_T>(1);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel126(const int32_T tmp, real32_T b_xdata[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = CUDART_NAN_F;
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel127(const real32_T b_xdata[6300], const int8_T
  ii_data[6300], const int32_T tmp, real_T score_data[6300], int8_T
  c_obj_Data_data[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    c_obj_Data_data[static_cast<int32_T>(idx)] = ii_data[static_cast<int32_T>
      (idx)];
    score_data[static_cast<int32_T>(idx)] = static_cast<real_T>(b_xdata[
      static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel128(const int8_T c_obj_Data_data[6300], const
  real_T score_data[6300], const int32_T tmp, real_T c_out_data[6300], real_T
  idx_data[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    idx_data[static_cast<int32_T>(idx)] = score_data[static_cast<int32_T>(idx)];
    c_out_data[static_cast<int32_T>(idx)] = static_cast<real_T>(c_obj_Data_data[
      static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel129(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T output)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    output.data[static_cast<int32_T>(idx)] = box.data[static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel130(const real_T idx_data[6300], const int8_T tmp,
  const int16_T b_sizes_dim0, const int32_T tmp_0,
  emxArray_real32_T_ex_DLModel__T output)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp_0);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    output.data[static_cast<int32_T>(idx) + static_cast<int32_T>(b_sizes_dim0) *
      static_cast<int32_T>(tmp)] = static_cast<real32_T>(idx_data
      [static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel131(const real_T c_out_data[6300], const int16_T
  b_sizes_dim0, const int8_T tmp, const int8_T tmp_0, const int32_T tmp_1,
  emxArray_real32_T_ex_DLModel__T output)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp_1);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    output.data[static_cast<int32_T>(idx) + (static_cast<int32_T>(tmp_0) +
      static_cast<int32_T>(tmp)) * static_cast<int32_T>(b_sizes_dim0)] =
      static_cast<real32_T>(c_out_data[static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel132(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(output_0) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(output_0) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(output_0) + 1UL));
    box.data[ix + box_dim0 * oldIdx] = output.data[output_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel133(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    box.data[static_cast<int32_T>(idx) + (box_dim0 << 1)] = (output.data
      [(output_dim0 << 1) + static_cast<int32_T>(idx)] + output.data[
      static_cast<int32_T>(idx)]) - 1.0F;
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel134(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300],
  int32_T box_dim0, int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = (output.data[output_dim0 * 3 +
      static_cast<int32_T>(idx)] + box.data[static_cast<int32_T>(idx) + box_dim0])
      - 1.0F;
    box.data[static_cast<int32_T>(idx) + box_dim0 * 3] = b_xdata
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel135(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(b_sizes) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_sizes) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(b_sizes) + 1UL));
    output.data[ix + output_dim0 * oldIdx] = box.data[box_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel136(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(output_0) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(output_0) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(output_0) + 1UL));
    box.data[ix + box_dim0 * oldIdx] = output.data[output_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel137(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T b_xdata[6300], emxArray_real32_T_ex_DLModel__T box)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    box.data[static_cast<int32_T>(idx)] = output.data[static_cast<int32_T>(idx)];
    b_xdata[static_cast<int32_T>(idx)] = fminf(box.data[static_cast<int32_T>(idx)],
      640.0F);
    box.data[static_cast<int32_T>(idx)] = fmaxf(b_xdata[static_cast<int32_T>(idx)],
      0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel138(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = fminf(box.data[(box_dim0 << 1) +
      static_cast<int32_T>(idx)], 640.0F);
    box.data[static_cast<int32_T>(idx) + (box_dim0 << 1)] = fmaxf(b_xdata[
      static_cast<int32_T>(idx)], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel139(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = fminf(box.data[static_cast<int32_T>(idx)
      + box_dim0], 480.0F);
    box.data[static_cast<int32_T>(idx) + box_dim0] = fmaxf(b_xdata
      [static_cast<int32_T>(idx)], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel140(const int32_T tmp,
  emxArray_real32_T_ex_DLModel__T box, real32_T b_xdata[6300], int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = fminf(box.data[box_dim0 * 3 +
      static_cast<int32_T>(idx)], 480.0F);
    box.data[static_cast<int32_T>(idx) + box_dim0 * 3] = fmaxf(b_xdata[
      static_cast<int32_T>(idx)], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel141(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(b_sizes) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_sizes) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(b_sizes) + 1UL));
    output.data[ix + output_dim0 * oldIdx] = box.data[box_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel142(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T output_0, emxArray_real32_T_ex_DLModel__T box, int32_T box_dim0,
  int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(output_0) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(output_0) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(output_0) + 1UL));
    box.data[ix + box_dim0 * oldIdx] = output.data[output_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel143(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T b_xdata[6300], emxArray_real32_T_ex_DLModel__T box,
  int32_T box_dim0, int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    box.data[static_cast<int32_T>(idx) + (box_dim0 << 1)] = (output.data
      [(output_dim0 << 1) + static_cast<int32_T>(idx)] - output.data[
      static_cast<int32_T>(idx)]) + 1.0F;
    b_xdata[static_cast<int32_T>(idx)] = (box.data[box_dim0 * 3 +
      static_cast<int32_T>(idx)] - box.data[static_cast<int32_T>(idx) + box_dim0])
      + 1.0F;
    box.data[static_cast<int32_T>(idx) + box_dim0 * 3] = b_xdata
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel144(const emxArray_real32_T_ex_DLModel__T box,
  const int32_T b_sizes, emxArray_real32_T_ex_DLModel__T output, int32_T
  output_dim0, int32_T box_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(b_sizes) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_sizes) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(b_sizes) + 1UL));
    output.data[ix + output_dim0 * oldIdx] = box.data[box_dim0 * oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel145(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T bboxes_size_dim0, const int32_T tmp, real32_T bboxes_data[],
  int32_T output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(tmp) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(tmp) + 1UL));
    bboxes_data[ix + bboxes_size_dim0 * oldIdx] = output.data[output_dim0 *
      oldIdx + ix];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel146(const emxArray_real32_T_ex_DLModel__T output,
  const int32_T tmp, real32_T labelIds_data[], real32_T scores_data[], int32_T
  output_dim0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    scores_data[static_cast<int32_T>(idx)] = output.data[(output_dim0 << 2) +
      static_cast<int32_T>(idx)];
    labelIds_data[static_cast<int32_T>(idx)] = output.data[output_dim0 * 5 +
      static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel147(const real_T score_data[6300], const int32_T
  tmp, real_T idx_data[6300], real_T c_out_data[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    c_out_data[static_cast<int32_T>(idx)] = score_data[static_cast<int32_T>(idx)];
    idx_data[static_cast<int32_T>(idx)] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel148(const emxArray_real32_T_ex_DLModel__T box,
  const real_T idx_data[6300], const int32_T idx_size,
  emxArray_real32_T_ex_DLModel__T box_0, int32_T box_dim0, int32_T box_dim0_0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(idx_size) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(idx_size) + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(idx_size) + 1UL));
    box_0.data[ix + box_dim0 * oldIdx] = box.data[(box_dim0_0 * oldIdx +
      static_cast<int32_T>(idx_data[ix])) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel149(const int8_T c_obj_Data_data[6300], const
  real_T idx_data[6300], const int32_T tmp, real32_T b_xdata[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_xdata[static_cast<int32_T>(idx)] = static_cast<real32_T>(c_obj_Data_data[
      static_cast<int32_T>(idx_data[static_cast<int32_T>(idx)]) - 1]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel150(const emxArray_real32_T_ex_DLModel__T box,
  const int16_T iv14_data[6300], const int32_T varargin_1_tmp_size,
  emxArray_real32_T_ex_DLModel__T box_0, int32_T box_dim0, int32_T box_dim0_0)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = ((static_cast<uint64_T>(varargin_1_tmp_size) + 1UL) << 2UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T ix;
    int32_T oldIdx;
    ix = static_cast<int32_T>(idx % (static_cast<uint64_T>(varargin_1_tmp_size)
      + 1UL));
    oldIdx = static_cast<int32_T>((idx - static_cast<uint64_T>(ix)) / (
      static_cast<uint64_T>(varargin_1_tmp_size) + 1UL));
    box_0.data[ix + box_dim0 * oldIdx] = box.data[box_dim0_0 * oldIdx +
      static_cast<int32_T>(iv14_data[ix])];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel151(const int8_T c_obj_Data_data[6300], const
  real_T score_data[6300], const int16_T iv14_data[6300], const int32_T tmp,
  real_T c_out_data[6300], real_T idx_data[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int16_T varargin_1_tmp;
    varargin_1_tmp = iv14_data[static_cast<int32_T>(idx)];
    idx_data[static_cast<int32_T>(idx)] = score_data[varargin_1_tmp];
    c_out_data[static_cast<int32_T>(idx)] = static_cast<real_T>
      (c_obj_Data_data[varargin_1_tmp]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_D_c1_ex_DLModel_28_kernel152(const emxArray_real32_T_ex_DLModel__T d_x,
  const emxArray_real32_T_ex_DLModel__T c_x_Data, const int32_T b, const int32_T
  currentIndex, const int32_T tmp, int8_T ii_data[6300], real32_T b_xdata[6300])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T iv0;
    iv0 = (static_cast<int32_T>(static_cast<uint32_T>(idx) /
            static_cast<uint32_T>(currentIndex)) * b + static_cast<int32_T>(idx))
      + 1;
    b_xdata[static_cast<int32_T>(idx)] = c_x_Data.data[iv0 - 1];
    for (int32_T i_i = 0; i_i < 79; i_i++) {
      int32_T b_ix;
      boolean_T b_p;
      b_ix = (i_i + 1) * currentIndex + iv0;
      if (isnan(c_x_Data.data[b_ix - 1])) {
        b_p = false;
      } else {
        real32_T dh;
        dh = b_xdata[static_cast<int32_T>(idx)];
        if (isnan(dh)) {
          b_p = true;
        } else {
          b_p = (dh < d_x.data[b_ix - 1]);
        }
      }

      if (b_p) {
        b_xdata[static_cast<int32_T>(idx)] = c_x_Data.data[b_ix - 1];
        ii_data[static_cast<int32_T>(idx)] = static_cast<int8_T>(i_i + 2);
      }
    }
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::ex_DLModel_28_c1_ex_DLModel_28(const uint8_T image[921600],
  real32_T bboxes_data[], int32_T bboxes_size[2], real32_T scores_data[],
  int32_T scores_size[2], real32_T labelIds_data[], int32_T labelIds_size[2])
{
  emxArray_real32_T_ex_DLModel__T *cpu_box;
  emxArray_real32_T_ex_DLModel__T *cpu_box_0;
  emxArray_real32_T_ex_DLModel__T *cpu_c_x_Data;
  emxArray_real32_T_ex_DLModel__T *cpu_d_x;
  emxArray_real32_T_ex_DLModel__T *cpu_output;
  emxArray_real32_T_ex_DLModel__T *cpu_pred_Data;
  emxArray_real_T_ex_DLModel_28_T *cpu_centers;
  static const int8_T sizes[6] = { 60, 30, 15, 80, 40, 20 };

  static const int8_T cpu_fv[6300] = { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
    32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32 };

  real_T (*gpu_centersArray)[12600];
  real_T (*gpu_c_out_data)[6300];
  real_T (*gpu_idx_data)[6300];
  real_T (*gpu_score_data)[6300];
  real_T (*gpu_X_data)[4800];
  real_T (*gpu_Y_data)[4800];
  real_T (*gpu_b_y_data)[80];
  real_T (*gpu_y_data)[80];
  real32_T (*gpu_expl_temp_Data)[921600];
  real32_T (*gpu_b_out_Data)[907200];
  real32_T (*gpu_intermediateResult)[907200];
  real32_T (*gpu_matrixToCat)[691200];
  real32_T (*gpu_objX_Data)[691200];
  real32_T (*gpu_objdata)[691200];
  real32_T (*gpu_b_intermediateResult)[529200];
  real32_T (*gpu_b_x_Data)[504000];
  real32_T (*gpu_x)[504000];
  real32_T (*gpu_obj_Data)[403200];
  real32_T (*gpu_xdata)[403200];
  real32_T (*gpu_xdata_0)[403200];
  real32_T (*gpu_b_matrixToCat)[172800];
  real32_T (*gpu_b_objX_Data)[172800];
  real32_T (*gpu_b_objdata)[172800];
  real32_T (*gpu_c_matrixToCat)[43200];
  real32_T (*gpu_c_objX_Data)[43200];
  real32_T (*gpu_c_objdata)[43200];
  real32_T (*gpu_e_objX_Data)[25200];
  real32_T (*gpu_maxVal)[25200];
  real32_T (*gpu_maxVal_0)[25200];
  real32_T (*gpu_ConstantArray1)[12600];
  real32_T (*gpu_sub1)[12600];
  real32_T (*gpu_b_xdata)[6300];
  int16_T (*gpu_iv14_data)[6300];
  int16_T (*gpu_tmp_data)[6300];
  int16_T (*gpu_aux2)[1280];
  int16_T (*gpu_ipColIndices)[1280];
  int16_T (*gpu_aux1)[960];
  int16_T (*gpu_ipRowIndices)[960];
  int8_T (*gpu_c_obj_Data_data)[6300];
  int8_T (*gpu_fv)[6300];
  int8_T (*gpu_ii_data)[6300];
  int8_T (*gpu_colWeights)[1280];
  int8_T (*gpu_rowWeights)[960];
  int8_T (*gpu_colWeightsTotal)[640];
  int8_T (*gpu_rowWeightsTotal)[480];
  uint8_T (*gpu_img)[921600];
  uint8_T (*gpu_out)[921600];
  uint8_T (*gpu_partialResize)[921600];
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_fv, 6300UL), __FILE__, __LINE__);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_box_c);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_maxVal_0, 100800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_xdata_0, 1612800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_expl_temp_Data, 3686400UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_tmp_data, 12600UL), __FILE__,
    __LINE__);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_output);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_ii_data, 6300UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_iv14_data, 12600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_idx_data, 50400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_out_data, 50400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_score_data, 50400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_obj_Data_data, 6300UL),
    __FILE__, __LINE__);
  ex_DLModel_2_gpuEmxReset_real_T(&ex_DLModel_28_B.gpu_centers);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_Y_data, 38400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_X_data, 38400UL), __FILE__,
    __LINE__);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_d_x);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_box);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_c_x_Data);
  ex_DLModel_gpuEmxReset_real32_T(&ex_DLModel_28_B.gpu_pred_Data);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_y_data, 640UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_xdata, 25200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_x_Data, 2016000UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_intermediateResult, 2116800UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_sub1, 50400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_y_data, 640UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_ConstantArray1, 50400UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_centersArray, 100800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_e_objX_Data, 100800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_obj_Data, 1612800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_xdata, 1612800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_maxVal, 100800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_x, 2016000UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_out_Data, 3628800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_matrixToCat, 172800UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_matrixToCat, 691200UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_matrixToCat, 2764800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_intermediateResult, 3628800UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_objdata, 172800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_objdata, 691200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_objdata, 2764800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_objX_Data, 172800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_objX_Data, 691200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_objX_Data, 2764800UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_img, 921600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_out, 921600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_partialResize, 921600UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_colWeightsTotal, 640UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_rowWeightsTotal, 480UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_colWeights, 1280UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_ipColIndices, 2560UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_rowWeights, 960UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_ipRowIndices, 1920UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_aux2, 2560UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_aux1, 1920UL), __FILE__, __LINE__);
  ex_DLModel_28_B.tmp_data_outdatedOnGpu = false;
  ex_DLModel_28_B.empty_non_axis_sizes = false;
  ex_DLModel_28_B.box_needsGpuEnsureCapacity = true;
  bboxes_size[0] = 0;
  bboxes_size[1] = 4;
  scores_size[0] = 0;
  scores_size[1] = 1;
  labelIds_size[0] = 0;
  labelIds_size[1] = 1;
  if (!ex_DLModel_28_DW.det_not_empty) {
    ex_DLModel_28_dlnetwork_setup(&ex_DLModel_28_DL_ref->det);
    ex_DLModel_28_DL_ref->det.matlabCodegenIsDeleted = false;
    ex_DLModel_28_DW.det_not_empty = true;
  }

  ex_DL_c1_ex_DLModel_28_kernel68<<<dim3(8U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_aux1);
  ex_DL_c1_ex_DLModel_28_kernel69<<<dim3(10U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_aux2);
  ex_DL_c1_ex_DLModel_28_kernel70<<<dim3(8U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_aux1, *gpu_ipRowIndices, *gpu_rowWeights);
  ex_DL_c1_ex_DLModel_28_kernel71<<<dim3(10U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_aux2, *gpu_ipColIndices, *gpu_colWeights);
  ex_DL_c1_ex_DLModel_28_kernel72<<<dim3(4U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_rowWeights, *gpu_rowWeightsTotal);
  ex_DL_c1_ex_DLModel_28_kernel73<<<dim3(5U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_colWeights, *gpu_colWeightsTotal);
  ex_DL_c1_ex_DLModel_28_kernel74<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_rowWeightsTotal, *gpu_rowWeights, image, *gpu_ipRowIndices,
     *gpu_partialResize);
  ex_DL_c1_ex_DLModel_28_kernel75<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_colWeightsTotal, *gpu_colWeights, *gpu_partialResize,
     *gpu_ipColIndices, *gpu_out);
  ex_DL_c1_ex_DLModel_28_kernel76<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_out, *gpu_img);
  ex_DL_c1_ex_DLModel_28_kernel77<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_img, *gpu_partialResize);
  ex_DL_c1_ex_DLModel_28_kernel78<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_partialResize, *gpu_img);
  ex_DL_c1_ex_DLModel_28_kernel79<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_img, *gpu_expl_temp_Data);
  ex_DLModel_28_dlnetwork_predict(&ex_DLModel_28_DL_ref->det,
    *gpu_expl_temp_Data, *gpu_objX_Data, *gpu_b_objX_Data, *gpu_c_objX_Data);
  ex_DL_c1_ex_DLModel_28_kernel80<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_objX_Data, *gpu_objdata);
  ex_DL_c1_ex_DLModel_28_kernel81<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_objX_Data, *gpu_b_objdata);
  ex_DL_c1_ex_DLModel_28_kernel82<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*gpu_c_objX_Data, *gpu_c_objdata);
  ex_DL_c1_ex_DLModel_28_kernel83<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_objdata, *gpu_matrixToCat);
  ex_DL_c1_ex_DLModel_28_kernel84<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_matrixToCat, *gpu_intermediateResult);
  ex_DL_c1_ex_DLModel_28_kernel85<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_objdata, *gpu_b_matrixToCat);
  ex_DL_c1_ex_DLModel_28_kernel86<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_matrixToCat, *gpu_intermediateResult);
  ex_DL_c1_ex_DLModel_28_kernel87<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*gpu_c_objdata, *gpu_c_matrixToCat);
  ex_DL_c1_ex_DLModel_28_kernel88<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*gpu_c_matrixToCat, *gpu_intermediateResult);
  ex_DL_c1_ex_DLModel_28_kernel89<<<dim3(1772U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_intermediateResult, *gpu_b_out_Data);
  ex_DL_c1_ex_DLModel_28_kernel90<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_out_Data, *gpu_x);
  ex_DL_c1_ex_DLModel_28_kernel91<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_x);
  ex_DL_c1_ex_DLModel_28_kernel92<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_out_Data, *gpu_xdata);
  ReduceNonFirstDimLargeFirstDimK<<<dim3(788U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_xdata, *gpu_maxVal, 6300U, 16U, 0U, true);
  ex_DL_c1_ex_DLModel_28_kernel93<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_maxVal, *gpu_xdata, *gpu_xdata_0);
  ex_DL_c1_ex_DLModel_28_kernel94<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_xdata_0, *gpu_xdata);
  ReduceNonFirstDimLargeFirstDi_h<<<dim3(788U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_xdata, *gpu_maxVal, 6300U, 16U, 0U, true);
  ex_DL_c1_ex_DLModel_28_kernel95<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_maxVal, *gpu_xdata, *gpu_obj_Data);
  ex_DL_c1_ex_DLModel_28_kernel96<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_obj_Data, *gpu_xdata);
  conv2dCudaImplicitGemmColMajor(*gpu_xdata, *gpu_e_objX_Data);
  ex_DL_c1_ex_DLModel_28_kernel97<<<dim3(99U, 1U, 1U), dim3(256U, 1U, 1U)>>>
    (*gpu_e_objX_Data, *gpu_maxVal);
  ex_DL_c1_ex_DLModel_28_kernel98<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_centersArray);
  ex_DLModel_28_B.centersArray_outdatedOnGpu = false;
  ex_DLModel_28_B.centersArray_outdatedOnCpu = true;
  ex_DLModel_28_B.currentIndex = 0;
  ex_DLModel_28_emxInit_real_T(&cpu_centers, 2);
  for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < 3; ex_DLModel_28_B.b++) {
    ex_DLModel_28_B.sizes = sizes[ex_DLModel_28_B.b];
    ex_DLModel_28_B.ndbl = static_cast<int32_T>(floor(((static_cast<real_T>
      (ex_DLModel_28_B.sizes) - 0.5) - 0.5) + 0.5));
    ex_DLModel_28_B.apnd = static_cast<real_T>(ex_DLModel_28_B.ndbl) + 0.5;
    ex_DLModel_28_B.cdiff = (static_cast<real_T>(ex_DLModel_28_B.ndbl) + 0.5) -
      (static_cast<real_T>(ex_DLModel_28_B.sizes) - 0.5);
    if (fabs(ex_DLModel_28_B.cdiff) < (static_cast<real_T>(ex_DLModel_28_B.sizes)
         - 0.5) * 4.4408920985006262E-16) {
      ex_DLModel_28_B.ndbl++;
      ex_DLModel_28_B.apnd = static_cast<real_T>(ex_DLModel_28_B.sizes) - 0.5;
    } else if (ex_DLModel_28_B.cdiff > 0.0) {
      ex_DLModel_28_B.apnd = (static_cast<real_T>(ex_DLModel_28_B.ndbl) - 1.0) +
        0.5;
    } else {
      ex_DLModel_28_B.ndbl++;
    }

    ex_DLModel_28_B.inDims[1] = ex_DLModel_28_B.ndbl;
    ex_DL_c1_ex_DLModel_28_kernel99<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(0, *
      gpu_y_data);
    ex_D_c1_ex_DLModel_28_kernel100<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.apnd, ex_DLModel_28_B.ndbl, *gpu_y_data);
    ex_DLModel_28_B.nm1d2 = (ex_DLModel_28_B.ndbl - 1) >> 1;
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.nm1d2
      - 2), &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel101<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.apnd, ex_DLModel_28_B.ndbl,
        ex_DLModel_28_B.nm1d2 - 2, *gpu_y_data);
    }

    if (ex_DLModel_28_B.nm1d2 << 1 == ex_DLModel_28_B.ndbl - 1) {
      ex_D_c1_ex_DLModel_28_kernel102<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (ex_DLModel_28_B.apnd, ex_DLModel_28_B.nm1d2, *gpu_y_data);
    } else {
      ex_D_c1_ex_DLModel_28_kernel110<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (ex_DLModel_28_B.apnd, ex_DLModel_28_B.nm1d2, *gpu_y_data);
    }

    ex_DLModel_28_B.sizes = sizes[ex_DLModel_28_B.b + 3];
    ex_DLModel_28_B.ndbl = static_cast<int32_T>(floor(((static_cast<real_T>
      (ex_DLModel_28_B.sizes) - 0.5) - 0.5) + 0.5));
    ex_DLModel_28_B.apnd = static_cast<real_T>(ex_DLModel_28_B.ndbl) + 0.5;
    ex_DLModel_28_B.cdiff = (static_cast<real_T>(ex_DLModel_28_B.ndbl) + 0.5) -
      (static_cast<real_T>(ex_DLModel_28_B.sizes) - 0.5);
    if (fabs(ex_DLModel_28_B.cdiff) < (static_cast<real_T>(ex_DLModel_28_B.sizes)
         - 0.5) * 4.4408920985006262E-16) {
      ex_DLModel_28_B.ndbl++;
      ex_DLModel_28_B.apnd = static_cast<real_T>(ex_DLModel_28_B.sizes) - 0.5;
    } else if (ex_DLModel_28_B.cdiff > 0.0) {
      ex_DLModel_28_B.apnd = (static_cast<real_T>(ex_DLModel_28_B.ndbl) - 1.0) +
        0.5;
    } else {
      ex_DLModel_28_B.ndbl++;
    }

    ex_D_c1_ex_DLModel_28_kernel103<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(0, *
      gpu_b_y_data);
    ex_D_c1_ex_DLModel_28_kernel104<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.apnd, ex_DLModel_28_B.ndbl, *gpu_b_y_data);
    ex_DLModel_28_B.nm1d2 = (ex_DLModel_28_B.ndbl - 1) >> 1;
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.nm1d2
      - 2), &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel105<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.apnd, ex_DLModel_28_B.ndbl,
        ex_DLModel_28_B.nm1d2 - 2, *gpu_b_y_data);
    }

    if (ex_DLModel_28_B.nm1d2 << 1 == ex_DLModel_28_B.ndbl - 1) {
      ex_D_c1_ex_DLModel_28_kernel106<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (ex_DLModel_28_B.apnd, ex_DLModel_28_B.nm1d2, *gpu_b_y_data);
    } else {
      ex_D_c1_ex_DLModel_28_kernel109<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (ex_DLModel_28_B.apnd, ex_DLModel_28_B.nm1d2, *gpu_b_y_data);
    }

    ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h
      (ex_DLModel_28_B.inDims[1] - 1, ex_DLModel_28_B.ndbl - 1);
    mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel107<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(*gpu_b_y_data, *gpu_y_data,
        ex_DLModel_28_B.ndbl, ex_DLModel_28_B.ndbl - 1, ex_DLModel_28_B.inDims[1]
        - 1, *gpu_Y_data, *gpu_X_data);
    }

    ex_DLModel_28_B.X_data_outdatedOnCpu = true;
    ex_DLModel_28_B.ndbl *= ex_DLModel_28_B.inDims[1];
    ex_DLModel_28_B.y_data_tmp = cpu_centers->size[0] * cpu_centers->size[1];
    cpu_centers->size[0] = ex_DLModel_28_B.ndbl;
    cpu_centers->size[1] = 2;
    ex_DLM_emxEnsureCapacity_real_T(cpu_centers, ex_DLModel_28_B.y_data_tmp);
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.ndbl -
      1), &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
    ex__gpuEmxEnsureCapacity_real_T(cpu_centers, &ex_DLModel_28_B.gpu_centers,
      true);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel108<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(*gpu_Y_data, ex_DLModel_28_B.ndbl - 1,
        ex_DLModel_28_B.gpu_centers);
    }

    ex_DLModel_28_B.centers_outdatedOnCpu = true;
    for (ex_DLModel_28_B.nm1d2 = 0; ex_DLModel_28_B.nm1d2 < ex_DLModel_28_B.ndbl;
         ex_DLModel_28_B.nm1d2++) {
      if (ex_DLModel_28_B.centers_outdatedOnCpu) {
        ex__gpuEmxMemcpyGpuToCpu_real_T(cpu_centers,
          &ex_DLModel_28_B.gpu_centers);
      }

      if (ex_DLModel_28_B.X_data_outdatedOnCpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_X_data,
          *gpu_X_data, 38400UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.X_data_outdatedOnCpu = false;
      cpu_centers->data[ex_DLModel_28_B.nm1d2 + ex_DLModel_28_B.ndbl] =
        ex_DLModel_28_B.cpu_X_data[ex_DLModel_28_B.nm1d2];
      ex_DLModel_28_B.centers_outdatedOnCpu = false;
    }

    ex_DLModel_28_B.ndbl = ex_DLModel_28_B.currentIndex + cpu_centers->size[0];
    if (ex_DLModel_28_B.currentIndex + 1 > ex_DLModel_28_B.ndbl) {
      ex_DLModel_28_B.currentIndex = 0;
      ex_DLModel_28_B.nm1d2 = 0;
    } else {
      ex_DLModel_28_B.nm1d2 = ex_DLModel_28_B.ndbl;
    }

    ex_DLModel_28_B.i3_idx_0 = ex_DLModel_28_B.nm1d2 -
      ex_DLModel_28_B.currentIndex;
    for (ex_DLModel_28_B.nm1d2 = 0; ex_DLModel_28_B.nm1d2 < 2;
         ex_DLModel_28_B.nm1d2++) {
      for (ex_DLModel_28_B.y_data_tmp = 0; ex_DLModel_28_B.y_data_tmp <
           ex_DLModel_28_B.i3_idx_0; ex_DLModel_28_B.y_data_tmp++) {
        if (ex_DLModel_28_B.centersArray_outdatedOnCpu) {
          ex_DLModel_28_checkCudaError(cudaMemcpy
            (ex_DLModel_28_B.cpu_centersArray, *gpu_centersArray, 100800UL,
             cudaMemcpyDeviceToHost), __FILE__, __LINE__);
        }

        if (ex_DLModel_28_B.centers_outdatedOnCpu) {
          ex__gpuEmxMemcpyGpuToCpu_real_T(cpu_centers,
            &ex_DLModel_28_B.gpu_centers);
        }

        ex_DLModel_28_B.centers_outdatedOnCpu = false;
        ex_DLModel_28_B.cpu_centersArray[(ex_DLModel_28_B.currentIndex +
          ex_DLModel_28_B.y_data_tmp) + 6300 * ex_DLModel_28_B.nm1d2] =
          cpu_centers->data[cpu_centers->size[0] * ex_DLModel_28_B.nm1d2 +
          ex_DLModel_28_B.y_data_tmp];
        ex_DLModel_28_B.centersArray_outdatedOnCpu = false;
        ex_DLModel_28_B.centersArray_outdatedOnGpu = true;
      }
    }

    ex_DLModel_28_B.currentIndex = ex_DLModel_28_B.ndbl;
  }

  ex_DLModel_28_emxFree_real_T(&cpu_centers);
  if (ex_DLModel_28_B.centersArray_outdatedOnGpu) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_centersArray,
      ex_DLModel_28_B.cpu_centersArray, 100800UL, cudaMemcpyHostToDevice),
      __FILE__, __LINE__);
  }

  ex_D_c1_ex_DLModel_28_kernel111<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_centersArray, *gpu_ConstantArray1);
  ex_D_c1_ex_DLModel_28_kernel112<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_maxVal, *gpu_sub1, *gpu_ConstantArray1);
  ex_D_c1_ex_DLModel_28_kernel113<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_sub1, *gpu_maxVal, *gpu_ConstantArray1);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_fv, cpu_fv, 6300UL,
    cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_D_c1_ex_DLModel_28_kernel114<<<dim3(99U, 1U, 1U), dim3(256U, 1U, 1U)>>>
    (*gpu_fv, *gpu_maxVal, *gpu_maxVal_0);
  ex_D_c1_ex_DLModel_28_kernel115<<<dim3(99U, 1U, 1U), dim3(256U, 1U, 1U)>>>
    (*gpu_maxVal_0, *gpu_b_intermediateResult);
  ex_D_c1_ex_DLModel_28_kernel116<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_x, *gpu_b_intermediateResult);
  ex_D_c1_ex_DLModel_28_kernel117<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_intermediateResult, *gpu_b_x_Data);
  ex_D_c1_ex_DLModel_28_kernel118<<<dim3(50U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*gpu_b_intermediateResult, *gpu_b_x_Data, *gpu_b_xdata);
  ex_DLModel_28_B.centersArray_outdatedOnGpu = true;
  ex_DLModel_28_B.currentIndex = 0;
  for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < 6300; ex_DLModel_28_B.b++) {
    if (ex_DLModel_28_B.centersArray_outdatedOnGpu) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_b_xdata,
        *gpu_b_xdata, 25200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    ex_DLModel_28_B.centersArray_outdatedOnGpu = false;
    if (ex_DLModel_28_B.cpu_b_xdata[ex_DLModel_28_B.b] > 0.25F) {
      ex_DLModel_28_B.currentIndex++;
    }
  }

  ex_DLModel_28_B.tmp_size_p = static_cast<int16_T>(ex_DLModel_28_B.currentIndex);
  ex_DLModel_28_B.currentIndex = 0;
  for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < 6300; ex_DLModel_28_B.b++) {
    if (ex_DLModel_28_B.centersArray_outdatedOnGpu) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_b_xdata,
        *gpu_b_xdata, 25200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    ex_DLModel_28_B.centersArray_outdatedOnGpu = false;
    if (ex_DLModel_28_B.cpu_b_xdata[ex_DLModel_28_B.b] > 0.25F) {
      ex_DLModel_28_B.cpu_tmp_data[ex_DLModel_28_B.currentIndex] = static_cast<
        int16_T>(ex_DLModel_28_B.b);
      ex_DLModel_28_B.tmp_data_outdatedOnGpu = true;
      ex_DLModel_28_B.currentIndex++;
    }
  }

  ex_DLModel_28_emxInit_real32_T(&cpu_pred_Data, 2);
  cpu_pred_Data->size[0] = ex_DLModel_28_B.tmp_size_p;
  cpu_pred_Data->size[1] = 84;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(83,
    ex_DLModel_28_B.tmp_size_p - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_pred_Data, &ex_DLModel_28_B.gpu_pred_Data,
    true);
  if (ex_DLModel_28_B.tmp_data_outdatedOnGpu) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_tmp_data,
      ex_DLModel_28_B.cpu_tmp_data, 12600UL, cudaMemcpyHostToDevice), __FILE__,
      __LINE__);
  }

  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel119<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_b_intermediateResult, *gpu_tmp_data,
      ex_DLModel_28_B.tmp_size_p - 1, ex_DLModel_28_B.gpu_pred_Data,
      cpu_pred_Data->size[0U]);
  }

  ex_DLM_emxInitStruct_dlarray_38(&cpu_c_x_Data);
  cpu_c_x_Data->size[0] = ex_DLModel_28_B.tmp_size_p;
  cpu_c_x_Data->size[1] = 80;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(79,
    ex_DLModel_28_B.tmp_size_p - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_c_x_Data, &ex_DLModel_28_B.gpu_c_x_Data,
    true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel120<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_b_intermediateResult, *gpu_tmp_data,
      ex_DLModel_28_B.tmp_size_p - 1, ex_DLModel_28_B.gpu_c_x_Data,
      cpu_c_x_Data->size[0U]);
  }

  ex_DLModel_28_emxInit_real32_T(&cpu_box, 2);
  ex_DLModel_28_B.y_data_tmp = cpu_box->size[0] * cpu_box->size[1];
  cpu_box->size[0] = ex_DLModel_28_B.tmp_size_p;
  cpu_box->size[1] = 4;
  ex_D_emxEnsureCapacity_real32_T(cpu_box, ex_DLModel_28_B.y_data_tmp);
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.tmp_size_p - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel121<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_b_intermediateResult, *gpu_tmp_data,
      ex_DLModel_28_B.tmp_size_p - 1, ex_DLModel_28_B.gpu_box, cpu_box->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel122<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_b_intermediateResult, *gpu_tmp_data,
      ex_DLModel_28_B.tmp_size_p - 1, *gpu_b_xdata, ex_DLModel_28_B.gpu_box,
      cpu_box->size[0U]);
  }

  ex_DLModel_28_B.ndbl = cpu_box->size[0] << 2;
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.ndbl - 1),
    &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.tmp_data_outdatedOnGpu = false;
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel123<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.ndbl - 1,
      ex_DLModel_28_B.gpu_box);
  }

  ex_DLModel_28_B.centersArray_outdatedOnGpu = false;
  ex_DLModel_28_B.centersArray_outdatedOnCpu = true;
  for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < ex_DLModel_28_B.ndbl;
       ex_DLModel_28_B.b++) {
    if (ex_DLModel_28_B.centersArray_outdatedOnCpu) {
      e_gpuEmxMemcpyGpuToCpu_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box);
    }

    ex_DLModel_28_B.centersArray_outdatedOnCpu = false;
    if (cpu_box->data[ex_DLModel_28_B.b] < 1.0F) {
      cpu_box->data[ex_DLModel_28_B.b] = 1.0F;
      ex_DLModel_28_B.centersArray_outdatedOnGpu = true;
      ex_DLModel_28_B.tmp_data_outdatedOnGpu = true;
    }
  }

  ex_DLModel_28_emxInit_real32_T(&cpu_d_x, 2);
  cpu_d_x->size[0] = ex_DLModel_28_B.tmp_size_p;
  cpu_d_x->size[1] = 80;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(79,
    ex_DLModel_28_B.tmp_size_p - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_d_x, &ex_DLModel_28_B.gpu_d_x, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel124<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_pred_Data,
      ex_DLModel_28_B.tmp_size_p - 1, ex_DLModel_28_B.gpu_d_x, cpu_d_x->size[0U],
      cpu_pred_Data->size[0U]);
  }

  ex_DLModel_28_emxFree_real32_T(&cpu_pred_Data);
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel125<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.tmp_size_p - 1, *gpu_ii_data);
  }

  if (ex_DLModel_28_B.tmp_size_p == 0) {
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(-1),
      &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel126<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(-1, *gpu_b_xdata);
    }
  } else {
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel152<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_d_x,
        ex_DLModel_28_B.gpu_c_x_Data, ex_DLModel_28_B.tmp_size_p * 79,
        static_cast<int32_T>(ex_DLModel_28_B.tmp_size_p),
        ex_DLModel_28_B.tmp_size_p - 1, *gpu_ii_data, *gpu_b_xdata);
    }
  }

  ex_DLModel_28_emxFree_real32_T(&cpu_d_x);
  ex_DLM_emxFreeStruct_dlarray_38(&cpu_c_x_Data);
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel127<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_b_xdata, *gpu_ii_data,
      ex_DLModel_28_B.tmp_size_p - 1, *gpu_score_data, *gpu_c_obj_Data_data);
  }

  ex_DLModel_28_emxInit_real32_T(&cpu_box_0, 2);
  if (cpu_box->size[0] == 0) {
    cpu_box_0->size[0] = 0;
    cpu_box_0->size[1] = 4;
    ex_DLModel_28_B.idx_size = ex_DLModel_28_B.tmp_size_p;
    ex_DLModel_28_B.c_out_size = ex_DLModel_28_B.tmp_size_p;
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel128<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(*gpu_c_obj_Data_data, *gpu_score_data,
        ex_DLModel_28_B.tmp_size_p - 1, *gpu_c_out_data, *gpu_idx_data);
    }
  } else {
    ex_DLModel_28_B.box_needsGpuEnsureCapacity = false;
    ex_DLModel_28_B.idx_size = ex_DLModel_28_B.tmp_size_p;
    if (ex_DLModel_28_B.tmp_size_p != 0) {
      ex_DLModel_28_B.b = 2;
      if (ex_DLModel_28_B.tmp_size_p != 1) {
        ex_DLModel_28_B.b = 1;
      }

      ex_DLModel_28_B.inDims[0] = ex_DLModel_28_B.tmp_size_p;
      ex_DLModel_28_B.inDims[1] = 1;
      ex_DLModel_28_B.idx_size = ex_DLModel_28_B.tmp_size_p;
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.tmp_size_p - 1), &ex_DLModel_28_B.grid_f,
        &ex_DLModel_28_B.block_g, 65535U);
      ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
      if (ex_DLModel_28_B.validLaunchParams_g) {
        ex_D_c1_ex_DLModel_28_kernel147<<<ex_DLModel_28_B.grid_f,
          ex_DLModel_28_B.block_g>>>(*gpu_score_data, ex_DLModel_28_B.tmp_size_p
          - 1, *gpu_idx_data, *gpu_c_out_data);
      }

      gpu_sort_with_index(&(*gpu_c_out_data)[0], &(*gpu_idx_data)[0], 2.0,
                          &ex_DLModel_28_B.inDims[0], ex_DLModel_28_B.b, false,
                          false);
      ex_DLModel_28_B.box_needsGpuEnsureCapacity = true;
    }

    ex_DLModel_28_B.y_data_tmp = cpu_box_0->size[0] * cpu_box_0->size[1];
    cpu_box_0->size[0] = ex_DLModel_28_B.idx_size;
    cpu_box_0->size[1] = 4;
    ex_D_emxEnsureCapacity_real32_T(cpu_box_0, ex_DLModel_28_B.y_data_tmp);
    ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
      ex_DLModel_28_B.idx_size - 1);
    mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    if (ex_DLModel_28_B.tmp_data_outdatedOnGpu) {
      e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box,
        !ex_DLModel_28_B.centersArray_outdatedOnGpu);
    }

    e_gpuEmxEnsureCapacity_real32_T(cpu_box_0, &ex_DLModel_28_B.gpu_box_c, true);
    if (ex_DLModel_28_B.centersArray_outdatedOnGpu) {
      e_gpuEmxMemcpyCpuToGpu_real32_T(&ex_DLModel_28_B.gpu_box, cpu_box);
    }

    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel148<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box, *gpu_idx_data,
        ex_DLModel_28_B.idx_size - 1, ex_DLModel_28_B.gpu_box_c, cpu_box_0->
        size[0U], cpu_box->size[0U]);
    }

    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.idx_size - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel149<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(*gpu_c_obj_Data_data, *gpu_idx_data,
        ex_DLModel_28_B.idx_size - 1, *gpu_b_xdata);
    }

    e_gpuEmxMemcpyGpuToCpu_real32_T(cpu_box_0, &ex_DLModel_28_B.gpu_box_c);
    ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_b_xdata,
      *gpu_b_xdata, 25200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    ex_D_selectStrongestBboxCodegen(cpu_box_0, ex_DLModel_28_B.cpu_b_xdata,
      ex_DLModel_28_B.selectedIndex_data, &ex_DLModel_28_B.selectedIndex_size);
    ex_DLModel_28_B.ndbl = ex_DLModel_28_B.selectedIndex_size;
    for (ex_DLModel_28_B.nm1d2 = 0; ex_DLModel_28_B.nm1d2 < ex_DLModel_28_B.ndbl;
         ex_DLModel_28_B.nm1d2++) {
      if (ex_DLModel_28_B.box_needsGpuEnsureCapacity) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_idx_data,
          *gpu_idx_data, 50400UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.box_needsGpuEnsureCapacity = false;
      ex_DLModel_28_B.b_index_data[static_cast<int32_T>
        (ex_DLModel_28_B.cpu_idx_data[ex_DLModel_28_B.nm1d2]) - 1] =
        ex_DLModel_28_B.selectedIndex_data[ex_DLModel_28_B.nm1d2];
    }

    ex_DLModel_28_B.currentIndex = 0;
    for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < ex_DLModel_28_B.ndbl;
         ex_DLModel_28_B.b++) {
      if (ex_DLModel_28_B.b_index_data[ex_DLModel_28_B.b]) {
        ex_DLModel_28_B.currentIndex++;
      }
    }

    ex_DLModel_28_B.varargin_1_tmp_size = ex_DLModel_28_B.currentIndex;
    ex_DLModel_28_B.currentIndex = 0;
    for (ex_DLModel_28_B.b = 0; ex_DLModel_28_B.b < ex_DLModel_28_B.ndbl;
         ex_DLModel_28_B.b++) {
      if (ex_DLModel_28_B.b_index_data[ex_DLModel_28_B.b]) {
        ex_DLModel_28_B.cpu_iv14_data[ex_DLModel_28_B.currentIndex] =
          static_cast<int16_T>(ex_DLModel_28_B.b);
        ex_DLModel_28_B.empty_non_axis_sizes = true;
        ex_DLModel_28_B.currentIndex++;
      }
    }

    ex_DLModel_28_B.y_data_tmp = cpu_box_0->size[0] * cpu_box_0->size[1];
    cpu_box_0->size[0] = ex_DLModel_28_B.varargin_1_tmp_size;
    cpu_box_0->size[1] = 4;
    ex_D_emxEnsureCapacity_real32_T(cpu_box_0, ex_DLModel_28_B.y_data_tmp);
    ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
      ex_DLModel_28_B.varargin_1_tmp_size - 1);
    mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    e_gpuEmxEnsureCapacity_real32_T(cpu_box_0, &ex_DLModel_28_B.gpu_box_c, true);
    ex_DLModel_28_B.box_needsGpuEnsureCapacity = false;
    if (ex_DLModel_28_B.empty_non_axis_sizes) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_iv14_data,
        ex_DLModel_28_B.cpu_iv14_data, 12600UL, cudaMemcpyHostToDevice),
        __FILE__, __LINE__);
    }

    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel150<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box, *gpu_iv14_data,
        ex_DLModel_28_B.varargin_1_tmp_size - 1, ex_DLModel_28_B.gpu_box_c,
        cpu_box_0->size[0U], cpu_box->size[0U]);
    }

    ex_DLModel_28_B.idx_size = ex_DLModel_28_B.varargin_1_tmp_size;
    ex_DLModel_28_B.c_out_size = ex_DLModel_28_B.varargin_1_tmp_size;
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.varargin_1_tmp_size - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel151<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(*gpu_c_obj_Data_data, *gpu_score_data,
        *gpu_iv14_data, ex_DLModel_28_B.varargin_1_tmp_size - 1, *gpu_c_out_data,
        *gpu_idx_data);
    }
  }

  if (cpu_box_0->size[0] != 0) {
    ex_DLModel_28_B.b_sizes[0] = static_cast<int16_T>(cpu_box_0->size[0]);
  } else if (ex_DLModel_28_B.idx_size != 0) {
    ex_DLModel_28_B.b_sizes[0] = static_cast<int16_T>(ex_DLModel_28_B.idx_size);
  } else if (ex_DLModel_28_B.c_out_size != 0) {
    ex_DLModel_28_B.b_sizes[0] = static_cast<int16_T>(ex_DLModel_28_B.c_out_size);
  } else {
    ex_DLModel_28_B.b_sizes[0] = 0;
  }

  ex_DLModel_28_B.empty_non_axis_sizes = (ex_DLModel_28_B.b_sizes[0] == 0);
  ex_DLModel_28_emxInit_real32_T(&cpu_output, 2);
  ex_DLModel_28_B.y_data_tmp = cpu_output->size[0] * cpu_output->size[1];
  cpu_output->size[0] = ex_DLModel_28_B.b_sizes[0];
  ex_D_emxEnsureCapacity_real32_T(cpu_output, ex_DLModel_28_B.y_data_tmp);
  if (ex_DLModel_28_B.empty_non_axis_sizes) {
    ex_DLModel_28_B.sizes = 4;
    ex_DLModel_28_B.i8 = 1;
    ex_DLModel_28_B.i4 = 1;
  } else {
    if (cpu_box_0->size[0] != 0) {
      ex_DLModel_28_B.sizes = 4;
    } else {
      ex_DLModel_28_B.sizes = 0;
    }

    ex_DLModel_28_B.i8 = static_cast<int8_T>(ex_DLModel_28_B.idx_size != 0);
    ex_DLModel_28_B.i4 = ex_DLModel_28_B.i8;
  }

  ex_DLModel_28_B.y_data_tmp = cpu_output->size[0] * cpu_output->size[1];
  cpu_output->size[1] = (ex_DLModel_28_B.sizes + ex_DLModel_28_B.i8) +
    ex_DLModel_28_B.i4;
  ex_D_emxEnsureCapacity_real32_T(cpu_output, ex_DLModel_28_B.y_data_tmp);
  if (ex_DLModel_28_B.empty_non_axis_sizes) {
    ex_DLModel_28_B.sizes = 4;
  } else if (cpu_box_0->size[0] != 0) {
    ex_DLModel_28_B.sizes = 4;
  } else {
    ex_DLModel_28_B.sizes = 0;
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_sizes
    [0] * ex_DLModel_28_B.sizes - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  if (ex_DLModel_28_B.box_needsGpuEnsureCapacity) {
    e_gpuEmxEnsureCapacity_real32_T(cpu_box_0, &ex_DLModel_28_B.gpu_box_c, true);
  }

  e_gpuEmxEnsureCapacity_real32_T(cpu_output, &ex_DLModel_28_B.gpu_output, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel129<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box_c,
      ex_DLModel_28_B.b_sizes[0] * ex_DLModel_28_B.sizes - 1,
      ex_DLModel_28_B.gpu_output);
  }

  if (ex_DLModel_28_B.empty_non_axis_sizes) {
    ex_DLModel_28_B.sizes = 1;
  } else {
    ex_DLModel_28_B.sizes = static_cast<int8_T>(ex_DLModel_28_B.idx_size != 0);
  }

  ex_DLModel_28_B.ndbl = ex_DLModel_28_B.b_sizes[0] * ex_DLModel_28_B.sizes;
  if (ex_DLModel_28_B.ndbl - 1 >= 0) {
    if (ex_DLModel_28_B.empty_non_axis_sizes) {
      ex_DLModel_28_B.i7 = 4;
    } else if (cpu_box_0->size[0] != 0) {
      ex_DLModel_28_B.i7 = 4;
    } else {
      ex_DLModel_28_B.i7 = 0;
    }
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.ndbl - 1),
    &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel130<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_idx_data, ex_DLModel_28_B.i7,
      ex_DLModel_28_B.b_sizes[0], ex_DLModel_28_B.ndbl - 1,
      ex_DLModel_28_B.gpu_output);
  }

  if (ex_DLModel_28_B.empty_non_axis_sizes) {
    ex_DLModel_28_B.sizes = 1;
  } else {
    ex_DLModel_28_B.sizes = static_cast<int8_T>(ex_DLModel_28_B.c_out_size != 0);
  }

  ex_DLModel_28_B.ndbl = ex_DLModel_28_B.b_sizes[0] * ex_DLModel_28_B.sizes;
  if (ex_DLModel_28_B.ndbl - 1 >= 0) {
    if (ex_DLModel_28_B.empty_non_axis_sizes) {
      ex_DLModel_28_B.i5 = 4;
      ex_DLModel_28_B.i6 = 1;
    } else {
      if (cpu_box_0->size[0] != 0) {
        ex_DLModel_28_B.i5 = 4;
      } else {
        ex_DLModel_28_B.i5 = 0;
      }

      ex_DLModel_28_B.i6 = static_cast<int8_T>(ex_DLModel_28_B.idx_size != 0);
    }
  }

  ex_DLModel_28_emxFree_real32_T(&cpu_box_0);
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.ndbl - 1),
    &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel131<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(*gpu_c_out_data, ex_DLModel_28_B.b_sizes[0],
      ex_DLModel_28_B.i6, ex_DLModel_28_B.i5, ex_DLModel_28_B.ndbl - 1,
      ex_DLModel_28_B.gpu_output);
  }

  ex_DLModel_28_B.y_data_tmp = cpu_box->size[0] * cpu_box->size[1];
  cpu_box->size[0] = ex_DLModel_28_B.b_sizes[0];
  cpu_box->size[1] = 4;
  ex_D_emxEnsureCapacity_real32_T(cpu_box, ex_DLModel_28_B.y_data_tmp);
  ex_DLModel_28_B.b = cpu_output->size[0] - 1;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.b);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel132<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output, ex_DLModel_28_B.b,
      ex_DLModel_28_B.gpu_box, cpu_box->size[0U], cpu_output->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_sizes
    [0] - 1), &ex_DLModel_28_B.grid_f, &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel133<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
      ex_DLModel_28_B.b_sizes[0] - 1, ex_DLModel_28_B.gpu_box, cpu_box->size[0U],
      cpu_output->size[0U]);
  }

  if (cpu_box->size[0] == cpu_output->size[0]) {
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.b_sizes[0] - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.tmp_data_outdatedOnGpu = false;
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel134<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
        ex_DLModel_28_B.b_sizes[0] - 1, ex_DLModel_28_B.gpu_box, *gpu_b_xdata,
        cpu_box->size[0U], cpu_output->size[0U]);
    }

    ex_DLModel_28_B.centersArray_outdatedOnGpu = false;
  } else {
    e_gpuEmxMemcpyGpuToCpu_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box);
    e_gpuEmxMemcpyGpuToCpu_real32_T(cpu_output, &ex_DLModel_28_B.gpu_output);
    ex_DLModel_28_binary_expand_op(cpu_box, cpu_output);
    ex_DLModel_28_B.centersArray_outdatedOnGpu = true;
    ex_DLModel_28_B.tmp_data_outdatedOnGpu = true;
  }

  ex_DLModel_28_B.output_tmp = static_cast<int16_T>(cpu_output->size[0]);
  ex_DLModel_28_B.b_sizes[0] = static_cast<int16_T>(cpu_output->size[0]);
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.b_sizes[0] - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  if (ex_DLModel_28_B.tmp_data_outdatedOnGpu) {
    e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box,
      !ex_DLModel_28_B.centersArray_outdatedOnGpu);
  }

  if (ex_DLModel_28_B.centersArray_outdatedOnGpu) {
    e_gpuEmxMemcpyCpuToGpu_real32_T(&ex_DLModel_28_B.gpu_box, cpu_box);
  }

  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel135<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box,
      ex_DLModel_28_B.b_sizes[0] - 1, ex_DLModel_28_B.gpu_output,
      cpu_output->size[0U], cpu_box->size[0U]);
  }

  ex_DLModel_28_B.currentIndex = cpu_output->size[0];
  ex_DLModel_28_B.y_data_tmp = cpu_box->size[0] * cpu_box->size[1];
  cpu_box->size[0] = cpu_output->size[0];
  cpu_box->size[1] = 4;
  ex_D_emxEnsureCapacity_real32_T(cpu_box, ex_DLModel_28_B.y_data_tmp);
  ex_DLModel_28_B.b = cpu_output->size[0] - 1;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.b);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel136<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output, ex_DLModel_28_B.b,
      ex_DLModel_28_B.gpu_box, cpu_box->size[0U], cpu_output->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel137<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
      ex_DLModel_28_B.currentIndex - 1, *gpu_b_xdata, ex_DLModel_28_B.gpu_box);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel138<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.currentIndex - 1,
      ex_DLModel_28_B.gpu_box, *gpu_b_xdata, cpu_box->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel139<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.currentIndex - 1,
      ex_DLModel_28_B.gpu_box, *gpu_b_xdata, cpu_box->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel140<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.currentIndex - 1,
      ex_DLModel_28_B.gpu_box, *gpu_b_xdata, cpu_box->size[0U]);
  }

  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.output_tmp - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel141<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box,
      ex_DLModel_28_B.output_tmp - 1, ex_DLModel_28_B.gpu_output,
      cpu_output->size[0U], cpu_box->size[0U]);
  }

  ex_DLModel_28_B.y_data_tmp = cpu_box->size[0] * cpu_box->size[1];
  cpu_box->size[0] = ex_DLModel_28_B.currentIndex;
  cpu_box->size[1] = 4;
  ex_D_emxEnsureCapacity_real32_T(cpu_box, ex_DLModel_28_B.y_data_tmp);
  ex_DLModel_28_B.b = cpu_output->size[0] - 1;
  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.b);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  e_gpuEmxEnsureCapacity_real32_T(cpu_box, &ex_DLModel_28_B.gpu_box, true);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel142<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output, ex_DLModel_28_B.b,
      ex_DLModel_28_B.gpu_box, cpu_box->size[0U], cpu_output->size[0U]);
  }

  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel143<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
      ex_DLModel_28_B.currentIndex - 1, *gpu_b_xdata, ex_DLModel_28_B.gpu_box,
      cpu_box->size[0U], cpu_output->size[0U]);
  }

  ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
    ex_DLModel_28_B.output_tmp - 1);
  mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
    &ex_DLModel_28_B.block_g, 65535U);
  ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
  if (ex_DLModel_28_B.validLaunchParams_g) {
    ex_D_c1_ex_DLModel_28_kernel144<<<ex_DLModel_28_B.grid_f,
      ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_box,
      ex_DLModel_28_B.output_tmp - 1, ex_DLModel_28_B.gpu_output,
      cpu_output->size[0U], cpu_box->size[0U]);
  }

  ex_DLModel_28_emxFree_real32_T(&cpu_box);
  ex_DLModel_28_B.currentIndex = cpu_output->size[0];
  if (ex_DLModel_28_B.currentIndex <= 100) {
  } else {
    ex_DLModel_28_B.currentIndex = 100;
  }

  if (ex_DLModel_28_B.currentIndex > 0) {
    bboxes_size[0] = ex_DLModel_28_B.currentIndex;
    bboxes_size[1] = 4;
    ex_DLModel_28_B.numIters_g = ex_DLModel_28_computeNumIters_h(3,
      ex_DLModel_28_B.currentIndex - 1);
    mwGetLaunchParameters1D(ex_DLModel_28_B.numIters_g, &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel145<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
        ex_DLModel_28_B.currentIndex, ex_DLModel_28_B.currentIndex - 1,
        bboxes_data, cpu_output->size[0U]);
    }

    scores_size[0] = ex_DLModel_28_B.currentIndex;
    scores_size[1] = 1;
    labelIds_size[0] = ex_DLModel_28_B.currentIndex;
    labelIds_size[1] = 1;
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
      (ex_DLModel_28_B.currentIndex - 1), &ex_DLModel_28_B.grid_f,
      &ex_DLModel_28_B.block_g, 65535U);
    ex_DLModel_28_B.validLaunchParams_g = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_f, ex_DLModel_28_B.block_g);
    if (ex_DLModel_28_B.validLaunchParams_g) {
      ex_D_c1_ex_DLModel_28_kernel146<<<ex_DLModel_28_B.grid_f,
        ex_DLModel_28_B.block_g>>>(ex_DLModel_28_B.gpu_output,
        ex_DLModel_28_B.currentIndex - 1, labelIds_data, scores_data,
        cpu_output->size[0U]);
    }
  }

  ex_DLModel_28_emxFree_real32_T(&cpu_output);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_aux1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_aux2), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_ipRowIndices), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_rowWeights), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_ipColIndices), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_colWeights), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_rowWeightsTotal), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_colWeightsTotal), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_partialResize), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_out), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_img), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_objX_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_objX_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_objX_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_objdata), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_objdata), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_objdata), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_intermediateResult), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_matrixToCat), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_matrixToCat), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_matrixToCat), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_out_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_x), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_maxVal), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_xdata), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_obj_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_e_objX_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_centersArray), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_ConstantArray1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_y_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_sub1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_intermediateResult), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_x_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_xdata), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_y_data), __FILE__, __LINE__);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_pred_Data);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_c_x_Data);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_box);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_d_x);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_X_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_Y_data), __FILE__, __LINE__);
  ex_DLModel_28_gpuEmxFree_real_T(&ex_DLModel_28_B.gpu_centers);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_obj_Data_data), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_score_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_c_out_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_idx_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_iv14_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_ii_data), __FILE__, __LINE__);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_output);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_tmp_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_expl_temp_Data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_xdata_0), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_maxVal_0), __FILE__, __LINE__);
  ex_DLModel__gpuEmxFree_real32_T(&ex_DLModel_28_B.gpu_box_c);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_fv), __FILE__, __LINE__);
}

static __global__ __launch_bounds__(512, 1) void ex_DLModel_28_Outputs_kernel2(
  const uint8_T outB[307200], uint8_T pln3[307200], const uint8_T outG[307200],
  uint8_T pln2[307200], const uint8_T outR[307200], uint8_T pln1[307200])
{
  int32_T tmp;
  tmp = static_cast<int32_T>(mwGetGlobalThreadIndex());

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  // MATLAB Function: '<Root>/YOLO-V9 ' incorporates:
  //   MATLABSystem: '<S3>/MATLAB System'
  //
  if (tmp < 307200) {
    pln1[tmp] = outR[tmp];
    pln2[tmp] = outG[tmp];
    pln3[tmp] = outB[tmp];
  }

  // End of MATLAB Function: '<Root>/YOLO-V9 '
  // End of Outputs for SubSystem: '<Root>/SDL Video Display1'
}

void addFPSModelClass::ex_DLMode_gpuEmxReset_boolean_T
  (emxArray_boolean_T_ex_DLModel_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_boolean_T_ex_DLModel_T));
}

void addFPSModelClass::ex_DLModel_2_gpuEmxReset_int8_T
  (emxArray_int8_T_ex_DLModel_28_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_int8_T_ex_DLModel_28_T));
}

void addFPSModelClass::ex_DLModel_gpuEmxReset_uint16_T
  (emxArray_uint16_T_ex_DLModel__T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_uint16_T_ex_DLModel__T));
}

void addFPSModelClass::ex_DLModel__gpuEmxReset_int32_T
  (emxArray_int32_T_ex_DLModel_2_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_int32_T_ex_DLModel_2_T));
}

void addFPSModelClass::ex_DLModel_2_gpuEmxReset_char_T
  (emxArray_char_T_ex_DLModel_28_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_char_T_ex_DLModel_28_T));
}

void addFPSModelClass::ex_DLModel__gpuEmxReset_uint8_T
  (emxArray_uint8_T_ex_DLModel_2_T *gpu)
{
  memset(gpu, 0, sizeof(emxArray_uint8_T_ex_DLModel_2_T));
}

void addFPSModelClass::ex_DLModel_28_emxInit_char_T
  (emxArray_char_T_ex_DLModel_28_T **pEmxArray, int32_T numDimensions)
{
  emxArray_char_T_ex_DLModel_28_T *emxArray;
  *pEmxArray = static_cast<emxArray_char_T_ex_DLModel_28_T *>(malloc(sizeof
    (emxArray_char_T_ex_DLModel_28_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<char_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::ex_DL_emxInitStruct_cell_wrap_0
  (emxArray_char_T_ex_DLModel_28_T **pStruct_f1)
{
  ex_DLModel_28_emxInit_char_T(pStruct_f1, 2);
}

void addFPSModelClass::ex_DLM_emxEnsureCapacity_char_T
  (emxArray_char_T_ex_DLModel_28_T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(char_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(char_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<char_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::ex__gpuEmxEnsureCapacity_char_T(const
  emxArray_char_T_ex_DLModel_28_T *cpu, emxArray_char_T_ex_DLModel_28_T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  char_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(char_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(char_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel3
  (emxArray_char_T_ex_DLModel_28_T r4_f1, emxArray_char_T_ex_DLModel_28_T r3_f1,
   char_T cv4_dim0, char_T cv4_dim1, char_T cv4_dim2, char_T cv4_dim3, char_T
   cv4_dim4, char_T cv4_dim5, char_T cv4_dim6, char_T cv4_dim7, char_T cv4_dim8,
   char_T cv3_dim0, char_T cv3_dim1, char_T cv3_dim2, char_T cv3_dim3, char_T
   cv3_dim4, char_T cv3_dim5, char_T cv3_dim6, char_T cv3_dim7, char_T cv3_dim8)
{
  __shared__ char_T cv3_shared[9];
  __shared__ char_T cv4_shared[9];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv3_shared[0] = cv3_dim0;
    cv3_shared[1] = cv3_dim1;
    cv3_shared[2] = cv3_dim2;
    cv3_shared[3] = cv3_dim3;
    cv3_shared[4] = cv3_dim4;
    cv3_shared[5] = cv3_dim5;
    cv3_shared[6] = cv3_dim6;
    cv3_shared[7] = cv3_dim7;
    cv3_shared[8] = cv3_dim8;
    cv4_shared[0] = cv4_dim0;
    cv4_shared[1] = cv4_dim1;
    cv4_shared[2] = cv4_dim2;
    cv4_shared[3] = cv4_dim3;
    cv4_shared[4] = cv4_dim4;
    cv4_shared[5] = cv4_dim5;
    cv4_shared[6] = cv4_dim6;
    cv4_shared[7] = cv4_dim7;
    cv4_shared[8] = cv4_dim8;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 9) {
    r3_f1.data[jcol] = cv3_shared[jcol];
    r4_f1.data[jcol] = cv4_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel4
  (emxArray_char_T_ex_DLModel_28_T r7_f1, emxArray_char_T_ex_DLModel_28_T r6_f1,
   char_T cv7_dim0, char_T cv7_dim1, char_T cv7_dim2, char_T cv7_dim3, char_T
   cv7_dim4, char_T cv6_dim0, char_T cv6_dim1, char_T cv6_dim2, char_T cv6_dim3,
   char_T cv6_dim4)
{
  __shared__ char_T cv6_shared[5];
  __shared__ char_T cv7_shared[5];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv6_shared[0] = cv6_dim0;
    cv6_shared[1] = cv6_dim1;
    cv6_shared[2] = cv6_dim2;
    cv6_shared[3] = cv6_dim3;
    cv6_shared[4] = cv6_dim4;
    cv7_shared[0] = cv7_dim0;
    cv7_shared[1] = cv7_dim1;
    cv7_shared[2] = cv7_dim2;
    cv7_shared[3] = cv7_dim3;
    cv7_shared[4] = cv7_dim4;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 5) {
    r6_f1.data[jcol] = cv6_shared[jcol];
    r7_f1.data[jcol] = cv7_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel5
  (emxArray_char_T_ex_DLModel_28_T r16_f1, emxArray_char_T_ex_DLModel_28_T
   r15_f1, char_T cv17_dim0, char_T cv17_dim1, char_T cv17_dim2, char_T
   cv16_dim0, char_T cv16_dim1, char_T cv16_dim2)
{
  __shared__ char_T cv16_shared[3];
  __shared__ char_T cv17_shared[3];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv16_shared[0] = cv16_dim0;
    cv16_shared[1] = cv16_dim1;
    cv16_shared[2] = cv16_dim2;
    cv17_shared[0] = cv17_dim0;
    cv17_shared[1] = cv17_dim1;
    cv17_shared[2] = cv17_dim2;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 3) {
    r15_f1.data[jcol] = cv16_shared[jcol];
    r16_f1.data[jcol] = cv17_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel6
  (emxArray_char_T_ex_DLModel_28_T r19_f1, emxArray_char_T_ex_DLModel_28_T
   r18_f1, char_T cv19_dim0, char_T cv19_dim1, char_T cv19_dim2, char_T
   cv19_dim3, char_T cv19_dim4, char_T cv18_dim0, char_T cv18_dim1, char_T
   cv18_dim2, char_T cv18_dim3, char_T cv18_dim4)
{
  __shared__ char_T cv18_shared[5];
  __shared__ char_T cv19_shared[5];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv18_shared[0] = cv18_dim0;
    cv18_shared[1] = cv18_dim1;
    cv18_shared[2] = cv18_dim2;
    cv18_shared[3] = cv18_dim3;
    cv18_shared[4] = cv18_dim4;
    cv19_shared[0] = cv19_dim0;
    cv19_shared[1] = cv19_dim1;
    cv19_shared[2] = cv19_dim2;
    cv19_shared[3] = cv19_dim3;
    cv19_shared[4] = cv19_dim4;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 5) {
    r18_f1.data[jcol] = cv18_shared[jcol];
    r19_f1.data[jcol] = cv19_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel7
  (emxArray_char_T_ex_DLModel_28_T r26_f1, emxArray_char_T_ex_DLModel_28_T
   r25_f1, char_T cv26_dim0, char_T cv26_dim1, char_T cv26_dim2, char_T
   cv26_dim3, char_T cv26_dim4, char_T cv26_dim5, char_T cv26_dim6, char_T
   cv26_dim7, char_T cv25_dim0, char_T cv25_dim1, char_T cv25_dim2, char_T
   cv25_dim3, char_T cv25_dim4, char_T cv25_dim5, char_T cv25_dim6, char_T
   cv25_dim7)
{
  __shared__ char_T cv25_shared[8];
  __shared__ char_T cv26_shared[8];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv25_shared[0] = cv25_dim0;
    cv25_shared[1] = cv25_dim1;
    cv25_shared[2] = cv25_dim2;
    cv25_shared[3] = cv25_dim3;
    cv25_shared[4] = cv25_dim4;
    cv25_shared[5] = cv25_dim5;
    cv25_shared[6] = cv25_dim6;
    cv25_shared[7] = cv25_dim7;
    cv26_shared[0] = cv26_dim0;
    cv26_shared[1] = cv26_dim1;
    cv26_shared[2] = cv26_dim2;
    cv26_shared[3] = cv26_dim3;
    cv26_shared[4] = cv26_dim4;
    cv26_shared[5] = cv26_dim5;
    cv26_shared[6] = cv26_dim6;
    cv26_shared[7] = cv26_dim7;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 8) {
    r25_f1.data[jcol] = cv25_shared[jcol];
    r26_f1.data[jcol] = cv26_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel8
  (emxArray_char_T_ex_DLModel_28_T r45_f1, emxArray_char_T_ex_DLModel_28_T
   r44_f1, char_T cv45_dim0, char_T cv45_dim1, char_T cv45_dim2, char_T
   cv45_dim3, char_T cv45_dim4, char_T cv44_dim0, char_T cv44_dim1, char_T
   cv44_dim2, char_T cv44_dim3, char_T cv44_dim4)
{
  __shared__ char_T cv44_shared[5];
  __shared__ char_T cv45_shared[5];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv44_shared[0] = cv44_dim0;
    cv44_shared[1] = cv44_dim1;
    cv44_shared[2] = cv44_dim2;
    cv44_shared[3] = cv44_dim3;
    cv44_shared[4] = cv44_dim4;
    cv45_shared[0] = cv45_dim0;
    cv45_shared[1] = cv45_dim1;
    cv45_shared[2] = cv45_dim2;
    cv45_shared[3] = cv45_dim3;
    cv45_shared[4] = cv45_dim4;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 5) {
    r44_f1.data[jcol] = cv44_shared[jcol];
    r45_f1.data[jcol] = cv45_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DLM_c2_ex_DLModel_28_kernel9
  (emxArray_char_T_ex_DLModel_28_T r55_f1, emxArray_char_T_ex_DLModel_28_T
   r54_f1, char_T cv55_dim0, char_T cv55_dim1, char_T cv55_dim2, char_T
   cv55_dim3, char_T cv55_dim4, char_T cv54_dim0, char_T cv54_dim1, char_T
   cv54_dim2, char_T cv54_dim3, char_T cv54_dim4)
{
  __shared__ char_T cv54_shared[5];
  __shared__ char_T cv55_shared[5];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv54_shared[0] = cv54_dim0;
    cv54_shared[1] = cv54_dim1;
    cv54_shared[2] = cv54_dim2;
    cv54_shared[3] = cv54_dim3;
    cv54_shared[4] = cv54_dim4;
    cv55_shared[0] = cv55_dim0;
    cv55_shared[1] = cv55_dim1;
    cv55_shared[2] = cv55_dim2;
    cv55_shared[3] = cv55_dim3;
    cv55_shared[4] = cv55_dim4;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 5) {
    r54_f1.data[jcol] = cv54_shared[jcol];
    r55_f1.data[jcol] = cv55_shared[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel10
  (emxArray_char_T_ex_DLModel_28_T r81_f1, emxArray_char_T_ex_DLModel_28_T
   r80_f1, emxArray_char_T_ex_DLModel_28_T r79_f1, char_T cv80_dim0, char_T
   cv80_dim1, char_T cv80_dim2, char_T cv80_dim3, char_T cv80_dim4, char_T
   cv80_dim5, char_T cv80_dim6, char_T cv80_dim7, char_T cv80_dim8, char_T
   cv80_dim9, char_T cv79_dim0, char_T cv79_dim1, char_T cv79_dim2, char_T
   cv79_dim3, char_T cv79_dim4, char_T cv79_dim5, char_T cv79_dim6, char_T
   cv79_dim7, char_T cv79_dim8, char_T cv79_dim9, char_T cv78_dim0, char_T
   cv78_dim1, char_T cv78_dim2, char_T cv78_dim3, char_T cv78_dim4, char_T
   cv78_dim5, char_T cv78_dim6, char_T cv78_dim7, char_T cv78_dim8, char_T
   cv78_dim9)
{
  __shared__ char_T cv78_shared[10];
  __shared__ char_T cv79_shared[10];
  __shared__ char_T cv80_shared[10];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    cv78_shared[0] = cv78_dim0;
    cv78_shared[1] = cv78_dim1;
    cv78_shared[2] = cv78_dim2;
    cv78_shared[3] = cv78_dim3;
    cv78_shared[4] = cv78_dim4;
    cv78_shared[5] = cv78_dim5;
    cv78_shared[6] = cv78_dim6;
    cv78_shared[7] = cv78_dim7;
    cv78_shared[8] = cv78_dim8;
    cv78_shared[9] = cv78_dim9;
    cv79_shared[0] = cv79_dim0;
    cv79_shared[1] = cv79_dim1;
    cv79_shared[2] = cv79_dim2;
    cv79_shared[3] = cv79_dim3;
    cv79_shared[4] = cv79_dim4;
    cv79_shared[5] = cv79_dim5;
    cv79_shared[6] = cv79_dim6;
    cv79_shared[7] = cv79_dim7;
    cv79_shared[8] = cv79_dim8;
    cv79_shared[9] = cv79_dim9;
    cv80_shared[0] = cv80_dim0;
    cv80_shared[1] = cv80_dim1;
    cv80_shared[2] = cv80_dim2;
    cv80_shared[3] = cv80_dim3;
    cv80_shared[4] = cv80_dim4;
    cv80_shared[5] = cv80_dim5;
    cv80_shared[6] = cv80_dim6;
    cv80_shared[7] = cv80_dim7;
    cv80_shared[8] = cv80_dim8;
    cv80_shared[9] = cv80_dim9;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 10) {
    r79_f1.data[jcol] = cv78_shared[jcol];
    r80_f1.data[jcol] = cv79_shared[jcol];
    r81_f1.data[jcol] = cv80_shared[jcol];
  }
}

void addFPSModelClass::ex_DLModel_28_emxCopy_char_T
  (emxArray_char_T_ex_DLModel_28_T **dst, emxArray_char_T_ex_DLModel_28_T *
   const *src)
{
  int32_T i;
  int32_T numElDst;
  int32_T numElSrc;
  numElDst = 1;
  numElSrc = 1;
  for (i = 0; i < (*dst)->numDimensions; i++) {
    numElDst *= (*dst)->size[i];
    numElSrc *= (*src)->size[i];
  }

  for (i = 0; i < (*dst)->numDimensions; i++) {
    (*dst)->size[i] = (*src)->size[i];
  }

  ex_DLM_emxEnsureCapacity_char_T(*dst, numElDst);
  for (i = 0; i < numElSrc; i++) {
    (*dst)->data[i] = (*src)->data[i];
  }
}

void addFPSModelClass::ex_DL_emxCopyStruct_cell_wrap_0
  (cell_wrap_0_ex_DLModel_28_T *dst, emxArray_char_T_ex_DLModel_28_T **src_f1)
{
  ex_DLModel_28_emxCopy_char_T(&dst->f1, src_f1);
}

void addFPSModelClass::ex_DLModel_28_emxFree_char_T
  (emxArray_char_T_ex_DLModel_28_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_char_T_ex_DLModel_28_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<char_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_char_T_ex_DLModel_28_T *>(NULL);
  }
}

void addFPSModelClass::ex_DL_emxFreeStruct_cell_wrap_0
  (emxArray_char_T_ex_DLModel_28_T **pStruct_f1)
{
  ex_DLModel_28_emxFree_char_T(pStruct_f1);
}

void addFPSModelClass::ex__gpuEmxMemcpyGpuToCpu_char_T
  (emxArray_char_T_ex_DLModel_28_T *cpu, const emxArray_char_T_ex_DLModel_28_T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(char_T), cudaMemcpyDeviceToHost),
      __FILE__, __LINE__);
  }
}

// Function for MATLAB Function: '<Root>/Detection and Tracking'
void addFPSModelClass::ex_DLModel_28_tic(real_T *tstart_tv_sec, real_T
  *tstart_tv_nsec)
{
  coderTimespec origTimespec;
  if (!ex_DLModel_28_DW.freq_not_empty) {
    ex_DLModel_28_DW.freq_not_empty = true;
    coderInitTimeFunctions(&ex_DLModel_28_DW.freq);
  }

  coderTimeClockGettimeMonotonic(&origTimespec, ex_DLModel_28_DW.freq);
  *tstart_tv_sec = origTimespec.tv_sec;
  *tstart_tv_nsec = origTimespec.tv_nsec;
}

void addFPSModelClass::ex_DLModel_28_emxInit_uint8_T
  (emxArray_uint8_T_ex_DLModel_2_T **pEmxArray, int32_T numDimensions)
{
  emxArray_uint8_T_ex_DLModel_2_T *emxArray;
  *pEmxArray = static_cast<emxArray_uint8_T_ex_DLModel_2_T *>(malloc(sizeof
    (emxArray_uint8_T_ex_DLModel_2_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<uint8_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_int32_T
  (emxArray_int32_T_ex_DLModel_2_T **pEmxArray, int32_T numDimensions)
{
  emxArray_int32_T_ex_DLModel_2_T *emxArray;
  *pEmxArray = static_cast<emxArray_int32_T_ex_DLModel_2_T *>(malloc(sizeof
    (emxArray_int32_T_ex_DLModel_2_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<int32_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_uint16_T
  (emxArray_uint16_T_ex_DLModel__T **pEmxArray, int32_T numDimensions)
{
  emxArray_uint16_T_ex_DLModel__T *emxArray;
  *pEmxArray = static_cast<emxArray_uint16_T_ex_DLModel__T *>(malloc(sizeof
    (emxArray_uint16_T_ex_DLModel__T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<uint16_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_int8_T
  (emxArray_int8_T_ex_DLModel_28_T **pEmxArray, int32_T numDimensions)
{
  emxArray_int8_T_ex_DLModel_28_T *emxArray;
  *pEmxArray = static_cast<emxArray_int8_T_ex_DLModel_28_T *>(malloc(sizeof
    (emxArray_int8_T_ex_DLModel_28_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<int8_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

void addFPSModelClass::ex_DLModel_28_emxInit_boolean_T
  (emxArray_boolean_T_ex_DLModel_T **pEmxArray, int32_T numDimensions)
{
  emxArray_boolean_T_ex_DLModel_T *emxArray;
  *pEmxArray = static_cast<emxArray_boolean_T_ex_DLModel_T *>(malloc(sizeof
    (emxArray_boolean_T_ex_DLModel_T)));
  emxArray = *pEmxArray;
  emxArray->data = static_cast<boolean_T *>(NULL);
  emxArray->numDimensions = numDimensions;
  emxArray->size = static_cast<int32_T *>(malloc(sizeof(int32_T)
    * static_cast<uint32_T>(numDimensions)));
  emxArray->allocatedSize = 0;
  emxArray->canFreeData = true;
  for (int32_T i = 0; i < numDimensions; i++) {
    emxArray->size[i] = 0;
  }
}

real32_T rt_roundf_snf(real32_T u)
{
  real32_T y;
  if (static_cast<real32_T>(fabs(static_cast<real_T>(u))) < 8.388608E+6F) {
    if (u >= 0.5F) {
      y = static_cast<real32_T>(floor(static_cast<real_T>(u + 0.5F)));
    } else if (u > -0.5F) {
      y = u * 0.0F;
    } else {
      y = static_cast<real32_T>(ceil(static_cast<real_T>(u - 0.5F)));
    }
  } else {
    y = u;
  }

  return y;
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel11(
  const int32_T b_nbytes, char_T validatedHoleFilling_f1_data[15])
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    validatedHoleFilling_f1_data[b_nbytes] = '\x00';
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel14
  (uint8_T b_color_data[3], uint8_T color_data[3], uint8_T uv_dim0, uint8_T
   uv_dim1, uint8_T uv_dim2)
{
  __shared__ uint8_T uv_shared[3];
  int32_T jcol;
  if (mwGetThreadIndexWithinBlock() == 0U) {
    uv_shared[0] = uv_dim0;
    uv_shared[1] = uv_dim1;
    uv_shared[2] = uv_dim2;
  }

  __syncthreads();
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 3) {
    uint8_T color;
    color = uv_shared[jcol];
    color_data[jcol] = color;
    b_color_data[jcol] = color;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel16(
  const real_T inPosition_data[4], int32_T position_data[4])
{
  int32_T jcol;
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 2) {
    real_T b_varargout_1;
    real_T positionOut;
    positionOut = inPosition_data[jcol];
    if (isnan(positionOut)) {
      b_varargout_1 = CUDART_NAN;
    } else if (isinf(positionOut)) {
      b_varargout_1 = CUDART_NAN;
    } else {
      b_varargout_1 = fmod(positionOut, 4.294967296E+9);
      if (b_varargout_1 == 0.0) {
        b_varargout_1 = 0.0;
      } else if (b_varargout_1 < 0.0) {
        b_varargout_1 += 4.294967296E+9;
      }
    }

    positionOut = b_varargout_1;
    if (b_varargout_1 > 2.147483647E+9) {
      positionOut = b_varargout_1 - 4.294967296E+9;
      b_varargout_1 -= 4.294967296E+9;
    }

    if (positionOut < -2.147483648E+9) {
      b_varargout_1 = positionOut + 4.294967296E+9;
    }

    positionOut = round(b_varargout_1);
    if (positionOut < 2.147483648E+9) {
      if (positionOut >= -2.147483648E+9) {
        position_data[jcol] = static_cast<int32_T>(positionOut);
      } else {
        position_data[jcol] = MIN_int32_T;
      }
    } else {
      position_data[jcol] = MAX_int32_T;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel17
  (uint8_T RGB[921600])
{
  int32_T jcol;
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 921600) {
    RGB[jcol] = static_cast<uint8_T>(0U);
  }
}

static __global__ __launch_bounds__(128, 1) void ex_DL_c2_ex_DLModel_28_kernel18
  (uint8_T pixCount[640])
{
  int32_T jcol;
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 640) {
    pixCount[jcol] = static_cast<uint8_T>(0U);
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel20
  (const uint8_T RGB[921600], uint8_T In[921600])
{
  int32_T jcol;
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 921600) {
    In[jcol] = RGB[jcol];
  }
}

void addFPSModelClass::ex_gpuEmxEnsureCapacity_uint8_T(const
  emxArray_uint8_T_ex_DLModel_2_T *cpu, emxArray_uint8_T_ex_DLModel_2_T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  uint8_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (cpu->allocatedSize < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(uint8_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(uint8_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex__gpuEmxMemcpyCpuToGpu_char_T
  (emxArray_char_T_ex_DLModel_28_T *gpu, const emxArray_char_T_ex_DLModel_28_T
   *cpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (cpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(gpu->data, cpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(char_T), cudaMemcpyHostToDevice),
      __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex__emxEnsureCapacity_boolean_T
  (emxArray_boolean_T_ex_DLModel_T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(boolean_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(boolean_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<boolean_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::gpuEmxEnsureCapacity_boolean_T(const
  emxArray_boolean_T_ex_DLModel_T *cpu, emxArray_boolean_T_ex_DLModel_T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  boolean_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(boolean_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(boolean_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex_DL_emxEnsureCapacity_int32_T
  (emxArray_int32_T_ex_DLModel_2_T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(int32_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(int32_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<int32_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::gpuEmxMemcpyGpuToCpu_boolean_T
  (emxArray_boolean_T_ex_DLModel_T *cpu, const emxArray_boolean_T_ex_DLModel_T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(boolean_T),
      cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex_gpuEmxEnsureCapacity_int32_T(const
  emxArray_int32_T_ex_DLModel_2_T *cpu, emxArray_int32_T_ex_DLModel_2_T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  int32_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(int32_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(int32_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex_gpuEmxMemcpyCpuToGpu_int32_T
  (emxArray_int32_T_ex_DLModel_2_T *gpu, const emxArray_int32_T_ex_DLModel_2_T
   *cpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (cpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(gpu->data, cpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(int32_T),
      cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }
}

void addFPSModelClass::e_gpuEmxEnsureCapacity_uint16_T(const
  emxArray_uint16_T_ex_DLModel__T *cpu, emxArray_uint16_T_ex_DLModel__T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  uint16_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (cpu->allocatedSize < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(uint16_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(uint16_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

void addFPSModelClass::ex_DLM_emxEnsureCapacity_int8_T
  (emxArray_int8_T_ex_DLModel_28_T *emxArray, int32_T oldNumel)
{
  int32_T i;
  int32_T newNumel;
  void *newData;
  if (oldNumel < 0) {
    oldNumel = 0;
  }

  newNumel = 1;
  for (i = 0; i < emxArray->numDimensions; i++) {
    newNumel *= emxArray->size[i];
  }

  if (newNumel > emxArray->allocatedSize) {
    i = emxArray->allocatedSize;
    if (i < 16) {
      i = 16;
    }

    while (i < newNumel) {
      if (i > 1073741823) {
        i = MAX_int32_T;
      } else {
        i <<= 1;
      }
    }

    newData = malloc(static_cast<uint32_T>(i) * sizeof(int8_T));
    if (emxArray->data != NULL) {
      memcpy(newData, emxArray->data, sizeof(int8_T) * static_cast<uint32_T>
             (oldNumel));
      if (emxArray->canFreeData) {
        free(emxArray->data);
      }
    }

    emxArray->data = static_cast<int8_T *>(newData);
    emxArray->allocatedSize = i;
    emxArray->canFreeData = true;
  }
}

void addFPSModelClass::ex__gpuEmxEnsureCapacity_int8_T(const
  emxArray_int8_T_ex_DLModel_28_T *cpu, emxArray_int8_T_ex_DLModel_28_T *gpu,
  boolean_T needsCopy)
{
  int32_T i;
  int32_T totalSizeCpu;
  int32_T totalSizeGpu;
  int8_T *newData;
  if (gpu->numDimensions == 0) {
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(calloc(gpu->numDimensions, sizeof(int32_T)));
  }

  totalSizeCpu = 1;
  totalSizeGpu = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    totalSizeGpu *= gpu->size[i];
    totalSizeCpu *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }

  if (((totalSizeCpu == 0) && (cpu->allocatedSize > 0)) || (gpu->allocatedSize <
       totalSizeCpu)) {
    i = cpu->allocatedSize;
    if (i < totalSizeCpu) {
      i = totalSizeCpu;
    }

    ex_DLModel_28_checkCudaError(cudaMalloc(&newData, static_cast<uint32_T>(i) *
      sizeof(int8_T)), __FILE__, __LINE__);
    needsCopy = (needsCopy && (totalSizeGpu > 0));
    if (needsCopy) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(newData, gpu->data,
        static_cast<uint32_T>(totalSizeGpu) * sizeof(int8_T),
        cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
    }

    if (gpu->canFreeData) {
      ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
    }

    gpu->data = newData;
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel42(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_lenFirstSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *b_lenFirstSegment = static_cast<real_T>(iv6[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[d_tbWidth]) - 1]);
  }
}

void addFPSModelClass::ex__gpuEmxMemcpyGpuToCpu_int8_T
  (emxArray_int8_T_ex_DLModel_28_T *cpu, const emxArray_int8_T_ex_DLModel_28_T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(int8_T), cudaMemcpyDeviceToHost),
      __FILE__, __LINE__);
  }
}

void addFPSModelClass::ex_gpuEmxMemcpyGpuToCpu_int32_T
  (emxArray_int32_T_ex_DLModel_2_T *cpu, const emxArray_int32_T_ex_DLModel_2_T
   *gpu)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (gpu->data) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(cpu->data, gpu->data,
      static_cast<uint32_T>(actualSize) * sizeof(int32_T),
      cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel38(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *c_lenThisSegment = static_cast<real_T>(iv6[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[d_tbWidth]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel41(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *c_lenThisSegment = static_cast<real_T>(iv6[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[d_tbWidth]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel25(
  const int8_T iv6[261], const int32_T d_tbWidth, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_cg)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *b_cg = static_cast<real_T>(iv6[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[d_tbWidth]) - 1]);
  }
}

// Function for MATLAB Function: '<Root>/Detection and Tracking'
int64_T addFPSModelClass::ex_DLModel_28_computeEndIdx(int64_T start, int64_T end,
  int64_T stride)
{
  int64_T newEnd;
  newEnd = -1L;
  if ((stride > 0L) && (start <= end)) {
    newEnd = (end - start) / stride;
  } else if ((stride < 0L) && (end <= start)) {
    newEnd = (start - end) / -stride;
  }

  return newEnd;
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel27
  (const uint8_T RGB[921600], uint8_T In[921600])
{
  int32_T jcol;
  jcol = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (jcol < 921600) {
    In[jcol] = RGB[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel29(
  const uint16_T uv1[256], const int32_T textLocAndWidth_idx_1, const
  emxArray_uint8_T_ex_DLModel_2_T thisTextU16, uint16_T *tmp3)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *tmp3 = uv1[thisTextU16.data[textLocAndWidth_idx_1]];
  }
}

// Function for MATLAB Function: '<Root>/Detection and Tracking'
real_T addFPSModelClass::ex_DLModel_28_toc(real_T tstart_tv_sec, real_T
  tstart_tv_nsec)
{
  coderTimespec origTimespec;
  if (!ex_DLModel_28_DW.freq_not_empty) {
    ex_DLModel_28_DW.freq_not_empty = true;
    coderInitTimeFunctions(&ex_DLModel_28_DW.freq);
  }

  coderTimeClockGettimeMonotonic(&origTimespec, ex_DLModel_28_DW.freq);
  return (origTimespec.tv_nsec - tstart_tv_nsec) / 1.0E+9 + (origTimespec.tv_sec
    - tstart_tv_sec);
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel66(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_lenFirstSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *b_lenFirstSegment = static_cast<real_T>(iv3[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[b_startC_im]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel62(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *c_lenThisSegment = static_cast<real_T>(iv3[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[b_startC_im]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel65(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *c_lenThisSegment)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *c_lenThisSegment = static_cast<real_T>(iv3[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[b_startC_im]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel48(
  const int8_T iv3[261], const int32_T b_startC_im, const
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b, real_T *b_cg)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *b_cg = static_cast<real_T>(iv3[static_cast<int32_T>
      (thisGlyphIdxs_1b.data[b_startC_im]) - 1]);
  }
}

uint64_T addFPSModelClass::ex_DLModel_2_computeNumIters_hp(int32_T ub, int32_T
  ub_0, int32_T ub_1)
{
  uint64_T n;
  uint64_T numIters;
  boolean_T overflow;
  overflow = false;
  n = 0UL;
  if (ub >= 0) {
    n = static_cast<uint64_T>(ub + 1);
  }

  numIters = n;
  n = 0UL;
  if (ub_0 >= 0) {
    n = static_cast<uint64_T>(ub_0 + 1);
    if (numIters > MAX_uint64_T / n) {
      overflow = true;
    }
  }

  numIters *= n;
  n = 0UL;
  if (ub_1 >= 0) {
    n = static_cast<uint64_T>(ub_1 + 1);
    if (numIters > MAX_uint64_T / n) {
      overflow = true;
    }
  }

  numIters *= n;
  if (overflow) {
    ex_DLModel_28_gpuThrowError_hp(__FILE__, __LINE__);
  }

  return numIters;
}

static __global__ __launch_bounds__(32, 1) void ex_DL_c2_ex_DLModel_28_kernel52(
  const uint16_T uv1[256], const int32_T b_nz, const
  emxArray_uint8_T_ex_DLModel_2_T thisTextU16, uint16_T *tmp3)
{
  if (static_cast<int32_T>(mwGetGlobalThreadIndex()) < 1) {
    *tmp3 = uv1[thisTextU16.data[b_nz]];
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_boolean_T
  (emxArray_boolean_T_ex_DLModel_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_boolean_T_ex_DLModel_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<boolean_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_boolean_T_ex_DLModel_T *>(NULL);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_int8_T
  (emxArray_int8_T_ex_DLModel_28_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_int8_T_ex_DLModel_28_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<int8_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_int8_T_ex_DLModel_28_T *>(NULL);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_uint16_T
  (emxArray_uint16_T_ex_DLModel__T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_uint16_T_ex_DLModel__T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<uint16_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_uint16_T_ex_DLModel__T *>(NULL);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_int32_T
  (emxArray_int32_T_ex_DLModel_2_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_int32_T_ex_DLModel_2_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<int32_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_int32_T_ex_DLModel_2_T *>(NULL);
  }
}

void addFPSModelClass::ex_DLModel_28_emxFree_uint8_T
  (emxArray_uint8_T_ex_DLModel_2_T **pEmxArray)
{
  if (*pEmxArray != static_cast<emxArray_uint8_T_ex_DLModel_2_T *>(NULL)) {
    if (((*pEmxArray)->data != static_cast<uint8_T *>(NULL)) && (*pEmxArray)
        ->canFreeData) {
      free((*pEmxArray)->data);
    }

    free((*pEmxArray)->size);
    free(*pEmxArray);
    *pEmxArray = static_cast<emxArray_uint8_T_ex_DLModel_2_T *>(NULL);
  }
}

static __global__ __launch_bounds__(512, 1) void ex_DL_c2_ex_DLModel_28_kernel56
  (const uint8_T In[921600], uint8_T outB[307200], uint8_T outG[307200], uint8_T
   outR[307200])
{
  uint64_T gThreadId;
  int32_T e_c;
  int32_T jcol;
  gThreadId = mwGetGlobalThreadIndex();
  e_c = static_cast<int32_T>(gThreadId % 640UL);
  jcol = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(e_c)) / 640UL);
  if (jcol < 480) {
    int32_T outR_tmp;
    outR_tmp = 480 * e_c + jcol;
    e_c += 640 * jcol;
    outR[e_c] = In[outR_tmp];
    outG[e_c] = In[outR_tmp + 307200];
    outB[e_c] = In[outR_tmp + 614400];
  }
}

void addFPSModelClass::ex_DLModel_28_gpuEmxFree_char_T
  (emxArray_char_T_ex_DLModel_28_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel_2_gpuEmxFree_uint8_T
  (emxArray_uint8_T_ex_DLModel_2_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel_2_gpuEmxFree_int32_T
  (emxArray_int32_T_ex_DLModel_2_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel__gpuEmxFree_uint16_T
  (emxArray_uint16_T_ex_DLModel__T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel_28_gpuEmxFree_int8_T
  (emxArray_int8_T_ex_DLModel_28_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

void addFPSModelClass::ex_DLModel_gpuEmxFree_boolean_T
  (emxArray_boolean_T_ex_DLModel_T *gpu)
{
  if (gpu->data && gpu->canFreeData && (gpu->data != (void *)4207599121UL)) {
    ex_DLModel_28_checkCudaError(cudaFree(gpu->data), __FILE__, __LINE__);
  }

  free(gpu->size);
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel12(const char_T validatedHoleFilling_f1_data[15],
  const int32_T tmp, char_T varargin_1_data[15])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    varargin_1_data[static_cast<int32_T>(idx)] = validatedHoleFilling_f1_data[
      static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel13(const char_T validatedHoleFilling_f1_data[15],
  const int32_T tmp, char_T varargin_1_data[15])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    varargin_1_data[static_cast<int32_T>(idx)] = validatedHoleFilling_f1_data[
      static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel15(const real32_T bboxes_data[], const int32_T
  bboxes_size_dim0, const int32_T vlen, const int32_T tmp, real_T
  inPosition_data[4])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    inPosition_data[static_cast<int32_T>(idx)] = static_cast<real_T>
      (bboxes_data[bboxes_size_dim0 * static_cast<int32_T>(idx) + vlen]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel19(const real32_T bboxes_data[], const int32_T
  bboxes_size_dim0, const int32_T vlen, const int32_T tmp, int32_T
  position_data[4])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    real32_T tmp_0;
    tmp_0 = roundf(bboxes_data[bboxes_size_dim0 * static_cast<int32_T>(idx) +
                   vlen]);
    if (tmp_0 < 2.14748365E+9F) {
      if (tmp_0 >= -2.14748365E+9F) {
        position_data[static_cast<int32_T>(idx)] = static_cast<int32_T>(tmp_0);
      } else {
        position_data[static_cast<int32_T>(idx)] = MIN_int32_T;
      }
    } else {
      position_data[static_cast<int32_T>(idx)] = MAX_int32_T;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel21(const emxArray_char_T_ex_DLModel_28_T b_str,
  const int32_T i_vlen, emxArray_uint8_T_ex_DLModel_2_T thisTextU16)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(i_vlen);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    thisTextU16.data[static_cast<int32_T>(idx)] = static_cast<uint8_T>
      (b_str.data[static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel22(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>
      (thisTextU16.data[static_cast<int32_T>(idx)]) == 10);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel23(const emxArray_int32_T_ex_DLModel_2_T b_ii,
  const int32_T tmp, emxArray_int32_T_ex_DLModel_2_T idxNewlineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    idxNewlineChar.data[static_cast<int32_T>(idx)] = b_ii.data
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel24(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b, emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[static_cast<
      int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv6[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel26(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel28(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>
      (thisTextU16.data[static_cast<int32_T>(idx)]) == 10);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel30(const uint8_T uv9[10664], const int32_T g_nz,
  const int32_T tmp, uint8_T uv9_data[10664])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uv9_data[static_cast<int32_T>(idx)] = uv9[g_nz + static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel31(const uint8_T uv9_data[10664], const int8_T
  b_varargin_1_dim0, const int32_T uv9_size_dim0, const int32_T b_varargin_1,
  const int32_T tmp, uint8_T uv9_data_0[144])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp) + 1UL) * (static_cast<uint64_T>
    (b_varargin_1) + 1UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T e_c;
    int32_T jcol;
    e_c = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_varargin_1) + 1UL));
    jcol = static_cast<int32_T>((idx - static_cast<uint64_T>(e_c)) / (
      static_cast<uint64_T>(b_varargin_1) + 1UL));
    uv9_data_0[e_c + uv9_size_dim0 * jcol] = uv9_data[static_cast<int32_T>
      (b_varargin_1_dim0) * e_c + jcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel32(const uint8_T uv9_data[144], const int32_T tmp,
  uint8_T b_thisGlyphBitmap_data[144])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    b_thisGlyphBitmap_data[static_cast<int32_T>(idx)] = uv9_data
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel33(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T b_nbytes, emxArray_uint16_T_ex_DLModel__T
  thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_nbytes);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[static_cast<
      int32_T>(idx)])) + 1U);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel34(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv6[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel35(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel36(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T b_nbytes,
  const int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[b_nbytes +
      static_cast<int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv6[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel37(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel39(const int8_T iv6[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T g_nz, const
  int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[g_nz +
      static_cast<int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv6[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel40(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel43(const real_T inPosition_data[4], const int32_T
  tmp, int32_T position_data[4])
{
  real_T positionOut_data[4];
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    real_T positionOut;
    positionOut = inPosition_data[static_cast<int32_T>(idx)];
    if (isnan(positionOut)) {
    } else if (isinf(positionOut)) {
      positionOut = CUDART_NAN;
    } else {
      positionOut = fmod(positionOut, 4.294967296E+9);
      if (positionOut == 0.0) {
        positionOut = 0.0;
      } else if (positionOut < 0.0) {
        positionOut += 4.294967296E+9;
      }
    }

    positionOut_data[static_cast<int32_T>(idx)] = positionOut;
    positionOut = positionOut_data[static_cast<int32_T>(idx)];
    if (positionOut > 2.147483647E+9) {
      positionOut -= 4.294967296E+9;
      positionOut_data[static_cast<int32_T>(idx)] = positionOut;
    }

    if (positionOut < -2.147483648E+9) {
      positionOut_data[static_cast<int32_T>(idx)] = positionOut + 4.294967296E+9;
    }

    positionOut = round(positionOut_data[static_cast<int32_T>(idx)]);
    if (positionOut < 2.147483648E+9) {
      if (positionOut >= -2.147483648E+9) {
        position_data[static_cast<int32_T>(idx)] = static_cast<int32_T>
          (positionOut);
      } else {
        position_data[static_cast<int32_T>(idx)] = MIN_int32_T;
      }
    } else {
      position_data[static_cast<int32_T>(idx)] = MAX_int32_T;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel44(const emxArray_char_T_ex_DLModel_28_T str,
  const int32_T nbytes, emxArray_uint8_T_ex_DLModel_2_T thisTextU16)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(nbytes);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    thisTextU16.data[static_cast<int32_T>(idx)] = static_cast<uint8_T>(str.data[
      static_cast<int32_T>(idx)]);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel45(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>
      (thisTextU16.data[static_cast<int32_T>(idx)]) == 10);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel46(const emxArray_int32_T_ex_DLModel_2_T b_ii,
  const int32_T tmp, emxArray_int32_T_ex_DLModel_2_T idxNewlineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    idxNewlineChar.data[static_cast<int32_T>(idx)] = b_ii.data
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel47(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b, emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[static_cast<
      int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv3[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel49(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel50(const int32_T tmp, const int32_T tmp_0,
  uint8_T In[921600])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp_0) + 1UL) * 3UL * (static_cast<uint64_T>
    (tmp) + 1UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint64_T tmpIndex;
    int32_T e_c;
    int32_T outR_tmp;
    outR_tmp = static_cast<int32_T>(idx % (static_cast<uint64_T>(tmp) + 1UL));
    tmpIndex = (idx - static_cast<uint64_T>(outR_tmp)) / (static_cast<uint64_T>
      (tmp) + 1UL);
    e_c = static_cast<int32_T>(tmpIndex % (static_cast<uint64_T>(tmp_0) + 1UL));
    outR_tmp = (((e_c + 9) * 480 + outR_tmp) + static_cast<int32_T>((tmpIndex -
      static_cast<uint64_T>(e_c)) / (static_cast<uint64_T>(tmp_0) + 1UL)) *
                307200) + 19;
    In[outR_tmp] = static_cast<uint8_T>(static_cast<real_T>(In[outR_tmp]) * 0.4
      + 0.5);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel51(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T tmp, emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>
      (thisTextU16.data[static_cast<int32_T>(idx)]) == 10);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel53(const uint8_T uv5[31620], const int32_T
  d_tbWidth, const int32_T tmp, uint8_T uv5_data[31620])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uv5_data[static_cast<int32_T>(idx)] = uv5[d_tbWidth + static_cast<int32_T>
      (idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel54(const uint8_T uv5_data[31620], const int8_T
  b_varargin_1_dim0, const int32_T uv5_size_dim0, const int32_T b_varargin_1,
  const int32_T tmp, uint8_T uv5_data_0[441])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(tmp) + 1UL) * (static_cast<uint64_T>
    (b_varargin_1) + 1UL) - 1UL;
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    int32_T e_c;
    int32_T jcol;
    e_c = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_varargin_1) + 1UL));
    jcol = static_cast<int32_T>((idx - static_cast<uint64_T>(e_c)) / (
      static_cast<uint64_T>(b_varargin_1) + 1UL));
    uv5_data_0[e_c + uv5_size_dim0 * jcol] = uv5_data[static_cast<int32_T>
      (b_varargin_1_dim0) * e_c + jcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel55(const uint8_T uv5_data[441], const int32_T tmp,
  uint8_T thisGlyphBitmap_data[441])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    thisGlyphBitmap_data[static_cast<int32_T>(idx)] = uv5_data
      [static_cast<int32_T>(idx)];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel57(const emxArray_uint8_T_ex_DLModel_2_T
  thisTextU16, const int32_T nbytes, emxArray_uint16_T_ex_DLModel__T
  thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(nbytes);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[static_cast<
      int32_T>(idx)])) + 1U);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel58(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_int8_T_ex_DLModel_28_T c_x, emxArray_uint16_T_ex_DLModel__T
  thisGlyphIdxs_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv3[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel59(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel60(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T b_nbytes,
  const int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[b_nbytes +
      static_cast<int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv3[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel61(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel63(const int8_T iv3[261], const uint16_T uv1[256],
  const emxArray_uint8_T_ex_DLModel_2_T thisTextU16, const int32_T i_vlen, const
  int32_T tmp, emxArray_int8_T_ex_DLModel_28_T c_x,
  emxArray_uint16_T_ex_DLModel__T thisGlyphIdxs_1b,
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    uint16_T thisGlyphIdxs_1b_tmp;
    thisCharcodes_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<uint32_T>(static_cast<int32_T>(thisTextU16.data[i_vlen +
      static_cast<int32_T>(idx)])) + 1U);
    thisGlyphIdxs_1b_tmp = uv1[static_cast<int32_T>(thisCharcodes_1b.data[
      static_cast<int32_T>(idx)]) - 1];
    thisGlyphIdxs_1b.data[static_cast<int32_T>(idx)] = static_cast<uint16_T>(
      static_cast<int32_T>(thisGlyphIdxs_1b_tmp) + 1);
    c_x.data[static_cast<int32_T>(idx)] = iv3[thisGlyphIdxs_1b_tmp];
  }
}

static __global__ __launch_bounds__(1024, 1) void
  ex_DL_c2_ex_DLModel_28_kernel64(const uint16_T uv1[256], const
  emxArray_uint16_T_ex_DLModel__T thisCharcodes_1b, const int32_T tmp,
  emxArray_boolean_T_ex_DLModel_T isNewLineChar)
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    isNewLineChar.data[static_cast<int32_T>(idx)] = (static_cast<int32_T>(uv1[
      static_cast<int32_T>(thisCharcodes_1b.data[static_cast<int32_T>(idx)]) - 1])
      == 0);
  }
}

// Function for MATLAB Function: '<Root>/Detection and Tracking'
void addFPSModelClass::ex_DLModel_28_c2_ex_DLModel_28(const real32_T
  cpu_bboxes_data[], const int32_T bboxes_size[2], const real32_T scores_data[],
  const real32_T labels_data[], uint8_T cpu_In[921600], uint8_T cpu_outR[307200],
  uint8_T cpu_outG[307200], uint8_T cpu_outB[307200])
{
  void *colPtr;
  void *polygonEdgePtr;
  void *posPtr;
  void *ptrObj;
  void *ptsDWPtr;
  emxArray_boolean_T_ex_DLModel_T *cpu_isNewLineChar;
  emxArray_char_T_ex_DLModel_28_T *cpu_b_str;
  emxArray_char_T_ex_DLModel_28_T *cpu_r15_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r16_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r18_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r19_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r25_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r26_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r3_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r44_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r45_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r4_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r54_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r55_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r6_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r79_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r7_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r80_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_r81_f1;
  emxArray_char_T_ex_DLModel_28_T *cpu_str;
  emxArray_char_T_ex_DLModel_28_T *r10_f1;
  emxArray_char_T_ex_DLModel_28_T *r11_f1;
  emxArray_char_T_ex_DLModel_28_T *r12_f1;
  emxArray_char_T_ex_DLModel_28_T *r13_f1;
  emxArray_char_T_ex_DLModel_28_T *r14_f1;
  emxArray_char_T_ex_DLModel_28_T *r1_f1;
  emxArray_char_T_ex_DLModel_28_T *r20_f1;
  emxArray_char_T_ex_DLModel_28_T *r21_f1;
  emxArray_char_T_ex_DLModel_28_T *r22_f1;
  emxArray_char_T_ex_DLModel_28_T *r23_f1;
  emxArray_char_T_ex_DLModel_28_T *r24_f1;
  emxArray_char_T_ex_DLModel_28_T *r27_f1;
  emxArray_char_T_ex_DLModel_28_T *r28_f1;
  emxArray_char_T_ex_DLModel_28_T *r29_f1;
  emxArray_char_T_ex_DLModel_28_T *r2_f1;
  emxArray_char_T_ex_DLModel_28_T *r30_f1;
  emxArray_char_T_ex_DLModel_28_T *r31_f1;
  emxArray_char_T_ex_DLModel_28_T *r32_f1;
  emxArray_char_T_ex_DLModel_28_T *r33_f1;
  emxArray_char_T_ex_DLModel_28_T *r34_f1;
  emxArray_char_T_ex_DLModel_28_T *r35_f1;
  emxArray_char_T_ex_DLModel_28_T *r36_f1;
  emxArray_char_T_ex_DLModel_28_T *r37_f1;
  emxArray_char_T_ex_DLModel_28_T *r38_f1;
  emxArray_char_T_ex_DLModel_28_T *r39_f1;
  emxArray_char_T_ex_DLModel_28_T *r40_f1;
  emxArray_char_T_ex_DLModel_28_T *r41_f1;
  emxArray_char_T_ex_DLModel_28_T *r42_f1;
  emxArray_char_T_ex_DLModel_28_T *r43_f1;
  emxArray_char_T_ex_DLModel_28_T *r46_f1;
  emxArray_char_T_ex_DLModel_28_T *r47_f1;
  emxArray_char_T_ex_DLModel_28_T *r48_f1;
  emxArray_char_T_ex_DLModel_28_T *r49_f1;
  emxArray_char_T_ex_DLModel_28_T *r50_f1;
  emxArray_char_T_ex_DLModel_28_T *r51_f1;
  emxArray_char_T_ex_DLModel_28_T *r52_f1;
  emxArray_char_T_ex_DLModel_28_T *r53_f1;
  emxArray_char_T_ex_DLModel_28_T *r56_f1;
  emxArray_char_T_ex_DLModel_28_T *r57_f1;
  emxArray_char_T_ex_DLModel_28_T *r58_f1;
  emxArray_char_T_ex_DLModel_28_T *r59_f1;
  emxArray_char_T_ex_DLModel_28_T *r5_f1;
  emxArray_char_T_ex_DLModel_28_T *r60_f1;
  emxArray_char_T_ex_DLModel_28_T *r61_f1;
  emxArray_char_T_ex_DLModel_28_T *r62_f1;
  emxArray_char_T_ex_DLModel_28_T *r63_f1;
  emxArray_char_T_ex_DLModel_28_T *r64_f1;
  emxArray_char_T_ex_DLModel_28_T *r65_f1;
  emxArray_char_T_ex_DLModel_28_T *r66_f1;
  emxArray_char_T_ex_DLModel_28_T *r67_f1;
  emxArray_char_T_ex_DLModel_28_T *r68_f1;
  emxArray_char_T_ex_DLModel_28_T *r70_f1;
  emxArray_char_T_ex_DLModel_28_T *r71_f1;
  emxArray_char_T_ex_DLModel_28_T *r72_f1;
  emxArray_char_T_ex_DLModel_28_T *r73_f1;
  emxArray_char_T_ex_DLModel_28_T *r74_f1;
  emxArray_char_T_ex_DLModel_28_T *r75_f1;
  emxArray_char_T_ex_DLModel_28_T *r76_f1;
  emxArray_char_T_ex_DLModel_28_T *r77_f1;
  emxArray_char_T_ex_DLModel_28_T *r78_f1;
  emxArray_char_T_ex_DLModel_28_T *r8_f1;
  emxArray_char_T_ex_DLModel_28_T *r9_f1;
  emxArray_char_T_ex_DLModel_28_T *r_f1;
  emxArray_int32_T_ex_DLModel_2_T *cpu_b_ii;
  emxArray_int32_T_ex_DLModel_2_T *cpu_idxNewlineChar;
  emxArray_int8_T_ex_DLModel_28_T *cpu_c_x;
  emxArray_uint16_T_ex_DLModel__T *cpu_thisCharcodes_1b;
  emxArray_uint16_T_ex_DLModel__T *cpu_thisGlyphIdxs_1b;
  emxArray_uint8_T_ex_DLModel_2_T *cpu_thisTextU16;
  static const char_T cv[6] = { 'p', 'e', 'r', 's', 'o', 'n' };

  static const char_T cv1[7] = { 'b', 'i', 'c', 'y', 'c', 'l', 'e' };

  static const char_T cv2[3] = { 'c', 'a', 'r' };

  static const char_T cv5[3] = { 'b', 'u', 's' };

  static const char_T cv8[4] = { 'b', 'o', 'a', 't' };

  static const char_T cv10[13] = { 't', 'r', 'a', 'f', 'f', 'i', 'c', ' ', 'l',
    'i', 'g', 'h', 't' };

  static const char_T cv11[12] = { 'f', 'i', 'r', 'e', ' ', 'h', 'y', 'd', 'r',
    'a', 'n', 't' };

  static const char_T cv12[9] = { 's', 't', 'o', 'p', ' ', 's', 'i', 'g', 'n' };

  static const char_T cv13[13] = { 'p', 'a', 'r', 'k', 'i', 'n', 'g', ' ', 'm',
    'e', 't', 'e', 'r' };

  static const char_T cv14[5] = { 'b', 'e', 'n', 'c', 'h' };

  static const char_T cv15[4] = { 'b', 'i', 'r', 'd' };

  static const int8_T cpu_iv3[261] = { 17, 0, 0, 7, 7, 8, 14, 14, 15, 15, 5, 7,
    7, 11, 17, 7, 13, 7, 12, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 7, 7, 17,
    17, 17, 9, 19, 15, 13, 15, 16, 12, 12, 16, 16, 6, 7, 14, 12, 19, 16, 17, 12,
    17, 14, 12, 14, 15, 14, 19, 14, 14, 13, 7, 12, 7, 14, 11, 14, 12, 14, 11, 14,
    12, 8, 14, 14, 6, 7, 13, 6, 21, 14, 14, 14, 14, 9, 11, 8, 14, 11, 17, 14, 12,
    13, 7, 8, 7, 14, 15, 15, 15, 12, 16, 17, 15, 12, 12, 12, 12, 12, 12, 11, 12,
    12, 12, 12, 6, 6, 6, 6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0, 10, 14,
    14, 14, 0, 14, 13, 14, 19, 0, 14, 14, 0, 20, 17, 0, 17, 0, 0, 14, 14, 0, 0,
    0, 0, 0, 10, 10, 0, 19, 14, 9, 7, 17, 0, 0, 0, 0, 12, 12, 0, 7, 15, 15, 17,
    0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 12, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15,
    12, 15, 12, 12, 6, 6, 6, 6, 17, 17, 0, 17, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0,
    14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 16, 13, 14, 12, 12, 14, 0, 17, 9, 9, 9, 18,
    18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 11, 7 };

  static const uint16_T cpu_uv1[256] = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 3U, 4U, 5U, 6U, 7U, 8U, 9U, 10U, 11U, 12U, 13U, 14U, 15U, 16U,
    17U, 18U, 19U, 20U, 21U, 22U, 23U, 24U, 25U, 26U, 27U, 28U, 29U, 30U, 31U,
    32U, 33U, 34U, 35U, 36U, 37U, 38U, 39U, 40U, 41U, 42U, 43U, 44U, 45U, 46U,
    47U, 48U, 49U, 50U, 51U, 52U, 53U, 54U, 55U, 56U, 57U, 58U, 59U, 60U, 61U,
    62U, 63U, 64U, 65U, 66U, 67U, 68U, 69U, 70U, 71U, 72U, 73U, 74U, 75U, 76U,
    77U, 78U, 79U, 80U, 81U, 82U, 83U, 84U, 85U, 86U, 87U, 88U, 89U, 90U, 91U,
    92U, 93U, 94U, 95U, 96U, 97U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 172U, 163U, 132U, 133U, 189U, 150U, 232U, 134U, 142U, 139U, 157U,
    169U, 164U, 258U, 138U, 259U, 131U, 147U, 242U, 243U, 141U, 151U, 136U, 260U,
    222U, 241U, 158U, 170U, 245U, 244U, 246U, 162U, 173U, 201U, 199U, 174U, 98U,
    99U, 144U, 100U, 203U, 101U, 200U, 202U, 207U, 204U, 205U, 206U, 233U, 102U,
    211U, 208U, 209U, 175U, 103U, 240U, 145U, 214U, 212U, 213U, 104U, 235U, 237U,
    137U, 106U, 105U, 107U, 109U, 108U, 110U, 160U, 111U, 113U, 112U, 114U, 115U,
    117U, 116U, 118U, 119U, 234U, 120U, 122U, 121U, 123U, 125U, 124U, 184U, 161U,
    127U, 126U, 128U, 129U, 236U, 238U, 186U };

  static const char_T cv20[3] = { 'c', 'o', 'w' };

  static const char_T cv21[8] = { 'e', 'l', 'e', 'p', 'h', 'a', 'n', 't' };

  static const char_T cv22[4] = { 'b', 'e', 'a', 'r' };

  static const char_T cv23[5] = { 'z', 'e', 'b', 'r', 'a' };

  static const boolean_T bv[2] = { false, true };

  static const char_T cv24[7] = { 'g', 'i', 'r', 'a', 'f', 'f', 'e' };

  static const char_T cv27[7] = { 'h', 'a', 'n', 'd', 'b', 'a', 'g' };

  static const char_T cv28[3] = { 't', 'i', 'e' };

  static const char_T cv29[8] = { 's', 'u', 'i', 't', 'c', 'a', 's', 'e' };

  static const char_T cv30[7] = { 'f', 'r', 'i', 's', 'b', 'e', 'e' };

  static const char_T cv31[4] = { 's', 'k', 'i', 's' };

  static const char_T cv32[9] = { 's', 'n', 'o', 'w', 'b', 'o', 'a', 'r', 'd' };

  static const char_T cv33[11] = { 's', 'p', 'o', 'r', 't', 's', ' ', 'b', 'a',
    'l', 'l' };

  static const char_T cv34[4] = { 'k', 'i', 't', 'e' };

  static const char_T cv35[12] = { 'b', 'a', 's', 'e', 'b', 'a', 'l', 'l', ' ',
    'b', 'a', 't' };

  static const char_T cv36[14] = { 'b', 'a', 's', 'e', 'b', 'a', 'l', 'l', ' ',
    'g', 'l', 'o', 'v', 'e' };

  static const int8_T iv4[261] = { 2, 0, 0, 0, 2, 1, 0, 2, 0, 0, 1, 1, 0, 1, 2,
    2, 1, 2, 2, 1, 3, 1, 2, 1, 2, 1, 2, 1, 1, 2, 2, 2, 2, 2, 0, 1, 0, 2, 1, 2, 2,
    2, 1, 2, 2, -2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 0, 1, 0, 0, 0, 0, 1, 2, 2, 0, 1,
    0, 4, 1, 2, 1, 1, 1, 0, 1, 2, 2, -2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 0, 1, 0, 0,
    0, 0, 1, 0, 3, 1, 1, 0, 0, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    -1, -1, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 2, 2, 0, 2, 2, 2, 1, 0, 4,
    3, 0, 0, 1, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 2, 2, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 1, -1, 0, -1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, -1, 1, 0, 0, 2, 2, 0, 2, 2, 1, 1,
    0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2 };

  static const char_T cv37[10] = { 's', 'k', 'a', 't', 'e', 'b', 'o', 'a', 'r',
    'd' };

  static const int8_T iv5[261] = { 14, 0, 0, 0, 16, 17, 16, 17, 16, 16, 17, 17,
    17, 16, 14, 3, 7, 3, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 12, 12, 13,
    9, 13, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 16, 17, 16, 0, 17, 12, 17,
    12, 17, 12, 17, 12, 17, 16, 16, 17, 17, 12, 12, 12, 12, 12, 12, 12, 14, 12,
    12, 12, 12, 12, 12, 17, 17, 17, 8, 19, 21, 16, 20, 20, 19, 19, 17, 17, 17,
    16, 17, 19, 12, 17, 17, 17, 16, 17, 17, 17, 16, 17, 17, 17, 17, 16, 17, 17,
    17, 17, 16, 0, 17, 16, 16, 16, 0, 16, 17, 16, 17, 0, 17, 16, 0, 16, 16, 0,
    13, 0, 0, 16, 12, 0, 0, 0, 0, 0, 17, 17, 0, 12, 12, 12, 12, 10, 0, 0, 0, 0,
    10, 10, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 16, 0, 0, 14, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 20, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 0, 20, 20,
    20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 16, 18, 20,
    17, 16, 17, 0, 13, 16, 16, 16, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    7, 18, 8 };

  static const char_T cv38[9] = { 's', 'u', 'r', 'f', 'b', 'o', 'a', 'r', 'd' };

  static const int8_T uv2[261] = { 14, 0, 0, 0, 16, 5, 16, 18, 16, 16, 5, 20, 20,
    8, 14, 6, 2, 3, 19, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 12, 15, 13, 6,
    13, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 19, 16, 16, 16, 16, 16, 16,
    19, 16, 16, 16, 16, 15, 16, 16, 15, 16, 20, 19, 20, 12, 2, 3, 12, 17, 12, 17,
    12, 17, 16, 17, 16, 20, 17, 17, 12, 12, 12, 16, 16, 12, 12, 14, 12, 12, 12,
    12, 16, 12, 20, 20, 20, 4, 19, 21, 21, 20, 20, 19, 19, 17, 17, 17, 16, 17,
    19, 17, 17, 17, 17, 16, 17, 17, 17, 16, 17, 17, 17, 17, 16, 17, 17, 17, 17,
    16, 0, 6, 16, 16, 20, 0, 19, 17, 10, 17, 0, 3, 2, 0, 15, 16, 0, 13, 0, 0, 16,
    16, 0, 0, 0, 0, 0, 8, 8, 0, 12, 12, 16, 16, 7, 0, 0, 0, 0, 9, 9, 0, 0, 20,
    20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 20, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 20, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 0, 20, 20, 20, 20, 0, 0, 0, 0,
    0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 16, 18, 19, 21, 15, 21, 0, 13, 10,
    10, 10, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 3 };

  static const char_T cv39[13] = { 't', 'e', 'n', 'n', 'i', 's', ' ', 'r', 'a',
    'c', 'k', 'e', 't' };

  static const char_T cv40[6] = { 'b', 'o', 't', 't', 'l', 'e' };

  static const int8_T uv3[261] = { 12, 0, 0, 0, 3, 7, 14, 10, 15, 15, 3, 6, 6, 9,
    14, 3, 11, 3, 8, 12, 9, 11, 10, 12, 10, 12, 11, 12, 12, 3, 3, 14, 14, 14, 9,
    18, 15, 10, 13, 14, 10, 9, 13, 13, 3, 7, 12, 10, 15, 13, 15, 10, 17, 12, 10,
    14, 13, 15, 19, 14, 14, 12, 5, 8, 6, 12, 11, 6, 11, 11, 10, 11, 10, 9, 11,
    10, 3, 7, 11, 3, 17, 10, 12, 11, 11, 7, 9, 8, 11, 12, 17, 13, 12, 11, 6, 2,
    6, 12, 15, 15, 13, 10, 13, 15, 13, 11, 11, 11, 11, 11, 11, 10, 10, 10, 10,
    10, 6, 6, 8, 7, 10, 12, 12, 12, 12, 12, 11, 11, 11, 11, 0, 7, 10, 10, 10, 0,
    10, 11, 10, 17, 0, 6, 7, 0, 20, 15, 0, 14, 0, 0, 14, 10, 0, 0, 0, 0, 0, 9, 8,
    0, 17, 12, 9, 3, 14, 0, 0, 0, 0, 10, 11, 0, 0, 15, 15, 15, 0, 0, 0, 0, 0, 0,
    0, 0, 14, 0, 12, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 10, 15, 10, 10, 6,
    8, 7, 6, 15, 15, 0, 15, 13, 13, 13, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 2, 17, 12, 14, 12, 10, 11, 0, 14, 6, 7, 7, 17, 17, 16, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 11, 11, 3 };

  static const int8_T cpu_iv6[261] = { 9, 0, 0, 4, 4, 4, 8, 8, 8, 8, 3, 4, 4, 6,
    10, 4, 7, 4, 6, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 4, 4, 10, 10, 10, 5, 10, 8, 7,
    8, 9, 7, 6, 9, 9, 3, 4, 8, 6, 10, 9, 9, 7, 9, 8, 6, 8, 8, 8, 10, 8, 7, 7, 4,
    6, 4, 8, 6, 7, 7, 8, 6, 8, 7, 4, 7, 7, 3, 4, 7, 3, 11, 7, 7, 8, 8, 5, 6, 4,
    7, 6, 9, 7, 6, 7, 4, 4, 4, 8, 8, 8, 8, 7, 9, 9, 8, 7, 7, 7, 7, 7, 7, 6, 7, 7,
    7, 7, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 5, 8, 8, 8, 0, 8, 7, 8,
    10, 0, 7, 7, 0, 11, 9, 0, 10, 0, 0, 8, 8, 0, 0, 0, 0, 0, 6, 6, 0, 10, 7, 5,
    4, 10, 0, 0, 0, 0, 6, 6, 0, 4, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 6, 0,
    0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 7, 8, 7, 7, 3, 3, 3, 3, 9, 9, 0, 9, 8, 8,
    8, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 9, 7, 7, 6, 7, 8, 0,
    10, 5, 5, 5, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 6, 4 };

  static const char_T cv41[10] = { 'w', 'i', 'n', 'e', ' ', 'g', 'l', 'a', 's',
    's' };

  static const char_T cv42[3] = { 'c', 'u', 'p' };

  static const char_T cv43[4] = { 'f', 'o', 'r', 'k' };

  static const int16_T uv4[261] = { 0, 0, 0, 168, 168, 216, 251, 475, 655, 895,
    1135, 1150, 1270, 1390, 1462, 1658, 1676, 1698, 1707, 1859, 2051, 2195, 2371,
    2531, 2723, 2883, 3075, 3251, 3443, 3635, 3671, 3716, 3898, 3982, 4164, 4308,
    4596, 4836, 4996, 5204, 5428, 5588, 5732, 5940, 6148, 6196, 6329, 6521, 6681,
    6921, 7129, 7369, 7529, 7852, 8044, 8204, 8428, 8636, 8861, 9165, 9389, 9599,
    9791, 9891, 10043, 10163, 10307, 10329, 10347, 10479, 10666, 10786, 10973,
    11093, 11246, 11422, 11592, 11640, 11780, 11967, 12018, 12222, 12342, 12486,
    12662, 12838, 12922, 13030, 13142, 13274, 13418, 13622, 13778, 13970, 14102,
    14222, 14262, 14382, 19246, 19531, 20146, 20619, 22014, 23474, 24961, 25998,
    25811, 26185, 26559, 26372, 26735, 27148, 27488, 27318, 27658, 27828, 28090,
    27988, 28192, 28328, 28656, 29030, 28826, 29234, 29642, 29438, 30347, 30160,
    30534, 30721, 0, 16113, 14478, 14638, 15206, 0, 16655, 25624, 15991, 15420,
    0, 16477, 15406, 0, 19846, 23941, 0, 16155, 0, 0, 14942, 16495, 0, 0, 0, 0,
    0, 15709, 16939, 0, 26944, 30016, 17902, 14430, 15871, 0, 0, 0, 0, 15781,
    17003, 0, 14430, 18046, 18946, 23174, 0, 0, 0, 0, 0, 0, 0, 0, 29834, 0,
    31380, 0, 0, 14798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18646, 20819, 18346, 21019,
    20419, 21329, 21449, 21609, 21209, 22574, 22874, 0, 22274, 24441, 24701,
    24181, 0, 0, 0, 0, 0, 0, 0, 16854, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15166, 21742,
    28440, 25208, 30897, 25474, 31149, 0, 23759, 16879, 16337, 16407, 17374,
    17102, 17646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15969, 16091, 16845 };

  static const char_T cv46[4] = { 'b', 'o', 'w', 'l' };

  static const char_T cv47[6] = { 'b', 'a', 'n', 'a', 'n', 'a' };

  static const char_T cv48[5] = { 'a', 'p', 'p', 'l', 'e' };

  static const char_T cv49[8] = { 's', 'a', 'n', 'd', 'w', 'i', 'c', 'h' };

  static const char_T cv50[6] = { 'o', 'r', 'a', 'n', 'g', 'e' };

  static const uint8_T cpu_uv5[31620] = { 48U, 183U, 176U, 176U, 176U, 176U,
    176U, 176U, 176U, 176U, 176U, 143U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U,
    112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 176U, 64U, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 64U, 211U,
    176U, 176U, 176U, 176U, 176U, 176U, 176U, 176U, 176U, 187U, 148U,
    MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 144U,
    MAX_uint8_T, 131U, 136U, MAX_uint8_T, 123U, 127U, MAX_uint8_T, 115U, 119U,
    MAX_uint8_T, 107U, 110U, MAX_uint8_T, 99U, 102U, MAX_uint8_T, 91U, 93U,
    MAX_uint8_T, 83U, 84U, MAX_uint8_T, 75U, 0U, 0U, 0U, 0U, 0U, 0U, 148U,
    MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 202U,
    MAX_uint8_T, 72U, 18U, MAX_uint8_T, 254U, 2U, 188U, MAX_uint8_T, 59U, 4U,
    MAX_uint8_T, 243U, 0U, 174U, MAX_uint8_T, 45U, 0U, 246U, 229U, 0U, 161U,
    MAX_uint8_T, 32U, 0U, 233U, 216U, 0U, 147U, MAX_uint8_T, 18U, 0U, 219U, 202U,
    0U, 0U, 0U, 0U, 0U, 0U, 2U, 240U, 105U, 0U, 0U, 195U, 156U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 49U, MAX_uint8_T, 44U, 0U, 7U, 248U, 95U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 110U, 238U, 1U, 0U, 60U, MAX_uint8_T, 33U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    172U, 178U, 0U, 0U, 121U, 228U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 232U, 118U,
    0U, 0U, 182U, 166U, 0U, 0U, 0U, 0U, 182U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 157U, 0U, 0U, 0U, 0U, 123U, 225U, 0U,
    0U, 71U, MAX_uint8_T, 22U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 183U, 166U, 0U, 0U,
    131U, 217U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 240U, 107U, 0U, 0U, 191U, 157U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 46U, MAX_uint8_T, 49U, 0U, 4U, 245U, 97U, 0U, 0U,
    0U, 0U, 182U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 157U, 0U, 0U, 0U, 0U, 191U, 161U, 0U, 0U, 143U, 209U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 5U, 245U, 100U, 0U, 0U, 203U, 148U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 56U, MAX_uint8_T, 39U, 0U, 12U, 251U, 87U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 117U, 234U, 0U, 0U, 69U, MAX_uint8_T, 27U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    178U, 174U, 0U, 0U, 130U, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 112U,
    156U, 0U, 0U, 0U, 0U, 0U, 0U, 72U, 192U, 246U, 252U, 221U, 164U, 59U, 0U, 0U,
    108U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 16U, 8U, 242U, 254U, 129U, 134U, 159U, 45U, 110U,
    204U, 15U, 48U, MAX_uint8_T, 184U, 0U, 112U, 156U, 0U, 0U, 0U, 0U, 31U,
    MAX_uint8_T, 195U, 0U, 112U, 156U, 0U, 0U, 0U, 0U, 1U, 213U, MAX_uint8_T,
    93U, 112U, 156U, 0U, 0U, 0U, 0U, 0U, 63U, 248U, MAX_uint8_T, 219U, 156U, 0U,
    0U, 0U, 0U, 0U, 0U, 58U, 228U, MAX_uint8_T, 228U, 75U, 0U, 0U, 0U, 0U, 0U,
    0U, 17U, 180U, MAX_uint8_T, MAX_uint8_T, 160U, 7U, 0U, 0U, 0U, 0U, 0U, 112U,
    198U, 226U, MAX_uint8_T, 171U, 0U, 0U, 0U, 0U, 0U, 112U, 156U, 26U, 231U,
    MAX_uint8_T, 40U, 0U, 0U, 0U, 0U, 112U, 156U, 0U, 149U, MAX_uint8_T, 74U, 0U,
    0U, 0U, 0U, 112U, 156U, 0U, 178U, MAX_uint8_T, 43U, 152U, 156U, 76U, 34U,
    117U, 176U, 141U, MAX_uint8_T, 213U, 3U, 172U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 242U, 59U, 0U, 19U, 101U,
    181U, 223U, 251U, 248U, 170U, 43U, 0U, 0U, 0U, 0U, 0U, 0U, 112U, 156U, 0U,
    0U, 0U, 0U, 0U, 84U, 214U, 249U, 216U, 84U, 0U, 0U, 0U, 0U, 0U, 0U, 156U,
    236U, 31U, 51U, 254U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, 51U, 0U,
    0U, 0U, 0U, 101U, 253U, 70U, 0U, 165U, MAX_uint8_T, 94U, 12U, 90U, 254U,
    168U, 0U, 0U, 0U, 52U, 248U, 123U, 0U, 0U, 207U, 204U, 0U, 0U, 0U, 200U,
    210U, 0U, 0U, 19U, 224U, 178U, 1U, 0U, 0U, 206U, 204U, 0U, 0U, 0U, 198U,
    209U, 0U, 2U, 186U, 219U, 15U, 0U, 0U, 0U, 163U, MAX_uint8_T, 93U, 10U, 78U,
    253U, 167U, 0U, 134U, 245U, 46U, 0U, 0U, 0U, 0U, 49U, 253U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 254U, 52U, 78U, 254U, 91U, 0U, 0U, 0U, 0U, 0U, 0U,
    84U, 217U, 250U, 215U, 84U, 37U, 240U, 147U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 10U, 211U, 198U, 9U, 136U, 232U, 247U, 187U, 38U, 0U, 0U, 0U, 0U,
    0U, 0U, 166U, 232U, 26U, 125U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 220U, 5U, 0U, 0U, 0U, 0U, 111U, 251U, 63U, 1U, 240U, 226U, 47U,
    17U, 162U, MAX_uint8_T, 88U, 0U, 0U, 0U, 60U, 250U, 115U, 0U, 26U,
    MAX_uint8_T, 124U, 0U, 0U, 24U, MAX_uint8_T, 130U, 0U, 0U, 24U, 230U, 171U,
    0U, 0U, 27U, MAX_uint8_T, 123U, 0U, 0U, 22U, MAX_uint8_T, 129U, 0U, 4U, 194U,
    214U, 12U, 0U, 0U, 1U, 240U, 225U, 45U, 14U, 147U, MAX_uint8_T, 88U, 0U,
    144U, 242U, 40U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 222U, 6U, 88U, MAX_uint8_T, 84U, 0U, 0U, 0U, 0U, 0U, 5U, 140U,
    235U, 247U, 188U, 40U, 0U, 0U, 0U, 0U, 0U, 9U, 126U, 216U, 245U, 210U, 95U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 192U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 70U,
    MAX_uint8_T, 244U, 56U, 10U, 108U, MAX_uint8_T, 227U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 96U, MAX_uint8_T, 192U, 0U, 0U, 7U, MAX_uint8_T, 241U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 49U, MAX_uint8_T, 227U, 1U, 0U, 61U, MAX_uint8_T, 180U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 208U, MAX_uint8_T, 83U, 54U, 226U, 239U, 41U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 15U, 164U, MAX_uint8_T, 242U, 254U, 217U, 46U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 94U, 242U, 252U, 228U, MAX_uint8_T, 196U, 7U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 89U, MAX_uint8_T, 209U, 35U, 35U, 246U, 251U, 51U, 0U, 0U,
    0U, 202U, MAX_uint8_T, 68U, 0U, 225U, MAX_uint8_T, 38U, 0U, 0U, 117U,
    MAX_uint8_T, 210U, 5U, 0U, 0U, 210U, MAX_uint8_T, 44U, 26U, MAX_uint8_T,
    240U, 0U, 0U, 0U, 3U, 205U, MAX_uint8_T, 146U, 0U, 1U, 242U, 238U, 2U, 43U,
    MAX_uint8_T, 254U, 23U, 0U, 0U, 0U, 40U, 244U, MAX_uint8_T, 99U, 60U,
    MAX_uint8_T, 151U, 0U, 9U, 245U, MAX_uint8_T, 161U, 0U, 0U, 0U, 0U, 91U,
    MAX_uint8_T, 249U, 211U, 244U, 31U, 0U, 0U, 142U, MAX_uint8_T, MAX_uint8_T,
    177U, 55U, 7U, 7U, 18U, 173U, MAX_uint8_T, MAX_uint8_T, 110U, 0U, 0U, 0U, 6U,
    176U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 16U, 0U, 0U, 0U,
    0U, 87U, 184U, 236U, 250U, 229U, 199U, 123U, 60U, 233U, MAX_uint8_T, 205U,
    20U, 195U, MAX_uint8_T, 201U, 167U, MAX_uint8_T, 174U, 140U, MAX_uint8_T,
    147U, 113U, MAX_uint8_T, 120U, 86U, MAX_uint8_T, 93U, 0U, 0U, 0U, 0U, 84U,
    79U, 0U, 0U, 0U, 96U, 254U, 92U, 0U, 0U, 57U, 251U, 223U, 20U, 0U, 5U, 217U,
    248U, 46U, 0U, 0U, 105U, MAX_uint8_T, 148U, 0U, 0U, 0U, 215U, MAX_uint8_T,
    30U, 0U, 0U, 44U, MAX_uint8_T, 216U, 0U, 0U, 0U, 105U, MAX_uint8_T, 160U, 0U,
    0U, 0U, 147U, MAX_uint8_T, 137U, 0U, 0U, 0U, 165U, MAX_uint8_T, 120U, 0U, 0U,
    0U, 166U, MAX_uint8_T, 120U, 0U, 0U, 0U, 147U, MAX_uint8_T, 137U, 0U, 0U, 0U,
    106U, MAX_uint8_T, 160U, 0U, 0U, 0U, 44U, MAX_uint8_T, 216U, 0U, 0U, 0U, 0U,
    216U, MAX_uint8_T, 29U, 0U, 0U, 0U, 106U, MAX_uint8_T, 147U, 0U, 0U, 0U, 6U,
    218U, 248U, 45U, 0U, 0U, 0U, 59U, 251U, 222U, 20U, 0U, 0U, 0U, 97U, 254U,
    92U, 0U, 0U, 0U, 0U, 85U, 79U, 47U, 114U, 0U, 0U, 0U, 0U, 51U, MAX_uint8_T,
    134U, 0U, 0U, 0U, 6U, 197U, MAX_uint8_T, 91U, 0U, 0U, 0U, 23U, 231U, 240U,
    21U, 0U, 0U, 0U, 109U, MAX_uint8_T, 144U, 0U, 0U, 0U, 7U, 238U, 242U, 12U,
    0U, 0U, 0U, 177U, MAX_uint8_T, 82U, 0U, 0U, 0U, 120U, MAX_uint8_T, 145U, 0U,
    0U, 0U, 98U, MAX_uint8_T, 185U, 0U, 0U, 0U, 80U, MAX_uint8_T, 204U, 0U, 0U,
    0U, 81U, MAX_uint8_T, 203U, 0U, 0U, 0U, 98U, MAX_uint8_T, 186U, 0U, 0U, 0U,
    120U, MAX_uint8_T, 145U, 0U, 0U, 0U, 176U, MAX_uint8_T, 82U, 0U, 0U, 7U,
    238U, 243U, 12U, 0U, 0U, 107U, MAX_uint8_T, 146U, 0U, 0U, 23U, 231U, 241U,
    22U, 0U, 6U, 196U, MAX_uint8_T, 94U, 0U, 0U, 51U, MAX_uint8_T, 135U, 0U, 0U,
    0U, 47U, 115U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T, 13U, 0U, 0U,
    0U, 0U, 0U, 0U, 83U, 239U, 0U, 0U, 0U, 0U, 108U, 178U, 84U, 62U, 204U, 27U,
    119U, 212U, 16U, 176U, MAX_uint8_T, MAX_uint8_T, 133U, 3U, 226U, MAX_uint8_T,
    MAX_uint8_T, 76U, 0U, 0U, 6U, 144U, 80U, 99U, 0U, 0U, 0U, 0U, 0U, 152U, 209U,
    56U, 249U, 57U, 0U, 0U, 0U, 97U, MAX_uint8_T, 81U, 0U, 180U, 229U, 23U, 0U,
    0U, 45U, 174U, 1U, 0U, 50U, 161U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 156U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 0U, 12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 216U, MAX_uint8_T, 204U, 216U,
    MAX_uint8_T, 204U, 216U, MAX_uint8_T, 196U, 0U, 216U, 167U, 55U, 253U, 82U,
    189U, 120U, 0U, 104U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 32U, 104U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 32U, 216U, MAX_uint8_T, 204U, 216U,
    MAX_uint8_T, 204U, 216U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 91U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 168U, 248U, 11U, 0U, 0U, 0U, 0U, 4U,
    240U, 182U, 0U, 0U, 0U, 0U, 0U, 66U, MAX_uint8_T, 105U, 0U, 0U, 0U, 0U, 0U,
    143U, MAX_uint8_T, 29U, 0U, 0U, 0U, 0U, 0U, 220U, 207U, 0U, 0U, 0U, 0U, 0U,
    41U, MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 118U, MAX_uint8_T, 53U, 0U, 0U,
    0U, 0U, 0U, 195U, 231U, 1U, 0U, 0U, 0U, 0U, 19U, 252U, 155U, 0U, 0U, 0U, 0U,
    0U, 93U, MAX_uint8_T, 78U, 0U, 0U, 0U, 0U, 0U, 170U, 247U, 10U, 0U, 0U, 0U,
    0U, 5U, 241U, 180U, 0U, 0U, 0U, 0U, 0U, 68U, MAX_uint8_T, 103U, 0U, 0U, 0U,
    0U, 0U, 145U, MAX_uint8_T, 27U, 0U, 0U, 0U, 0U, 0U, 222U, 205U, 0U, 0U, 0U,
    0U, 0U, 43U, MAX_uint8_T, 128U, 0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 51U,
    0U, 0U, 0U, 0U, 0U, 197U, 229U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 74U,
    191U, 242U, 239U, 184U, 63U, 0U, 0U, 0U, 0U, 0U, 118U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 253U, 99U, 0U, 0U, 0U,
    63U, 254U, 251U, 112U, 15U, 19U, 121U, 254U, 251U, 45U, 0U, 0U, 198U,
    MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 147U, MAX_uint8_T, 177U, 0U, 35U,
    MAX_uint8_T, 254U, 24U, 0U, 0U, 0U, 0U, 38U, MAX_uint8_T, 251U, 19U, 95U,
    MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U, 0U, 233U, MAX_uint8_T, 74U, 134U,
    MAX_uint8_T, 185U, 0U, 0U, 0U, 0U, 0U, 0U, 202U, MAX_uint8_T, 113U, 149U,
    MAX_uint8_T, 172U, 0U, 0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 128U, 149U,
    MAX_uint8_T, 172U, 0U, 0U, 0U, 0U, 0U, 0U, 190U, MAX_uint8_T, 128U, 133U,
    MAX_uint8_T, 185U, 0U, 0U, 0U, 0U, 0U, 0U, 204U, MAX_uint8_T, 112U, 94U,
    MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U, 0U, 237U, MAX_uint8_T, 72U, 34U,
    MAX_uint8_T, 254U, 23U, 0U, 0U, 0U, 0U, 43U, MAX_uint8_T, 251U, 19U, 0U,
    197U, MAX_uint8_T, 129U, 0U, 0U, 0U, 0U, 154U, MAX_uint8_T, 178U, 0U, 0U,
    63U, 254U, 250U, 107U, 14U, 20U, 127U, 254U, 252U, 47U, 0U, 0U, 0U, 121U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 253U, 101U,
    0U, 0U, 0U, 0U, 0U, 78U, 196U, 244U, 239U, 183U, 63U, 0U, 0U, 0U, 11U, 57U,
    105U, 153U, 202U, 146U, 0U, 0U, 0U, 176U, MAX_uint8_T, 253U, 240U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 87U, 75U, 15U, 132U, MAX_uint8_T, 156U, 0U,
    0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U,
    0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U,
    0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U,
    0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 176U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 176U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    204U, 0U, 27U, 116U, 193U, 227U, 250U, 230U, 168U, 48U, 0U, 0U, 0U, 200U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    250U, 80U, 0U, 0U, 172U, 139U, 60U, 22U, 13U, 63U, 204U, MAX_uint8_T, 237U,
    11U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 24U, 253U, MAX_uint8_T, 69U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 235U, MAX_uint8_T, 81U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U,
    MAX_uint8_T, MAX_uint8_T, 43U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 151U, MAX_uint8_T,
    195U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 90U, MAX_uint8_T, 236U, 37U, 0U, 0U, 0U,
    0U, 0U, 0U, 95U, 252U, 230U, 46U, 0U, 0U, 0U, 0U, 0U, 0U, 126U, MAX_uint8_T,
    208U, 29U, 0U, 0U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 186U, 12U, 0U, 0U, 0U,
    0U, 0U, 0U, 126U, MAX_uint8_T, 195U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 72U, 254U,
    241U, 25U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 223U, MAX_uint8_T, 143U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 44U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 15U, 108U, 195U, 234U, 250U,
    228U, 171U, 58U, 0U, 0U, 140U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U, 75U, 0U, 124U, 146U, 58U, 17U,
    16U, 70U, 219U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 74U,
    MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 46U, MAX_uint8_T, 219U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 131U, 0U, 0U, 0U, 1U, 14U, 55U,
    148U, 254U, 181U, 10U, 0U, 0U, 76U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    243U, 97U, 3U, 0U, 0U, 0U, 76U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 239U, 142U, 10U, 0U, 0U, 0U, 1U, 11U, 41U, 107U, 226U,
    MAX_uint8_T, 195U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 28U, 246U, MAX_uint8_T, 74U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 207U, MAX_uint8_T, 117U, 0U, 0U, 0U, 0U, 0U, 0U,
    24U, 247U, MAX_uint8_T, 100U, 167U, 136U, 56U, 13U, 21U, 81U, 215U,
    MAX_uint8_T, 246U, 26U, 196U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 251U, 93U, 0U, 27U, 118U, 198U, 238U,
    248U, 220U, 157U, 45U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 38U, 242U,
    MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 9U, 209U, MAX_uint8_T,
    MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 157U, 233U, 172U, MAX_uint8_T,
    68U, 0U, 0U, 0U, 0U, 0U, 0U, 94U, 254U, 70U, 148U, MAX_uint8_T, 68U, 0U, 0U,
    0U, 0U, 0U, 42U, 245U, 134U, 0U, 148U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 11U,
    214U, 197U, 4U, 0U, 148U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 163U, 238U, 30U,
    0U, 0U, 148U, MAX_uint8_T, 68U, 0U, 0U, 0U, 102U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 148U, MAX_uint8_T, 68U, 0U, 0U, 47U, 247U, 146U, 0U, 0U, 0U, 0U, 148U,
    MAX_uint8_T, 68U, 0U, 0U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 100U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    100U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    184U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 184U,
    MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 68U,
    0U, 0U, 16U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 252U, 0U, 16U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U, 0U,
    16U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, MAX_uint8_T, 204U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 16U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, MAX_uint8_T,
    MAX_uint8_T, 244U, 219U, 163U, 66U, 0U, 0U, 0U, 16U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 164U, 5U,
    0U, 0U, 0U, 4U, 22U, 67U, 158U, 254U, MAX_uint8_T, 141U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 113U, MAX_uint8_T, 248U, 12U, 0U, 0U, 0U, 0U, 0U, 0U, 9U, 254U,
    MAX_uint8_T, 59U, 0U, 0U, 0U, 0U, 0U, 0U, 11U, 253U, MAX_uint8_T, 67U, 0U,
    0U, 0U, 0U, 0U, 0U, 92U, MAX_uint8_T, MAX_uint8_T, 29U, 77U, 152U, 53U, 11U,
    29U, 109U, 242U, MAX_uint8_T, 183U, 0U, 84U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 212U, 25U, 0U, 7U, 110U,
    210U, 249U, 237U, 193U, 109U, 7U, 0U, 0U, 0U, 0U, 0U, 19U, 135U, 212U, 244U,
    234U, 188U, 99U, 12U, 0U, 0U, 0U, 52U, 235U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 132U, 0U, 0U, 21U, 235U,
    MAX_uint8_T, 190U, 57U, 9U, 26U, 72U, 161U, 119U, 0U, 0U, 150U, MAX_uint8_T,
    202U, 6U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 9U, 241U, MAX_uint8_T, 75U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 61U, MAX_uint8_T, 251U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 105U, MAX_uint8_T, 219U, 9U, 128U, 218U, 249U, 232U, 162U, 35U, 0U, 0U,
    124U, MAX_uint8_T, 218U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 240U, 50U, 0U, 132U, MAX_uint8_T, MAX_uint8_T,
    235U, 101U, 25U, 15U, 76U, 223U, MAX_uint8_T, 212U, 1U, 121U, MAX_uint8_T,
    MAX_uint8_T, 55U, 0U, 0U, 0U, 0U, 52U, MAX_uint8_T, MAX_uint8_T, 46U, 91U,
    MAX_uint8_T, 236U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 77U, 39U,
    MAX_uint8_T, 254U, 11U, 0U, 0U, 0U, 0U, 0U, 222U, MAX_uint8_T, 64U, 0U, 211U,
    MAX_uint8_T, 117U, 0U, 0U, 0U, 0U, 42U, 254U, 249U, 13U, 0U, 84U,
    MAX_uint8_T, 249U, 124U, 32U, 13U, 70U, 218U, MAX_uint8_T, 147U, 0U, 0U, 0U,
    145U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 193U, 9U, 0U, 0U, 0U, 0U, 86U, 194U, 242U, 246U, 207U, 113U, 5U,
    0U, 0U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 152U, 156U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 152U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    187U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 90U, MAX_uint8_T, 156U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 15U, 231U, 231U, 15U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    150U, MAX_uint8_T, 89U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 53U, 253U, 190U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 3U, 206U, 253U, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 112U,
    MAX_uint8_T, 158U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 25U, 242U, 249U, 32U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 161U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 47U,
    254U, MAX_uint8_T, 41U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 171U, MAX_uint8_T, 192U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 18U, 250U, MAX_uint8_T, 98U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 91U, MAX_uint8_T, 254U, 22U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U,
    MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, 174U, 233U,
    249U, 222U, 165U, 44U, 0U, 0U, 0U, 0U, 91U, 253U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 249U, 69U, 0U, 0U, 10U, 241U, 254U,
    127U, 26U, 9U, 53U, 194U, MAX_uint8_T, 197U, 0U, 0U, 57U, MAX_uint8_T, 190U,
    0U, 0U, 0U, 0U, 28U, MAX_uint8_T, 219U, 0U, 0U, 42U, MAX_uint8_T, 217U, 4U,
    0U, 0U, 0U, 41U, MAX_uint8_T, 159U, 0U, 0U, 0U, 195U, MAX_uint8_T, 171U, 17U,
    0U, 6U, 186U, 234U, 31U, 0U, 0U, 0U, 26U, 215U, MAX_uint8_T, 235U, 122U,
    203U, 221U, 46U, 0U, 0U, 0U, 0U, 0U, 85U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 102U, 0U, 0U, 0U, 0U, 0U, 125U, MAX_uint8_T, 176U,
    86U, 211U, MAX_uint8_T, MAX_uint8_T, 185U, 14U, 0U, 0U, 87U, MAX_uint8_T,
    168U, 1U, 0U, 2U, 100U, 239U, MAX_uint8_T, 192U, 0U, 0U, 213U, MAX_uint8_T,
    37U, 0U, 0U, 0U, 0U, 38U, 243U, MAX_uint8_T, 73U, 10U, 254U, MAX_uint8_T,
    17U, 0U, 0U, 0U, 0U, 0U, 178U, MAX_uint8_T, 124U, 8U, 253U, MAX_uint8_T, 90U,
    0U, 0U, 0U, 0U, 4U, 218U, MAX_uint8_T, 108U, 0U, 185U, MAX_uint8_T, 240U,
    104U, 25U, 10U, 52U, 179U, MAX_uint8_T, 245U, 28U, 0U, 34U, 227U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    248U, 85U, 0U, 0U, 0U, 17U, 131U, 209U, 245U, 249U, 222U, 155U, 40U, 0U, 0U,
    0U, 0U, 5U, 112U, 207U, 246U, 240U, 190U, 79U, 0U, 0U, 0U, 0U, 9U, 193U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    131U, 0U, 0U, 0U, 150U, MAX_uint8_T, 216U, 69U, 13U, 34U, 130U, 252U,
    MAX_uint8_T, 72U, 0U, 15U, 250U, 253U, 39U, 0U, 0U, 0U, 0U, 127U,
    MAX_uint8_T, 202U, 0U, 67U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 16U,
    MAX_uint8_T, MAX_uint8_T, 32U, 77U, MAX_uint8_T, 228U, 0U, 0U, 0U, 0U, 0U,
    0U, 240U, MAX_uint8_T, 84U, 39U, MAX_uint8_T, MAX_uint8_T, 53U, 0U, 0U, 0U,
    0U, 55U, MAX_uint8_T, MAX_uint8_T, 109U, 0U, 194U, MAX_uint8_T, 223U, 77U,
    16U, 22U, 97U, 234U, MAX_uint8_T, MAX_uint8_T, 119U, 0U, 33U, 227U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 187U, 232U,
    MAX_uint8_T, 106U, 0U, 0U, 22U, 147U, 227U, 249U, 217U, 117U, 5U, 243U,
    MAX_uint8_T, 81U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 34U, MAX_uint8_T,
    MAX_uint8_T, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 119U, MAX_uint8_T, 209U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 30U, 237U, MAX_uint8_T, 98U, 0U, 0U, 114U,
    152U, 62U, 17U, 14U, 83U, 224U, MAX_uint8_T, 192U, 1U, 0U, 0U, 128U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    197U, 15U, 0U, 0U, 0U, 13U, 107U, 198U, 243U, 237U, 193U, 100U, 2U, 0U, 0U,
    0U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T,
    136U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U,
    148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U,
    MAX_uint8_T, 136U, 148U, MAX_uint8_T, 135U, 148U, MAX_uint8_T, 123U, 0U,
    214U, 93U, 35U, 242U, 20U, 126U, 83U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 46U, 175U, 27U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 42U, 170U, 254U,
    251U, 23U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 37U, 164U, 253U, 253U, 163U, 36U, 0U,
    0U, 0U, 0U, 0U, 0U, 33U, 158U, 252U, 254U, 169U, 41U, 0U, 0U, 0U, 0U, 0U, 0U,
    29U, 153U, 250U, MAX_uint8_T, 175U, 45U, 0U, 0U, 0U, 0U, 0U, 0U, 25U, 147U,
    249U, MAX_uint8_T, 181U, 51U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 48U, 238U,
    MAX_uint8_T, MAX_uint8_T, 112U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 26U,
    148U, 249U, MAX_uint8_T, 181U, 51U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    30U, 154U, 250U, MAX_uint8_T, 176U, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 33U, 159U, 252U, 254U, 171U, 43U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    38U, 165U, 253U, 253U, 165U, 38U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    42U, 171U, 254U, 252U, 23U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 47U,
    176U, 27U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 28U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 28U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 28U, 134U, 108U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 151U, MAX_uint8_T, 226U, 102U, 5U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 4U, 99U, 224U, MAX_uint8_T, 222U, 96U, 3U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 6U, 106U, 228U, MAX_uint8_T, 218U, 91U, 2U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 8U, 112U, 232U, MAX_uint8_T, 213U, 85U, 1U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 10U, 118U, 236U, MAX_uint8_T, 209U, 79U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 26U, 219U, MAX_uint8_T, MAX_uint8_T, 153U, 1U,
    0U, 0U, 0U, 0U, 0U, 0U, 10U, 117U, 235U, MAX_uint8_T, 209U, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 8U, 112U, 232U, MAX_uint8_T, 214U, 86U, 1U, 0U, 0U, 0U, 0U, 0U,
    6U, 107U, 229U, MAX_uint8_T, 218U, 92U, 2U, 0U, 0U, 0U, 0U, 0U, 5U, 102U,
    226U, MAX_uint8_T, 222U, 97U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 226U, 103U, 5U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 134U, 109U,
    7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 18U, 110U, 195U, 234U, 243U,
    214U, 149U, 35U, 0U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 246U, 61U, 136U, 138U, 53U, 15U, 13U,
    62U, 211U, MAX_uint8_T, 191U, 0U, 0U, 0U, 0U, 0U, 0U, 110U, MAX_uint8_T,
    219U, 0U, 0U, 0U, 0U, 0U, 0U, 192U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U,
    110U, MAX_uint8_T, 219U, 22U, 0U, 0U, 0U, 0U, 82U, 253U, 205U, 25U, 0U, 0U,
    0U, 0U, 54U, 247U, 196U, 12U, 0U, 0U, 0U, 0U, 0U, 208U, 251U, 26U, 0U, 0U,
    0U, 0U, 0U, 45U, MAX_uint8_T, 213U, 0U, 0U, 0U, 0U, 0U, 0U, 77U, MAX_uint8_T,
    204U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 80U, MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U, 80U,
    MAX_uint8_T, 204U, 0U, 0U, 0U, 0U, 0U, 0U, 80U, MAX_uint8_T, 204U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 70U, 155U, 212U, 240U, 245U, 217U, 152U, 44U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 65U, 208U, 194U, 100U, 36U, 10U, 14U, 54U,
    142U, 245U, 132U, 2U, 0U, 0U, 0U, 0U, 0U, 120U, 235U, 79U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 45U, 227U, 145U, 0U, 0U, 0U, 0U, 129U, 221U, 35U, 0U, 0U, 90U,
    206U, 249U, MAX_uint8_T, MAX_uint8_T, 192U, 0U, 47U, 250U, 68U, 0U, 0U, 75U,
    236U, 38U, 0U, 0U, 134U, 189U, 41U, 11U, 82U, MAX_uint8_T, 146U, 0U, 0U,
    152U, 183U, 0U, 6U, 222U, 96U, 0U, 0U, 85U, 219U, 11U, 0U, 0U, 60U,
    MAX_uint8_T, 99U, 0U, 0U, 71U, 247U, 1U, 96U, 214U, 1U, 0U, 6U, 223U, 94U,
    0U, 0U, 0U, 104U, MAX_uint8_T, 53U, 0U, 0U, 37U, MAX_uint8_T, 17U, 177U,
    128U, 0U, 0U, 88U, 250U, 13U, 0U, 0U, 1U, 204U, 253U, 9U, 0U, 0U, 40U,
    MAX_uint8_T, 7U, 227U, 76U, 0U, 0U, 171U, 211U, 0U, 0U, 0U, 86U, MAX_uint8_T,
    216U, 0U, 0U, 0U, 85U, 216U, 0U, 249U, 54U, 0U, 0U, 219U, 185U, 0U, 0U, 14U,
    209U, 210U, 169U, 0U, 0U, 0U, 180U, 128U, 0U, 236U, 69U, 0U, 0U, 240U, 181U,
    0U, 0U, 160U, 119U, 250U, 126U, 0U, 0U, 79U, 225U, 16U, 0U, 185U, 134U, 0U,
    0U, 209U, 228U, 21U, 134U, 171U, 52U, MAX_uint8_T, 146U, 13U, 98U, 222U, 47U,
    0U, 0U, 84U, 239U, 23U, 0U, 70U, 226U, 233U, 136U, 6U, 14U, 200U, 249U, 227U,
    149U, 24U, 0U, 0U, 0U, 0U, 173U, 204U, 25U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 8U, 160U, 236U, 125U, 47U, 11U, 15U, 55U, 153U,
    130U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 60U, 162U, 222U, 247U, 237U,
    201U, 124U, 27U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 183U,
    MAX_uint8_T, 229U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 253U,
    MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 128U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 2U, 226U, MAX_uint8_T, 150U, MAX_uint8_T, 251U, 24U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 74U, MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 108U, 0U, 159U, MAX_uint8_T, 218U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U, MAX_uint8_T,
    MAX_uint8_T, 62U, 0U, 0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 166U, 0U, 0U,
    0U, 217U, MAX_uint8_T, 161U, 0U, 0U, 0U, 0U, 0U, 1U, 219U, MAX_uint8_T, 67U,
    0U, 0U, 0U, 120U, MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T,
    223U, 1U, 0U, 0U, 0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 166U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 0U, 0U, 0U, 18U, 248U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 112U,
    MAX_uint8_T, 207U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U, MAX_uint8_T, 147U, 0U,
    0U, 211U, MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T,
    238U, 8U, 57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 254U,
    MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 184U, MAX_uint8_T, 190U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    251U, 229U, 174U, 64U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, 95U, 0U, 244U, MAX_uint8_T, 72U,
    8U, 33U, 106U, 242U, MAX_uint8_T, 233U, 2U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    0U, 100U, MAX_uint8_T, MAX_uint8_T, 20U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U,
    70U, MAX_uint8_T, 248U, 2U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 151U,
    MAX_uint8_T, 166U, 0U, 244U, MAX_uint8_T, 72U, 14U, 49U, 153U, MAX_uint8_T,
    217U, 27U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    253U, 142U, 18U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 213U, 98U, 0U, 0U, 244U, MAX_uint8_T, 72U, 18U,
    52U, 145U, 246U, MAX_uint8_T, 164U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U,
    53U, 248U, MAX_uint8_T, 87U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 180U,
    MAX_uint8_T, 160U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 200U, MAX_uint8_T,
    178U, 244U, MAX_uint8_T, 72U, 2U, 12U, 43U, 149U, MAX_uint8_T, MAX_uint8_T,
    124U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 216U, 15U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 245U, 209U, 130U, 14U, 0U, 0U, 0U, 0U, 6U, 98U,
    175U, 226U, 246U, 241U, 213U, 174U, 105U, 33U, 0U, 0U, 50U, 222U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 44U, 244U, MAX_uint8_T, 240U, 125U, 43U,
    9U, 9U, 40U, 89U, 150U, 214U, 1U, 209U, MAX_uint8_T, 232U, 39U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 73U, MAX_uint8_T, MAX_uint8_T, 82U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 147U, MAX_uint8_T, 226U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 196U, MAX_uint8_T, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 215U,
    MAX_uint8_T, 141U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 215U, MAX_uint8_T,
    140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 197U, MAX_uint8_T, 167U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 229U, 3U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 78U, MAX_uint8_T, MAX_uint8_T, 97U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 2U, 217U, MAX_uint8_T, 242U, 58U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 53U, 249U, MAX_uint8_T, 249U, 145U, 54U, 13U, 9U, 36U, 69U, 140U,
    217U, 0U, 0U, 61U, 230U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 0U, 0U, 0U,
    10U, 107U, 183U, 230U, 248U, 241U, 217U, 187U, 118U, 39U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U, 237U, 215U, 159U, 72U, 0U, 0U,
    0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 181U, 12U,
    0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 2U, 10U, 33U, 85U, 194U, MAX_uint8_T,
    MAX_uint8_T, 193U, 3U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 1U,
    143U, MAX_uint8_T, MAX_uint8_T, 109U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 2U, 204U, MAX_uint8_T, 220U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 97U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T,
    80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 38U, MAX_uint8_T, MAX_uint8_T, 72U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 14U, MAX_uint8_T, MAX_uint8_T,
    87U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 19U, MAX_uint8_T,
    MAX_uint8_T, 76U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 48U,
    MAX_uint8_T, MAX_uint8_T, 52U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 110U, MAX_uint8_T, 247U, 6U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U,
    0U, 0U, 4U, 214U, MAX_uint8_T, 173U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 142U, MAX_uint8_T, 253U, 54U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    5U, 25U, 80U, 188U, MAX_uint8_T, MAX_uint8_T, 126U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 114U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U, 234U, 198U, 130U, 27U, 0U, 0U,
    0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    240U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    220U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    100U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 240U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 224U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    224U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U,
    244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 99U, 177U, 227U,
    247U, 240U, 215U, 180U, 109U, 34U, 0U, 0U, 50U, 223U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 248U, 0U, 44U, 244U, MAX_uint8_T, 241U, 125U, 43U, 9U, 9U, 41U,
    89U, 151U, 214U, 1U, 209U, MAX_uint8_T, 232U, 39U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 73U, MAX_uint8_T, MAX_uint8_T, 81U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 147U, MAX_uint8_T, 225U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 196U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 215U, MAX_uint8_T,
    140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 216U, MAX_uint8_T, 140U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 197U, MAX_uint8_T, 167U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 64U, MAX_uint8_T, MAX_uint8_T, 151U, MAX_uint8_T, 228U, 2U, 0U,
    0U, 0U, 0U, 0U, 0U, 64U, MAX_uint8_T, MAX_uint8_T, 80U, MAX_uint8_T,
    MAX_uint8_T, 92U, 0U, 0U, 0U, 0U, 0U, 0U, 64U, MAX_uint8_T, MAX_uint8_T, 3U,
    219U, MAX_uint8_T, 240U, 54U, 0U, 0U, 0U, 0U, 0U, 64U, MAX_uint8_T,
    MAX_uint8_T, 0U, 56U, 249U, MAX_uint8_T, 248U, 146U, 58U, 15U, 5U, 27U, 117U,
    MAX_uint8_T, MAX_uint8_T, 0U, 0U, 63U, 231U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 0U, 0U, 0U, 9U, 105U, 180U, 228U, 247U, 245U, 223U, 192U, 137U,
    81U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T,
    MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U,
    MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U,
    0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U,
    0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T,
    80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U,
    244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    32U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T,
    MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U,
    MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U,
    0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T, 80U, 0U,
    0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U, MAX_uint8_T,
    80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, 32U,
    244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U,
    MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U,
    MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U,
    MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U,
    MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U, MAX_uint8_T, 76U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U,
    100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U,
    0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U,
    0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U,
    0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U,
    0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T,
    220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 219U, 0U, 0U, 0U, 0U,
    110U, MAX_uint8_T, 208U, 0U, 0U, 0U, 0U, 151U, MAX_uint8_T, 174U, 0U, 0U,
    10U, 78U, 243U, MAX_uint8_T, 95U, 252U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 191U, 4U, 252U, MAX_uint8_T, 247U, 211U, 124U, 7U,
    0U, 244U, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 6U, 198U, MAX_uint8_T, 118U, 0U,
    244U, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 157U, MAX_uint8_T, 165U, 0U, 0U,
    244U, MAX_uint8_T, 44U, 0U, 0U, 0U, 111U, MAX_uint8_T, 203U, 9U, 0U, 0U,
    244U, MAX_uint8_T, 44U, 0U, 0U, 68U, 252U, 231U, 28U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 35U, 238U, 248U, 57U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 13U, 213U, MAX_uint8_T, 96U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 45U, 178U, MAX_uint8_T, 143U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 174U, MAX_uint8_T, 216U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 125U, 253U, MAX_uint8_T, 103U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 116U, MAX_uint8_T, 252U, 75U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 153U, MAX_uint8_T, 244U, 51U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 4U, 185U, MAX_uint8_T, 231U, 31U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 0U, 14U, 212U, MAX_uint8_T, 214U, 16U, 0U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 31U, 232U, MAX_uint8_T, 192U, 6U, 0U, 244U,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 54U, 246U, MAX_uint8_T, 166U, 1U, 244U,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 84U, 254U, MAX_uint8_T, 135U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 120U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 120U, 244U, MAX_uint8_T, MAX_uint8_T, 88U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 23U, 251U, MAX_uint8_T, 232U, 244U, MAX_uint8_T, MAX_uint8_T, 179U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 112U, MAX_uint8_T, MAX_uint8_T, 232U, 244U,
    MAX_uint8_T, MAX_uint8_T, 250U, 19U, 0U, 0U, 0U, 0U, 0U, 0U, 205U,
    MAX_uint8_T, MAX_uint8_T, 232U, 244U, 252U, 212U, MAX_uint8_T, 105U, 0U, 0U,
    0U, 0U, 0U, 42U, MAX_uint8_T, 208U, MAX_uint8_T, 232U, 244U, 252U, 122U,
    MAX_uint8_T, 195U, 0U, 0U, 0U, 0U, 0U, 136U, MAX_uint8_T, 115U, MAX_uint8_T,
    232U, 244U, 252U, 32U, 254U, 254U, 31U, 0U, 0U, 0U, 2U, 227U, 224U, 53U,
    MAX_uint8_T, 232U, 244U, 252U, 0U, 197U, MAX_uint8_T, 121U, 0U, 0U, 0U, 66U,
    MAX_uint8_T, 132U, 52U, MAX_uint8_T, 232U, 244U, 252U, 0U, 107U, MAX_uint8_T,
    211U, 0U, 0U, 0U, 160U, MAX_uint8_T, 39U, 52U, MAX_uint8_T, 232U, 244U, 252U,
    0U, 20U, 251U, MAX_uint8_T, 46U, 0U, 10U, 242U, 202U, 0U, 52U, MAX_uint8_T,
    232U, 244U, 252U, 0U, 0U, 182U, MAX_uint8_T, 137U, 0U, 90U, MAX_uint8_T,
    108U, 0U, 52U, MAX_uint8_T, 232U, 244U, 252U, 0U, 0U, 91U, MAX_uint8_T, 226U,
    1U, 183U, 250U, 20U, 0U, 52U, MAX_uint8_T, 232U, 244U, 252U, 0U, 0U, 11U,
    245U, MAX_uint8_T, 86U, 252U, 178U, 0U, 0U, 52U, MAX_uint8_T, 232U, 244U,
    252U, 0U, 0U, 0U, 166U, MAX_uint8_T, 238U, MAX_uint8_T, 84U, 0U, 0U, 52U,
    MAX_uint8_T, 232U, 244U, 252U, 0U, 0U, 0U, 76U, MAX_uint8_T, MAX_uint8_T,
    239U, 7U, 0U, 0U, 52U, MAX_uint8_T, 232U, 244U, 252U, 0U, 0U, 0U, 5U, 236U,
    MAX_uint8_T, 154U, 0U, 0U, 0U, 52U, MAX_uint8_T, 232U, 244U, 252U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 52U, MAX_uint8_T, 232U, 244U, MAX_uint8_T,
    150U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, MAX_uint8_T,
    254U, 61U, 0U, 0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, MAX_uint8_T,
    MAX_uint8_T, 217U, 8U, 0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U,
    254U, 246U, MAX_uint8_T, 135U, 0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U,
    244U, 252U, 118U, MAX_uint8_T, 251U, 49U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T,
    52U, 244U, 252U, 3U, 204U, MAX_uint8_T, 206U, 4U, 0U, 0U, 0U, 188U,
    MAX_uint8_T, 52U, 244U, 252U, 0U, 46U, 250U, MAX_uint8_T, 120U, 0U, 0U, 0U,
    188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 132U, MAX_uint8_T, 247U, 38U, 0U,
    0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 7U, 214U, MAX_uint8_T, 194U,
    1U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 58U, 253U,
    MAX_uint8_T, 106U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U,
    146U, MAX_uint8_T, 242U, 29U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U,
    0U, 11U, 223U, MAX_uint8_T, 181U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U,
    0U, 0U, 0U, 70U, MAX_uint8_T, MAX_uint8_T, 245U, MAX_uint8_T, 52U, 244U,
    252U, 0U, 0U, 0U, 0U, 0U, 0U, 160U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    52U, 244U, 252U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 232U, MAX_uint8_T, MAX_uint8_T,
    52U, 244U, 252U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 83U, MAX_uint8_T, MAX_uint8_T,
    52U, 0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U, 13U, 0U, 0U,
    0U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U, 37U, 240U,
    MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T, 249U, 56U, 0U,
    0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U, 206U, MAX_uint8_T,
    222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U, MAX_uint8_T, 139U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T, 242U, 215U, MAX_uint8_T, 140U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U, MAX_uint8_T, 241U, 194U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T,
    221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T, 222U, 25U, 0U,
    0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U, 240U, MAX_uint8_T,
    228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U, 58U, 0U, 0U, 0U, 47U,
    224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U, 0U, 0U, 8U, 110U, 192U,
    235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 253U, 242U, 209U, 144U, 29U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    235U, 32U, 244U, MAX_uint8_T, 72U, 0U, 8U, 41U, 138U, MAX_uint8_T,
    MAX_uint8_T, 145U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 190U, MAX_uint8_T,
    190U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 185U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 21U, 235U, MAX_uint8_T, 134U, 244U,
    MAX_uint8_T, 72U, 8U, 34U, 104U, 222U, MAX_uint8_T, 243U, 29U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    236U, 66U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, 252U, 237U, 196U, 122U, 20U,
    0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 195U, 118U, 13U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 63U, 0U, 0U, 0U, 0U, 0U, 37U,
    240U, MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 93U, 221U, MAX_uint8_T, 249U,
    56U, 0U, 0U, 0U, 0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 17U,
    208U, MAX_uint8_T, 222U, 5U, 0U, 0U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 46U, 254U, MAX_uint8_T, 92U, 0U, 0U, 144U,
    MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 194U, MAX_uint8_T,
    170U, 0U, 0U, 194U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    136U, MAX_uint8_T, 221U, 0U, 0U, 215U, MAX_uint8_T, 139U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 112U, MAX_uint8_T, 241U, 0U, 0U, 215U, MAX_uint8_T, 140U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U, MAX_uint8_T, 245U, 0U, 0U, 193U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T,
    224U, 0U, 0U, 141U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    195U, MAX_uint8_T, 178U, 0U, 0U, 61U, MAX_uint8_T, MAX_uint8_T, 71U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 44U, 254U, MAX_uint8_T, 101U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 222U, 25U, 0U, 0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 226U, 9U,
    0U, 0U, 0U, 34U, 239U, MAX_uint8_T, 228U, 101U, 26U, 5U, 25U, 94U, 220U,
    MAX_uint8_T, 248U, 63U, 0U, 0U, 0U, 0U, 0U, 46U, 225U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    230U, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 9U, 113U, 196U, 237U, 252U, 238U,
    MAX_uint8_T, 254U, 137U, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 73U, 224U, MAX_uint8_T, 254U, 194U, 126U, 65U, 10U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 7U, 113U, 229U, MAX_uint8_T, MAX_uint8_T, 253U, 63U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 92U, 191U, 133U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 245U, 210U, 127U, 11U,
    0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 203U, 5U, 0U, 0U, 244U, MAX_uint8_T,
    72U, 1U, 18U, 58U, 176U, MAX_uint8_T, MAX_uint8_T, 93U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 3U, 227U, MAX_uint8_T, 142U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 199U, MAX_uint8_T, 129U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 33U, 249U, MAX_uint8_T, 72U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 4U, 31U, 98U, 226U, MAX_uint8_T, 191U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    172U, 12U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 160U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U,
    0U, 74U, MAX_uint8_T, 252U, 55U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U,
    0U, 164U, MAX_uint8_T, 217U, 10U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    20U, 235U, MAX_uint8_T, 149U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U,
    90U, MAX_uint8_T, 254U, 70U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U,
    181U, MAX_uint8_T, 228U, 17U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U,
    29U, 242U, MAX_uint8_T, 166U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U,
    107U, MAX_uint8_T, MAX_uint8_T, 87U, 0U, 8U, 123U, 212U, 247U, 235U, 199U,
    121U, 27U, 0U, 12U, 203U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 196U, 0U, 131U, MAX_uint8_T, 231U, 81U, 16U, 12U,
    62U, 138U, 168U, 0U, 202U, MAX_uint8_T, 101U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    196U, MAX_uint8_T, 137U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 123U, MAX_uint8_T, 251U,
    109U, 1U, 0U, 0U, 0U, 0U, 0U, 9U, 201U, MAX_uint8_T, MAX_uint8_T, 197U, 53U,
    0U, 0U, 0U, 0U, 0U, 10U, 153U, MAX_uint8_T, MAX_uint8_T, 254U, 164U, 24U, 0U,
    0U, 0U, 0U, 0U, 57U, 199U, MAX_uint8_T, MAX_uint8_T, 236U, 64U, 0U, 0U, 0U,
    0U, 0U, 0U, 94U, 237U, MAX_uint8_T, 245U, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 40U,
    244U, MAX_uint8_T, 142U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 163U, MAX_uint8_T, 182U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 182U, MAX_uint8_T, 162U, 202U, 144U, 70U, 31U,
    7U, 34U, 140U, MAX_uint8_T, MAX_uint8_T, 71U, 236U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 131U, 0U,
    36U, 121U, 194U, 232U, 250U, 227U, 168U, 61U, 0U, 0U, 208U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 188U, 208U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    188U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 0U, 0U,
    0U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U,
    0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U,
    0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 19U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 83U, 10U, MAX_uint8_T, MAX_uint8_T, 57U, 0U, 0U,
    0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 74U, 0U, 241U, MAX_uint8_T, 100U, 0U, 0U,
    0U, 0U, 0U, 0U, 209U, MAX_uint8_T, 53U, 0U, 185U, MAX_uint8_T, 199U, 1U, 0U,
    0U, 0U, 0U, 40U, 254U, 249U, 9U, 0U, 83U, MAX_uint8_T, MAX_uint8_T, 174U,
    49U, 6U, 11U, 70U, 216U, MAX_uint8_T, 164U, 0U, 0U, 0U, 155U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    222U, 24U, 0U, 0U, 0U, 0U, 82U, 181U, 232U, 251U, 243U, 208U, 132U, 18U, 0U,
    0U, 105U, MAX_uint8_T, 214U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 224U, 252U,
    26U, 14U, 244U, MAX_uint8_T, 63U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 71U,
    MAX_uint8_T, 180U, 0U, 0U, 156U, MAX_uint8_T, 167U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 171U, MAX_uint8_T, 81U, 0U, 0U, 54U, MAX_uint8_T, 249U, 21U, 0U, 0U, 0U,
    0U, 0U, 21U, 249U, 234U, 5U, 0U, 0U, 0U, 207U, MAX_uint8_T, 119U, 0U, 0U, 0U,
    0U, 0U, 116U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 105U, MAX_uint8_T, 221U, 1U,
    0U, 0U, 0U, 0U, 215U, MAX_uint8_T, 42U, 0U, 0U, 0U, 0U, 14U, 244U,
    MAX_uint8_T, 71U, 0U, 0U, 0U, 60U, MAX_uint8_T, 200U, 0U, 0U, 0U, 0U, 0U, 0U,
    156U, MAX_uint8_T, 175U, 0U, 0U, 0U, 161U, MAX_uint8_T, 101U, 0U, 0U, 0U, 0U,
    0U, 0U, 54U, MAX_uint8_T, 251U, 27U, 0U, 14U, 245U, 245U, 14U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 207U, MAX_uint8_T, 127U, 0U, 105U, MAX_uint8_T, 160U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 105U, MAX_uint8_T, 227U, 3U, 205U, MAX_uint8_T, 62U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 14U, 244U, MAX_uint8_T, 128U, MAX_uint8_T,
    219U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T, 254U,
    MAX_uint8_T, 121U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 54U, MAX_uint8_T,
    MAX_uint8_T, 252U, 26U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 181U, 0U, 0U, 0U, 0U, 0U, 0U, 220U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 175U, MAX_uint8_T, 184U, 0U, 0U, 0U, 0U, 0U, 48U, MAX_uint8_T,
    163U, 154U, MAX_uint8_T, 147U, 0U, 0U, 0U, 0U, 0U, 234U, MAX_uint8_T, 240U,
    2U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 92U, 89U, MAX_uint8_T, 213U, 0U, 0U,
    0U, 0U, 39U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 45U, 0U, 0U, 0U, 0U,
    192U, 254U, 23U, 23U, MAX_uint8_T, MAX_uint8_T, 23U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 249U, MAX_uint8_T, 103U, 0U, 0U, 0U, 13U, 250U, 206U, 0U, 0U,
    214U, MAX_uint8_T, 89U, 0U, 0U, 0U, 160U, MAX_uint8_T, 157U, MAX_uint8_T,
    162U, 0U, 0U, 0U, 79U, MAX_uint8_T, 134U, 0U, 0U, 148U, MAX_uint8_T, 155U,
    0U, 0U, 0U, 220U, 215U, 78U, MAX_uint8_T, 220U, 0U, 0U, 0U, 151U,
    MAX_uint8_T, 63U, 0U, 0U, 83U, MAX_uint8_T, 221U, 0U, 0U, 24U, MAX_uint8_T,
    154U, 20U, MAX_uint8_T, MAX_uint8_T, 23U, 0U, 0U, 222U, 243U, 5U, 0U, 0U,
    18U, 254U, MAX_uint8_T, 31U, 0U, 85U, MAX_uint8_T, 93U, 0U, 218U,
    MAX_uint8_T, 81U, 0U, 39U, MAX_uint8_T, 177U, 0U, 0U, 0U, 0U, 208U,
    MAX_uint8_T, 97U, 0U, 145U, MAX_uint8_T, 32U, 0U, 160U, MAX_uint8_T, 139U,
    0U, 110U, MAX_uint8_T, 105U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 163U, 0U,
    206U, 227U, 0U, 0U, 102U, MAX_uint8_T, 197U, 0U, 182U, MAX_uint8_T, 34U, 0U,
    0U, 0U, 0U, 77U, MAX_uint8_T, 228U, 13U, 252U, 166U, 0U, 0U, 44U,
    MAX_uint8_T, 248U, 15U, 245U, 219U, 0U, 0U, 0U, 0U, 0U, 14U, 252U,
    MAX_uint8_T, 110U, MAX_uint8_T, 105U, 0U, 0U, 1U, 239U, MAX_uint8_T, 128U,
    MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 0U, 0U, 202U, MAX_uint8_T, 228U,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 184U, MAX_uint8_T, 240U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 0U, 0U, 136U, MAX_uint8_T, MAX_uint8_T, 238U, 1U, 0U, 0U, 0U,
    126U, MAX_uint8_T, MAX_uint8_T, 249U, 12U, 0U, 0U, 0U, 0U, 0U, 0U, 71U,
    MAX_uint8_T, MAX_uint8_T, 178U, 0U, 0U, 0U, 0U, 68U, MAX_uint8_T,
    MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 10U, 250U, MAX_uint8_T, 118U,
    0U, 0U, 0U, 0U, 12U, 252U, MAX_uint8_T, 119U, 0U, 0U, 0U, 0U, 64U,
    MAX_uint8_T, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 102U, MAX_uint8_T,
    186U, 0U, 0U, 158U, MAX_uint8_T, 240U, 26U, 0U, 0U, 0U, 0U, 29U, 241U, 243U,
    31U, 0U, 0U, 18U, 234U, MAX_uint8_T, 173U, 0U, 0U, 0U, 0U, 185U, MAX_uint8_T,
    107U, 0U, 0U, 0U, 0U, 92U, MAX_uint8_T, MAX_uint8_T, 80U, 0U, 0U, 101U,
    MAX_uint8_T, 193U, 1U, 0U, 0U, 0U, 0U, 0U, 187U, MAX_uint8_T, 228U, 14U, 29U,
    241U, 246U, 37U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 246U, MAX_uint8_T, 149U, 185U,
    MAX_uint8_T, 115U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 121U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 200U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 5U, 210U,
    MAX_uint8_T, MAX_uint8_T, 46U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 9U, 219U,
    MAX_uint8_T, MAX_uint8_T, 118U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 142U,
    MAX_uint8_T, 236U, MAX_uint8_T, 245U, 34U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 57U,
    253U, 224U, 30U, 232U, MAX_uint8_T, 185U, 0U, 0U, 0U, 0U, 0U, 0U, 7U, 214U,
    MAX_uint8_T, 69U, 0U, 87U, MAX_uint8_T, MAX_uint8_T, 90U, 0U, 0U, 0U, 0U, 0U,
    135U, MAX_uint8_T, 157U, 0U, 0U, 0U, 179U, MAX_uint8_T, 233U, 17U, 0U, 0U,
    0U, 51U, 251U, 229U, 15U, 0U, 0U, 0U, 29U, 243U, MAX_uint8_T, 156U, 0U, 0U,
    5U, 209U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 109U, MAX_uint8_T, 254U, 62U,
    0U, 128U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 199U, MAX_uint8_T,
    215U, 7U, 135U, MAX_uint8_T, 243U, 25U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 233U,
    248U, 36U, 13U, 231U, MAX_uint8_T, 159U, 0U, 0U, 0U, 0U, 0U, 0U, 154U,
    MAX_uint8_T, 127U, 0U, 0U, 98U, MAX_uint8_T, 254U, 52U, 0U, 0U, 0U, 0U, 57U,
    254U, 218U, 7U, 0U, 0U, 2U, 205U, MAX_uint8_T, 196U, 0U, 0U, 0U, 4U, 209U,
    MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 62U, MAX_uint8_T, MAX_uint8_T, 88U, 0U, 0U,
    116U, MAX_uint8_T, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 171U, MAX_uint8_T, 226U, 9U,
    29U, 243U, 240U, 24U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, 248U, MAX_uint8_T, 126U,
    176U, MAX_uint8_T, 107U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T,
    250U, MAX_uint8_T, 203U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 13U, 231U,
    MAX_uint8_T, 253U, 51U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U,
    MAX_uint8_T, 195U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 68U, 116U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 4U, 199U, MAX_uint8_T, 220U,
    12U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 130U, MAX_uint8_T, 251U, 55U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 59U, 252U, MAX_uint8_T, 124U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    14U, 223U, MAX_uint8_T, 195U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 165U,
    MAX_uint8_T, 240U, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 91U, MAX_uint8_T,
    MAX_uint8_T, 90U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 32U, 241U, MAX_uint8_T, 164U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 3U, 196U, MAX_uint8_T, 223U, 14U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 126U, MAX_uint8_T, 252U, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U,
    251U, MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 13U, 221U, MAX_uint8_T,
    200U, 4U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 161U, MAX_uint8_T, 243U, 35U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 252U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 68U, 252U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    68U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 92U, 228U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 92U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U,
    0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U,
    228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U,
    248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U,
    0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, 248U, 0U,
    0U, 0U, 228U, 248U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    92U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 92U, 201U, 225U, 0U, 0U,
    0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 47U, 0U, 0U, 0U, 0U, 0U, 47U, MAX_uint8_T,
    124U, 0U, 0U, 0U, 0U, 0U, 0U, 225U, 201U, 0U, 0U, 0U, 0U, 0U, 0U, 149U, 254U,
    24U, 0U, 0U, 0U, 0U, 0U, 72U, MAX_uint8_T, 99U, 0U, 0U, 0U, 0U, 0U, 7U, 243U,
    176U, 0U, 0U, 0U, 0U, 0U, 0U, 174U, 245U, 8U, 0U, 0U, 0U, 0U, 0U, 97U,
    MAX_uint8_T, 74U, 0U, 0U, 0U, 0U, 0U, 22U, 253U, 151U, 0U, 0U, 0U, 0U, 0U,
    0U, 199U, 227U, 0U, 0U, 0U, 0U, 0U, 0U, 122U, MAX_uint8_T, 49U, 0U, 0U, 0U,
    0U, 0U, 45U, MAX_uint8_T, 126U, 0U, 0U, 0U, 0U, 0U, 0U, 223U, 203U, 0U, 0U,
    0U, 0U, 0U, 0U, 147U, 254U, 25U, 0U, 0U, 0U, 0U, 0U, 70U, MAX_uint8_T, 101U,
    0U, 0U, 0U, 0U, 0U, 6U, 242U, 178U, 0U, 0U, 0U, 0U, 0U, 0U, 172U, 246U, 9U,
    0U, 0U, 0U, 0U, 0U, 94U, MAX_uint8_T, 76U, 51U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 11U, 51U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 207U, MAX_uint8_T, 11U, 0U, 0U, 0U, 207U,
    MAX_uint8_T, 11U, 51U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    11U, 51U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 11U, 0U, 0U,
    0U, 0U, 0U, 70U, 54U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 194U, 178U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 64U, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 189U, 246U, 251U, 170U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    57U, MAX_uint8_T, 142U, 160U, 253U, 41U, 0U, 0U, 0U, 0U, 0U, 0U, 182U, 248U,
    25U, 38U, 253U, 163U, 0U, 0U, 0U, 0U, 0U, 50U, MAX_uint8_T, 149U, 0U, 0U,
    167U, 252U, 35U, 0U, 0U, 0U, 0U, 175U, 250U, 30U, 0U, 0U, 44U, 254U, 156U,
    0U, 0U, 0U, 45U, 254U, 155U, 0U, 0U, 0U, 0U, 175U, 250U, 30U, 0U, 0U, 169U,
    252U, 35U, 0U, 0U, 0U, 0U, 51U, MAX_uint8_T, 148U, 0U, 39U, 253U, 162U, 0U,
    0U, 0U, 0U, 0U, 0U, 183U, 247U, 25U, 162U, 253U, 40U, 0U, 0U, 0U, 0U, 0U, 0U,
    58U, MAX_uint8_T, 141U, 20U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    16U, 20U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 16U, 63U, 238U, 242U,
    46U, 0U, 0U, 0U, 40U, 223U, 227U, 26U, 0U, 0U, 0U, 23U, 203U, 205U, 11U, 0U,
    36U, 128U, 201U, 234U, 249U, 217U, 122U, 2U, 0U, 0U, 0U, 228U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 114U, 0U,
    0U, 0U, 187U, 114U, 45U, 11U, 30U, 178U, MAX_uint8_T, 205U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 57U, MAX_uint8_T, 237U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 240U, 0U, 0U, 0U, 4U, 94U, 176U, 223U, 246U, MAX_uint8_T,
    MAX_uint8_T, 240U, 0U, 0U, 17U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 254U, MAX_uint8_T, 240U, 0U, 0U, 151U, MAX_uint8_T, 229U, 107U,
    36U, 8U, 44U, MAX_uint8_T, 240U, 0U, 0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U,
    44U, MAX_uint8_T, 245U, 0U, 0U, 197U, MAX_uint8_T, 168U, 24U, 17U, 69U, 183U,
    MAX_uint8_T, MAX_uint8_T, 67U, 0U, 94U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U, 211U, MAX_uint8_T, MAX_uint8_T,
    128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U, 63U, 229U, 238U, 102U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U,
    30U, 164U, 233U, 246U, 199U, 79U, 0U, 0U, 228U, MAX_uint8_T, 88U, 229U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 97U, 0U,
    228U, MAX_uint8_T, 225U, 198U, 65U, 11U, 42U, 187U, MAX_uint8_T, 243U, 16U,
    228U, MAX_uint8_T, 166U, 3U, 0U, 0U, 0U, 17U, 245U, MAX_uint8_T, 97U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 186U, MAX_uint8_T, 146U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 160U, MAX_uint8_T, 163U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 163U, MAX_uint8_T, 154U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 199U, MAX_uint8_T, 119U, 228U,
    MAX_uint8_T, 93U, 0U, 0U, 0U, 0U, 35U, 253U, MAX_uint8_T, 50U, 228U,
    MAX_uint8_T, 252U, 142U, 37U, 6U, 56U, 211U, MAX_uint8_T, 191U, 0U, 228U,
    MAX_uint8_T, 132U, 254U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    230U, 33U, 0U, 228U, MAX_uint8_T, 9U, 72U, 200U, 247U, 232U, 158U, 27U, 0U,
    0U, 0U, 0U, 26U, 140U, 214U, 245U, 235U, 181U, 70U, 0U, 0U, 56U, 236U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    24U, 13U, 231U, MAX_uint8_T, 244U, 104U, 20U, 17U, 75U, 186U, 23U, 108U,
    MAX_uint8_T, MAX_uint8_T, 86U, 0U, 0U, 0U, 0U, 0U, 0U, 173U, MAX_uint8_T,
    214U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 200U, MAX_uint8_T, 168U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 197U, MAX_uint8_T, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 161U,
    MAX_uint8_T, 213U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T, MAX_uint8_T,
    86U, 0U, 0U, 0U, 0U, 0U, 0U, 3U, 205U, MAX_uint8_T, 244U, 107U, 21U, 13U,
    58U, 164U, 52U, 0U, 32U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, 0U, 17U, 136U, 219U, 248U,
    224U, 170U, 72U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U,
    0U, 0U, 42U, 173U, 237U, 244U, 187U, 50U, 100U, MAX_uint8_T, 188U, 0U, 58U,
    245U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 247U, 156U,
    MAX_uint8_T, 188U, 8U, 223U, MAX_uint8_T, 189U, 42U, 7U, 47U, 164U,
    MAX_uint8_T, MAX_uint8_T, 188U, 91U, MAX_uint8_T, 237U, 14U, 0U, 0U, 0U, 0U,
    131U, MAX_uint8_T, 188U, 159U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 195U, MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 204U, MAX_uint8_T, 123U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 187U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 139U, MAX_uint8_T, 223U, 3U, 0U, 0U, 0U, 13U, 196U,
    MAX_uint8_T, 188U, 48U, 254U, MAX_uint8_T, 160U, 32U, 12U, 80U, 218U, 226U,
    MAX_uint8_T, 188U, 0U, 141U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 209U, 110U, MAX_uint8_T, 188U, 0U, 1U, 106U, 211U,
    248U, 229U, 148U, 16U, 100U, MAX_uint8_T, 188U, 0U, 0U, 37U, 166U, 234U,
    247U, 207U, 91U, 0U, 0U, 0U, 58U, 242U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 105U, 0U, 11U, 227U, MAX_uint8_T,
    158U, 30U, 16U, 103U, 252U, 243U, 17U, 102U, MAX_uint8_T, 215U, 3U, 0U, 0U,
    0U, 171U, MAX_uint8_T, 96U, 170U, MAX_uint8_T, 142U, 0U, 0U, 0U, 0U, 119U,
    MAX_uint8_T, 148U, 199U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 173U, 197U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 182U, 162U, MAX_uint8_T, 133U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U,
    MAX_uint8_T, 228U, 22U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 203U, MAX_uint8_T, 214U,
    87U, 27U, 9U, 46U, 128U, 147U, 0U, 28U, 213U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 172U, 0U, 0U, 10U, 119U,
    206U, 245U, 238U, 197U, 114U, 22U, 0U, 0U, 0U, 30U, 166U, 226U, 254U,
    MAX_uint8_T, 188U, 0U, 0U, 6U, 217U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 188U, 0U, 0U, 77U, MAX_uint8_T, 232U, 42U, 2U, 0U, 0U, 0U, 0U,
    113U, MAX_uint8_T, 172U, 0U, 0U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U,
    0U, 0U, 0U, 36U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 140U, 0U, 36U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 140U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U,
    0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U,
    0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U,
    0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 0U, 38U, 167U, 235U, 245U, 188U, 49U,
    100U, MAX_uint8_T, 188U, 0U, 54U, 242U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 246U, 156U, MAX_uint8_T, 188U, 8U, 222U,
    MAX_uint8_T, 210U, 55U, 7U, 38U, 147U, 254U, MAX_uint8_T, 188U, 93U,
    MAX_uint8_T, 252U, 34U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 188U, 163U,
    MAX_uint8_T, 178U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 196U,
    MAX_uint8_T, 138U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 202U,
    MAX_uint8_T, 123U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 182U,
    MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 130U,
    MAX_uint8_T, 222U, 2U, 0U, 0U, 0U, 12U, 197U, MAX_uint8_T, 187U, 37U, 251U,
    MAX_uint8_T, 160U, 32U, 12U, 78U, 216U, 227U, MAX_uint8_T, 183U, 0U, 124U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 216U, 113U,
    MAX_uint8_T, 172U, 0U, 0U, 95U, 207U, 247U, 232U, 156U, 22U, 126U,
    MAX_uint8_T, 150U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 3U, 202U, MAX_uint8_T, 104U,
    0U, 150U, 140U, 56U, 18U, 14U, 54U, 176U, MAX_uint8_T, 245U, 22U, 0U, 200U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    252U, 93U, 0U, 0U, 36U, 135U, 205U, 238U, 248U, 225U, 165U, 53U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 10U, 134U, 224U,
    243U, 197U, 55U, 0U, 228U, MAX_uint8_T, 73U, 204U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 244U, 28U, 228U, MAX_uint8_T, 217U, 237U, 99U, 17U,
    37U, 224U, MAX_uint8_T, 124U, 228U, MAX_uint8_T, 237U, 40U, 0U, 0U, 0U, 139U,
    MAX_uint8_T, 161U, 228U, MAX_uint8_T, 89U, 0U, 0U, 0U, 0U, 117U, MAX_uint8_T,
    168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T,
    168U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 140U,
    MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U,
    140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U,
    0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U,
    0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U,
    0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U,
    0U, 0U, 0U, 0U, 140U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T,
    146U, 0U, 0U, 0U, 0U, 163U, MAX_uint8_T, 130U, 135U, 90U, 14U, 50U, 234U,
    MAX_uint8_T, 80U, 168U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    216U, 6U, 33U, 169U, 239U, 239U, 169U, 28U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 68U, 251U,
    232U, 30U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 41U, 239U, 248U, 56U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 20U, 221U, MAX_uint8_T, 90U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 7U, 195U, MAX_uint8_T, 129U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 163U, MAX_uint8_T, 169U, 1U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 179U, MAX_uint8_T, 235U, 10U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 116U, 246U, MAX_uint8_T, 134U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 78U, 252U, MAX_uint8_T, 106U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 102U, MAX_uint8_T, 253U, 81U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 131U, MAX_uint8_T, 247U, 58U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 158U, MAX_uint8_T, 237U, 40U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 4U, 181U, MAX_uint8_T, 224U, 25U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U,
    MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 228U, MAX_uint8_T, 60U, 34U, 165U,
    233U, 242U, 181U, 33U, 0U, 10U, 137U, 226U, 243U, 196U, 55U, 0U, 228U,
    MAX_uint8_T, 111U, 241U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    217U, 14U, 201U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U,
    22U, 228U, MAX_uint8_T, 251U, 222U, 78U, 12U, 71U, 253U, MAX_uint8_T, 212U,
    237U, 98U, 15U, 46U, 236U, MAX_uint8_T, 103U, 228U, MAX_uint8_T, 206U, 18U,
    0U, 0U, 0U, 203U, MAX_uint8_T, 228U, 35U, 0U, 0U, 0U, 162U, MAX_uint8_T,
    135U, 228U, MAX_uint8_T, 63U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 103U, 0U,
    0U, 0U, 0U, 148U, MAX_uint8_T, 140U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    188U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, 140U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U,
    148U, MAX_uint8_T, 140U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U,
    MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, 140U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U,
    148U, MAX_uint8_T, 140U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U,
    MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, 140U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U,
    148U, MAX_uint8_T, 140U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 188U,
    MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, 140U, 228U,
    MAX_uint8_T, 60U, 10U, 134U, 224U, 243U, 197U, 55U, 0U, 228U, MAX_uint8_T,
    73U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 244U, 28U,
    228U, MAX_uint8_T, 217U, 237U, 99U, 17U, 37U, 224U, MAX_uint8_T, 124U, 228U,
    MAX_uint8_T, 237U, 40U, 0U, 0U, 0U, 139U, MAX_uint8_T, 161U, 228U,
    MAX_uint8_T, 89U, 0U, 0U, 0U, 0U, 117U, MAX_uint8_T, 168U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T,
    168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 0U, 0U, 29U, 149U,
    221U, 248U, 239U, 192U, 92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U,
    0U, 11U, 229U, MAX_uint8_T, 208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T,
    116U, 0U, 104U, MAX_uint8_T, 243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T,
    233U, 2U, 170U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T,
    MAX_uint8_T, 46U, 199U, MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U,
    MAX_uint8_T, 75U, 200U, MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U,
    MAX_uint8_T, 73U, 170U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U,
    MAX_uint8_T, MAX_uint8_T, 44U, 103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U,
    132U, MAX_uint8_T, 231U, 2U, 11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U,
    124U, 251U, MAX_uint8_T, 113U, 0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U,
    31U, 151U, 224U, 250U, 239U, 191U, 90U, 1U, 0U, 0U, 228U, MAX_uint8_T, 60U,
    30U, 164U, 233U, 246U, 199U, 79U, 0U, 0U, 228U, MAX_uint8_T, 88U, 229U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 97U, 0U,
    228U, MAX_uint8_T, 225U, 198U, 65U, 11U, 42U, 187U, MAX_uint8_T, 243U, 16U,
    228U, MAX_uint8_T, 166U, 3U, 0U, 0U, 0U, 17U, 245U, MAX_uint8_T, 97U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 186U, MAX_uint8_T, 146U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 160U, MAX_uint8_T, 163U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 163U, MAX_uint8_T, 154U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 199U, MAX_uint8_T, 119U, 228U,
    MAX_uint8_T, 93U, 0U, 0U, 0U, 0U, 35U, 253U, MAX_uint8_T, 50U, 228U,
    MAX_uint8_T, 252U, 142U, 37U, 6U, 56U, 211U, MAX_uint8_T, 191U, 0U, 228U,
    MAX_uint8_T, 150U, 254U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    230U, 33U, 0U, 228U, MAX_uint8_T, 60U, 72U, 200U, 247U, 232U, 158U, 27U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 42U, 173U, 237U, 244U, 187U, 50U, 100U, MAX_uint8_T, 188U,
    0U, 58U, 245U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 247U,
    156U, MAX_uint8_T, 188U, 8U, 223U, MAX_uint8_T, 189U, 42U, 7U, 47U, 164U,
    MAX_uint8_T, MAX_uint8_T, 188U, 91U, MAX_uint8_T, 237U, 14U, 0U, 0U, 0U, 0U,
    131U, MAX_uint8_T, 188U, 159U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 195U, MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 204U, MAX_uint8_T, 123U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 187U, MAX_uint8_T, 148U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 139U, MAX_uint8_T, 223U, 3U, 0U, 0U, 0U, 13U, 196U,
    MAX_uint8_T, 188U, 48U, 254U, MAX_uint8_T, 160U, 32U, 12U, 80U, 218U, 226U,
    MAX_uint8_T, 188U, 0U, 141U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 209U, 110U, MAX_uint8_T, 188U, 0U, 1U, 106U, 211U,
    248U, 229U, 148U, 16U, 100U, MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 100U, MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U,
    MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T, 188U, 228U, MAX_uint8_T,
    60U, 39U, 178U, 240U, 144U, 228U, MAX_uint8_T, 92U, 234U, MAX_uint8_T,
    MAX_uint8_T, 144U, 228U, MAX_uint8_T, 227U, 204U, 62U, 7U, 0U, 228U,
    MAX_uint8_T, 210U, 12U, 0U, 0U, 0U, 228U, MAX_uint8_T, 73U, 0U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 10U, 122U, 213U,
    244U, 223U, 140U, 29U, 0U, 0U, 185U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 164U, 0U, 39U, MAX_uint8_T, 240U, 57U, 7U, 35U,
    118U, 139U, 0U, 50U, MAX_uint8_T, 234U, 12U, 0U, 0U, 0U, 0U, 0U, 7U, 224U,
    MAX_uint8_T, 213U, 84U, 4U, 0U, 0U, 0U, 0U, 48U, 227U, MAX_uint8_T,
    MAX_uint8_T, 226U, 105U, 2U, 0U, 0U, 0U, 10U, 114U, 222U, MAX_uint8_T,
    MAX_uint8_T, 177U, 1U, 0U, 0U, 0U, 0U, 3U, 104U, 252U, MAX_uint8_T, 79U, 0U,
    0U, 0U, 0U, 0U, 0U, 172U, MAX_uint8_T, 126U, 75U, 175U, 80U, 30U, 8U, 64U,
    231U, MAX_uint8_T, 93U, 80U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 200U, 6U, 5U, 82U, 176U, 228U, 244U,
    209U, 118U, 9U, 0U, 0U, 0U, 175U, 238U, 78U, 0U, 0U, 0U, 0U, 0U, 204U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 68U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 68U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 0U, 0U, 204U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 204U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U,
    0U, 204U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 204U, MAX_uint8_T, 80U, 0U,
    0U, 0U, 0U, 0U, 204U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 204U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 201U, MAX_uint8_T, 101U, 0U, 0U, 0U,
    0U, 0U, 169U, MAX_uint8_T, 212U, 41U, 1U, 0U, 0U, 0U, 73U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 80U, 0U, 0U, 0U, 91U, 210U, 248U,
    MAX_uint8_T, 80U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U,
    MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 29U, 0U, 0U, 0U, 0U, 181U,
    MAX_uint8_T, 136U, 1U, 251U, MAX_uint8_T, 50U, 0U, 0U, 0U, 114U, MAX_uint8_T,
    MAX_uint8_T, 136U, 0U, 217U, MAX_uint8_T, 158U, 14U, 34U, 150U, 254U, 218U,
    MAX_uint8_T, 136U, 0U, 112U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 124U, 152U, MAX_uint8_T, 136U, 0U, 2U, 117U, 219U,
    245U, 201U, 82U, 0U, 152U, MAX_uint8_T, 136U, 162U, MAX_uint8_T, 125U, 0U,
    0U, 0U, 0U, 0U, 3U, 229U, 251U, 23U, 69U, MAX_uint8_T, 217U, 0U, 0U, 0U, 0U,
    0U, 74U, MAX_uint8_T, 176U, 0U, 2U, 229U, MAX_uint8_T, 54U, 0U, 0U, 0U, 0U,
    172U, MAX_uint8_T, 77U, 0U, 0U, 140U, MAX_uint8_T, 146U, 0U, 0U, 0U, 19U,
    249U, 231U, 4U, 0U, 0U, 47U, MAX_uint8_T, 234U, 4U, 0U, 0U, 110U,
    MAX_uint8_T, 137U, 0U, 0U, 0U, 0U, 210U, MAX_uint8_T, 75U, 0U, 0U, 207U,
    MAX_uint8_T, 39U, 0U, 0U, 0U, 0U, 118U, MAX_uint8_T, 167U, 0U, 49U,
    MAX_uint8_T, 196U, 0U, 0U, 0U, 0U, 0U, 27U, 253U, 246U, 13U, 147U,
    MAX_uint8_T, 98U, 0U, 0U, 0U, 0U, 0U, 0U, 189U, MAX_uint8_T, 102U, 237U,
    243U, 12U, 0U, 0U, 0U, 0U, 0U, 0U, 96U, MAX_uint8_T, 240U, MAX_uint8_T, 157U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 13U, 246U, MAX_uint8_T, MAX_uint8_T, 59U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 166U, MAX_uint8_T, 216U, 0U, 0U, 0U, 0U, 0U, 189U,
    MAX_uint8_T, 86U, 0U, 0U, 0U, 0U, 162U, MAX_uint8_T, 196U, 0U, 0U, 0U, 0U,
    45U, MAX_uint8_T, 162U, 117U, MAX_uint8_T, 156U, 0U, 0U, 0U, 2U, 234U,
    MAX_uint8_T, 250U, 11U, 0U, 0U, 0U, 125U, MAX_uint8_T, 81U, 46U, MAX_uint8_T,
    226U, 0U, 0U, 0U, 56U, MAX_uint8_T, 246U, MAX_uint8_T, 72U, 0U, 0U, 0U, 205U,
    246U, 10U, 0U, 229U, MAX_uint8_T, 40U, 0U, 0U, 131U, MAX_uint8_T, 132U,
    MAX_uint8_T, 137U, 0U, 0U, 29U, MAX_uint8_T, 175U, 0U, 0U, 159U, MAX_uint8_T,
    110U, 0U, 0U, 206U, 217U, 27U, MAX_uint8_T, 203U, 0U, 0U, 109U, MAX_uint8_T,
    94U, 0U, 0U, 88U, MAX_uint8_T, 180U, 0U, 26U, 254U, 141U, 0U, 215U, 253U,
    16U, 0U, 190U, 251U, 18U, 0U, 0U, 19U, 253U, 244U, 6U, 100U, MAX_uint8_T,
    64U, 0U, 148U, MAX_uint8_T, 78U, 17U, 251U, 188U, 0U, 0U, 0U, 0U, 201U,
    MAX_uint8_T, 64U, 175U, 239U, 4U, 0U, 80U, MAX_uint8_T, 144U, 94U,
    MAX_uint8_T, 107U, 0U, 0U, 0U, 0U, 130U, MAX_uint8_T, 140U, 243U, 167U, 0U,
    0U, 16U, 252U, 210U, 174U, 254U, 28U, 0U, 0U, 0U, 0U, 59U, MAX_uint8_T, 245U,
    MAX_uint8_T, 91U, 0U, 0U, 0U, 201U, 254U, 246U, 201U, 0U, 0U, 0U, 0U, 0U, 3U,
    239U, MAX_uint8_T, 252U, 18U, 0U, 0U, 0U, 134U, MAX_uint8_T, MAX_uint8_T,
    120U, 0U, 0U, 0U, 0U, 0U, 0U, 172U, MAX_uint8_T, 194U, 0U, 0U, 0U, 0U, 66U,
    MAX_uint8_T, MAX_uint8_T, 40U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 226U, 18U,
    0U, 0U, 0U, 0U, 66U, 254U, 203U, 3U, 0U, 5U, 202U, MAX_uint8_T, 177U, 0U, 0U,
    0U, 12U, 223U, 249U, 43U, 0U, 0U, 0U, 33U, 240U, MAX_uint8_T, 111U, 0U, 0U,
    150U, MAX_uint8_T, 122U, 0U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T, 249U, 50U,
    65U, 254U, 204U, 4U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 218U, 222U,
    249U, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 8U, 216U, MAX_uint8_T, MAX_uint8_T,
    124U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 41U, 246U, MAX_uint8_T, MAX_uint8_T,
    103U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 208U, MAX_uint8_T, 152U, MAX_uint8_T,
    246U, 45U, 0U, 0U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 147U, 0U, 155U,
    MAX_uint8_T, 215U, 11U, 0U, 0U, 0U, 0U, 69U, 254U, 212U, 8U, 0U, 9U, 212U,
    MAX_uint8_T, 162U, 0U, 0U, 0U, 19U, 230U, 248U, 45U, 0U, 0U, 0U, 42U, 245U,
    MAX_uint8_T, 97U, 0U, 0U, 176U, MAX_uint8_T, 111U, 0U, 0U, 0U, 0U, 0U, 99U,
    MAX_uint8_T, 245U, 42U, 164U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 0U,
    214U, MAX_uint8_T, 41U, 68U, MAX_uint8_T, 244U, 12U, 0U, 0U, 0U, 0U, 59U,
    MAX_uint8_T, 195U, 0U, 2U, 225U, MAX_uint8_T, 96U, 0U, 0U, 0U, 0U, 160U,
    MAX_uint8_T, 93U, 0U, 0U, 131U, MAX_uint8_T, 191U, 0U, 0U, 0U, 15U, 245U,
    238U, 8U, 0U, 0U, 35U, MAX_uint8_T, 254U, 31U, 0U, 0U, 106U, MAX_uint8_T,
    145U, 0U, 0U, 0U, 0U, 195U, MAX_uint8_T, 124U, 0U, 0U, 207U, MAX_uint8_T,
    44U, 0U, 0U, 0U, 0U, 98U, MAX_uint8_T, 218U, 0U, 52U, MAX_uint8_T, 198U, 0U,
    0U, 0U, 0U, 0U, 12U, 244U, MAX_uint8_T, 58U, 153U, MAX_uint8_T, 96U, 0U, 0U,
    0U, 0U, 0U, 0U, 162U, MAX_uint8_T, 165U, 242U, 240U, 10U, 0U, 0U, 0U, 0U, 0U,
    0U, 65U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 149U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 1U, 223U, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    128U, MAX_uint8_T, 201U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 141U,
    MAX_uint8_T, 99U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 18U, 243U, 242U, 11U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 127U, MAX_uint8_T, 152U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 11U, 236U, MAX_uint8_T, 50U, 0U, 0U, 0U, 0U, 0U, 0U, 88U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 88U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 40U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 213U, MAX_uint8_T, 176U, 3U,
    0U, 0U, 0U, 0U, 0U, 9U, 197U, MAX_uint8_T, 196U, 9U, 0U, 0U, 0U, 0U, 0U, 3U,
    178U, MAX_uint8_T, 212U, 17U, 0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T,
    226U, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 238U, 42U, 0U, 0U, 0U,
    0U, 0U, 0U, 107U, MAX_uint8_T, 246U, 58U, 0U, 0U, 0U, 0U, 0U, 0U, 84U, 253U,
    252U, 77U, 0U, 0U, 0U, 0U, 0U, 0U, 63U, 248U, MAX_uint8_T, 99U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 172U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 172U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 2U, 95U, 198U, 168U, 0U,
    0U, 148U, MAX_uint8_T, MAX_uint8_T, 180U, 0U, 14U, 252U, 239U, 58U, 2U, 0U,
    26U, MAX_uint8_T, 190U, 0U, 0U, 0U, 2U, 250U, 227U, 0U, 0U, 0U, 0U, 209U,
    MAX_uint8_T, 8U, 0U, 0U, 0U, 171U, MAX_uint8_T, 28U, 0U, 0U, 0U, 157U,
    MAX_uint8_T, 16U, 0U, 0U, 40U, 228U, 191U, 0U, 0U, 188U, MAX_uint8_T, 232U,
    38U, 0U, 0U, 188U, MAX_uint8_T, 231U, 37U, 0U, 0U, 0U, 41U, 228U, 190U, 0U,
    0U, 0U, 0U, 157U, 254U, 15U, 0U, 0U, 0U, 171U, MAX_uint8_T, 28U, 0U, 0U, 0U,
    209U, MAX_uint8_T, 8U, 0U, 0U, 2U, 250U, 227U, 0U, 0U, 0U, 26U, MAX_uint8_T,
    190U, 0U, 0U, 0U, 14U, 252U, 238U, 58U, 2U, 0U, 0U, 148U, MAX_uint8_T,
    MAX_uint8_T, 180U, 0U, 0U, 2U, 96U, 198U, 168U, 176U, 232U, 176U, 232U, 176U,
    232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U,
    176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U,
    232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 129U, 206U, 118U, 7U,
    0U, 0U, 135U, MAX_uint8_T, MAX_uint8_T, 188U, 1U, 0U, 1U, 39U, 215U,
    MAX_uint8_T, 53U, 0U, 0U, 0U, 146U, MAX_uint8_T, 69U, 0U, 0U, 0U, 184U,
    MAX_uint8_T, 41U, 0U, 0U, 0U, 220U, 247U, 5U, 0U, 0U, 0U, 240U, 213U, 0U, 0U,
    0U, 0U, 228U, 201U, 0U, 0U, 0U, 0U, 148U, 248U, 62U, 2U, 0U, 0U, 17U, 210U,
    MAX_uint8_T, 231U, 0U, 0U, 16U, 209U, MAX_uint8_T, 231U, 0U, 0U, 147U, 248U,
    63U, 2U, 0U, 0U, 227U, 201U, 0U, 0U, 0U, 0U, 241U, 213U, 0U, 0U, 0U, 0U,
    220U, 247U, 5U, 0U, 0U, 0U, 184U, MAX_uint8_T, 41U, 0U, 0U, 0U, 146U,
    MAX_uint8_T, 69U, 0U, 0U, 40U, 216U, MAX_uint8_T, 52U, 0U, 135U, MAX_uint8_T,
    MAX_uint8_T, 188U, 1U, 0U, 129U, 207U, 118U, 7U, 0U, 0U, 0U, 104U, 231U,
    238U, 175U, 75U, 1U, 0U, 0U, 0U, 217U, 184U, 58U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 215U, 101U, 21U, 61U, 254U, 143U,
    167U, 248U, 50U, 26U, 120U, 227U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 49U, 207U, 196U, 0U, 0U, 0U, 4U, 85U, 180U, 238U,
    224U, 100U, 0U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U,
    MAX_uint8_T, 136U, 0U, 0U, 0U, 0U, 0U, 0U, 85U, MAX_uint8_T, 75U, 93U,
    MAX_uint8_T, 83U, 102U, MAX_uint8_T, 91U, 110U, MAX_uint8_T, 99U, 119U,
    MAX_uint8_T, 107U, 127U, MAX_uint8_T, 115U, 136U, MAX_uint8_T, 123U, 144U,
    MAX_uint8_T, 131U, 148U, MAX_uint8_T, 136U, 148U, MAX_uint8_T, 136U, 148U,
    MAX_uint8_T, 136U, 0U, 0U, 0U, 0U, 0U, 224U, 48U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 224U, 48U, 0U, 0U, 0U, 0U, 0U, 23U, 142U, 222U, MAX_uint8_T, 237U, 181U,
    82U, 3U, 0U, 51U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 60U, 10U, 225U, MAX_uint8_T, 204U, 66U, 227U, 68U,
    85U, 182U, 57U, 100U, MAX_uint8_T, 246U, 18U, 0U, 224U, 48U, 0U, 0U, 0U,
    168U, MAX_uint8_T, 175U, 0U, 0U, 224U, 48U, 0U, 0U, 0U, 196U, MAX_uint8_T,
    144U, 0U, 0U, 224U, 48U, 0U, 0U, 0U, 195U, MAX_uint8_T, 145U, 0U, 0U, 224U,
    48U, 0U, 0U, 0U, 160U, MAX_uint8_T, 188U, 0U, 0U, 224U, 48U, 0U, 0U, 0U, 86U,
    MAX_uint8_T, 254U, 51U, 0U, 224U, 48U, 0U, 0U, 0U, 4U, 210U, MAX_uint8_T,
    236U, 100U, 228U, 61U, 60U, 165U, 56U, 0U, 38U, 229U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U,
    20U, 143U, 225U, MAX_uint8_T, 242U, 195U, 91U, 3U, 0U, 0U, 0U, 0U, 0U, 224U,
    48U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, 48U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    59U, 187U, 242U, 234U, 155U, 23U, 0U, 0U, 0U, 59U, 250U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 144U, 0U, 0U, 0U, 189U, MAX_uint8_T,
    171U, 22U, 25U, 103U, 120U, 0U, 0U, 4U, 249U, MAX_uint8_T, 36U, 0U, 0U, 0U,
    0U, 0U, 0U, 20U, MAX_uint8_T, MAX_uint8_T, 9U, 0U, 0U, 0U, 0U, 0U, 0U, 24U,
    MAX_uint8_T, MAX_uint8_T, 8U, 0U, 0U, 0U, 0U, 0U, 0U, 24U, MAX_uint8_T,
    MAX_uint8_T, 8U, 0U, 0U, 0U, 0U, 4U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 88U, 0U, 0U, 4U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 88U, 0U, 0U,
    0U, 0U, 24U, MAX_uint8_T, MAX_uint8_T, 8U, 0U, 0U, 0U, 0U, 0U, 0U, 24U,
    MAX_uint8_T, 254U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 38U, MAX_uint8_T, 229U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 108U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 6U, 96U,
    245U, 180U, 9U, 0U, 0U, 0U, 0U, 0U, 88U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    188U, 88U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 188U, 84U, 129U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 2U, 153U, 58U, 179U, MAX_uint8_T, 140U, 59U, 182U, 235U, 231U, 172U,
    49U, 165U, MAX_uint8_T, 154U, 6U, 139U, 254U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 251U, 122U, 2U, 0U, 33U,
    251U, 236U, 96U, 20U, 25U, 110U, 244U, 241U, 18U, 0U, 0U, 142U, MAX_uint8_T,
    63U, 0U, 0U, 0U, 0U, 90U, MAX_uint8_T, 117U, 0U, 0U, 189U, 221U, 0U, 0U, 0U,
    0U, 0U, 3U, 245U, 164U, 0U, 0U, 189U, 220U, 0U, 0U, 0U, 0U, 0U, 3U, 246U,
    164U, 0U, 0U, 142U, MAX_uint8_T, 61U, 0U, 0U, 0U, 0U, 89U, MAX_uint8_T, 117U,
    0U, 0U, 33U, 251U, 235U, 92U, 18U, 25U, 109U, 243U, 242U, 18U, 0U, 5U, 138U,
    254U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 250U, 121U, 2U, 179U, MAX_uint8_T, 138U, 66U, 188U, 245U, 242U,
    178U, 54U, 163U, MAX_uint8_T, 154U, 84U, 129U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    2U, 153U, 59U, 4U, 217U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 0U, 8U, 223U,
    240U, 22U, 0U, 80U, MAX_uint8_T, 254U, 49U, 0U, 0U, 0U, 0U, 0U, 128U,
    MAX_uint8_T, 110U, 0U, 0U, 0U, 194U, MAX_uint8_T, 188U, 0U, 0U, 0U, 0U, 32U,
    246U, 209U, 3U, 0U, 0U, 0U, 54U, 254U, MAX_uint8_T, 74U, 0U, 0U, 0U, 175U,
    MAX_uint8_T, 61U, 0U, 0U, 0U, 0U, 0U, 168U, MAX_uint8_T, 212U, 3U, 0U, 70U,
    MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 0U, 33U, 249U, MAX_uint8_T, 101U, 5U,
    216U, 241U, 24U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 231U, 129U,
    MAX_uint8_T, 113U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 238U, MAX_uint8_T,
    MAX_uint8_T, 212U, 4U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 115U, MAX_uint8_T,
    MAX_uint8_T, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 88U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    32U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 88U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 32U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 232U, 176U, 232U, 176U,
    232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 176U, 232U, 176U, 232U, 176U, 232U, 176U, 232U, 176U,
    232U, 176U, 232U, 176U, 232U, 176U, 232U, 0U, 0U, 77U, 182U, 235U, 249U,
    219U, 166U, 71U, 2U, 0U, 141U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 55U, MAX_uint8_T,
    243U, 106U, 27U, 7U, 37U, 92U, 186U, 57U, 120U, MAX_uint8_T, 127U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 109U, MAX_uint8_T, 190U, 11U, 0U, 0U, 0U, 0U, 0U, 0U,
    21U, 233U, MAX_uint8_T, 229U, 118U, 11U, 0U, 0U, 0U, 0U, 0U, 67U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 235U, 112U, 5U, 0U, 0U, 4U, 206U,
    200U, 55U, 180U, MAX_uint8_T, MAX_uint8_T, 213U, 46U, 0U, 89U, MAX_uint8_T,
    99U, 0U, 0U, 55U, 204U, MAX_uint8_T, 240U, 31U, 138U, MAX_uint8_T, 97U, 0U,
    0U, 0U, 5U, 173U, MAX_uint8_T, 135U, 102U, MAX_uint8_T, 220U, 28U, 0U, 0U,
    0U, 61U, MAX_uint8_T, 160U, 7U, 210U, MAX_uint8_T, 236U, 112U, 8U, 0U, 90U,
    MAX_uint8_T, 99U, 0U, 17U, 175U, MAX_uint8_T, MAX_uint8_T, 232U, 117U, 205U,
    211U, 5U, 0U, 0U, 0U, 72U, 205U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 90U,
    0U, 0U, 0U, 0U, 0U, 0U, 81U, 216U, MAX_uint8_T, 249U, 57U, 0U, 0U, 0U, 0U,
    0U, 0U, 5U, 146U, MAX_uint8_T, 178U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 207U, 143U, 165U, 86U, 40U, 9U, 16U, 67U, 200U, MAX_uint8_T,
    156U, 160U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 219U, 25U, 16U, 94U, 175U, 221U, 248U, 228U, 196U,
    106U, 11U, 0U, 76U, MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T, 208U, 76U,
    MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T, 208U, 0U, 0U, 0U, 0U, 15U, 117U,
    195U, 234U, 249U, 229U, 181U, 98U, 5U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 88U, 235U,
    168U, 74U, 23U, 6U, 28U, 90U, 193U, 218U, 54U, 0U, 0U, 0U, 0U, 0U, 117U,
    235U, 63U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 100U, 241U, 73U, 0U, 0U, 0U, 80U,
    241U, 43U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 82U, 240U, 41U, 0U, 9U, 229U,
    95U, 0U, 0U, 4U, 118U, 214U, 248U, 218U, 123U, 15U, 0U, 0U, 145U, 189U, 0U,
    101U, 216U, 2U, 0U, 1U, 175U, 241U, 89U, 10U, 34U, 122U, 105U, 0U, 0U, 20U,
    246U, 52U, 177U, 133U, 0U, 0U, 91U, MAX_uint8_T, 92U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 182U, 128U, 217U, 86U, 0U, 0U, 180U, 233U, 3U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 135U, 168U, 234U, 69U, 0U, 0U, 219U, 194U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 117U, 185U, 218U, 86U, 0U, 0U, 219U, 191U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 134U, 167U, 177U, 135U, 0U, 0U, 179U, 230U, 1U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 187U, 128U, 101U, 218U, 2U, 0U, 84U, MAX_uint8_T,
    88U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 26U, 250U, 53U, 9U, 230U, 97U, 0U, 0U, 165U,
    240U, 93U, 13U, 24U, 106U, 102U, 0U, 0U, 152U, 192U, 0U, 0U, 82U, 242U, 45U,
    0U, 2U, 111U, 212U, 248U, 218U, 129U, 14U, 0U, 82U, 243U, 45U, 0U, 0U, 0U,
    121U, 236U, 62U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 92U, 242U, 79U, 0U, 0U, 0U, 0U,
    0U, 93U, 237U, 165U, 69U, 20U, 6U, 30U, 88U, 187U, 220U, 57U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 18U, 122U, 199U, 236U, 249U, 229U, 179U, 98U, 5U, 0U, 0U, 0U, 0U,
    0U, 14U, 130U, 217U, 246U, 207U, 67U, 0U, 0U, 0U, 100U, 111U, 26U, 25U, 213U,
    236U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T, 27U, 0U, 0U, 19U, 137U,
    218U, 246U, MAX_uint8_T, MAX_uint8_T, 32U, 0U, 0U, 201U, 240U, 75U, 11U,
    156U, MAX_uint8_T, 32U, 0U, 26U, MAX_uint8_T, 161U, 0U, 0U, 156U,
    MAX_uint8_T, 32U, 0U, 6U, 243U, 203U, 16U, 68U, 227U, MAX_uint8_T, 64U, 0U,
    0U, 80U, 224U, 242U, 157U, 60U, 229U, 235U, 21U, 0U, 0U, 0U, 34U, 200U, 45U,
    0U, 9U, 184U, 88U, 0U, 0U, 27U, 223U, 206U, 11U, 6U, 183U, 239U, 41U, 0U,
    21U, 215U, 229U, 27U, 3U, 171U, 251U, 67U, 0U, 15U, 206U, 245U, 50U, 1U,
    158U, MAX_uint8_T, 101U, 0U, 0U, 148U, MAX_uint8_T, 134U, 0U, 84U,
    MAX_uint8_T, 194U, 0U, 0U, 0U, 15U, 206U, 245U, 50U, 1U, 158U, MAX_uint8_T,
    101U, 0U, 0U, 0U, 21U, 215U, 229U, 27U, 3U, 171U, 251U, 67U, 0U, 0U, 0U, 27U,
    223U, 206U, 11U, 6U, 183U, 239U, 40U, 0U, 0U, 0U, 35U, 201U, 45U, 0U, 9U,
    185U, 88U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 28U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 124U, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 124U, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 28U, 104U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 32U, 104U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 32U, 0U, 0U, 68U, 190U, 244U, 242U,
    183U, 56U, 0U, 0U, 0U, 105U, 230U, 89U, 13U, 17U, 101U, 236U, 85U, 0U, 44U,
    239U, 40U, 248U, 254U, 225U, 85U, 57U, 240U, 28U, 149U, 138U, 0U, 248U, 30U,
    124U, 213U, 0U, 160U, 128U, 197U, 75U, 0U, 248U, 31U, 136U, 187U, 0U, 96U,
    176U, 197U, 75U, 0U, 248U, MAX_uint8_T, 234U, 36U, 0U, 96U, 176U, 148U, 139U,
    0U, 248U, 58U, 241U, 45U, 0U, 159U, 128U, 43U, 239U, 40U, 248U, 28U, 121U,
    191U, 54U, 241U, 29U, 0U, 106U, 231U, 87U, 12U, 17U, 100U, 236U, 88U, 0U, 0U,
    0U, 71U, 194U, 245U, 241U, 182U, 57U, 0U, 0U, 20U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 16U, 20U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 16U, 0U,
    32U, 176U, 240U, 221U, 113U, 1U, 12U, 220U, 157U, 17U, 58U, 233U, 116U, 78U,
    249U, 8U, 0U, 0U, 122U, 217U, 79U, 249U, 8U, 0U, 0U, 122U, 217U, 12U, 221U,
    154U, 16U, 56U, 232U, 118U, 0U, 34U, 179U, 241U, 221U, 116U, 1U, 0U, 0U, 0U,
    0U, 0U, 12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 156U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 0U, 12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 12U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U,
    MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 156U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 28U, 1U, 92U, 204U, 244U,
    216U, 99U, 0U, 38U, 158U, 43U, 11U, 114U, MAX_uint8_T, 77U, 0U, 0U, 0U, 0U,
    15U, MAX_uint8_T, 155U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T, 140U, 0U, 0U, 0U,
    23U, 228U, 252U, 43U, 0U, 0U, 17U, 207U, MAX_uint8_T, 125U, 0U, 0U, 5U, 194U,
    MAX_uint8_T, 156U, 0U, 0U, 0U, 142U, MAX_uint8_T, 165U, 2U, 0U, 0U, 38U,
    251U, 198U, 5U, 0U, 0U, 0U, 104U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 160U, 2U, 107U, 216U, 246U, 216U, 100U, 0U, 41U,
    141U, 30U, 17U, 169U, MAX_uint8_T, 36U, 0U, 0U, 0U, 0U, 100U, MAX_uint8_T,
    53U, 0U, 0U, 10U, 58U, 214U, 173U, 1U, 0U, 108U, MAX_uint8_T, MAX_uint8_T,
    195U, 28U, 0U, 0U, 0U, 10U, 57U, 204U, 236U, 32U, 0U, 0U, 0U, 0U, 53U,
    MAX_uint8_T, 128U, 0U, 0U, 0U, 0U, 39U, MAX_uint8_T, 129U, 69U, 134U, 29U,
    26U, 178U, 250U, 49U, 6U, 122U, 222U, 242U, 198U, 71U, 0U, 0U, 0U, 154U,
    MAX_uint8_T, 172U, 8U, 0U, 119U, MAX_uint8_T, 142U, 2U, 0U, 83U, 251U, 109U,
    0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 130U, MAX_uint8_T,
    168U, 228U, MAX_uint8_T, 86U, 0U, 0U, 0U, 49U, 245U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 203U, 35U, 14U, 96U, 240U, 236U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 248U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 124U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 105U, 214U, 240U, 159U, 15U, 116U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    66U, 182U, 233U, 251U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    16U, 52U, 251U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 64U,
    MAX_uint8_T, 16U, 143U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 167U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 145U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 64U,
    MAX_uint8_T, 16U, 67U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 153U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 91U, 194U,
    243U, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T,
    40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U,
    MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U, MAX_uint8_T,
    16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U,
    0U, 0U, 44U, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T,
    40U, 64U, MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U,
    MAX_uint8_T, 16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U, MAX_uint8_T,
    16U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 40U, 64U, MAX_uint8_T, 16U, 216U,
    MAX_uint8_T, 204U, 216U, MAX_uint8_T, 204U, 216U, MAX_uint8_T, 204U, 0U,
    138U, 113U, 0U, 0U, 22U, 244U, 236U, 103U, 0U, 1U, 22U, 158U, 253U, 25U, 0U,
    2U, 117U, 253U, 24U, 132U, MAX_uint8_T, 235U, 105U, 0U, 27U, 95U, 164U, 188U,
    0U, 0U, 203U, 168U, 226U, 212U, 0U, 0U, 0U, 0U, 196U, 212U, 0U, 0U, 0U, 0U,
    196U, 212U, 0U, 0U, 0U, 0U, 196U, 212U, 0U, 0U, 0U, 0U, 196U, 212U, 0U, 0U,
    0U, 0U, 196U, 212U, 0U, 0U, 0U, 0U, 196U, 212U, 0U, 0U, 0U, 0U, 196U, 212U,
    0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 244U, 0U,
    31U, 170U, 238U, 247U, 201U, 72U, 0U, 16U, 226U, 219U, 44U, 20U, 161U, 253U,
    69U, 112U, MAX_uint8_T, 101U, 0U, 0U, 18U, 251U, 195U, 162U, MAX_uint8_T,
    59U, 0U, 0U, 0U, 228U, 246U, 162U, MAX_uint8_T, 59U, 0U, 0U, 0U, 229U, 245U,
    112U, MAX_uint8_T, 101U, 0U, 0U, 20U, 252U, 195U, 17U, 228U, 219U, 43U, 20U,
    164U, 254U, 71U, 0U, 34U, 174U, 241U, 247U, 201U, 74U, 0U, 9U, 186U, 86U, 0U,
    0U, 137U, 143U, 0U, 0U, 0U, 0U, 0U, 145U, 250U, 74U, 0U, 83U, 254U, 129U, 0U,
    0U, 0U, 0U, 3U, 180U, 246U, 62U, 0U, 121U, MAX_uint8_T, 116U, 0U, 0U, 0U, 0U,
    12U, 209U, 242U, 52U, 0U, 160U, MAX_uint8_T, 102U, 0U, 0U, 0U, 0U, 58U,
    MAX_uint8_T, 217U, 2U, 12U, 241U, 251U, 32U, 0U, 0U, 12U, 208U, 242U, 52U,
    0U, 160U, MAX_uint8_T, 103U, 0U, 0U, 3U, 180U, 246U, 63U, 0U, 121U,
    MAX_uint8_T, 116U, 0U, 0U, 0U, 145U, 250U, 74U, 0U, 83U, 254U, 129U, 0U, 0U,
    0U, 9U, 186U, 86U, 0U, 0U, 137U, 144U, 0U, 0U, 0U, 0U, 1U, 47U, 116U, 185U,
    122U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 242U, 94U, 0U, 0U, 50U, 212U, 158U,
    MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 0U, 0U, 5U, 202U, 163U, 0U, 0U, 0U, 0U,
    0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 0U, 0U, 140U, 219U, 13U, 0U, 0U,
    0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 0U, 72U, 248U, 52U, 0U,
    0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 24U, 233U, 115U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U, 1U, 186U,
    183U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U,
    120U, 231U, 22U, 0U, 0U, 156U, MAX_uint8_T, 64U, 0U, 0U, 0U, 20U,
    MAX_uint8_T, 132U, 0U, 0U, 55U, 249U, 69U, 0U, 0U, 83U, 253U, MAX_uint8_T,
    64U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 15U, 222U, 136U, 0U, 0U, 29U,
    237U, 133U, MAX_uint8_T, 64U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 168U,
    200U, 5U, 0U, 2U, 192U, 149U, 56U, MAX_uint8_T, 64U, 0U, 0U, 0U, 0U, 0U, 0U,
    100U, 241U, 33U, 0U, 0U, 124U, 213U, 9U, 56U, MAX_uint8_T, 64U, 0U, 0U, 0U,
    0U, 0U, 41U, 245U, 88U, 0U, 0U, 55U, 244U, 47U, 0U, 56U, MAX_uint8_T, 64U,
    0U, 0U, 0U, 0U, 8U, 209U, 157U, 0U, 0U, 0U, 151U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 144U, 0U, 0U, 0U, 149U,
    215U, 11U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T, 64U, 0U, 0U, 0U,
    80U, 247U, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T, 64U, 0U,
    0U, 28U, 237U, 109U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T,
    64U, 0U, 1U, 47U, 116U, 185U, 122U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 158U, 207U,
    7U, 0U, 0U, 50U, 212U, 158U, MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 0U, 0U, 88U,
    244U, 39U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U, 0U, 0U,
    34U, 241U, 96U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 0U, 0U,
    0U, 5U, 201U, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U,
    0U, 0U, 0U, 138U, 221U, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T,
    132U, 0U, 0U, 0U, 70U, 248U, 54U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U,
    MAX_uint8_T, 132U, 0U, 0U, 23U, 232U, 117U, 4U, 106U, 210U, 245U, 209U, 81U,
    0U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 1U, 185U, 185U, 1U, 59U, 144U, 37U,
    12U, 139U, 252U, 53U, 0U, 0U, 20U, MAX_uint8_T, 132U, 0U, 118U, 232U, 23U,
    0U, 0U, 0U, 0U, 0U, 43U, MAX_uint8_T, 127U, 0U, 0U, 20U, MAX_uint8_T, 132U,
    54U, 249U, 71U, 0U, 0U, 0U, 0U, 0U, 0U, 118U, MAX_uint8_T, 109U, 0U, 0U, 0U,
    0U, 14U, 221U, 138U, 0U, 0U, 0U, 0U, 0U, 0U, 50U, 247U, 236U, 18U, 0U, 0U,
    0U, 0U, 166U, 202U, 5U, 0U, 0U, 0U, 0U, 0U, 31U, 230U, 254U, 79U, 0U, 0U, 0U,
    0U, 98U, 242U, 35U, 0U, 0U, 0U, 0U, 0U, 11U, 211U, MAX_uint8_T, 119U, 0U, 0U,
    0U, 0U, 40U, 244U, 90U, 0U, 0U, 0U, 0U, 0U, 0U, 160U, MAX_uint8_T, 150U, 0U,
    0U, 0U, 0U, 7U, 208U, 159U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T, 185U,
    3U, 0U, 0U, 0U, 0U, 147U, 217U, 11U, 0U, 0U, 0U, 0U, 0U, 0U, 128U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 136U, 52U,
    189U, 243U, 233U, 160U, 12U, 0U, 0U, 0U, 0U, 0U, 0U, 24U, 233U, 109U, 0U,
    151U, 58U, 10U, 89U, MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 186U, 178U,
    0U, 0U, 0U, 0U, 0U, 9U, 254U, 149U, 0U, 0U, 0U, 0U, 0U, 120U, 228U, 19U, 0U,
    0U, 0U, 3U, 32U, 153U, 231U, 39U, 0U, 0U, 0U, 0U, 55U, 248U, 64U, 0U, 0U, 0U,
    16U, MAX_uint8_T, MAX_uint8_T, 239U, 78U, 0U, 0U, 0U, 0U, 15U, 222U, 129U,
    0U, 0U, 0U, 0U, 0U, 3U, 32U, 144U, MAX_uint8_T, 109U, 0U, 0U, 0U, 168U, 195U,
    3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 216U, 224U, 0U, 0U, 100U, 238U, 29U, 0U,
    156U, MAX_uint8_T, 64U, 0U, 0U, 0U, 0U, 0U, 203U, 225U, 0U, 41U, 245U, 81U,
    0U, 83U, 253U, MAX_uint8_T, 64U, 0U, 172U, 56U, 12U, 103U, MAX_uint8_T, 139U,
    8U, 209U, 149U, 0U, 29U, 237U, 133U, MAX_uint8_T, 64U, 0U, 68U, 197U, 245U,
    221U, 129U, 6U, 149U, 210U, 8U, 2U, 192U, 149U, 56U, MAX_uint8_T, 64U, 0U,
    0U, 0U, 0U, 0U, 0U, 80U, 245U, 42U, 0U, 124U, 213U, 9U, 56U, MAX_uint8_T,
    64U, 0U, 0U, 0U, 0U, 0U, 29U, 237U, 100U, 0U, 55U, 244U, 47U, 0U, 56U,
    MAX_uint8_T, 64U, 0U, 0U, 0U, 0U, 3U, 194U, 169U, 0U, 0U, 151U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 144U, 0U,
    0U, 0U, 129U, 223U, 15U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T, 64U, 0U,
    0U, 0U, 62U, 248U, 56U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T, 64U,
    0U, 0U, 18U, 227U, 121U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 56U, MAX_uint8_T,
    64U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U,
    132U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 156U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 152U, 0U, 0U, 0U, 0U, 0U, 0U, 141U,
    MAX_uint8_T, 120U, 0U, 0U, 0U, 0U, 0U, 1U, 203U, 250U, 34U, 0U, 0U, 0U, 0U,
    0U, 135U, MAX_uint8_T, 121U, 0U, 0U, 0U, 0U, 3U, 152U, MAX_uint8_T, 155U, 0U,
    0U, 0U, 0U, 1U, 167U, MAX_uint8_T, 183U, 3U, 0U, 0U, 0U, 0U, 89U,
    MAX_uint8_T, 245U, 23U, 0U, 0U, 0U, 0U, 0U, 144U, MAX_uint8_T, 186U, 0U, 0U,
    0U, 0U, 0U, 0U, 117U, MAX_uint8_T, 243U, 94U, 20U, 8U, 41U, 107U, 185U, 17U,
    219U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 228U, 0U, 16U, 120U, 206U, 237U, 243U, 208U, 139U, 39U, 0U, 0U,
    0U, 0U, 80U, 245U, 232U, 32U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    54U, 233U, 213U, 15U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 34U,
    216U, 188U, 5U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 183U, MAX_uint8_T, 229U, 3U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 253U, MAX_uint8_T, MAX_uint8_T, 76U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 226U, MAX_uint8_T,
    150U, MAX_uint8_T, 251U, 24U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 74U,
    MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 174U, MAX_uint8_T, 108U, 0U, 159U, MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U, MAX_uint8_T, MAX_uint8_T, 62U, 0U, 0U,
    0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 166U, 0U, 0U, 0U, 217U, MAX_uint8_T, 161U,
    0U, 0U, 0U, 0U, 0U, 1U, 219U, MAX_uint8_T, 67U, 0U, 0U, 0U, 120U,
    MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T, 223U, 1U, 0U, 0U,
    0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 166U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 204U, 0U, 0U, 0U, 18U, 248U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 112U, MAX_uint8_T, 207U,
    0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U, MAX_uint8_T, 147U, 0U, 0U, 211U,
    MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 238U, 8U,
    57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 254U,
    MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 10U, 203U, 254U,
    122U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 176U, 249U, 90U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 142U, 239U, 63U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 183U, MAX_uint8_T, 229U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    29U, 253U, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 2U, 226U, MAX_uint8_T, 150U, MAX_uint8_T, 251U, 24U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 74U, MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 108U, 0U, 159U,
    MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U,
    MAX_uint8_T, MAX_uint8_T, 62U, 0U, 0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T,
    166U, 0U, 0U, 0U, 217U, MAX_uint8_T, 161U, 0U, 0U, 0U, 0U, 0U, 1U, 219U,
    MAX_uint8_T, 67U, 0U, 0U, 0U, 120U, MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U,
    65U, MAX_uint8_T, 223U, 1U, 0U, 0U, 0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U,
    0U, 0U, 166U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 0U,
    0U, 0U, 18U, 248U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    47U, 0U, 0U, 112U, MAX_uint8_T, 207U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U,
    MAX_uint8_T, 147U, 0U, 0U, 211U, MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 150U, MAX_uint8_T, 238U, 8U, 57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 40U, 254U, MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 0U, 27U,
    227U, MAX_uint8_T, 247U, 58U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 12U, 207U,
    246U, 123U, 229U, 235U, 35U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 3U, 181U, 223U, 49U,
    0U, 24U, 196U, 217U, 19U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 183U, MAX_uint8_T, 229U, 3U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 253U, MAX_uint8_T, MAX_uint8_T, 76U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 226U, MAX_uint8_T,
    150U, MAX_uint8_T, 251U, 24U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 74U,
    MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 174U, MAX_uint8_T, 108U, 0U, 159U, MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U, MAX_uint8_T, MAX_uint8_T, 62U, 0U, 0U,
    0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 166U, 0U, 0U, 0U, 217U, MAX_uint8_T, 161U,
    0U, 0U, 0U, 0U, 0U, 1U, 219U, MAX_uint8_T, 67U, 0U, 0U, 0U, 120U,
    MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T, 223U, 1U, 0U, 0U,
    0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 166U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 204U, 0U, 0U, 0U, 18U, 248U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 112U, MAX_uint8_T, 207U,
    0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U, MAX_uint8_T, 147U, 0U, 0U, 211U,
    MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 238U, 8U,
    57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 254U,
    MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 59U, 227U, 237U, 153U, 35U,
    108U, MAX_uint8_T, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 195U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 244U, 133U, 27U, 137U, 231U, 234U, 77U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    183U, MAX_uint8_T, 229U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U,
    253U, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 2U, 226U, MAX_uint8_T, 150U, MAX_uint8_T, 251U, 24U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 74U, MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 108U, 0U, 159U, MAX_uint8_T,
    218U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U, MAX_uint8_T,
    MAX_uint8_T, 62U, 0U, 0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 166U, 0U, 0U,
    0U, 217U, MAX_uint8_T, 161U, 0U, 0U, 0U, 0U, 0U, 1U, 219U, MAX_uint8_T, 67U,
    0U, 0U, 0U, 120U, MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T,
    223U, 1U, 0U, 0U, 0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 166U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 0U, 0U, 0U, 18U, 248U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 112U,
    MAX_uint8_T, 207U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U, MAX_uint8_T, 147U, 0U,
    0U, 211U, MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T,
    238U, 8U, 57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 254U,
    MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 96U, 0U, 60U,
    MAX_uint8_T, 160U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 124U, MAX_uint8_T, 96U,
    0U, 60U, MAX_uint8_T, 160U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 183U, MAX_uint8_T, 229U,
    3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 253U, MAX_uint8_T,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 226U,
    MAX_uint8_T, 150U, MAX_uint8_T, 251U, 24U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    74U, MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 174U, MAX_uint8_T, 108U, 0U, 159U, MAX_uint8_T, 218U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U, MAX_uint8_T, MAX_uint8_T, 62U, 0U,
    0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T, 166U, 0U, 0U, 0U, 217U, MAX_uint8_T,
    161U, 0U, 0U, 0U, 0U, 0U, 1U, 219U, MAX_uint8_T, 67U, 0U, 0U, 0U, 120U,
    MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T, 223U, 1U, 0U, 0U,
    0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U, 0U, 0U, 166U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 204U, 0U, 0U, 0U, 18U, 248U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 112U, MAX_uint8_T, 207U,
    0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U, MAX_uint8_T, 147U, 0U, 0U, 211U,
    MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 238U, 8U,
    57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 254U,
    MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 0U, 17U, 174U, 242U, 196U, 37U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 151U, 142U, 12U, 97U, 202U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 204U, 36U, 0U, 0U, 237U, 3U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 151U, 142U, 12U, 98U, 203U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 17U, 175U, 243U, 197U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 183U, MAX_uint8_T, 229U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    29U, 253U, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 2U, 226U, MAX_uint8_T, 150U, MAX_uint8_T, 251U, 24U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 74U, MAX_uint8_T, 207U, 13U, 244U, MAX_uint8_T, 119U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 108U, 0U, 159U,
    MAX_uint8_T, 218U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 23U, 251U, 248U, 17U, 0U, 61U,
    MAX_uint8_T, MAX_uint8_T, 62U, 0U, 0U, 0U, 0U, 0U, 0U, 120U, MAX_uint8_T,
    166U, 0U, 0U, 0U, 217U, MAX_uint8_T, 161U, 0U, 0U, 0U, 0U, 0U, 1U, 219U,
    MAX_uint8_T, 67U, 0U, 0U, 0U, 120U, MAX_uint8_T, 245U, 15U, 0U, 0U, 0U, 0U,
    65U, MAX_uint8_T, 223U, 1U, 0U, 0U, 0U, 25U, 252U, MAX_uint8_T, 104U, 0U, 0U,
    0U, 0U, 166U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 0U,
    0U, 0U, 18U, 248U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    47U, 0U, 0U, 112U, MAX_uint8_T, 207U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 244U,
    MAX_uint8_T, 147U, 0U, 0U, 211U, MAX_uint8_T, 95U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 150U, MAX_uint8_T, 238U, 8U, 57U, MAX_uint8_T, 232U, 7U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 40U, 254U, MAX_uint8_T, 90U, 158U, MAX_uint8_T, 127U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 190U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 6U, 216U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 236U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 125U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 236U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 247U, 244U, 252U, MAX_uint8_T, 76U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 184U, MAX_uint8_T, 107U,
    248U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    87U, MAX_uint8_T, 193U, 1U, 248U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 14U, 229U, 246U, 36U, 0U, 248U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 147U, MAX_uint8_T, 113U, 0U, 0U,
    248U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U, 50U, 253U, 198U, 2U, 0U, 0U, 248U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    220U, 0U, 0U, 0U, 0U, 0U, 2U, 203U, 248U, 40U, 0U, 0U, 0U, 248U, MAX_uint8_T,
    76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 108U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 24U, 240U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, MAX_uint8_T, 132U, 0U, 0U, 0U,
    0U, 0U, 248U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 69U,
    MAX_uint8_T, 215U, 7U, 0U, 0U, 0U, 0U, 0U, 248U, MAX_uint8_T, 76U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 8U, 219U, 253U, 58U, 0U, 0U, 0U, 0U, 0U, 0U, 248U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 108U, 129U, MAX_uint8_T, 146U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 248U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 108U, 0U, 0U, 0U, 6U,
    98U, 175U, 226U, 246U, 241U, 213U, 174U, 105U, 33U, 0U, 0U, 50U, 222U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 44U, 244U, MAX_uint8_T, 240U, 125U, 43U,
    9U, 9U, 40U, 89U, 150U, 214U, 1U, 209U, MAX_uint8_T, 232U, 39U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 73U, MAX_uint8_T, MAX_uint8_T, 82U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 147U, MAX_uint8_T, 226U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 196U, MAX_uint8_T, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 215U,
    MAX_uint8_T, 141U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 215U, MAX_uint8_T,
    140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 197U, MAX_uint8_T, 167U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 150U, MAX_uint8_T, 229U, 3U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 78U, MAX_uint8_T, MAX_uint8_T, 97U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 2U, 217U, MAX_uint8_T, 242U, 58U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 53U, 249U, MAX_uint8_T, 249U, 145U, 54U, 13U, 9U, 36U, 69U, 140U,
    217U, 0U, 0U, 61U, 230U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 0U, 0U, 0U,
    10U, 107U, 183U, 230U, 248U, 241U, 217U, 187U, 118U, 39U, 0U, 0U, 0U, 0U, 0U,
    0U, 15U, 216U, 19U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 127U, 253U, 197U,
    29U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 55U, 236U, 163U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 16U, 219U, 161U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    248U, 252U, 197U, 30U, 0U, 0U, 0U, 0U, 74U, 243U, 236U, 36U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 49U, 230U, 218U, 19U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 30U, 212U,
    194U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 240U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 21U, 221U, 251U, 98U, 0U, 0U, 0U, 0U, 0U,
    8U, 197U, 241U, 69U, 0U, 0U, 0U, 0U, 0U, 1U, 168U, 228U, 46U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 0U,
    244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 240U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    220U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 100U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 0U,
    0U, 27U, 227U, MAX_uint8_T, 247U, 58U, 0U, 0U, 0U, 0U, 12U, 207U, 246U, 123U,
    229U, 235U, 35U, 0U, 0U, 3U, 181U, 223U, 49U, 0U, 24U, 196U, 217U, 19U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 0U,
    244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 240U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    220U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 100U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 0U,
    84U, MAX_uint8_T, 136U, 0U, 20U, MAX_uint8_T, 200U, 0U, 0U, 0U, 84U,
    MAX_uint8_T, 136U, 0U, 20U, MAX_uint8_T, 200U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    240U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 220U, 0U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    220U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    100U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 8U, 169U, MAX_uint8_T, 156U, 0U,
    0U, 0U, 1U, 139U, MAX_uint8_T, 121U, 0U, 0U, 0U, 0U, 106U, 251U, 87U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 73U, 252U, 223U, 41U, 0U, 47U, 242U, 204U, 23U, 0U,
    26U, 227U, 179U, 11U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U,
    0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U,
    244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 110U, MAX_uint8_T, MAX_uint8_T, 188U, 5U,
    0U, 0U, 78U, 253U, 199U, 144U, MAX_uint8_T, 158U, 0U, 51U, 245U, 154U, 6U,
    0U, 88U, 245U, 125U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 228U, 248U, 0U, 0U, 164U, MAX_uint8_T, 56U, 228U,
    248U, 0U, 0U, 164U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U,
    0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U,
    0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U,
    244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U,
    0U, 244U, MAX_uint8_T, 76U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U, 237U, 215U, 159U, 72U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 181U, 12U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 2U, 10U, 33U, 85U, 194U,
    MAX_uint8_T, MAX_uint8_T, 193U, 3U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U,
    0U, 0U, 0U, 0U, 0U, 1U, 143U, MAX_uint8_T, MAX_uint8_T, 109U, 0U, 0U, 0U, 0U,
    244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 204U, MAX_uint8_T, 220U,
    0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 97U,
    MAX_uint8_T, MAX_uint8_T, 32U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 38U, MAX_uint8_T, MAX_uint8_T, 72U, 84U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    228U, 0U, 0U, 0U, 0U, 14U, MAX_uint8_T, MAX_uint8_T, 87U, 84U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    228U, 0U, 0U, 0U, 0U, 19U, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 48U, MAX_uint8_T, MAX_uint8_T,
    52U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 110U,
    MAX_uint8_T, 247U, 6U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U, 0U, 0U, 0U, 0U,
    0U, 0U, 4U, 214U, MAX_uint8_T, 173U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 80U,
    0U, 0U, 0U, 0U, 0U, 0U, 142U, MAX_uint8_T, 253U, 54U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 80U, 0U, 0U, 5U, 25U, 79U, 187U, MAX_uint8_T, MAX_uint8_T, 126U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 114U, 0U, 0U, 0U,
    0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 252U,
    234U, 198U, 130U, 27U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 89U, 236U, 229U, 134U,
    24U, 147U, 230U, 0U, 0U, 0U, 0U, 0U, 2U, 233U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 180U, 0U, 0U, 0U, 0U, 0U, 28U,
    MAX_uint8_T, 94U, 39U, 156U, 239U, 223U, 49U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 150U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 188U, MAX_uint8_T, 52U, 244U, MAX_uint8_T, 254U, 61U, 0U, 0U, 0U, 0U,
    0U, 0U, 188U, MAX_uint8_T, 52U, 244U, MAX_uint8_T, MAX_uint8_T, 217U, 8U, 0U,
    0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, 254U, 246U, MAX_uint8_T, 135U,
    0U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 118U, MAX_uint8_T,
    251U, 49U, 0U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 3U, 204U,
    MAX_uint8_T, 206U, 4U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U, 0U,
    46U, 250U, MAX_uint8_T, 120U, 0U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U, 252U,
    0U, 0U, 132U, MAX_uint8_T, 247U, 38U, 0U, 0U, 188U, MAX_uint8_T, 52U, 244U,
    252U, 0U, 0U, 7U, 214U, MAX_uint8_T, 194U, 1U, 0U, 188U, MAX_uint8_T, 52U,
    244U, 252U, 0U, 0U, 0U, 58U, 253U, MAX_uint8_T, 106U, 0U, 188U, MAX_uint8_T,
    52U, 244U, 252U, 0U, 0U, 0U, 0U, 146U, MAX_uint8_T, 242U, 29U, 188U,
    MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U, 11U, 223U, MAX_uint8_T, 181U,
    188U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U, 0U, 70U, MAX_uint8_T,
    MAX_uint8_T, 245U, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U, 0U, 0U,
    160U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U,
    0U, 0U, 17U, 232U, MAX_uint8_T, MAX_uint8_T, 52U, 244U, 252U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 83U, MAX_uint8_T, MAX_uint8_T, 52U, 0U, 0U, 0U, 0U, 89U, 248U,
    227U, 26U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 62U, 238U, 205U,
    11U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 40U, 222U, 178U, 2U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U, 13U, 0U, 0U, 0U,
    0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U, 37U, 240U,
    MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T, 249U, 56U, 0U,
    0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U, 206U, MAX_uint8_T,
    222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U, MAX_uint8_T, 139U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T, 242U, 215U, MAX_uint8_T, 140U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U, MAX_uint8_T, 241U, 194U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T,
    221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T, 222U, 25U, 0U,
    0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U, 240U, MAX_uint8_T,
    228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U, 58U, 0U, 0U, 0U, 47U,
    224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U, 0U, 0U, 8U, 110U, 192U,
    235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    14U, 211U, 253U, 111U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 4U, 185U,
    246U, 81U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 154U, 234U, 56U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U, 13U, 0U, 0U,
    0U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U, 37U, 240U,
    MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T, 249U, 56U, 0U,
    0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U, 206U, MAX_uint8_T,
    222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U, MAX_uint8_T, 139U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T, 242U, 215U, MAX_uint8_T, 140U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U, MAX_uint8_T, 241U, 194U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T,
    221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T, 222U, 25U, 0U,
    0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U, 240U, MAX_uint8_T,
    228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U, 58U, 0U, 0U, 0U, 47U,
    224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U, 0U, 0U, 8U, 110U, 192U,
    235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 33U, 233U,
    MAX_uint8_T, 244U, 50U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 215U, 243U,
    122U, 234U, 230U, 29U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 6U, 191U, 218U, 42U, 0U,
    29U, 203U, 210U, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U,
    13U, 0U, 0U, 0U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U,
    37U, 240U, MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T,
    249U, 56U, 0U, 0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U,
    206U, MAX_uint8_T, 222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U,
    MAX_uint8_T, 139U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T,
    242U, 215U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U,
    MAX_uint8_T, 241U, 194U, MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 137U, MAX_uint8_T, 221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 195U, MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T,
    222U, 25U, 0U, 0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U,
    240U, MAX_uint8_T, 228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U,
    58U, 0U, 0U, 0U, 47U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U,
    0U, 0U, 8U, 110U, 192U, 235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 59U, 227U, 237U, 153U, 35U, 108U, MAX_uint8_T, 14U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 195U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 133U, 27U, 137U,
    231U, 234U, 77U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U,
    13U, 0U, 0U, 0U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U,
    37U, 240U, MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T,
    249U, 56U, 0U, 0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U,
    206U, MAX_uint8_T, 222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U,
    MAX_uint8_T, 139U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T,
    242U, 215U, MAX_uint8_T, 140U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U,
    MAX_uint8_T, 241U, 194U, MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 137U, MAX_uint8_T, 221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 195U, MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T,
    222U, 25U, 0U, 0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U,
    240U, MAX_uint8_T, 228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U,
    58U, 0U, 0U, 0U, 47U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U,
    0U, 0U, 8U, 110U, 192U, 235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 128U, MAX_uint8_T, 92U, 0U, 64U, MAX_uint8_T, 156U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 92U, 0U, 64U, MAX_uint8_T, 156U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 7U, 106U, 188U, 233U, 250U, 235U, 194U, 117U, 13U, 0U, 0U, 0U, 0U,
    0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 233U, 62U, 0U, 0U, 0U, 37U, 240U,
    MAX_uint8_T, 230U, 105U, 30U, 6U, 24U, 92U, 219U, MAX_uint8_T, 249U, 56U, 0U,
    0U, 200U, MAX_uint8_T, 222U, 26U, 0U, 0U, 0U, 0U, 0U, 16U, 206U, MAX_uint8_T,
    222U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 69U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    44U, 254U, MAX_uint8_T, 94U, 144U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 193U, MAX_uint8_T, 171U, 195U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 222U, 215U, MAX_uint8_T, 139U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 111U, MAX_uint8_T, 242U, 215U, MAX_uint8_T, 140U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 113U, MAX_uint8_T, 241U, 194U,
    MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T,
    221U, 142U, MAX_uint8_T, 222U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 170U, 64U, MAX_uint8_T, MAX_uint8_T, 71U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 45U, 254U, MAX_uint8_T, 94U, 0U, 199U, MAX_uint8_T, 222U, 25U, 0U,
    0U, 0U, 0U, 0U, 15U, 206U, MAX_uint8_T, 224U, 5U, 0U, 37U, 240U, MAX_uint8_T,
    228U, 101U, 26U, 5U, 25U, 94U, 220U, MAX_uint8_T, 250U, 58U, 0U, 0U, 0U, 47U,
    224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 234U, 65U, 0U, 0U, 0U, 0U, 0U, 8U, 110U, 192U,
    235U, 250U, 235U, 193U, 116U, 13U, 0U, 0U, 0U, 9U, 180U, 33U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 131U, 91U, 0U, 99U, MAX_uint8_T, 225U, 33U, 0U, 0U, 0U, 0U,
    0U, 0U, 131U, MAX_uint8_T, 222U, 3U, 0U, 144U, MAX_uint8_T, 225U, 33U, 0U,
    0U, 0U, 0U, 131U, MAX_uint8_T, 229U, 41U, 0U, 0U, 0U, 133U, MAX_uint8_T,
    225U, 33U, 0U, 0U, 131U, MAX_uint8_T, 224U, 35U, 0U, 0U, 0U, 0U, 0U, 123U,
    MAX_uint8_T, 225U, 33U, 131U, MAX_uint8_T, 218U, 29U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 112U, MAX_uint8_T, 241U, MAX_uint8_T, 211U, 24U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 167U, MAX_uint8_T, 252U, 38U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    111U, MAX_uint8_T, 241U, MAX_uint8_T, 211U, 23U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    122U, MAX_uint8_T, 225U, 34U, 132U, MAX_uint8_T, 218U, 29U, 0U, 0U, 0U, 0U,
    0U, 132U, MAX_uint8_T, 225U, 34U, 0U, 0U, 132U, MAX_uint8_T, 224U, 35U, 0U,
    0U, 0U, 144U, MAX_uint8_T, 225U, 34U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T,
    229U, 41U, 0U, 99U, MAX_uint8_T, 225U, 34U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 222U, 3U, 9U, 181U, 34U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    91U, 0U, 0U, 0U, 0U, 7U, 106U, 188U, 233U, 250U, 238U, 195U, 117U, 15U, 97U,
    MAX_uint8_T, 117U, 0U, 0U, 46U, 222U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 235U, 248U, 168U, 0U, 0U,
    37U, 240U, MAX_uint8_T, 228U, 102U, 29U, 5U, 24U, 92U, 219U, MAX_uint8_T,
    MAX_uint8_T, 68U, 0U, 0U, 200U, MAX_uint8_T, 220U, 25U, 0U, 0U, 0U, 0U, 0U,
    146U, MAX_uint8_T, MAX_uint8_T, 221U, 5U, 66U, MAX_uint8_T, MAX_uint8_T, 67U,
    0U, 0U, 0U, 0U, 0U, 105U, MAX_uint8_T, 155U, MAX_uint8_T, MAX_uint8_T, 91U,
    144U, MAX_uint8_T, 220U, 0U, 0U, 0U, 0U, 0U, 70U, 251U, 153U, 0U, 203U,
    MAX_uint8_T, 169U, 195U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 43U, 241U, 187U,
    4U, 0U, 145U, MAX_uint8_T, 221U, 215U, MAX_uint8_T, 139U, 0U, 0U, 0U, 22U,
    223U, 214U, 15U, 0U, 0U, 118U, MAX_uint8_T, 242U, 215U, MAX_uint8_T, 145U,
    0U, 0U, 8U, 198U, 234U, 33U, 0U, 0U, 0U, 113U, MAX_uint8_T, 242U, 194U,
    MAX_uint8_T, 173U, 0U, 0U, 167U, 248U, 58U, 0U, 0U, 0U, 0U, 137U,
    MAX_uint8_T, 221U, 142U, MAX_uint8_T, 229U, 3U, 130U, MAX_uint8_T, 89U, 0U,
    0U, 0U, 0U, 0U, 195U, MAX_uint8_T, 170U, 63U, MAX_uint8_T, MAX_uint8_T, 159U,
    MAX_uint8_T, 126U, 0U, 0U, 0U, 0U, 0U, 46U, MAX_uint8_T, MAX_uint8_T, 93U,
    0U, 198U, MAX_uint8_T, MAX_uint8_T, 168U, 0U, 0U, 0U, 0U, 0U, 16U, 208U,
    MAX_uint8_T, 222U, 5U, 0U, 43U, MAX_uint8_T, MAX_uint8_T, 229U, 102U, 27U,
    4U, 23U, 92U, 220U, MAX_uint8_T, 249U, 55U, 0U, 0U, 147U, 254U, 230U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 234U, 63U, 0U, 0U, 94U, MAX_uint8_T, 125U, 10U, 110U, 191U,
    237U, 251U, 237U, 197U, 119U, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 51U, 231U, 248U,
    60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 31U, 213U, 236U, 36U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 16U, 190U, 218U, 19U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, MAX_uint8_T,
    44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U,
    0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U,
    0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 19U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    83U, 10U, MAX_uint8_T, MAX_uint8_T, 57U, 0U, 0U, 0U, 0U, 0U, 0U, 174U,
    MAX_uint8_T, 74U, 0U, 241U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 0U, 0U, 209U,
    MAX_uint8_T, 53U, 0U, 185U, MAX_uint8_T, 199U, 1U, 0U, 0U, 0U, 0U, 40U, 254U,
    249U, 9U, 0U, 83U, MAX_uint8_T, MAX_uint8_T, 174U, 49U, 6U, 11U, 70U, 216U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 155U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 222U, 24U, 0U, 0U, 0U,
    0U, 82U, 181U, 232U, 251U, 243U, 208U, 132U, 18U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 1U, 168U, MAX_uint8_T, 159U, 5U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 135U,
    MAX_uint8_T, 128U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 98U, 250U, 96U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U,
    0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U,
    0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 19U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 83U, 10U, MAX_uint8_T, MAX_uint8_T, 57U, 0U, 0U, 0U, 0U,
    0U, 0U, 174U, MAX_uint8_T, 74U, 0U, 241U, MAX_uint8_T, 100U, 0U, 0U, 0U, 0U,
    0U, 0U, 209U, MAX_uint8_T, 53U, 0U, 185U, MAX_uint8_T, 199U, 1U, 0U, 0U, 0U,
    0U, 40U, 254U, 249U, 9U, 0U, 83U, MAX_uint8_T, MAX_uint8_T, 174U, 49U, 6U,
    11U, 70U, 216U, MAX_uint8_T, 164U, 0U, 0U, 0U, 155U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    222U, 24U, 0U, 0U, 0U, 0U, 82U, 181U, 232U, 251U, 243U, 208U, 132U, 18U, 0U,
    0U, 0U, 0U, 0U, 0U, 9U, 201U, MAX_uint8_T, MAX_uint8_T, 94U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 2U, 173U, 254U, 137U, 208U, 250U, 65U, 0U, 0U, 0U, 0U, 0U, 0U,
    141U, 240U, 76U, 0U, 10U, 166U, 239U, 41U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U,
    0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U,
    0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T,
    44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U,
    0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 19U, MAX_uint8_T, MAX_uint8_T, 44U,
    0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 83U, 10U, MAX_uint8_T,
    MAX_uint8_T, 57U, 0U, 0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 74U, 0U, 241U,
    MAX_uint8_T, 100U, 0U, 0U, 0U, 0U, 0U, 0U, 209U, MAX_uint8_T, 53U, 0U, 185U,
    MAX_uint8_T, 199U, 1U, 0U, 0U, 0U, 0U, 40U, 254U, 249U, 9U, 0U, 83U,
    MAX_uint8_T, MAX_uint8_T, 174U, 49U, 6U, 11U, 70U, 216U, MAX_uint8_T, 164U,
    0U, 0U, 0U, 155U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 222U, 24U, 0U, 0U, 0U, 0U, 82U, 181U,
    232U, 251U, 243U, 208U, 132U, 18U, 0U, 0U, 0U, 0U, 0U, 108U, MAX_uint8_T,
    112U, 0U, 44U, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 108U, MAX_uint8_T,
    112U, 0U, 44U, MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U,
    0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U,
    0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U,
    0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T,
    44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 84U, 20U,
    MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T,
    84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 0U, 0U,
    164U, MAX_uint8_T, 84U, 20U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U,
    0U, 0U, 164U, MAX_uint8_T, 84U, 19U, MAX_uint8_T, MAX_uint8_T, 44U, 0U, 0U,
    0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 83U, 10U, MAX_uint8_T, MAX_uint8_T, 57U,
    0U, 0U, 0U, 0U, 0U, 0U, 174U, MAX_uint8_T, 74U, 0U, 241U, MAX_uint8_T, 100U,
    0U, 0U, 0U, 0U, 0U, 0U, 209U, MAX_uint8_T, 53U, 0U, 185U, MAX_uint8_T, 199U,
    1U, 0U, 0U, 0U, 0U, 40U, 254U, 249U, 9U, 0U, 83U, MAX_uint8_T, MAX_uint8_T,
    174U, 49U, 6U, 11U, 70U, 216U, MAX_uint8_T, 164U, 0U, 0U, 0U, 155U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 222U, 24U, 0U, 0U, 0U, 0U, 82U, 181U, 232U, 251U, 243U, 208U,
    132U, 18U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 143U, MAX_uint8_T, 181U, 11U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 106U, MAX_uint8_T, 152U, 3U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 73U, 251U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 243U, 25U, 0U,
    0U, 0U, 0U, 0U, 0U, 17U, 233U, 248U, 36U, 13U, 231U, MAX_uint8_T, 159U, 0U,
    0U, 0U, 0U, 0U, 0U, 154U, MAX_uint8_T, 127U, 0U, 0U, 98U, MAX_uint8_T, 254U,
    52U, 0U, 0U, 0U, 0U, 57U, 254U, 218U, 7U, 0U, 0U, 2U, 205U, MAX_uint8_T,
    196U, 0U, 0U, 0U, 4U, 209U, MAX_uint8_T, 68U, 0U, 0U, 0U, 0U, 62U,
    MAX_uint8_T, MAX_uint8_T, 88U, 0U, 0U, 116U, MAX_uint8_T, 166U, 0U, 0U, 0U,
    0U, 0U, 0U, 171U, MAX_uint8_T, 226U, 9U, 29U, 243U, 240U, 24U, 0U, 0U, 0U,
    0U, 0U, 0U, 32U, 248U, MAX_uint8_T, 126U, 176U, MAX_uint8_T, 107U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 135U, MAX_uint8_T, 250U, MAX_uint8_T, 203U, 2U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 13U, 231U, MAX_uint8_T, 253U, 51U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 137U, MAX_uint8_T, 195U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 132U, MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 132U, MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    132U, MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 132U,
    MAX_uint8_T, 192U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 253U, 242U, 209U, 144U, 29U, 0U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 235U, 31U,
    244U, MAX_uint8_T, 72U, 0U, 8U, 41U, 137U, MAX_uint8_T, MAX_uint8_T, 144U,
    244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 189U, MAX_uint8_T, 190U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 185U, 244U, MAX_uint8_T,
    72U, 0U, 0U, 0U, 17U, 233U, MAX_uint8_T, 135U, 244U, MAX_uint8_T, 72U, 4U,
    29U, 91U, 215U, MAX_uint8_T, 244U, 30U, 244U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 236U, 66U, 0U, 244U,
    MAX_uint8_T, MAX_uint8_T, 252U, 237U, 196U, 122U, 20U, 0U, 0U, 244U,
    MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 244U, MAX_uint8_T, 72U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    87U, 203U, 245U, 242U, 206U, 104U, 2U, 0U, 0U, 0U, 70U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 142U, 0U,
    0U, 0U, 170U, MAX_uint8_T, 193U, 26U, 16U, 148U, MAX_uint8_T, 236U, 0U, 0U,
    0U, 213U, MAX_uint8_T, 80U, 0U, 0U, 53U, MAX_uint8_T, 217U, 0U, 0U, 0U, 226U,
    MAX_uint8_T, 60U, 0U, 0U, 112U, MAX_uint8_T, 121U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 18U, 235U, 215U, 9U, 0U, 0U, 0U, 228U, MAX_uint8_T,
    60U, 0U, 156U, 252U, 52U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 14U, 251U,
    207U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 10U, 244U, 254U, 83U, 0U,
    0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 96U, 253U, 252U, 125U, 3U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 80U, 245U, MAX_uint8_T, 192U, 19U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 53U, 232U, MAX_uint8_T, 203U, 5U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 38U, 238U, MAX_uint8_T, 81U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 144U, MAX_uint8_T, 120U, 228U,
    MAX_uint8_T, 60U, 63U, 171U, 69U, 15U, 37U, 213U, MAX_uint8_T, 91U, 228U,
    MAX_uint8_T, 60U, 68U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 223U, 10U, 0U, 0U, 0U, 4U, 98U, 200U, 243U, 227U, 160U, 26U, 0U,
    0U, 8U, 169U, MAX_uint8_T, 156U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 1U, 139U,
    MAX_uint8_T, 121U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 106U, 251U, 87U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, 128U, 201U, 234U, 249U, 217U, 122U, 2U, 0U,
    0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 187U, 114U, 45U, 11U, 30U, 178U,
    MAX_uint8_T, 205U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 57U, MAX_uint8_T, 237U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 240U, 0U, 0U, 0U, 4U, 94U,
    176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 0U, 17U, 204U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, MAX_uint8_T, 240U,
    0U, 0U, 151U, MAX_uint8_T, 229U, 107U, 36U, 8U, 44U, MAX_uint8_T, 240U, 0U,
    0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 44U, MAX_uint8_T, 245U, 0U, 0U, 197U,
    MAX_uint8_T, 168U, 24U, 17U, 69U, 183U, MAX_uint8_T, MAX_uint8_T, 67U, 0U,
    94U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U,
    211U, MAX_uint8_T, MAX_uint8_T, 128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U,
    63U, 229U, 238U, 102U, 0U, 0U, 0U, 0U, 0U, 73U, 252U, 223U, 41U, 0U, 0U, 0U,
    0U, 0U, 0U, 47U, 242U, 204U, 23U, 0U, 0U, 0U, 0U, 0U, 0U, 26U, 227U, 179U,
    11U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, 128U, 201U, 234U, 249U, 217U, 122U,
    2U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 187U, 114U, 45U, 11U, 30U, 178U,
    MAX_uint8_T, 205U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 57U, MAX_uint8_T, 237U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 240U, 0U, 0U, 0U, 4U, 94U,
    176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 0U, 17U, 204U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, MAX_uint8_T, 240U,
    0U, 0U, 151U, MAX_uint8_T, 229U, 107U, 36U, 8U, 44U, MAX_uint8_T, 240U, 0U,
    0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 44U, MAX_uint8_T, 245U, 0U, 0U, 197U,
    MAX_uint8_T, 168U, 24U, 17U, 69U, 183U, MAX_uint8_T, MAX_uint8_T, 67U, 0U,
    94U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U,
    211U, MAX_uint8_T, MAX_uint8_T, 128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U,
    63U, 229U, 238U, 102U, 0U, 0U, 0U, 123U, MAX_uint8_T, MAX_uint8_T, 179U, 3U,
    0U, 0U, 0U, 0U, 0U, 89U, 254U, 192U, 151U, MAX_uint8_T, 147U, 0U, 0U, 0U, 0U,
    60U, 248U, 145U, 4U, 0U, 97U, 247U, 113U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, 128U,
    201U, 234U, 249U, 217U, 122U, 2U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 187U,
    114U, 45U, 11U, 30U, 178U, MAX_uint8_T, 205U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    57U, MAX_uint8_T, 237U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T,
    240U, 0U, 0U, 0U, 4U, 94U, 176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, 240U,
    0U, 0U, 17U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U,
    MAX_uint8_T, 240U, 0U, 0U, 151U, MAX_uint8_T, 229U, 107U, 36U, 8U, 44U,
    MAX_uint8_T, 240U, 0U, 0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 245U, 0U, 0U, 197U, MAX_uint8_T, 168U, 24U, 17U, 69U, 183U,
    MAX_uint8_T, MAX_uint8_T, 67U, 0U, 94U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U, 211U, MAX_uint8_T, MAX_uint8_T,
    128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U, 63U, 229U, 238U, 102U, 0U, 0U,
    157U, 245U, 208U, 94U, 20U, 215U, 150U, 0U, 0U, 0U, 59U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 0U,
    0U, 0U, 108U, 244U, 28U, 72U, 190U, 246U, 184U, 10U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    36U, 128U, 201U, 234U, 249U, 217U, 122U, 2U, 0U, 0U, 0U, 228U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 114U, 0U,
    0U, 0U, 187U, 114U, 45U, 11U, 30U, 178U, MAX_uint8_T, 205U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 57U, MAX_uint8_T, 237U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 240U, 0U, 0U, 0U, 4U, 94U, 176U, 223U, 246U, MAX_uint8_T,
    MAX_uint8_T, 240U, 0U, 0U, 17U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 254U, MAX_uint8_T, 240U, 0U, 0U, 151U, MAX_uint8_T, 229U, 107U,
    36U, 8U, 44U, MAX_uint8_T, 240U, 0U, 0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U,
    44U, MAX_uint8_T, 245U, 0U, 0U, 197U, MAX_uint8_T, 168U, 24U, 17U, 69U, 183U,
    MAX_uint8_T, MAX_uint8_T, 67U, 0U, 94U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U, 211U, MAX_uint8_T, MAX_uint8_T,
    128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U, 63U, 229U, 238U, 102U, 0U, 0U,
    244U, 232U, 0U, 0U, 180U, MAX_uint8_T, 40U, 0U, 0U, 0U, 0U, 244U, 232U, 0U,
    0U, 180U, MAX_uint8_T, 40U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, 128U, 201U, 234U,
    249U, 217U, 122U, 2U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 187U,
    114U, 45U, 11U, 30U, 178U, MAX_uint8_T, 205U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    57U, MAX_uint8_T, 237U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T,
    240U, 0U, 0U, 0U, 4U, 94U, 176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, 240U,
    0U, 0U, 17U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U,
    MAX_uint8_T, 240U, 0U, 0U, 151U, MAX_uint8_T, 229U, 107U, 36U, 8U, 44U,
    MAX_uint8_T, 240U, 0U, 0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, 245U, 0U, 0U, 197U, MAX_uint8_T, 168U, 24U, 17U, 69U, 183U,
    MAX_uint8_T, MAX_uint8_T, 67U, 0U, 94U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U, 211U, MAX_uint8_T, MAX_uint8_T,
    128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U, 63U, 229U, 238U, 102U, 0U, 0U, 0U,
    85U, 224U, 234U, 123U, 0U, 0U, 0U, 0U, 0U, 0U, 30U, 226U, 46U, 26U, 203U,
    74U, 0U, 0U, 0U, 0U, 0U, 76U, 164U, 0U, 0U, 112U, 128U, 0U, 0U, 0U, 0U, 0U,
    30U, 226U, 44U, 27U, 203U, 75U, 0U, 0U, 0U, 0U, 0U, 0U, 87U, 226U, 235U,
    125U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, 128U, 201U, 234U, 249U, 217U, 122U,
    2U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 114U, 0U, 0U, 0U, 187U, 114U, 45U, 11U, 30U, 178U,
    MAX_uint8_T, 205U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 57U, MAX_uint8_T, 237U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U, MAX_uint8_T, 240U, 0U, 0U, 0U, 4U, 94U,
    176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, 240U, 0U, 0U, 17U, 204U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, MAX_uint8_T, 240U,
    0U, 0U, 151U, MAX_uint8_T, 229U, 107U, 36U, 8U, 44U, MAX_uint8_T, 240U, 0U,
    0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 44U, MAX_uint8_T, 245U, 0U, 0U, 197U,
    MAX_uint8_T, 168U, 24U, 17U, 69U, 183U, MAX_uint8_T, MAX_uint8_T, 67U, 0U,
    94U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 194U,
    211U, MAX_uint8_T, MAX_uint8_T, 128U, 0U, 97U, 213U, 247U, 211U, 108U, 4U,
    63U, 229U, 238U, 102U, 0U, 36U, 128U, 201U, 234U, 244U, 191U, 58U, 0U, 75U,
    201U, 247U, 231U, 150U, 17U, 0U, 0U, 0U, 228U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 249U, 143U, 254U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 204U, 7U, 0U, 0U, 187U, 114U, 45U,
    11U, 30U, 180U, MAX_uint8_T, MAX_uint8_T, 233U, 73U, 12U, 53U, 220U,
    MAX_uint8_T, 105U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 57U, MAX_uint8_T, MAX_uint8_T,
    99U, 0U, 0U, 0U, 87U, MAX_uint8_T, 194U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 44U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 38U, MAX_uint8_T, 247U, 1U, 0U,
    4U, 94U, 176U, 223U, 246U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 25U, 17U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 254U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 38U, 151U,
    MAX_uint8_T, 229U, 107U, 36U, 8U, 44U, MAX_uint8_T, 254U, 24U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 217U, MAX_uint8_T, 76U, 0U, 0U, 0U, 48U, MAX_uint8_T,
    MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 197U, MAX_uint8_T, 168U, 24U,
    13U, 88U, 222U, 180U, 252U, 253U, 141U, 44U, 11U, 25U, 76U, 180U, 42U, 94U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 162U, 2U,
    107U, 253U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 44U, 0U, 97U, 213U, 246U, 208U, 96U, 0U, 0U, 0U, 63U, 177U,
    233U, 246U, 215U, 159U, 65U, 1U, 0U, 0U, 26U, 140U, 214U, 245U, 235U, 181U,
    70U, 0U, 0U, 56U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 24U, 13U, 231U, MAX_uint8_T, 244U, 104U, 20U, 17U,
    75U, 186U, 23U, 108U, MAX_uint8_T, MAX_uint8_T, 86U, 0U, 0U, 0U, 0U, 0U, 0U,
    173U, MAX_uint8_T, 214U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 200U, MAX_uint8_T, 168U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 197U, MAX_uint8_T, 166U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 161U, MAX_uint8_T, 213U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T,
    MAX_uint8_T, 86U, 0U, 0U, 0U, 0U, 0U, 0U, 3U, 205U, MAX_uint8_T, 244U, 107U,
    21U, 13U, 58U, 164U, 52U, 0U, 32U, 222U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, 0U, 17U, 136U,
    219U, 248U, 224U, 170U, 72U, 2U, 0U, 0U, 0U, 0U, 5U, 212U, 32U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 103U, 254U, 207U, 42U, 0U, 0U, 0U, 0U, 0U, 0U, 4U, 45U, 223U,
    187U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 11U, 200U, 185U, 0U, 0U, 0U, 0U, 0U, 0U,
    224U, 253U, 207U, 43U, 0U, 0U, 0U, 12U, 181U, MAX_uint8_T, 141U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 3U, 152U, MAX_uint8_T, 105U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    120U, 250U, 73U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 37U, 166U, 234U, 247U, 207U, 91U, 0U,
    0U, 0U, 58U, 242U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 105U, 0U, 11U, 227U, MAX_uint8_T, 158U, 30U, 16U, 103U, 252U,
    243U, 17U, 102U, MAX_uint8_T, 215U, 3U, 0U, 0U, 0U, 171U, MAX_uint8_T, 96U,
    170U, MAX_uint8_T, 142U, 0U, 0U, 0U, 0U, 119U, MAX_uint8_T, 148U, 199U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 173U, 197U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 182U, 162U,
    MAX_uint8_T, 133U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T, 228U, 22U,
    0U, 0U, 0U, 0U, 0U, 0U, 2U, 203U, MAX_uint8_T, 214U, 87U, 27U, 9U, 46U, 128U,
    147U, 0U, 28U, 213U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 172U, 0U, 0U, 10U, 119U, 206U, 245U, 238U, 197U,
    114U, 22U, 0U, 0U, 0U, 0U, 0U, 84U, 254U, 217U, 35U, 0U, 0U, 0U, 0U, 0U, 55U,
    246U, 196U, 19U, 0U, 0U, 0U, 0U, 0U, 32U, 233U, 170U, 8U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 37U, 166U, 234U, 247U, 207U, 91U, 0U, 0U, 0U, 58U, 242U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 105U, 0U, 11U, 227U,
    MAX_uint8_T, 158U, 30U, 16U, 103U, 252U, 243U, 17U, 102U, MAX_uint8_T, 215U,
    3U, 0U, 0U, 0U, 171U, MAX_uint8_T, 96U, 170U, MAX_uint8_T, 142U, 0U, 0U, 0U,
    0U, 119U, MAX_uint8_T, 148U, 199U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 173U, 197U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 182U, 162U, MAX_uint8_T, 133U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 84U, MAX_uint8_T, 228U, 22U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 203U,
    MAX_uint8_T, 214U, 87U, 27U, 9U, 46U, 128U, 147U, 0U, 28U, 213U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 172U, 0U,
    0U, 10U, 119U, 206U, 245U, 238U, 197U, 114U, 22U, 0U, 0U, 0U, 80U, 253U,
    MAX_uint8_T, 211U, 14U, 0U, 0U, 0U, 0U, 53U, 245U, 216U, 130U, 252U, 186U,
    4U, 0U, 0U, 32U, 232U, 178U, 14U, 0U, 65U, 235U, 156U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 37U,
    166U, 234U, 247U, 207U, 91U, 0U, 0U, 0U, 58U, 242U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 105U, 0U, 11U, 227U, MAX_uint8_T,
    158U, 30U, 16U, 103U, 252U, 243U, 17U, 102U, MAX_uint8_T, 215U, 3U, 0U, 0U,
    0U, 171U, MAX_uint8_T, 96U, 170U, MAX_uint8_T, 142U, 0U, 0U, 0U, 0U, 119U,
    MAX_uint8_T, 148U, 199U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 173U, 197U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 182U, 162U, MAX_uint8_T, 133U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U,
    MAX_uint8_T, 228U, 22U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 203U, MAX_uint8_T, 214U,
    87U, 27U, 9U, 46U, 128U, 147U, 0U, 28U, 213U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 172U, 0U, 0U, 10U, 119U,
    206U, 245U, 238U, 197U, 114U, 22U, 0U, 0U, 176U, MAX_uint8_T, 44U, 0U, 112U,
    MAX_uint8_T, 108U, 0U, 0U, 0U, 176U, MAX_uint8_T, 44U, 0U, 112U, MAX_uint8_T,
    108U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 37U, 166U, 234U, 247U, 207U, 91U, 0U, 0U, 0U, 58U, 242U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 105U, 0U,
    11U, 227U, MAX_uint8_T, 158U, 30U, 16U, 103U, 252U, 243U, 17U, 102U,
    MAX_uint8_T, 215U, 3U, 0U, 0U, 0U, 171U, MAX_uint8_T, 96U, 170U, MAX_uint8_T,
    142U, 0U, 0U, 0U, 0U, 119U, MAX_uint8_T, 148U, 199U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 173U, 197U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 182U, 162U, MAX_uint8_T,
    133U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 84U, MAX_uint8_T, 228U, 22U, 0U, 0U, 0U,
    0U, 0U, 0U, 2U, 203U, MAX_uint8_T, 214U, 87U, 27U, 9U, 46U, 128U, 147U, 0U,
    28U, 213U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 172U, 0U, 0U, 10U, 119U, 206U, 245U, 238U, 197U, 114U, 22U, 8U,
    169U, MAX_uint8_T, 156U, 0U, 0U, 0U, 1U, 139U, MAX_uint8_T, 121U, 0U, 0U, 0U,
    0U, 106U, 251U, 87U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 70U, 251U,
    225U, 43U, 0U, 44U, 241U, 206U, 25U, 0U, 24U, 225U, 182U, 12U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 106U, MAX_uint8_T, MAX_uint8_T, 191U, 6U,
    0U, 0U, 75U, 252U, 201U, 142U, MAX_uint8_T, 162U, 0U, 49U, 243U, 157U, 7U,
    0U, 85U, 243U, 129U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 224U, 252U, 0U, 0U, 160U, MAX_uint8_T, 60U, 224U,
    252U, 0U, 0U, 160U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U,
    0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 86U,
    178U, 7U, 0U, 0U, 0U, 0U, 202U, 234U, 211U, 160U, 146U, 254U, 139U, 1U, 0U,
    0U, 0U, 0U, 204U, 240U, 213U, 254U, MAX_uint8_T, 231U, 40U, 0U, 0U, 0U, 0U,
    0U, 0U, 13U, 184U, 243U, 174U, MAX_uint8_T, 245U, 76U, 0U, 0U, 0U, 0U, 0U,
    29U, 196U, 49U, 0U, 113U, MAX_uint8_T, 252U, 78U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 153U, MAX_uint8_T, 245U, 38U, 0U, 0U, 0U, 0U, 31U, 156U, 227U, 249U,
    224U, MAX_uint8_T, MAX_uint8_T, 192U, 0U, 0U, 0U, 55U, 239U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    61U, 0U, 11U, 228U, MAX_uint8_T, 207U, 59U, 8U, 36U, 135U, 253U, MAX_uint8_T,
    153U, 0U, 106U, MAX_uint8_T, 246U, 26U, 0U, 0U, 0U, 0U, 159U, MAX_uint8_T,
    214U, 0U, 175U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 63U, MAX_uint8_T,
    250U, 0U, 204U, MAX_uint8_T, 123U, 0U, 0U, 0U, 0U, 0U, 31U, MAX_uint8_T,
    MAX_uint8_T, 7U, 202U, MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 41U,
    MAX_uint8_T, 250U, 0U, 170U, MAX_uint8_T, 165U, 0U, 0U, 0U, 0U, 0U, 81U,
    MAX_uint8_T, 210U, 0U, 99U, MAX_uint8_T, 248U, 27U, 0U, 0U, 0U, 0U, 192U,
    MAX_uint8_T, 135U, 0U, 9U, 223U, MAX_uint8_T, 207U, 56U, 6U, 32U, 156U,
    MAX_uint8_T, 239U, 26U, 0U, 0U, 50U, 236U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 74U, 0U, 0U, 0U, 0U, 28U, 151U,
    225U, 250U, 233U, 168U, 43U, 0U, 0U, 0U, 0U, 0U, 143U, 243U, 213U, 102U, 19U,
    202U, 166U, 0U, 0U, 43U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 116U, 0U, 0U, 92U, 251U, 37U, 65U, 184U, 245U,
    193U, 16U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 10U, 134U, 224U, 243U, 197U, 55U,
    0U, 228U, MAX_uint8_T, 73U, 204U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 244U, 28U, 228U, MAX_uint8_T, 217U, 237U, 99U, 17U, 37U, 224U,
    MAX_uint8_T, 124U, 228U, MAX_uint8_T, 237U, 40U, 0U, 0U, 0U, 139U,
    MAX_uint8_T, 161U, 228U, MAX_uint8_T, 89U, 0U, 0U, 0U, 0U, 117U, MAX_uint8_T,
    168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    116U, MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U,
    MAX_uint8_T, 168U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 116U, MAX_uint8_T,
    168U, 0U, 0U, 53U, 232U, 247U, 57U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 33U,
    215U, 234U, 34U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 193U, 215U, 17U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 149U, 221U, 248U, 239U,
    192U, 92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U, 0U, 11U, 229U, MAX_uint8_T,
    208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T, 116U, 0U, 104U, MAX_uint8_T,
    243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 233U, 2U, 170U, MAX_uint8_T,
    164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T, MAX_uint8_T, 46U, 199U,
    MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U, MAX_uint8_T, 75U, 200U,
    MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U, MAX_uint8_T, 73U, 170U,
    MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U, MAX_uint8_T, MAX_uint8_T, 44U,
    103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 231U, 2U,
    11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U, 124U, 251U, MAX_uint8_T, 113U,
    0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U, 31U, 151U, 224U, 250U, 239U,
    191U, 90U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 1U, 172U, MAX_uint8_T, 156U, 4U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 139U, MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 101U, 249U, 92U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U,
    149U, 221U, 248U, 239U, 192U, 92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U,
    0U, 11U, 229U, MAX_uint8_T, 208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T,
    116U, 0U, 104U, MAX_uint8_T, 243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T,
    233U, 2U, 170U, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T,
    MAX_uint8_T, 46U, 199U, MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U,
    MAX_uint8_T, 75U, 200U, MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U,
    MAX_uint8_T, 73U, 170U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U,
    MAX_uint8_T, MAX_uint8_T, 44U, 103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U,
    132U, MAX_uint8_T, 231U, 2U, 11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U,
    124U, 251U, MAX_uint8_T, 113U, 0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U,
    31U, 151U, 224U, 250U, 239U, 191U, 90U, 1U, 0U, 0U, 0U, 0U, 0U, 10U, 204U,
    MAX_uint8_T, MAX_uint8_T, 91U, 0U, 0U, 0U, 0U, 0U, 0U, 2U, 177U, 253U, 135U,
    210U, 249U, 62U, 0U, 0U, 0U, 0U, 0U, 145U, 239U, 73U, 0U, 11U, 169U, 237U,
    39U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 149U, 221U, 248U, 239U, 192U,
    92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U, 0U, 11U, 229U, MAX_uint8_T,
    208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T, 116U, 0U, 104U, MAX_uint8_T,
    243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 233U, 2U, 170U, MAX_uint8_T,
    164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T, MAX_uint8_T, 46U, 199U,
    MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U, MAX_uint8_T, 75U, 200U,
    MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U, MAX_uint8_T, 73U, 170U,
    MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U, MAX_uint8_T, MAX_uint8_T, 44U,
    103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 231U, 2U,
    11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U, 124U, 251U, MAX_uint8_T, 113U,
    0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U, 31U, 151U, 224U, 250U, 239U,
    191U, 90U, 1U, 0U, 0U, 0U, 0U, 28U, 206U, 244U, 176U, 55U, 57U, MAX_uint8_T,
    66U, 0U, 0U, 0U, 0U, 143U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 250U, 21U, 0U, 0U, 0U, 0U, 192U, 180U, 19U, 113U,
    218U, 241U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 149U, 221U,
    248U, 239U, 192U, 92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U, 0U, 11U, 229U,
    MAX_uint8_T, 208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T, 116U, 0U, 104U,
    MAX_uint8_T, 243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 233U, 2U, 170U,
    MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T, MAX_uint8_T, 46U,
    199U, MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U, MAX_uint8_T, 75U,
    200U, MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U, MAX_uint8_T, 73U,
    170U, MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U, MAX_uint8_T, MAX_uint8_T,
    44U, 103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 231U,
    2U, 11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U, 124U, 251U, MAX_uint8_T,
    113U, 0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U, 31U, 151U, 224U, 250U, 239U,
    191U, 90U, 1U, 0U, 0U, 0U, 0U, 76U, MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T,
    208U, 0U, 0U, 0U, 0U, 0U, 76U, MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T, 208U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 29U, 149U, 221U, 248U, 239U, 192U,
    92U, 1U, 0U, 0U, 0U, 56U, 238U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 168U, 2U, 0U, 11U, 229U, MAX_uint8_T,
    208U, 63U, 14U, 33U, 119U, 249U, MAX_uint8_T, 116U, 0U, 104U, MAX_uint8_T,
    243U, 20U, 0U, 0U, 0U, 0U, 128U, MAX_uint8_T, 233U, 2U, 170U, MAX_uint8_T,
    164U, 0U, 0U, 0U, 0U, 0U, 27U, MAX_uint8_T, MAX_uint8_T, 46U, 199U,
    MAX_uint8_T, 131U, 0U, 0U, 0U, 0U, 0U, 1U, 248U, MAX_uint8_T, 75U, 200U,
    MAX_uint8_T, 130U, 0U, 0U, 0U, 0U, 0U, 2U, 250U, MAX_uint8_T, 73U, 170U,
    MAX_uint8_T, 163U, 0U, 0U, 0U, 0U, 0U, 30U, MAX_uint8_T, MAX_uint8_T, 44U,
    103U, MAX_uint8_T, 243U, 18U, 0U, 0U, 0U, 0U, 132U, MAX_uint8_T, 231U, 2U,
    11U, 228U, MAX_uint8_T, 205U, 60U, 13U, 33U, 124U, 251U, MAX_uint8_T, 113U,
    0U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 165U, 1U, 0U, 0U, 0U, 31U, 151U, 224U, 250U, 239U,
    191U, 90U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, MAX_uint8_T,
    20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, MAX_uint8_T,
    20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T, MAX_uint8_T,
    20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 156U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    28U, 156U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T,
    MAX_uint8_T, 20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T,
    MAX_uint8_T, 20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 148U, MAX_uint8_T,
    MAX_uint8_T, 20U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 30U, 149U, 222U, 248U, 231U,
    188U, 83U, 167U, 220U, 17U, 0U, 56U, 239U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 254U, 47U, 0U, 11U, 229U,
    MAX_uint8_T, 207U, 63U, 14U, 28U, 143U, MAX_uint8_T, MAX_uint8_T, 107U, 0U,
    103U, MAX_uint8_T, 243U, 19U, 0U, 0U, 9U, 199U, 239U, MAX_uint8_T, 227U, 1U,
    170U, MAX_uint8_T, 163U, 0U, 0U, 3U, 176U, 209U, 50U, MAX_uint8_T,
    MAX_uint8_T, 43U, 199U, MAX_uint8_T, 129U, 0U, 0U, 150U, 227U, 27U, 0U, 249U,
    MAX_uint8_T, 74U, 200U, MAX_uint8_T, 128U, 0U, 121U, 240U, 44U, 0U, 1U, 248U,
    MAX_uint8_T, 74U, 171U, MAX_uint8_T, 167U, 92U, 248U, 65U, 0U, 0U, 27U,
    MAX_uint8_T, MAX_uint8_T, 45U, 104U, MAX_uint8_T, 244U, 249U, 89U, 0U, 0U,
    0U, 128U, MAX_uint8_T, 231U, 2U, 12U, 226U, MAX_uint8_T, 229U, 65U, 11U, 32U,
    120U, 249U, MAX_uint8_T, 113U, 0U, 0U, 167U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 166U, 1U,
    0U, 105U, 248U, 79U, 139U, 214U, 245U, 240U, 193U, 93U, 1U, 0U, 0U, 0U, 0U,
    53U, 232U, 247U, 57U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 33U, 215U, 234U, 34U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 17U, 193U, 215U, 17U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U,
    4U, MAX_uint8_T, MAX_uint8_T, 29U, 0U, 0U, 0U, 0U, 181U, MAX_uint8_T, 136U,
    1U, 251U, MAX_uint8_T, 50U, 0U, 0U, 0U, 114U, MAX_uint8_T, MAX_uint8_T, 136U,
    0U, 217U, MAX_uint8_T, 158U, 14U, 34U, 150U, 254U, 218U, MAX_uint8_T, 136U,
    0U, 112U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    124U, 152U, MAX_uint8_T, 136U, 0U, 2U, 117U, 219U, 245U, 201U, 82U, 0U, 152U,
    MAX_uint8_T, 136U, 0U, 0U, 0U, 0U, 0U, 1U, 172U, MAX_uint8_T, 156U, 4U, 0U,
    0U, 0U, 0U, 0U, 0U, 139U, MAX_uint8_T, 125U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    101U, 249U, 92U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T,
    29U, 0U, 0U, 0U, 0U, 181U, MAX_uint8_T, 136U, 1U, 251U, MAX_uint8_T, 50U, 0U,
    0U, 0U, 114U, MAX_uint8_T, MAX_uint8_T, 136U, 0U, 217U, MAX_uint8_T, 158U,
    14U, 34U, 150U, 254U, 218U, MAX_uint8_T, 136U, 0U, 112U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 124U, 152U, MAX_uint8_T,
    136U, 0U, 2U, 117U, 219U, 245U, 201U, 82U, 0U, 152U, MAX_uint8_T, 136U, 0U,
    0U, 0U, 10U, 204U, MAX_uint8_T, MAX_uint8_T, 91U, 0U, 0U, 0U, 0U, 0U, 2U,
    177U, 253U, 135U, 210U, 249U, 62U, 0U, 0U, 0U, 0U, 145U, 239U, 73U, 0U, 11U,
    169U, 237U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U,
    0U, 0U, 152U, MAX_uint8_T, 136U, 4U, MAX_uint8_T, MAX_uint8_T, 29U, 0U, 0U,
    0U, 0U, 181U, MAX_uint8_T, 136U, 1U, 251U, MAX_uint8_T, 50U, 0U, 0U, 0U,
    114U, MAX_uint8_T, MAX_uint8_T, 136U, 0U, 217U, MAX_uint8_T, 158U, 14U, 34U,
    150U, 254U, 218U, MAX_uint8_T, 136U, 0U, 112U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 124U, 152U, MAX_uint8_T, 136U, 0U, 2U,
    117U, 219U, 245U, 201U, 82U, 0U, 152U, MAX_uint8_T, 136U, 0U, 0U, 76U,
    MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T, 208U, 0U, 0U, 0U, 0U, 76U,
    MAX_uint8_T, 144U, 0U, 12U, MAX_uint8_T, 208U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 28U, 0U, 0U, 0U, 0U, 152U, MAX_uint8_T, 136U, 4U,
    MAX_uint8_T, MAX_uint8_T, 29U, 0U, 0U, 0U, 0U, 181U, MAX_uint8_T, 136U, 1U,
    251U, MAX_uint8_T, 50U, 0U, 0U, 0U, 114U, MAX_uint8_T, MAX_uint8_T, 136U, 0U,
    217U, MAX_uint8_T, 158U, 14U, 34U, 150U, 254U, 218U, MAX_uint8_T, 136U, 0U,
    112U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 124U,
    152U, MAX_uint8_T, 136U, 0U, 2U, 117U, 219U, 245U, 201U, 82U, 0U, 152U,
    MAX_uint8_T, 136U, 0U, 0U, 0U, 0U, 0U, 0U, 161U, MAX_uint8_T, 166U, 6U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 127U, MAX_uint8_T, 135U, 1U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 90U, 251U, 102U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 164U,
    MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U, 0U, 214U, MAX_uint8_T, 41U, 68U,
    MAX_uint8_T, 244U, 12U, 0U, 0U, 0U, 0U, 59U, MAX_uint8_T, 195U, 0U, 2U, 225U,
    MAX_uint8_T, 96U, 0U, 0U, 0U, 0U, 160U, MAX_uint8_T, 93U, 0U, 0U, 131U,
    MAX_uint8_T, 191U, 0U, 0U, 0U, 15U, 245U, 238U, 8U, 0U, 0U, 35U, MAX_uint8_T,
    254U, 31U, 0U, 0U, 106U, MAX_uint8_T, 145U, 0U, 0U, 0U, 0U, 195U,
    MAX_uint8_T, 124U, 0U, 0U, 207U, MAX_uint8_T, 44U, 0U, 0U, 0U, 0U, 98U,
    MAX_uint8_T, 218U, 0U, 52U, MAX_uint8_T, 198U, 0U, 0U, 0U, 0U, 0U, 12U, 244U,
    MAX_uint8_T, 58U, 153U, MAX_uint8_T, 96U, 0U, 0U, 0U, 0U, 0U, 0U, 162U,
    MAX_uint8_T, 165U, 242U, 240U, 10U, 0U, 0U, 0U, 0U, 0U, 0U, 65U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 149U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 1U, 223U,
    MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 128U,
    MAX_uint8_T, 201U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 141U, MAX_uint8_T,
    99U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 18U, 243U, 242U, 11U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 127U, MAX_uint8_T, 152U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 11U,
    236U, MAX_uint8_T, 50U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 33U, 166U, 234U, 246U,
    199U, 79U, 0U, 0U, 228U, MAX_uint8_T, 93U, 233U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 97U, 0U, 228U, MAX_uint8_T, 232U,
    192U, 63U, 10U, 42U, 188U, MAX_uint8_T, 243U, 16U, 228U, MAX_uint8_T, 154U,
    1U, 0U, 0U, 0U, 18U, 246U, MAX_uint8_T, 97U, 228U, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 0U, 186U, MAX_uint8_T, 146U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U,
    0U, 160U, MAX_uint8_T, 163U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U,
    163U, MAX_uint8_T, 154U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 200U,
    MAX_uint8_T, 119U, 228U, MAX_uint8_T, 93U, 0U, 0U, 0U, 0U, 36U, 253U,
    MAX_uint8_T, 50U, 228U, MAX_uint8_T, 252U, 142U, 37U, 6U, 56U, 211U,
    MAX_uint8_T, 191U, 0U, 228U, MAX_uint8_T, 150U, 254U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 230U, 33U, 0U, 228U, MAX_uint8_T, 60U,
    72U, 200U, 247U, 232U, 158U, 27U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    228U, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, MAX_uint8_T,
    60U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 36U, MAX_uint8_T, 184U, 0U, 0U,
    228U, 248U, 0U, 0U, 0U, 0U, 0U, 36U, MAX_uint8_T, 184U, 0U, 0U, 228U, 248U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 164U, MAX_uint8_T, 162U, 0U, 0U, 0U, 0U, 0U,
    0U, 214U, MAX_uint8_T, 41U, 68U, MAX_uint8_T, 244U, 12U, 0U, 0U, 0U, 0U, 59U,
    MAX_uint8_T, 195U, 0U, 2U, 225U, MAX_uint8_T, 96U, 0U, 0U, 0U, 0U, 160U,
    MAX_uint8_T, 93U, 0U, 0U, 131U, MAX_uint8_T, 191U, 0U, 0U, 0U, 15U, 245U,
    238U, 8U, 0U, 0U, 35U, MAX_uint8_T, 254U, 31U, 0U, 0U, 106U, MAX_uint8_T,
    145U, 0U, 0U, 0U, 0U, 195U, MAX_uint8_T, 124U, 0U, 0U, 207U, MAX_uint8_T,
    44U, 0U, 0U, 0U, 0U, 98U, MAX_uint8_T, 218U, 0U, 52U, MAX_uint8_T, 198U, 0U,
    0U, 0U, 0U, 0U, 12U, 244U, MAX_uint8_T, 58U, 153U, MAX_uint8_T, 96U, 0U, 0U,
    0U, 0U, 0U, 0U, 162U, MAX_uint8_T, 165U, 242U, 240U, 10U, 0U, 0U, 0U, 0U, 0U,
    0U, 65U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 149U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 1U, 223U, MAX_uint8_T, MAX_uint8_T, 47U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    128U, MAX_uint8_T, 201U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 141U,
    MAX_uint8_T, 99U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 18U, 243U, 242U, 11U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 127U, MAX_uint8_T, 152U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 11U, 236U, MAX_uint8_T, 50U, 0U, 0U, 0U, 0U, 0U, 0U };

  static const char_T cv51[8] = { 'b', 'r', 'o', 'c', 'c', 'o', 'l', 'i' };

  static const char_T cv52[6] = { 'c', 'a', 'r', 'r', 'o', 't' };

  static const char_T cv53[7] = { 'h', 'o', 't', ' ', 'd', 'o', 'g' };

  static const char_T cv56[4] = { 'c', 'a', 'k', 'e' };

  static const char_T cv57[5] = { 'c', 'h', 'a', 'i', 'r' };

  static const char_T cv58[4] = { 's', 'o', 'f', 'a' };

  static const char_T cv59[11] = { 'p', 'o', 't', 't', 'e', 'd', 'p', 'l', 'a',
    'n', 't' };

  static const char_T cv60[3] = { 'b', 'e', 'd' };

  static const char_T cv61[11] = { 'd', 'i', 'n', 'i', 'n', 'g', 't', 'a', 'b',
    'l', 'e' };

  static const char_T cv62[6] = { 't', 'o', 'i', 'l', 'e', 't' };

  static const char_T cv63[9] = { 't', 'v', 'm', 'o', 'n', 'i', 't', 'o', 'r' };

  static const char_T cv64[6] = { 'l', 'a', 'p', 't', 'o', 'p' };

  static const int8_T iv7[261] = { 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1,
    1, 0, 1, 1, -2, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
    0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 1, -1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    -1, -1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 2,
    2, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, -1, 0, -1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 };

  static const char_T cv65[5] = { 'm', 'o', 'u', 's', 'e' };

  static const int8_T iv8[261] = { 8, 0, 0, 0, 9, 9, 9, 10, 9, 9, 9, 9, 9, 9, 7,
    1, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 7, 7, 5, 7, 9, 9, 9, 9, 9, 9, 9,
    9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 0,
    10, 7, 9, 7, 9, 7, 9, 7, 9, 9, 9, 9, 9, 7, 7, 7, 7, 7, 7, 7, 8, 7, 7, 7, 7,
    7, 7, 9, 9, 9, 5, 11, 12, 9, 12, 12, 11, 11, 10, 10, 10, 9, 10, 11, 7, 10,
    10, 10, 9, 10, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 10, 10, 9, 0, 9, 9, 9,
    9, 0, 9, 9, 9, 9, 0, 10, 9, 0, 9, 9, 0, 7, 0, 0, 9, 7, 0, 0, 0, 0, 0, 9, 9,
    0, 7, 7, 7, 7, 5, 0, 0, 0, 0, 6, 6, 0, 0, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0,
    7, 0, 9, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 12, 11, 12, 12, 12, 11,
    12, 12, 12, 0, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 9, 9, 10, 12, 10, 9, 9, 0, 7, 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 4, 10, 4 };

  static const char_T cv66[6] = { 'r', 'e', 'm', 'o', 't', 'e' };

  static const int8_T uv6[261] = { 8, 0, 0, 0, 9, 3, 9, 11, 9, 9, 3, 11, 11, 4,
    7, 3, 1, 1, 11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 9, 7, 3, 7, 9, 9, 9, 9, 9,
    9, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 11,
    11, 11, 6, 1, 2, 7, 9, 7, 9, 7, 9, 9, 9, 9, 11, 9, 9, 7, 7, 7, 9, 9, 7, 7, 8,
    7, 7, 7, 7, 9, 7, 11, 11, 11, 2, 11, 12, 12, 12, 12, 11, 11, 10, 10, 10, 9,
    10, 11, 10, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 10, 10,
    9, 0, 3, 9, 9, 11, 0, 11, 9, 5, 9, 0, 2, 1, 0, 9, 9, 0, 7, 0, 0, 9, 9, 0, 0,
    0, 0, 0, 4, 4, 0, 7, 7, 9, 9, 3, 0, 0, 0, 0, 5, 5, 0, 0, 12, 12, 12, 0, 0, 0,
    0, 0, 0, 0, 0, 7, 0, 11, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 12, 11,
    12, 12, 12, 11, 12, 12, 12, 0, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 11, 9, 10, 12, 12, 9, 11, 0, 7, 6, 6, 6, 9, 9, 9, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 };

  static const char_T cv67[8] = { 'k', 'e', 'y', 'b', 'o', 'a', 'r', 'd' };

  static const int8_T uv7[261] = { 7, 0, 0, 0, 2, 4, 8, 6, 8, 8, 3, 4, 4, 6, 8,
    2, 7, 2, 5, 7, 6, 6, 6, 7, 6, 7, 6, 6, 7, 2, 2, 8, 8, 8, 5, 10, 9, 6, 8, 8,
    6, 5, 8, 7, 2, 5, 7, 6, 9, 7, 9, 6, 10, 7, 6, 8, 7, 8, 11, 8, 8, 7, 3, 5, 3,
    7, 6, 4, 7, 6, 6, 7, 6, 5, 7, 6, 2, 4, 6, 2, 10, 6, 7, 6, 7, 4, 6, 5, 6, 7,
    10, 7, 7, 7, 4, 2, 4, 7, 9, 9, 8, 6, 7, 9, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6,
    6, 4, 4, 5, 4, 6, 7, 7, 7, 7, 7, 6, 6, 6, 6, 0, 5, 6, 6, 6, 0, 6, 6, 6, 10,
    0, 4, 4, 0, 11, 9, 0, 8, 0, 0, 8, 6, 0, 0, 0, 0, 0, 4, 5, 0, 10, 7, 5, 2, 8,
    0, 0, 0, 0, 6, 6, 0, 0, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 7, 0, 0, 8, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 9, 6, 9, 6, 6, 4, 5, 4, 4, 9, 9, 0, 9, 7, 7, 7, 0, 0,
    0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10, 7, 8, 7, 6, 6, 0, 8, 4,
    5, 5, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 6, 2 };

  static const char_T cv68[10] = { 'c', 'e', 'l', 'l', ' ', 'p', 'h', 'o', 'n',
    'e' };

  static const char_T cv69[9] = { 'm', 'i', 'c', 'r', 'o', 'w', 'a', 'v', 'e' };

  static const char_T cv70[4] = { 'o', 'v', 'e', 'n' };

  static const char_T cv71[7] = { 't', 'o', 'a', 's', 't', 'e', 'r' };

  static const char_T cv72[4] = { 's', 'i', 'n', 'k' };

  static const int16_T uv8[261] = { 0, 0, 0, 56, 56, 74, 86, 158, 224, 296, 368,
    377, 421, 465, 489, 545, 551, 558, 560, 615, 678, 732, 786, 840, 903, 957,
    1020, 1074, 1128, 1191, 1205, 1223, 1279, 1303, 1359, 1404, 1494, 1575, 1629,
    1701, 1773, 1827, 1872, 1944, 2007, 2025, 2080, 2143, 2197, 2278, 2341, 2422,
    2476, 2586, 2649, 2703, 2775, 2838, 2910, 3009, 3081, 3153, 3216, 3249, 3304,
    3337, 3379, 3385, 3393, 3442, 3496, 3538, 3601, 3643, 3688, 3751, 3805, 3823,
    3867, 3921, 3939, 4009, 4051, 4100, 4154, 4217, 4245, 4287, 4327, 4369, 4418,
    4488, 4537, 4600, 4649, 4693, 4715, 4759, 6416, 6515, 6722, 6890, 7390, 7906,
    8394, 8745, 8675, 8815, 8955, 8885, 9018, 9165, 9285, 9225, 9345, 9405, 9499,
    9459, 9539, 9589, 9695, 9825, 9755, 9895, 10035, 9965, 10263, 10203, 10323,
    10383, 0, 5322, 4791, 4845, 5049, 0, 5515, 8621, 5286, 5119, 0, 5453, 5115,
    0, 6623, 8061, 0, 5337, 0, 0, 4955, 5461, 0, 0, 0, 0, 0, 5209, 5619, 0, 9095,
    10154, 5939, 4773, 5255, 0, 0, 0, 0, 5225, 5639, 0, 4773, 5984, 6308, 7798,
    0, 0, 0, 0, 0, 0, 0, 0, 10098, 0, 10587, 0, 0, 4899, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 6200, 6962, 6092, 7034, 6818, 7148, 7196, 7256, 7100, 7582, 7690, 0, 7474,
    8226, 8310, 8142, 0, 0, 0, 0, 0, 0, 0, 5583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5027,
    7300, 9625, 8471, 10437, 8567, 10521, 0, 8005, 5595, 5393, 5423, 5759, 5669,
    5849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5279, 5316, 5581 };

  static const char_T cv73[12] = { 'r', 'e', 'f', 'r', 'i', 'g', 'e', 'r', 'a',
    't', 'o', 'r' };

  static const char_T cv74[4] = { 'b', 'o', 'o', 'k' };

  static const char_T cv75[5] = { 'c', 'l', 'o', 'c', 'k' };

  static const char_T cv76[4] = { 'v', 'a', 's', 'e' };

  static const char_T cv77[8] = { 's', 'c', 'i', 's', 's', 'o', 'r', 's' };

  static const uint8_T cpu_uv9[10664] = { 60U, 96U, 96U, 96U, 96U, 96U, 60U, 96U,
    0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U,
    0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U,
    0U, 0U, 0U, 0U, 96U, 108U, 96U, 96U, 96U, 96U, 96U, 108U, 176U, 120U, 176U,
    119U, 172U, 115U, 165U, 108U, 158U, 101U, 151U, 94U, 144U, 87U, 0U, 0U, 176U,
    120U, 83U, 201U, 79U, 205U, 71U, 189U, 67U, 193U, 58U, 177U, 54U, 181U, 0U,
    0U, 0U, 185U, 6U, 117U, 75U, 0U, 0U, 0U, 3U, 187U, 0U, 172U, 20U, 0U, 0U, 0U,
    48U, 143U, 0U, 192U, 0U, 0U, 74U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 109U, 0U, 0U, 172U, 19U, 110U, 79U,
    0U, 0U, 214U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 225U, 0U, 0U, 69U, 123U, 3U, 187U, 0U, 0U, 0U, 0U, 125U, 67U,
    49U, 143U, 0U, 0U, 0U, 0U, 178U, 13U, 104U, 87U, 0U, 0U, 0U, 0U, 0U, 108U,
    40U, 0U, 0U, 3U, 155U, 245U, 230U, 104U, 0U, 89U, 202U, 130U, 73U, 164U, 7U,
    109U, 164U, 108U, 40U, 0U, 0U, 26U, 231U, 195U, 40U, 0U, 0U, 0U, 38U, 207U,
    190U, 29U, 0U, 0U, 0U, 108U, 163U, 223U, 7U, 0U, 0U, 108U, 40U, 230U, 38U,
    145U, 76U, 117U, 107U, 230U, 7U, 42U, 181U, 246U, 221U, 67U, 0U, 0U, 0U,
    108U, 40U, 0U, 0U, 80U, 234U, 221U, 50U, 0U, 0U, 106U, 126U, 211U, 40U, 81U,
    171U, 0U, 50U, 179U, 2U, 212U, 39U, 90U, 170U, 15U, 194U, 21U, 0U, 83U, 235U,
    222U, 52U, 170U, 60U, 0U, 0U, 0U, 0U, 0U, 114U, 117U, 0U, 0U, 0U, 0U, 0U,
    57U, 173U, 48U, 219U, 236U, 86U, 0U, 19U, 194U, 17U, 166U, 89U, 38U, 218U,
    1U, 176U, 53U, 0U, 167U, 92U, 45U, 220U, 123U, 109U, 0U, 0U, 49U, 221U, 236U,
    88U, 0U, 0U, 83U, 227U, 235U, 93U, 0U, 0U, 0U, 1U, 240U, 84U, 72U, 238U, 0U,
    0U, 0U, 0U, 230U, 69U, 73U, 208U, 0U, 0U, 0U, 3U, 171U, 218U, 208U, 42U, 0U,
    0U, 12U, 199U, 146U, 230U, 87U, 0U, 91U, 198U, 107U, 179U, 0U, 86U, 229U,
    17U, 111U, 162U, 129U, 183U, 0U, 0U, 172U, 181U, 177U, 80U, 55U, 252U, 110U,
    13U, 41U, 240U, 215U, 1U, 0U, 81U, 209U, 247U, 228U, 160U, 247U, 101U, 77U,
    MAX_uint8_T, 10U, 53U, 241U, 0U, 28U, 216U, 0U, 0U, 0U, 48U, 94U, 0U, 19U,
    216U, 35U, 0U, 150U, 115U, 0U, 6U, 239U, 26U, 0U, 43U, 240U, 0U, 0U, 65U,
    228U, 0U, 0U, 43U, 240U, 0U, 0U, 6U, 239U, 25U, 0U, 0U, 150U, 113U, 0U, 0U,
    19U, 216U, 35U, 0U, 0U, 48U, 94U, 107U, 34U, 0U, 0U, 51U, 209U, 8U, 0U, 0U,
    142U, 122U, 0U, 0U, 53U, 219U, 0U, 0U, 9U, MAX_uint8_T, 17U, 0U, 0U, 252U,
    40U, 0U, 9U, MAX_uint8_T, 17U, 0U, 52U, 219U, 0U, 0U, 140U, 122U, 0U, 50U,
    209U, 8U, 0U, 107U, 34U, 0U, 0U, 0U, 0U, 124U, 69U, 0U, 0U, 58U, 208U, 141U,
    142U, 217U, 9U, 0U, 19U, 131U, 142U, 2U, 0U, 0U, 123U, 57U, 109U, 70U, 0U,
    0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U,
    0U, 168U, 52U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 168U, 52U, 0U, 0U,
    0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U,
    212U, 160U, 105U, 147U, 186U, 51U, 32U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 212U, 160U, 0U, 0U, 0U, 220U,
    10U, 0U, 0U, 45U, 186U, 0U, 0U, 0U, 118U, 113U, 0U, 0U, 0U, 191U, 41U, 0U,
    0U, 13U, 218U, 0U, 0U, 0U, 80U, 151U, 0U, 0U, 0U, 153U, 78U, 0U, 0U, 0U,
    219U, 12U, 0U, 0U, 42U, 189U, 0U, 0U, 0U, 115U, 116U, 0U, 0U, 0U, 188U, 44U,
    0U, 0U, 0U, 0U, 6U, 155U, 244U, 222U, 79U, 0U, 0U, 130U, 192U, 23U, 68U,
    239U, 29U, 4U, 235U, 65U, 0U, 0U, 165U, 134U, 31U, MAX_uint8_T, 18U, 0U, 0U,
    119U, 182U, 53U, MAX_uint8_T, 4U, 0U, 0U, 105U, 204U, 31U, MAX_uint8_T, 18U,
    0U, 0U, 120U, 181U, 3U, 234U, 64U, 0U, 0U, 168U, 133U, 0U, 128U, 190U, 23U,
    70U, 240U, 29U, 0U, 6U, 156U, 245U, 223U, 79U, 0U, 1U, 60U, 149U, 157U, 0U,
    0U, 40U, 178U, 186U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U, 116U,
    180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U,
    116U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 48U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 112U, 200U, MAX_uint8_T, 251U, 208U,
    65U, 0U, 0U, 0U, 8U, 120U, 240U, 10U, 0U, 0U, 0U, 18U, MAX_uint8_T, 42U, 0U,
    0U, 0U, 81U, 237U, 9U, 0U, 0U, 35U, 224U, 76U, 0U, 0U, 43U, 220U, 73U, 0U,
    0U, 30U, 226U, 64U, 0U, 0U, 0U, 187U, 148U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 168U, MAX_uint8_T,
    249U, 209U, 67U, 0U, 0U, 0U, 8U, 133U, 221U, 0U, 0U, 0U, 0U, 59U, 234U, 0U,
    0U, 4U, 38U, 183U, 111U, 0U, 0U, 252U, MAX_uint8_T, 183U, 26U, 0U, 0U, 3U,
    28U, 139U, 231U, 14U, 0U, 0U, 0U, 5U, 253U, 60U, 0U, 0U, 11U, 122U, 244U,
    20U, 200U, MAX_uint8_T, 246U, 202U, 67U, 0U, 0U, 0U, 0U, 9U, 211U, 156U, 0U,
    0U, 0U, 0U, 158U, 188U, 156U, 0U, 0U, 0U, 96U, 153U, 104U, 156U, 0U, 0U, 44U,
    200U, 9U, 104U, 156U, 0U, 12U, 205U, 41U, 0U, 104U, 156U, 0U, 97U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 196U, 0U,
    0U, 0U, 0U, 124U, 156U, 0U, 0U, 0U, 0U, 0U, 124U, 156U, 0U, 0U, 0U, 0U, 0U,
    124U, 156U, 0U, 100U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 0U,
    100U, 160U, 0U, 0U, 0U, 0U, 100U, 160U, 0U, 0U, 0U, 0U, 100U, 253U, 224U,
    147U, 16U, 0U, 0U, 8U, 49U, 194U, 180U, 0U, 0U, 0U, 0U, 43U, MAX_uint8_T,
    16U, 0U, 0U, 0U, 35U, MAX_uint8_T, 25U, 0U, 0U, 18U, 167U, 204U, 0U, 140U,
    MAX_uint8_T, 236U, 173U, 30U, 0U, 0U, 0U, 117U, 225U, 254U, MAX_uint8_T, 72U,
    0U, 100U, 215U, 48U, 2U, 0U, 0U, 0U, 219U, 80U, 0U, 0U, 0U, 0U, 17U,
    MAX_uint8_T, 117U, 226U, 237U, 144U, 3U, 43U, MAX_uint8_T, 169U, 20U, 45U,
    229U, 107U, 29U, MAX_uint8_T, 40U, 0U, 0U, 133U, 173U, 3U, 241U, 63U, 0U, 0U,
    129U, 158U, 0U, 140U, 195U, 27U, 39U, 224U, 69U, 0U, 10U, 162U, 244U, 224U,
    102U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 224U, 0U,
    0U, 0U, 0U, 136U, 145U, 0U, 0U, 0U, 36U, 225U, 15U, 0U, 0U, 0U, 180U, 94U,
    0U, 0U, 0U, 74U, 213U, 2U, 0U, 0U, 4U, 216U, 85U, 0U, 0U, 0U, 101U, 228U, 3U,
    0U, 0U, 0U, 208U, 134U, 0U, 0U, 0U, 21U, MAX_uint8_T, 67U, 0U, 0U, 0U, 1U,
    137U, 233U, 241U, 163U, 8U, 89U, 197U, 22U, 27U, 206U, 105U, 114U, 176U, 0U,
    0U, 171U, 86U, 18U, 216U, 174U, 121U, 159U, 2U, 12U, 179U, 191U, 252U, 125U,
    1U, 161U, 128U, 0U, 58U, 227U, 127U, 236U, 62U, 0U, 0U, 103U, 203U, 194U,
    171U, 20U, 26U, 187U, 149U, 32U, 180U, 242U, 234U, 154U, 12U, 0U, 13U, 160U,
    239U, 226U, 94U, 0U, 0U, 159U, 154U, 14U, 71U, 245U, 45U, 2U, 246U, 31U, 0U,
    0U, 160U, 148U, 7U, 252U, 37U, 0U, 0U, 137U, 187U, 0U, 185U, 162U, 15U, 53U,
    229U, 196U, 0U, 26U, 184U, 245U, 188U, 164U, 165U, 0U, 0U, 0U, 0U, 0U, 196U,
    101U, 0U, 0U, 0U, 15U, 121U, 221U, 6U, 0U, 164U, MAX_uint8_T, 246U, 181U,
    34U, 0U, 176U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 120U,
    176U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 119U, 96U, 104U,
    145U, 26U, 0U, 0U, 0U, 0U, 0U, 36U, 160U, 56U, 0U, 0U, 0U, 34U, 158U, 210U,
    87U, 1U, 0U, 32U, 156U, 212U, 91U, 2U, 0U, 0U, 63U, 245U, 180U, 6U, 0U, 0U,
    0U, 0U, 0U, 32U, 157U, 212U, 91U, 2U, 0U, 0U, 0U, 0U, 0U, 34U, 159U, 211U,
    90U, 2U, 0U, 0U, 0U, 0U, 0U, 36U, 161U, 56U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 60U, 144U, 102U, 5U, 0U, 0U, 0U, 0U, 0U, 25U, 146U,
    215U, 99U, 4U, 0U, 0U, 0U, 0U, 0U, 27U, 149U, 215U, 97U, 4U, 0U, 0U, 0U, 0U,
    0U, 59U, 243U, 185U, 8U, 0U, 0U, 28U, 149U, 215U, 98U, 4U, 0U, 27U, 148U,
    216U, 100U, 4U, 0U, 0U, 0U, 145U, 103U, 5U, 0U, 0U, 0U, 0U, 0U, 200U,
    MAX_uint8_T, 245U, 188U, 34U, 0U, 0U, 16U, 174U, 179U, 0U, 0U, 0U, 128U,
    193U, 0U, 0U, 21U, 232U, 83U, 0U, 0U, 179U, 107U, 0U, 0U, 67U, 201U, 0U, 0U,
    0U, 125U, 162U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 136U, 160U, 0U, 0U, 0U, 0U,
    0U, 77U, 186U, 240U, 244U, 185U, 50U, 0U, 0U, 2U, 155U, 178U, 61U, 10U, 22U,
    89U, 217U, 48U, 0U, 125U, 124U, 3U, 143U, 240U, MAX_uint8_T, 111U, 43U, 173U,
    19U, 171U, 0U, 131U, 117U, 13U, 165U, 55U, 0U, 175U, 87U, 81U, 10U, 197U, 0U,
    43U, 238U, 6U, 9U, 167U, 110U, 65U, 54U, 189U, 44U, 185U, 201U, 20U, 164U,
    75U, 73U, 143U, 22U, 230U, 208U, 51U, 233U, 220U, 97U, 0U, 2U, 197U, 138U,
    35U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 12U, 138U, 221U, 253U, MAX_uint8_T, 77U, 0U,
    0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U,
    0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U,
    85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U,
    145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U,
    224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 224U,
    MAX_uint8_T, 250U, 211U, 74U, 0U, 224U, 88U, 21U, 154U, 239U, 1U, 224U, 88U,
    0U, 66U, 249U, 4U, 224U, 89U, 32U, 184U, 137U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, 192U, 16U, 0U, 224U, 89U, 32U, 157U, 220U, 14U, 224U, 88U, 0U,
    2U, 244U, 88U, 224U, 88U, 9U, 81U, MAX_uint8_T, 65U, 224U, MAX_uint8_T, 254U,
    229U, 128U, 0U, 0U, 0U, 98U, 207U, 248U, MAX_uint8_T, MAX_uint8_T, 160U, 0U,
    125U, 240U, 93U, 18U, 0U, 0U, 0U, 19U, 248U, 99U, 0U, 0U, 0U, 0U, 0U, 77U,
    MAX_uint8_T, 13U, 0U, 0U, 0U, 0U, 0U, 96U, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 78U,
    MAX_uint8_T, 15U, 0U, 0U, 0U, 0U, 0U, 21U, 250U, 108U, 0U, 0U, 0U, 0U, 0U,
    0U, 135U, 244U, 104U, 23U, 0U, 0U, 0U, 0U, 1U, 107U, 211U, 249U, MAX_uint8_T,
    MAX_uint8_T, 164U, 224U, MAX_uint8_T, MAX_uint8_T, 247U, 215U, 119U, 2U, 0U,
    224U, 88U, 2U, 19U, 87U, 239U, 135U, 0U, 224U, 88U, 0U, 0U, 0U, 98U, 247U,
    21U, 224U, 88U, 0U, 0U, 0U, 11U, MAX_uint8_T, 68U, 224U, 88U, 0U, 0U, 0U, 0U,
    244U, 89U, 224U, 88U, 0U, 0U, 0U, 15U, MAX_uint8_T, 65U, 224U, 88U, 0U, 0U,
    0U, 102U, 240U, 10U, 224U, 88U, 0U, 23U, 94U, 240U, 106U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, 246U, 201U, 86U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 56U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 224U,
    88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 224U, 88U, 0U, 0U, 0U, 224U,
    88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 0U, 100U,
    208U, 248U, MAX_uint8_T, MAX_uint8_T, 160U, 0U, 128U, 240U, 93U, 18U, 0U, 0U,
    0U, 19U, 248U, 99U, 0U, 0U, 0U, 0U, 0U, 77U, MAX_uint8_T, 13U, 0U, 0U, 0U,
    0U, 0U, 96U, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 78U, MAX_uint8_T, 15U, 0U, 0U, 0U,
    152U, 164U, 21U, 250U, 106U, 0U, 0U, 0U, 152U, 164U, 0U, 138U, 243U, 104U,
    24U, 17U, 171U, 164U, 0U, 1U, 108U, 210U, 248U, 242U, 206U, 101U, 224U, 88U,
    0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U,
    0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 180U, 224U, 88U, 0U, 0U,
    0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U,
    136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 228U, 88U, 228U, 88U, 228U,
    88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 0U,
    0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U,
    0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U,
    148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 156U, 151U, 0U, 0U, 20U,
    218U, 94U, 20U, MAX_uint8_T, 236U, 147U, 3U, 224U, 72U, 0U, 0U, 157U, 158U,
    0U, 224U, 72U, 0U, 104U, 204U, 8U, 0U, 224U, 72U, 56U, 229U, 30U, 0U, 0U,
    224U, 95U, 225U, 67U, 0U, 0U, 0U, 224U, 204U, 215U, 7U, 0U, 0U, 0U, 224U,
    82U, 205U, 165U, 0U, 0U, 0U, 224U, 72U, 27U, 230U, 127U, 0U, 0U, 224U, 72U,
    0U, 54U, 246U, 90U, 0U, 224U, 72U, 0U, 0U, 91U, 247U, 58U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U,
    0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 64U, 224U, 245U, 12U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 56U, 224U, 247U, 94U, 0U, 0U, 0U, 216U, 249U, 56U, 224U, 171U,
    187U, 0U, 0U, 58U, 189U, 236U, 56U, 224U, 78U, 252U, 27U, 0U, 153U, 93U,
    236U, 56U, 224U, 44U, 197U, 117U, 8U, 227U, 11U, 236U, 56U, 224U, 44U, 104U,
    209U, 88U, 158U, 0U, 236U, 56U, 224U, 44U, 18U, 249U, 217U, 63U, 0U, 236U,
    56U, 224U, 44U, 0U, 174U, 222U, 1U, 0U, 236U, 56U, 224U, 44U, 0U, 0U, 0U, 0U,
    0U, 236U, 56U, 224U, 163U, 0U, 0U, 0U, 80U, 192U, 224U, MAX_uint8_T, 68U, 0U,
    0U, 80U, 192U, 224U, 183U, 220U, 8U, 0U, 80U, 192U, 224U, 54U, 223U, 133U,
    0U, 80U, 192U, 224U, 44U, 73U, 250U, 43U, 80U, 192U, 224U, 44U, 0U, 168U,
    196U, 81U, 192U, 224U, 44U, 0U, 23U, 239U, 183U, 192U, 224U, 44U, 0U, 0U,
    102U, MAX_uint8_T, 192U, 224U, 44U, 0U, 0U, 1U, 195U, 192U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 224U, MAX_uint8_T, 252U, 229U, 141U, 1U,
    224U, 88U, 8U, 73U, 253U, 75U, 224U, 88U, 0U, 0U, 239U, 89U, 224U, 88U, 20U,
    129U, 239U, 26U, 224U, MAX_uint8_T, 236U, 184U, 52U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U, 231U, 148U, 14U, 0U, 0U, 0U, 122U,
    235U, 80U, 14U, 45U, 195U, 197U, 4U, 0U, 17U, 247U, 91U, 0U, 0U, 0U, 21U,
    244U, 90U, 0U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U, 158U, 0U, 96U,
    243U, 0U, 0U, 0U, 0U, 0U, 160U, 178U, 0U, 76U, MAX_uint8_T, 12U, 0U, 0U, 0U,
    0U, 184U, 157U, 0U, 16U, 245U, 94U, 0U, 0U, 0U, 21U, 244U, 89U, 0U, 0U, 118U,
    236U, 78U, 13U, 46U, 196U, 197U, 5U, 0U, 0U, 0U, 103U, 217U, 250U, 250U,
    215U, 15U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 25U, 187U, 212U, 98U, 15U, 0U, 0U, 0U,
    0U, 0U, 0U, 1U, 87U, 208U, 57U, 224U, MAX_uint8_T, 254U, 231U, 123U, 0U, 0U,
    224U, 88U, 9U, 91U, MAX_uint8_T, 49U, 0U, 224U, 88U, 0U, 4U, 251U, 70U, 0U,
    224U, 88U, 22U, 138U, 225U, 10U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 214U,
    29U, 0U, 0U, 224U, 88U, 55U, 248U, 47U, 0U, 0U, 224U, 88U, 0U, 152U, 205U,
    4U, 0U, 224U, 88U, 0U, 16U, 232U, 122U, 0U, 224U, 88U, 0U, 0U, 91U, 248U,
    42U, 0U, 101U, 225U, MAX_uint8_T, MAX_uint8_T, 84U, 45U, 242U, 53U, 1U, 0U,
    0U, 78U, 233U, 9U, 0U, 0U, 0U, 11U, 216U, 206U, 55U, 0U, 0U, 0U, 18U, 161U,
    253U, 148U, 5U, 0U, 0U, 0U, 62U, 233U, 143U, 0U, 0U, 0U, 0U, 116U, 208U, 0U,
    0U, 0U, 22U, 187U, 151U, 104U, MAX_uint8_T, MAX_uint8_T, 232U, 153U, 12U,
    228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 124U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U,
    104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U,
    0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U,
    0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U,
    0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U,
    72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U,
    0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U,
    235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U,
    51U, 0U, 154U, 157U, 0U, 0U, 0U, 0U, 117U, 158U, 61U, 241U, 9U, 0U, 0U, 0U,
    206U, 69U, 1U, 223U, 87U, 0U, 0U, 40U, 231U, 3U, 0U, 131U, 180U, 0U, 0U,
    129U, 145U, 0U, 0U, 38U, 250U, 21U, 0U, 218U, 55U, 0U, 0U, 0U, 201U, 109U,
    52U, 221U, 0U, 0U, 0U, 0U, 108U, 202U, 142U, 132U, 0U, 0U, 0U, 0U, 20U, 250U,
    240U, 42U, 0U, 0U, 0U, 0U, 0U, 178U, 208U, 0U, 0U, 0U, 221U, 83U, 0U, 0U,
    130U, 231U, 0U, 0U, 0U, 226U, 29U, 157U, 146U, 0U, 0U, 188U, MAX_uint8_T,
    31U, 0U, 39U, 215U, 0U, 93U, 209U, 0U, 3U, 227U, 213U, 87U, 0U, 108U, 146U,
    0U, 30U, 254U, 18U, 49U, 183U, 156U, 143U, 0U, 177U, 76U, 0U, 0U, 222U, 79U,
    108U, 125U, 100U, 199U, 4U, 236U, 12U, 0U, 0U, 159U, 142U, 166U, 67U, 44U,
    248U, 66U, 194U, 0U, 0U, 0U, 95U, 205U, 221U, 12U, 2U, 241U, 183U, 124U, 0U,
    0U, 0U, 31U, 254U, 206U, 0U, 0U, 188U, MAX_uint8_T, 55U, 0U, 0U, 0U, 0U,
    224U, 149U, 0U, 0U, 132U, 239U, 3U, 0U, 0U, 118U, 235U, 19U, 0U, 0U, 91U,
    203U, 3U, 5U, 212U, 157U, 0U, 20U, 230U, 48U, 0U, 0U, 62U, 253U, 60U, 165U,
    136U, 0U, 0U, 0U, 0U, 162U, 231U, 220U, 9U, 0U, 0U, 0U, 0U, 48U, MAX_uint8_T,
    135U, 0U, 0U, 0U, 0U, 0U, 174U, 204U, 243U, 28U, 0U, 0U, 0U, 80U, 214U, 9U,
    201U, 172U, 0U, 0U, 14U, 227U, 59U, 0U, 49U, 252U, 73U, 0U, 151U, 149U, 0U,
    0U, 0U, 143U, 220U, 8U, 159U, 199U, 1U, 0U, 0U, 39U, 231U, 22U, 24U, 242U,
    92U, 0U, 0U, 190U, 102U, 0U, 0U, 120U, 228U, 11U, 96U, 198U, 1U, 0U, 0U, 7U,
    221U, 150U, 231U, 46U, 0U, 0U, 0U, 0U, 81U, MAX_uint8_T, 139U, 0U, 0U, 0U,
    0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U,
    0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    56U, 0U, 0U, 0U, 40U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 38U, 246U, 90U, 0U, 0U, 0U, 2U, 197U,
    176U, 0U, 0U, 0U, 0U, 114U, 237U, 24U, 0U, 0U, 0U, 37U, 246U, 91U, 0U, 0U,
    0U, 2U, 196U, 177U, 0U, 0U, 0U, 0U, 113U, 238U, 25U, 0U, 0U, 0U, 36U, 246U,
    93U, 0U, 0U, 0U, 0U, 112U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 176U, 216U, MAX_uint8_T, 120U, 216U, 44U, 0U, 216U,
    44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U,
    44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, MAX_uint8_T, 120U, 184U, 47U,
    0U, 0U, 0U, 111U, 120U, 0U, 0U, 0U, 38U, 193U, 0U, 0U, 0U, 0U, 217U, 14U, 0U,
    0U, 0U, 149U, 82U, 0U, 0U, 0U, 76U, 155U, 0U, 0U, 0U, 10U, 220U, 0U, 0U, 0U,
    0U, 186U, 44U, 0U, 0U, 0U, 114U, 117U, 0U, 0U, 0U, 41U, 190U, 0U, 0U, 0U, 0U,
    218U, 13U, 143U, MAX_uint8_T, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U,
    191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U,
    191U, 0U, 67U, 191U, 143U, MAX_uint8_T, 191U, 0U, 0U, 0U, 110U, 25U, 0U, 0U,
    0U, 0U, 17U, 235U, 151U, 0U, 0U, 0U, 0U, 137U, 115U, 208U, 36U, 0U, 0U, 26U,
    215U, 7U, 81U, 167U, 0U, 0U, 153U, 96U, 0U, 0U, 198U, 48U, 36U, 208U, 2U, 0U,
    0U, 64U, 183U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    124U, 64U, 225U, 23U, 0U, 0U, 77U, 175U, 0U, 0U, 60U, 200U, 244U, 183U, 9U,
    0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U,
    91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U,
    84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U,
    216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 113U, 200U, 243U,
    173U, 14U, 216U, 196U, 45U, 21U, 204U, 137U, 216U, 80U, 0U, 0U, 107U, 207U,
    216U, 80U, 0U, 0U, 90U, 222U, 216U, 125U, 0U, 0U, 119U, 191U, 216U, 246U,
    62U, 34U, 220U, 98U, 216U, 115U, 211U, 244U, 147U, 2U, 0U, 33U, 180U, 240U,
    MAX_uint8_T, 128U, 3U, 212U, 180U, 23U, 0U, 0U, 53U, MAX_uint8_T, 32U, 0U,
    0U, 0U, 78U, 251U, 0U, 0U, 0U, 0U, 46U, MAX_uint8_T, 33U, 0U, 0U, 0U, 0U,
    198U, 183U, 26U, 0U, 0U, 0U, 25U, 178U, 245U, MAX_uint8_T, 148U, 0U, 0U, 0U,
    0U, 0U, 196U, 104U, 0U, 0U, 0U, 0U, 0U, 196U, 104U, 0U, 47U, 208U, 241U,
    154U, 202U, 104U, 1U, 212U, 130U, 15U, 82U, 239U, 104U, 49U, 249U, 8U, 0U,
    0U, 196U, 104U, 79U, 229U, 0U, 0U, 0U, 196U, 104U, 64U, 243U, 2U, 0U, 0U,
    196U, 104U, 12U, 238U, 105U, 11U, 107U, 242U, 104U, 0U, 73U, 221U, 241U,
    130U, 196U, 104U, 0U, 35U, 194U, 241U, 167U, 9U, 2U, 211U, 108U, 15U, 183U,
    115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U, 0U, 0U, 0U, 196U, 152U,
    21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U, 0U, 57U, 218U, 253U,
    196U, 0U, 153U, 160U, 2U, 0U, 136U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    32U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U,
    0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U,
    42U, 204U, 241U, 154U, 202U, 104U, 1U, 208U, 147U, 16U, 76U, 238U, 104U, 49U,
    251U, 14U, 0U, 0U, 196U, 104U, 79U, 230U, 0U, 0U, 0U, 196U, 104U, 61U, 243U,
    2U, 0U, 0U, 196U, 103U, 9U, 234U, 104U, 11U, 105U, 242U, 97U, 0U, 66U, 219U,
    242U, 136U, 203U, 79U, 0U, 0U, 0U, 7U, 77U, 242U, 22U, 0U, 194U, MAX_uint8_T,
    247U, 206U, 71U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U,
    216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U, 239U, 67U, 216U, 95U,
    0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U,
    92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U,
    0U, 0U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U,
    216U, 80U, 0U, 0U, 168U, 128U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 128U, 0U, 0U,
    168U, 128U, 0U, 0U, 168U, 128U, 0U, 0U, 168U, 128U, 0U, 0U, 168U, 128U, 0U,
    0U, 168U, 128U, 0U, 0U, 170U, 124U, 0U, 10U, 211U, 88U, 232U, 248U, 176U, 7U,
    216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 98U,
    208U, 10U, 216U, 80U, 53U, 230U, 34U, 0U, 216U, 102U, 225U, 72U, 0U, 0U,
    216U, 203U, 224U, 12U, 0U, 0U, 216U, 85U, 192U, 176U, 1U, 0U, 216U, 80U, 19U,
    221U, 135U, 0U, 216U, 80U, 0U, 42U, 240U, 93U, 216U, 80U, 216U, 80U, 216U,
    80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U,
    117U, 198U, 245U, 128U, 14U, 184U, 243U, 133U, 0U, 216U, 245U, 80U, 36U,
    251U, 163U, 62U, 61U, 254U, 13U, 216U, 124U, 0U, 0U, 240U, 100U, 0U, 12U,
    MAX_uint8_T, 31U, 216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U, MAX_uint8_T, 32U,
    216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U, MAX_uint8_T, 32U, 216U, 80U, 0U, 0U,
    240U, 56U, 0U, 12U, MAX_uint8_T, 32U, 216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U,
    MAX_uint8_T, 32U, 216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U,
    239U, 67U, 216U, 95U, 0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U,
    80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U,
    204U, 92U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 216U, 113U, 200U, 243U, 173U, 14U, 216U,
    196U, 45U, 21U, 204U, 137U, 216U, 80U, 0U, 0U, 107U, 207U, 216U, 80U, 0U, 0U,
    90U, 222U, 216U, 104U, 0U, 0U, 119U, 191U, 216U, 209U, 53U, 34U, 220U, 98U,
    216U, 99U, 198U, 244U, 147U, 2U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U,
    0U, 0U, 0U, 0U, 47U, 208U, 241U, 154U, 202U, 104U, 1U, 212U, 130U, 15U, 82U,
    239U, 104U, 49U, 249U, 8U, 0U, 0U, 196U, 104U, 79U, 229U, 0U, 0U, 0U, 196U,
    104U, 64U, 243U, 2U, 0U, 0U, 196U, 104U, 12U, 238U, 105U, 11U, 107U, 242U,
    104U, 0U, 73U, 221U, 241U, 130U, 196U, 104U, 0U, 0U, 0U, 0U, 0U, 196U, 104U,
    0U, 0U, 0U, 0U, 0U, 196U, 104U, 216U, 115U, 206U, 170U, 216U, 209U, 43U, 0U,
    216U, 87U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 98U, 230U, MAX_uint8_T, 184U, 0U, 2U, 246U, 59U, 0U,
    0U, 0U, 0U, 226U, 157U, 20U, 0U, 0U, 0U, 46U, 198U, 244U, 107U, 0U, 0U, 0U,
    0U, 88U, 254U, 28U, 0U, 0U, 0U, 56U, 251U, 23U, 20U, MAX_uint8_T,
    MAX_uint8_T, 228U, 98U, 0U, 0U, 191U, 90U, 0U, 0U, 152U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 4U, 0U, 204U, 92U, 0U, 0U, 0U, 204U, 92U, 0U, 0U,
    0U, 204U, 92U, 0U, 0U, 0U, 203U, 93U, 0U, 0U, 0U, 183U, 154U, 4U, 0U, 0U,
    61U, 226U, 251U, 0U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U,
    72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 235U, 61U,
    0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U, 72U, 80U, 234U, 227U, 88U,
    220U, 72U, 185U, 109U, 0U, 0U, 30U, 237U, 6U, 99U, 194U, 0U, 0U, 118U, 153U,
    0U, 18U, 248U, 25U, 0U, 208U, 61U, 0U, 0U, 182U, 107U, 40U, 224U, 1U, 0U, 0U,
    96U, 191U, 130U, 133U, 0U, 0U, 0U, 16U, 246U, 228U, 41U, 0U, 0U, 0U, 0U,
    179U, 205U, 0U, 0U, 0U, 203U, 83U, 0U, 12U, 250U, 94U, 0U, 5U, 236U, 12U,
    137U, 147U, 0U, 77U, 234U, 155U, 0U, 66U, 185U, 0U, 71U, 211U, 0U, 147U,
    115U, 216U, 0U, 140U, 109U, 0U, 10U, 248U, 20U, 210U, 11U, 233U, 22U, 213U,
    33U, 0U, 0U, 194U, 113U, 189U, 0U, 173U, 112U, 212U, 0U, 0U, 0U, 128U, 234U,
    120U, 0U, 110U, 234U, 137U, 0U, 0U, 0U, 61U, MAX_uint8_T, 50U, 0U, 47U,
    MAX_uint8_T, 61U, 0U, 0U, 30U, 240U, 76U, 0U, 3U, 205U, 79U, 0U, 95U, 232U,
    20U, 113U, 177U, 0U, 0U, 0U, 173U, 188U, 232U, 29U, 0U, 0U, 0U, 61U,
    MAX_uint8_T, 149U, 0U, 0U, 0U, 3U, 202U, 154U, 242U, 33U, 0U, 0U, 123U, 171U,
    0U, 155U, 195U, 2U, 44U, 228U, 22U, 0U, 12U, 220U, 119U, 187U, 131U, 0U, 0U,
    23U, 240U, 13U, 97U, 220U, 0U, 0U, 114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U,
    59U, 0U, 0U, 172U, 142U, 45U, 216U, 0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U,
    0U, 0U, 7U, 240U, 244U, 23U, 0U, 0U, 0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U,
    179U, 76U, 0U, 0U, 0U, 0U, 54U, 229U, 3U, 0U, 0U, 0U, 24U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U, 2U,
    186U, 174U, 0U, 0U, 0U, 0U, 135U, 215U, 13U, 0U, 0U, 0U, 80U, 241U, 41U, 0U,
    0U, 0U, 39U, 241U, 83U, 0U, 0U, 0U, 12U, 214U, 136U, 0U, 0U, 0U, 0U, 72U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 0U,
    84U, 223U, 27U, 0U, 235U, 47U, 0U, 0U, 230U, 35U, 0U, 0U, 189U, 61U, 0U, 14U,
    205U, 23U, 0U, 220U, 155U, 0U, 0U, 14U, 204U, 23U, 0U, 0U, 190U, 61U, 0U, 0U,
    230U, 35U, 0U, 0U, 235U, 47U, 0U, 0U, 86U, 224U, 27U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 50U, 216U, 66U, 0U, 0U, 72U, 210U, 0U, 0U, 59U, 205U,
    0U, 0U, 85U, 164U, 0U, 0U, 43U, 190U, 9U, 0U, 0U, 179U, 195U, 0U, 42U, 189U,
    9U, 0U, 85U, 165U, 0U, 0U, 59U, 205U, 0U, 0U, 71U, 210U, 0U, 51U, 217U, 68U,
    0U, 6U, 189U, 242U, 170U, 66U, 27U, 222U, 79U, 168U, 21U, 111U, 206U, 244U,
    110U, 176U, 120U, 0U, 0U, 144U, 87U, 151U, 94U, 158U, 101U, 165U, 108U, 172U,
    115U, 176U, 119U, 176U, 120U, 0U, 0U, 28U, 120U, 0U, 0U, 0U, 102U, 223U,
    MAX_uint8_T, MAX_uint8_T, 32U, 75U, 236U, 80U, 120U, 0U, 0U, 170U, 150U, 28U,
    120U, 0U, 0U, 195U, 125U, 28U, 120U, 0U, 0U, 165U, 158U, 28U, 120U, 0U, 0U,
    65U, 246U, 102U, 120U, 0U, 0U, 0U, 97U, 224U, MAX_uint8_T, MAX_uint8_T, 32U,
    0U, 0U, 28U, 120U, 0U, 0U, 0U, 0U, 114U, 234U, MAX_uint8_T, 80U, 0U, 33U,
    243U, 34U, 0U, 0U, 0U, 76U, 213U, 0U, 0U, 0U, 0U, 84U, 212U, 0U, 0U, 0U, 96U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 84U, 211U, 0U, 0U, 0U,
    0U, 93U, 190U, 0U, 0U, 0U, 18U, 192U, 76U, 0U, 0U, 0U, 140U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 104U, 52U, 117U, 0U, 0U, 0U, 11U,
    160U, 0U, 0U, 165U, 174U, 242U, 220U, 191U, 67U, 0U, 0U, 139U, 147U, 14U,
    44U, 216U, 37U, 0U, 0U, 197U, 29U, 0U, 0U, 134U, 89U, 0U, 0U, 139U, 147U,
    14U, 42U, 215U, 37U, 0U, 0U, 165U, 174U, 242U, 221U, 191U, 67U, 0U, 52U,
    117U, 0U, 0U, 0U, 11U, 160U, 0U, 53U, 246U, 47U, 0U, 0U, 45U, 209U, 12U, 0U,
    132U, 208U, 5U, 10U, 207U, 49U, 0U, 0U, 5U, 207U, 131U, 155U, 111U, 0U, 0U,
    0U, 0U, 46U, 246U, 180U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U, 0U, 208U, 88U, 0U, 0U, 0U, 0U,
    140U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U,
    0U, 208U, 88U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 88U, 0U, 0U, 0U, 48U, 172U, 48U,
    172U, 48U, 172U, 48U, 172U, 0U, 0U, 0U, 0U, 0U, 0U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 9U, 156U, 235U, MAX_uint8_T, MAX_uint8_T, 32U, 125U,
    179U, 23U, 0U, 0U, 0U, 135U, 171U, 6U, 0U, 0U, 0U, 18U, 237U, 227U, 109U, 6U,
    0U, 115U, 119U, 42U, 163U, 206U, 12U, 156U, 117U, 0U, 0U, 187U, 82U, 43U,
    226U, 128U, 17U, 198U, 36U, 0U, 18U, 135U, 232U, 184U, 0U, 0U, 0U, 0U, 20U,
    212U, 76U, 0U, 0U, 1U, 32U, 209U, 84U, 180U, MAX_uint8_T, 253U, 226U, 130U,
    1U, 252U, 8U, 168U, 88U, 0U, 0U, 45U, 174U, 239U, 246U, 199U, 79U, 0U, 0U,
    0U, 65U, 213U, 86U, 16U, 8U, 61U, 189U, 120U, 0U, 9U, 199U, 22U, 73U, 216U,
    253U, 204U, 2U, 176U, 50U, 75U, 106U, 12U, 227U, 60U, 2U, 0U, 0U, 38U, 141U,
    102U, 66U, 45U, 180U, 0U, 0U, 0U, 0U, 3U, 167U, 74U, 106U, 12U, 224U, 59U,
    3U, 0U, 0U, 48U, 141U, 8U, 199U, 22U, 71U, 216U, 254U, 204U, 3U, 186U, 51U,
    0U, 65U, 213U, 84U, 14U, 9U, 59U, 187U, 124U, 0U, 0U, 0U, 46U, 177U, 241U,
    246U, 198U, 81U, 0U, 0U, 156U, MAX_uint8_T, 233U, 56U, 0U, 2U, 159U, 111U,
    145U, 239U, MAX_uint8_T, 121U, 183U, 237U, 165U, 227U, 0U, 0U, 126U, 72U,
    57U, 141U, 0U, 107U, 164U, 45U, 206U, 21U, 32U, 241U, 16U, 204U, 85U, 0U, 0U,
    107U, 164U, 45U, 206U, 21U, 0U, 0U, 126U, 73U, 57U, 142U, 180U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 0U, 0U, 160U, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 160U, 60U, 32U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 8U,
    154U, 239U, 221U, 84U, 0U, 132U, 109U, 12U, 35U, 180U, 39U, 152U, 64U, 254U,
    167U, 61U, 91U, 133U, 170U, MAX_uint8_T, 184U, 178U, 39U, 9U, 157U, 240U,
    221U, 86U, 0U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    124U, 0U, 149U, 244U, 186U, 11U, 18U, 201U, 27U, 160U, 73U, 0U, 149U, 245U,
    186U, 11U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U,
    0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, MAX_uint8_T,
    250U, 167U, 2U, 0U, 0U, 16U, 221U, 36U, 0U, 0U, 23U, 212U, 5U, 0U, 9U, 188U,
    60U, 0U, 2U, 173U, 82U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    40U, 0U, MAX_uint8_T, 249U, 160U, 0U, 0U, 0U, 44U, 215U, 0U, 0U, 152U, 253U,
    94U, 0U, 0U, 1U, 38U, 225U, 12U, 0U, 0U, 29U, 227U, 19U, 20U, MAX_uint8_T,
    244U, 131U, 0U, 0U, 163U, 151U, 0U, 85U, 166U, 2U, 0U, 216U, 80U, 0U, 0U,
    204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U,
    80U, 0U, 0U, 204U, 92U, 216U, 81U, 0U, 0U, 216U, 92U, 216U, 144U, 13U, 139U,
    245U, 92U, 216U, 231U, 244U, 122U, 204U, 92U, 216U, 80U, 0U, 0U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 0U, 62U, 214U, 249U, MAX_uint8_T, MAX_uint8_T, 8U,
    174U, MAX_uint8_T, MAX_uint8_T, 116U, 176U, 8U, 145U, MAX_uint8_T,
    MAX_uint8_T, 116U, 176U, 8U, 18U, 169U, 243U, 116U, 176U, 8U, 0U, 0U, 72U,
    116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U,
    0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U,
    176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 212U, 160U, 0U, 156U, 162U, 0U, 0U,
    18U, 226U, 0U, 4U, MAX_uint8_T, 161U, 0U, 45U, 170U, 42U, 0U, 192U, 235U,
    44U, 0U, 0U, 176U, 44U, 0U, 0U, 176U, 44U, 0U, 0U, 176U, 44U, 0U, 216U,
    MAX_uint8_T, MAX_uint8_T, 88U, 0U, 141U, 241U, 222U, 66U, 48U, 222U, 26U,
    76U, 208U, 48U, 221U, 17U, 76U, 208U, 0U, 144U, 243U, 222U, 68U, 81U, 117U,
    17U, 173U, 7U, 0U, 1U, 171U, 99U, 94U, 174U, 3U, 0U, 21U, 242U, 27U, 189U,
    100U, 1U, 171U, 100U, 94U, 174U, 3U, 81U, 117U, 17U, 174U, 7U, 0U, 19U, 133U,
    106U, 0U, 0U, 0U, 38U, 165U, 0U, 0U, 133U, 222U, 120U, 0U, 0U, 5U, 178U, 20U,
    0U, 0U, 0U, 104U, 120U, 0U, 0U, 132U, 71U, 0U, 0U, 0U, 0U, 104U, 120U, 0U,
    61U, 141U, 1U, 201U, 80U, 0U, 0U, 104U, 120U, 15U, 180U, 8U, 97U, 210U, 80U,
    0U, 0U, 104U, 120U, 157U, 46U, 14U, 171U, 124U, 80U, 0U, 0U, 0U, 90U, 112U,
    0U, 138U, 49U, 124U, 80U, 0U, 0U, 31U, 171U, 1U, 0U, 219U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 8U, 2U, 175U, 26U, 0U, 0U, 0U, 0U, 124U, 80U, 0U,
    19U, 133U, 106U, 0U, 0U, 0U, 103U, 100U, 0U, 0U, 133U, 222U, 120U, 0U, 0U,
    38U, 165U, 0U, 0U, 0U, 0U, 104U, 120U, 0U, 5U, 178U, 20U, 0U, 0U, 0U, 0U,
    104U, 120U, 0U, 134U, 106U, MAX_uint8_T, 246U, 134U, 0U, 0U, 104U, 120U, 62U,
    140U, 0U, 0U, 28U, 243U, 1U, 0U, 104U, 136U, 180U, 7U, 0U, 0U, 60U, 184U, 0U,
    0U, 0U, 158U, 44U, 0U, 0U, 24U, 205U, 28U, 0U, 0U, 92U, 111U, 0U, 0U, 9U,
    191U, 59U, 0U, 0U, 32U, 170U, 1U, 0U, 0U, 68U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 4U, 88U, MAX_uint8_T, 237U, 84U, 0U, 0U, 0U, 134U, 70U, 0U, 0U,
    3U, 124U, 131U, 0U, 0U, 62U, 140U, 0U, 0U, 0U, 240U, 229U, 30U, 0U, 16U,
    180U, 7U, 0U, 0U, 0U, 5U, 101U, 171U, 0U, 158U, 46U, 201U, 80U, 0U, 0U, 1U,
    88U, 186U, 92U, 111U, 97U, 210U, 80U, 0U, 108U, MAX_uint8_T, 226U, 95U, 170U,
    15U, 171U, 124U, 80U, 0U, 0U, 0U, 3U, 175U, 25U, 138U, 49U, 124U, 80U, 0U,
    0U, 0U, 124U, 80U, 0U, 219U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 8U, 0U,
    53U, 149U, 0U, 0U, 0U, 0U, 124U, 80U, 0U, 0U, 0U, 140U, 156U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 142U, 145U, 0U, 0U, 0U, 181U, 87U, 0U, 0U, 90U, 195U, 1U, 0U,
    67U, 236U, 29U, 0U, 0U, 177U, 144U, 0U, 0U, 0U, 164U, 185U, 18U, 0U, 0U, 28U,
    184U, 244U, MAX_uint8_T, 220U, 0U, 0U, 74U, 222U, 17U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 87U, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U,
    0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U,
    23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U,
    0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U,
    0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 0U, 0U, 170U, 143U,
    0U, 0U, 0U, 0U, 0U, 0U, 94U, 158U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U,
    83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U,
    101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U,
    0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U,
    0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U,
    0U, 6U, 206U, 229U, 45U, 0U, 0U, 0U, 0U, 0U, 138U, 109U, 45U, 193U, 7U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U,
    0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U,
    0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U,
    10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U,
    236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U,
    0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U,
    108U, 236U, 6U, 0U, 0U, 114U, 232U, 70U, 194U, 6U, 0U, 0U, 0U, 0U, 190U, 44U,
    206U, 173U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U,
    236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U,
    187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U,
    46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U,
    0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U,
    0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 140U, 120U, 56U, 200U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U,
    0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U,
    0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U,
    244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U,
    85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U,
    236U, 6U, 0U, 0U, 3U, 187U, 227U, 38U, 0U, 0U, 0U, 0U, 0U, 34U, 143U, 69U,
    113U, 0U, 0U, 0U, 0U, 0U, 3U, 187U, 228U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 166U,
    236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U,
    187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U,
    46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U,
    0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U,
    0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 0U, 0U, 37U, 250U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 84U, 0U, 0U, 0U, 0U, 176U, 233U, 180U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 63U, 228U, 143U, 180U, 0U, 0U, 0U, 0U, 0U, 0U,
    1U, 204U, 107U, 136U, 180U, 0U, 0U, 0U, 0U, 0U, 0U, 94U, 228U, 7U, 136U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 188U, 0U, 0U, 10U, 227U, 107U, 0U,
    136U, 180U, 0U, 0U, 0U, 0U, 0U, 125U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 180U, 0U, 0U, 0U, 0U, 24U, 243U, 74U, 0U, 0U, 136U, 180U, 0U,
    0U, 0U, 0U, 156U, 149U, 0U, 0U, 0U, 136U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 152U, 0U, 0U, 98U, 207U, 248U, MAX_uint8_T,
    MAX_uint8_T, 160U, 0U, 125U, 240U, 93U, 18U, 0U, 0U, 0U, 19U, 248U, 99U, 0U,
    0U, 0U, 0U, 0U, 77U, MAX_uint8_T, 13U, 0U, 0U, 0U, 0U, 0U, 96U, 244U, 0U, 0U,
    0U, 0U, 0U, 0U, 78U, MAX_uint8_T, 15U, 0U, 0U, 0U, 0U, 0U, 21U, 250U, 108U,
    0U, 0U, 0U, 0U, 0U, 0U, 135U, 244U, 104U, 23U, 0U, 0U, 0U, 0U, 1U, 107U,
    211U, 249U, MAX_uint8_T, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 193U, 124U, 0U,
    0U, 0U, 0U, 0U, 0U, 36U, 208U, 0U, 0U, 0U, 0U, 0U, 44U, 253U, 123U, 0U, 0U,
    9U, 194U, 109U, 0U, 0U, 0U, 0U, 14U, 196U, 42U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, 0U, 71U, 218U, 24U, 0U, 0U,
    19U, 202U, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 56U, 0U, 99U, 235U, 153U, 0U, 0U, 34U, 196U, 18U, 167U, 78U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U,
    0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, MAX_uint8_T, 4U,
    172U, 84U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U,
    0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 3U,
    173U, 137U, 0U, 0U, 6U, 183U, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, 88U, 0U, 0U,
    228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U,
    228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 35U,
    228U, 50U, 3U, 189U, 61U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 228U,
    88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U,
    88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 67U,
    233U, 184U, 1U, 17U, 199U, 29U, 137U, 109U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U,
    0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U,
    228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 240U, 20U, 156U, 100U, 0U, 0U, 0U, 0U,
    0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U,
    0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U,
    0U, 228U, 88U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 247U, 215U, 119U,
    2U, 0U, 0U, 0U, 224U, 88U, 2U, 19U, 87U, 239U, 135U, 0U, 0U, 0U, 224U, 88U,
    0U, 0U, 0U, 98U, 247U, 21U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 11U, MAX_uint8_T,
    68U, 48U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U,
    244U, 89U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 15U, MAX_uint8_T, 65U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 102U, 240U, 10U, 0U, 0U, 224U, 88U, 0U, 23U, 93U,
    240U, 106U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 246U, 201U, 86U, 0U,
    0U, 0U, 21U, 228U, 158U, 88U, 121U, 0U, 0U, 82U, 122U, 125U, 238U, 46U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, 163U, 0U, 0U, 0U, 80U, 192U, 224U,
    MAX_uint8_T, 68U, 0U, 0U, 80U, 192U, 224U, 183U, 220U, 8U, 0U, 80U, 192U,
    224U, 54U, 223U, 133U, 0U, 80U, 192U, 224U, 44U, 73U, 250U, 43U, 80U, 192U,
    224U, 44U, 0U, 168U, 196U, 81U, 192U, 224U, 44U, 0U, 23U, 239U, 183U, 192U,
    224U, 44U, 0U, 0U, 102U, MAX_uint8_T, 192U, 224U, 44U, 0U, 0U, 1U, 195U,
    192U, 0U, 0U, 6U, 185U, 121U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 10U, 191U, 51U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U, 231U,
    148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U, 5U, 17U, 247U, 91U,
    0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U,
    159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U, MAX_uint8_T, 12U, 0U,
    0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U, 122U,
    236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U, 215U, 250U, 230U, 148U,
    14U, 0U, 0U, 0U, 0U, 0U, 45U, 227U, 40U, 0U, 0U, 0U, 0U, 0U, 7U, 196U, 50U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U,
    231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U, 5U, 17U,
    247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U,
    183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U, MAX_uint8_T, 12U,
    0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U,
    122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U, 215U, 250U, 230U,
    148U, 14U, 0U, 0U, 0U, 0U, 82U, 235U, 169U, 0U, 0U, 0U, 0U, 0U, 25U, 199U,
    22U, 152U, 93U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 0U, 0U, 8U, 218U, 175U, 69U, 145U, 0U, 0U,
    0U, 0U, 58U, 144U, 106U, 239U, 65U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 101U, 213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U,
    45U, 195U, 200U, 5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U,
    160U, 179U, 76U, MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U,
    94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U,
    5U, 0U, 0U, 103U, 215U, 250U, 230U, 148U, 14U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    4U, 172U, 84U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 109U, 107U, 0U, 0U, 0U, 17U, 183U, 13U, 7U,
    184U, 106U, 0U, 17U, 201U, 78U, 0U, 0U, 10U, 193U, 118U, 203U, 88U, 0U, 0U,
    0U, 0U, 28U, 249U, 160U, 0U, 0U, 0U, 0U, 10U, 193U, 118U, 204U, 88U, 0U, 0U,
    6U, 184U, 106U, 0U, 18U, 201U, 77U, 0U, 108U, 107U, 0U, 0U, 0U, 18U, 183U,
    13U, 0U, 0U, 102U, 213U, 248U, 225U, 140U, 187U, 71U, 0U, 122U, 235U, 79U,
    13U, 43U, 216U, 219U, 4U, 17U, 247U, 91U, 0U, 0U, 69U, 188U, 244U, 91U, 76U,
    MAX_uint8_T, 11U, 0U, 32U, 206U, 20U, 180U, 158U, 95U, 242U, 0U, 9U, 198U,
    51U, 0U, 159U, 179U, 75U, MAX_uint8_T, 10U, 163U, 96U, 0U, 0U, 184U, 159U,
    16U, 246U, 183U, 149U, 0U, 0U, 21U, 245U, 91U, 0U, 137U, 253U, 82U, 12U, 45U,
    195U, 200U, 5U, 17U, 206U, 114U, 208U, 246U, 233U, 150U, 15U, 0U, 0U, 56U,
    227U, 29U, 0U, 0U, 0U, 0U, 0U, 68U, 183U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U,
    72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U,
    0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U,
    235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U,
    51U, 0U, 0U, 0U, 0U, 147U, 165U, 2U, 0U, 0U, 0U, 70U, 178U, 4U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U,
    0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U,
    214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U,
    150U, 229U, 243U, 197U, 51U, 0U, 0U, 2U, 191U, 232U, 60U, 0U, 0U, 0U, 118U,
    129U, 34U, 198U, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U, 0U,
    208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U,
    240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U,
    216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U, 51U, 0U, 0U,
    132U, 128U, 48U, 208U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U,
    0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U,
    240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U,
    216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U, 51U, 0U, 0U, 0U,
    0U, 30U, 227U, 55U, 0U, 0U, 0U, 0U, 2U, 184U, 67U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 159U, 199U, 1U, 0U, 0U, 39U, 231U, 22U, 24U, 242U, 92U,
    0U, 0U, 190U, 102U, 0U, 0U, 120U, 228U, 11U, 96U, 198U, 1U, 0U, 0U, 7U, 221U,
    150U, 231U, 46U, 0U, 0U, 0U, 0U, 81U, MAX_uint8_T, 139U, 0U, 0U, 0U, 0U, 0U,
    0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U,
    0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, 252U, 229U, 141U, 1U, 224U, 88U, 8U, 73U, 253U, 75U, 224U, 88U,
    0U, 0U, 238U, 89U, 224U, 88U, 16U, 126U, 239U, 26U, 224U, MAX_uint8_T, 236U,
    184U, 52U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 60U,
    219U, 246U, 185U, 17U, 0U, 182U, 133U, 20U, 218U, 96U, 0U, 212U, 80U, 12U,
    229U, 39U, 0U, 216U, 80U, 136U, 140U, 0U, 0U, 216U, 80U, 172U, 105U, 0U, 0U,
    216U, 80U, 20U, 165U, 142U, 11U, 216U, 80U, 0U, 0U, 122U, 164U, 216U, 80U,
    0U, 1U, 121U, 193U, 216U, 80U, 224U, MAX_uint8_T, 220U, 62U, 0U, 36U, 226U,
    50U, 0U, 0U, 0U, 0U, 0U, 45U, 197U, 9U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U,
    0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U,
    242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U,
    241U, 166U, 92U, 235U, 60U, 0U, 0U, 0U, 115U, 191U, 8U, 0U, 0U, 0U, 45U,
    195U, 13U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U,
    0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U,
    91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U,
    84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U,
    0U, 0U, 166U, 235U, 85U, 0U, 0U, 0U, 89U, 156U, 21U, 198U, 27U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U,
    229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U,
    MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U,
    47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 67U, 239U,
    107U, 145U, 57U, 0U, 0U, 146U, 69U, 174U, 217U, 7U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U,
    0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U, MAX_uint8_T, 108U, 0U,
    52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U,
    182U, 241U, 166U, 92U, 235U, 60U, 0U, 88U, 172U, 4U, 252U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U,
    229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U,
    MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U,
    47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 0U, 148U,
    238U, 69U, 0U, 0U, 0U, 0U, 172U, 39U, 148U, 0U, 0U, 0U, 0U, 148U, 239U, 71U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U,
    149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U,
    242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U,
    27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 60U,
    200U, 240U, 163U, 116U, 232U, 220U, 70U, 0U, 0U, 149U, 44U, 23U, 229U, 226U,
    31U, 71U, 233U, 4U, 0U, 0U, 0U, 0U, 188U, 141U, 0U, 0U, 232U, 56U, 0U, 91U,
    205U, 242U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    80U, 52U, 242U, 73U, 6U, 188U, 136U, 0U, 0U, 0U, 0U, 84U, 226U, 27U, 54U,
    201U, 238U, 64U, 5U, 0U, 0U, 8U, 182U, 246U, 176U, 21U, 115U, 229U,
    MAX_uint8_T, MAX_uint8_T, 92U, 0U, 33U, 180U, 240U, MAX_uint8_T, 128U, 3U,
    212U, 180U, 23U, 0U, 0U, 53U, MAX_uint8_T, 32U, 0U, 0U, 0U, 78U, 251U, 0U,
    0U, 0U, 0U, 46U, MAX_uint8_T, 33U, 0U, 0U, 0U, 0U, 198U, 183U, 26U, 0U, 0U,
    0U, 25U, 178U, 245U, MAX_uint8_T, 148U, 0U, 0U, 1U, 199U, 117U, 0U, 0U, 0U,
    0U, 43U, 202U, 0U, 0U, 0U, 52U, 252U, 115U, 0U, 0U, 41U, 227U, 45U, 0U, 0U,
    0U, 0U, 51U, 195U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U, 167U,
    9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    0U, 0U, 0U, 123U, 185U, 6U, 0U, 0U, 51U, 191U, 10U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 35U, 194U, 241U, 167U, 9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U,
    244U, 2U, 0U, 93U, 186U, 78U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 211U, 47U, 241U, 4U, 0U, 0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U,
    0U, 22U, 170U, 239U, MAX_uint8_T, 208U, 0U, 0U, 147U, 235U, 105U, 0U, 0U,
    70U, 173U, 16U, 193U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U, 167U,
    9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    0U, 52U, 208U, 0U, 224U, 32U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U,
    167U, 9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    3U, 173U, 137U, 0U, 0U, 6U, 183U, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 35U, 228U, 50U, 3U, 189U, 61U, 0U, 0U,
    0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    67U, 233U, 184U, 1U, 17U, 199U, 29U, 137U, 109U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U,
    80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U,
    240U, 20U, 156U, 100U, 0U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 1U, 5U, 139U, 56U, 0U, 0U, 90U, 227U, 251U, 226U, 21U,
    0U, 0U, 0U, 86U, 114U, 105U, 219U, 25U, 0U, 0U, 36U, 190U, 243U, 248U, 190U,
    0U, 3U, 214U, 144U, 15U, 70U, 250U, 54U, 57U, 250U, 10U, 0U, 0U, 181U, 117U,
    83U, 231U, 0U, 0U, 0U, 159U, 139U, 54U, 251U, 12U, 0U, 0U, 194U, 109U, 2U,
    210U, 147U, 15U, 89U, 243U, 24U, 0U, 33U, 187U, 242U, 208U, 63U, 0U, 0U,
    168U, 211U, 45U, 192U, 0U, 2U, 198U, 64U, 229U, 119U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U, 239U, 67U, 216U,
    95U, 0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U,
    204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 0U,
    5U, 182U, 125U, 0U, 0U, 0U, 0U, 0U, 9U, 189U, 54U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U, 0U, 0U, 42U, 228U, 43U, 0U, 0U, 0U,
    6U, 194U, 53U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U,
    91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U,
    148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U,
    2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U,
    0U, 78U, 234U, 173U, 0U, 0U, 0U, 23U, 199U, 24U, 149U, 97U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U, 7U, 216U, 178U, 66U, 149U, 0U, 0U,
    54U, 148U, 103U, 239U, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 186U,
    242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U, 249U, 8U, 0U,
    0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U, 7U, 0U, 0U,
    163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U, 243U, 215U,
    88U, 0U, 0U, 0U, 252U, 8U, 168U, 88U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U,
    249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U,
    7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U,
    243U, 215U, 88U, 0U, 0U, 0U, 0U, 244U, 128U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 128U, 0U, 0U,
    0U, 0U, 33U, 185U, 242U, 221U, 179U, 89U, 2U, 210U, 135U, 14U, 114U,
    MAX_uint8_T, 53U, 51U, 248U, 7U, 21U, 188U, 185U, 147U, 79U, 229U, 2U, 176U,
    43U, 137U, 175U, 54U, 249U, 141U, 90U, 0U, 161U, 147U, 2U, 213U, 201U, 12U,
    62U, 242U, 55U, 20U, 191U, 190U, 245U, 217U, 91U, 0U, 5U, 182U, 125U, 0U, 0U,
    0U, 0U, 9U, 189U, 54U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U,
    220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U,
    60U, 0U, 0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U,
    246U, 72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 0U, 42U, 228U, 43U, 0U, 0U,
    6U, 194U, 53U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U,
    0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U,
    72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 78U, 234U, 173U, 0U, 0U, 23U, 199U,
    24U, 149U, 97U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U,
    0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U,
    72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 252U, 8U, 168U, 88U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 235U, 61U, 0U,
    4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U, 72U, 80U, 234U, 227U, 88U, 220U,
    72U, 0U, 0U, 0U, 166U, 147U, 0U, 0U, 0U, 0U, 89U, 162U, 1U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 187U, 131U, 0U, 0U, 23U, 240U, 13U, 97U, 220U, 0U, 0U,
    114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U, 59U, 0U, 0U, 172U, 142U, 45U, 216U,
    0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U, 0U, 0U, 7U, 240U, 244U, 23U, 0U, 0U,
    0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U, 179U, 76U, 0U, 0U, 0U, 0U, 54U, 229U,
    3U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U,
    90U, 179U, 242U, 173U, 14U, 216U, 196U, 66U, 22U, 206U, 137U, 216U, 105U, 0U,
    0U, 108U, 207U, 216U, 80U, 0U, 0U, 90U, 222U, 216U, 104U, 0U, 0U, 120U, 191U,
    216U, 209U, 53U, 34U, 220U, 98U, 216U, 99U, 198U, 244U, 147U, 2U, 216U, 80U,
    0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 0U, 116U, 144U, 32U, 224U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 187U, 131U, 0U, 0U, 23U, 240U, 13U, 97U, 220U,
    0U, 0U, 114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U, 59U, 0U, 0U, 172U, 142U,
    45U, 216U, 0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U, 0U, 0U, 7U, 240U, 244U,
    23U, 0U, 0U, 0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U, 179U, 76U, 0U, 0U, 0U,
    0U, 54U, 229U, 3U, 0U, 0U, 0U };

  real_T (*gpu_inPosition_data)[4];
  real_T *gpu_b_cg;
  real_T *gpu_b_lenFirstSegment;
  real_T *gpu_c_lenThisSegment;
  int32_T (*gpu_position_data)[4];
  real32_T *gpu_bboxes_data;
  uint16_T (*gpu_uv1)[256];
  uint16_T *gpu_tmp3;
  char_T (*gpu_validatedHoleFilling_f1_dat)[15];
  char_T (*gpu_varargin_1_data)[15];
  int8_T (*gpu_iv3)[261];
  int8_T (*gpu_iv6)[261];
  uint8_T (*gpu_In)[921600];
  uint8_T (*gpu_RGB)[921600];
  uint8_T (*gpu_outB)[307200];
  uint8_T (*gpu_outG)[307200];
  uint8_T (*gpu_outR)[307200];
  uint8_T (*gpu_uv5)[31620];
  uint8_T (*gpu_uv5_data)[31620];
  uint8_T (*gpu_uv9)[10664];
  uint8_T (*gpu_uv9_data)[10664];
  uint8_T (*gpu_pixCount)[640];
  uint8_T (*gpu_thisGlyphBitmap_data)[441];
  uint8_T (*gpu_uv5_data_0)[441];
  uint8_T (*gpu_b_thisGlyphBitmap_data)[144];
  uint8_T (*gpu_uv9_data_0)[144];
  uint8_T (*gpu_b_color_data)[3];
  uint8_T (*gpu_color_data)[3];
  boolean_T exitg1;
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv9, 10664UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv5, 31620UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_iv6, 261UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv1, 512UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_iv3, 261UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv9_data_0, 144UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv9_data, 10664UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv5_data_0, 441UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_uv5_data, 31620UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_cg, 8UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_thisGlyphBitmap_data, 144UL),
    __FILE__, __LINE__);
  ex_DLMode_gpuEmxReset_boolean_T(&ex_DLModel_28_B.gpu_isNewLineChar);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_tmp3, 2UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_c_lenThisSegment, 8UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_thisGlyphBitmap_data, 441UL),
    __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_lenFirstSegment, 8UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_int8_T(&ex_DLModel_28_B.gpu_c_x);
  ex_DLModel_gpuEmxReset_uint16_T(&ex_DLModel_28_B.gpu_thisGlyphIdxs_1b);
  ex_DLModel_gpuEmxReset_uint16_T(&ex_DLModel_28_B.gpu_thisCharcodes_1b);
  ex_DLModel__gpuEmxReset_int32_T(&ex_DLModel_28_B.gpu_idxNewlineChar);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r81_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r80_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r79_f1);
  ex_DLModel__gpuEmxReset_int32_T(&ex_DLModel_28_B.gpu_b_ii);
  ex_DLModel__gpuEmxReset_uint8_T(&ex_DLModel_28_B.gpu_thisTextU16);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_position_data, 16UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r55_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r54_f1);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_pixCount, 640UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r45_f1);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_RGB, 921600UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r44_f1);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_inPosition_data, 32UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_b_color_data, 3UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_color_data, 3UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r26_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r25_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r19_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r18_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r16_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_b_str);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r15_f1);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_varargin_1_data, 15UL), __FILE__,
    __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_str);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_validatedHoleFilling_f1_dat, 15UL),
    __FILE__, __LINE__);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r7_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r6_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r4_f1);
  ex_DLModel_2_gpuEmxReset_char_T(&ex_DLModel_28_B.gpu_r3_f1);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outB, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outG, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outR, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_In, 921600UL), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_bboxes_data, 400U * sizeof
    (real32_T)), __FILE__, __LINE__);
  ex_DLModel_28_B.uv9_outdatedOnGpu = true;
  ex_DLModel_28_B.uv5_outdatedOnGpu = true;
  ex_DLModel_28_B.iv6_outdatedOnGpu = true;
  ex_DLModel_28_B.uv1_outdatedOnGpu = true;
  ex_DLModel_28_B.In_outdatedOnCpu = false;
  ex_DLModel_28_B.In_outdatedOnGpu = true;
  ex_DLModel_28_B.bboxes_data_outdatedOnGpu = true;
  if (!ex_DLModel_28_DW.classNames_not_empty) {
    ex_DL_emxInitStruct_cell_wrap_0(&r_f1);
    ex_DLModel_28_B.b_startC_im = r_f1->size[0] * r_f1->size[1];
    r_f1->size[0] = 1;
    r_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r_f1->data[ex_DLModel_28_B.b_startC_im] = cv[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r1_f1);
    ex_DLModel_28_B.b_startC_im = r1_f1->size[0] * r1_f1->size[1];
    r1_f1->size[0] = 1;
    r1_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r1_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r1_f1->data[ex_DLModel_28_B.b_startC_im] = cv1[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r2_f1);
    ex_DLModel_28_B.b_startC_im = r2_f1->size[0] * r2_f1->size[1];
    r2_f1->size[0] = 1;
    r2_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r2_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r2_f1->data[ex_DLModel_28_B.b_startC_im] = cv2[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r3_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r3_f1->size[0] * cpu_r3_f1->size[1];
    cpu_r3_f1->size[0] = 1;
    cpu_r3_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r3_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r4_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r4_f1->size[0] * cpu_r4_f1->size[1];
    cpu_r4_f1->size[0] = 1;
    cpu_r4_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r4_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r4_f1, &ex_DLModel_28_B.gpu_r4_f1, true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r3_f1, &ex_DLModel_28_B.gpu_r3_f1, true);
    ex_DLM_c2_ex_DLModel_28_kernel3<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r4_f1, ex_DLModel_28_B.gpu_r3_f1, '\x61', '\x65',
       '\x72', '\x6f', '\x70', '\x6c', '\x61', '\x6e', '\x65', '\x6d', '\x6f',
       '\x74', '\x6f', '\x72', '\x62', '\x69', '\x6b', '\x65');
    ex_DL_emxInitStruct_cell_wrap_0(&r5_f1);
    ex_DLModel_28_B.b_startC_im = r5_f1->size[0] * r5_f1->size[1];
    r5_f1->size[0] = 1;
    r5_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r5_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r5_f1->data[ex_DLModel_28_B.b_startC_im] = cv5[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r6_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r6_f1->size[0] * cpu_r6_f1->size[1];
    cpu_r6_f1->size[0] = 1;
    cpu_r6_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r6_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r7_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r7_f1->size[0] * cpu_r7_f1->size[1];
    cpu_r7_f1->size[0] = 1;
    cpu_r7_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r7_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r7_f1, &ex_DLModel_28_B.gpu_r7_f1, true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r6_f1, &ex_DLModel_28_B.gpu_r6_f1, true);
    ex_DLM_c2_ex_DLModel_28_kernel4<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r7_f1, ex_DLModel_28_B.gpu_r6_f1, '\x74', '\x72',
       '\x75', '\x63', '\x6b', '\x74', '\x72', '\x61', '\x69', '\x6e');
    ex_DL_emxInitStruct_cell_wrap_0(&r8_f1);
    ex_DLModel_28_B.b_startC_im = r8_f1->size[0] * r8_f1->size[1];
    r8_f1->size[0] = 1;
    r8_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r8_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r8_f1->data[ex_DLModel_28_B.b_startC_im] = cv8[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r9_f1);
    ex_DLModel_28_B.b_startC_im = r9_f1->size[0] * r9_f1->size[1];
    r9_f1->size[0] = 1;
    r9_f1->size[1] = 13;
    ex_DLM_emxEnsureCapacity_char_T(r9_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 13;
         ex_DLModel_28_B.b_startC_im++) {
      r9_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv10[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r10_f1);
    ex_DLModel_28_B.b_startC_im = r10_f1->size[0] * r10_f1->size[1];
    r10_f1->size[0] = 1;
    r10_f1->size[1] = 12;
    ex_DLM_emxEnsureCapacity_char_T(r10_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 12;
         ex_DLModel_28_B.b_startC_im++) {
      r10_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv11[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r11_f1);
    ex_DLModel_28_B.b_startC_im = r11_f1->size[0] * r11_f1->size[1];
    r11_f1->size[0] = 1;
    r11_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(r11_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 9;
         ex_DLModel_28_B.b_startC_im++) {
      r11_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv12[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r12_f1);
    ex_DLModel_28_B.b_startC_im = r12_f1->size[0] * r12_f1->size[1];
    r12_f1->size[0] = 1;
    r12_f1->size[1] = 13;
    ex_DLM_emxEnsureCapacity_char_T(r12_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 13;
         ex_DLModel_28_B.b_startC_im++) {
      r12_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv13[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r13_f1);
    ex_DLModel_28_B.b_startC_im = r13_f1->size[0] * r13_f1->size[1];
    r13_f1->size[0] = 1;
    r13_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r13_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r13_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv14[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r14_f1);
    ex_DLModel_28_B.b_startC_im = r14_f1->size[0] * r14_f1->size[1];
    r14_f1->size[0] = 1;
    r14_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r14_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r14_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv15[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r15_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r15_f1->size[0] * cpu_r15_f1->size[1];
    cpu_r15_f1->size[0] = 1;
    cpu_r15_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r15_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r16_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r16_f1->size[0] * cpu_r16_f1->size[1];
    cpu_r16_f1->size[0] = 1;
    cpu_r16_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r16_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r16_f1, &ex_DLModel_28_B.gpu_r16_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r15_f1, &ex_DLModel_28_B.gpu_r15_f1,
      true);
    ex_DLM_c2_ex_DLModel_28_kernel5<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r16_f1, ex_DLModel_28_B.gpu_r15_f1, '\x64', '\x6f',
       '\x67', '\x63', '\x61', '\x74');
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r18_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r18_f1->size[0] * cpu_r18_f1->size[1];
    cpu_r18_f1->size[0] = 1;
    cpu_r18_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r18_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r19_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r19_f1->size[0] * cpu_r19_f1->size[1];
    cpu_r19_f1->size[0] = 1;
    cpu_r19_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r19_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r19_f1, &ex_DLModel_28_B.gpu_r19_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r18_f1, &ex_DLModel_28_B.gpu_r18_f1,
      true);
    ex_DLM_c2_ex_DLModel_28_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r19_f1, ex_DLModel_28_B.gpu_r18_f1, '\x73', '\x68',
       '\x65', '\x65', '\x70', '\x68', '\x6f', '\x72', '\x73', '\x65');
    ex_DL_emxInitStruct_cell_wrap_0(&r20_f1);
    ex_DLModel_28_B.b_startC_im = r20_f1->size[0] * r20_f1->size[1];
    r20_f1->size[0] = 1;
    r20_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r20_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r20_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv20[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r21_f1);
    ex_DLModel_28_B.b_startC_im = r21_f1->size[0] * r21_f1->size[1];
    r21_f1->size[0] = 1;
    r21_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r21_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r21_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv21[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r22_f1);
    ex_DLModel_28_B.b_startC_im = r22_f1->size[0] * r22_f1->size[1];
    r22_f1->size[0] = 1;
    r22_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r22_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r22_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv22[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r23_f1);
    ex_DLModel_28_B.b_startC_im = r23_f1->size[0] * r23_f1->size[1];
    r23_f1->size[0] = 1;
    r23_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r23_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r23_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv23[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r24_f1);
    ex_DLModel_28_B.b_startC_im = r24_f1->size[0] * r24_f1->size[1];
    r24_f1->size[0] = 1;
    r24_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r24_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r24_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv24[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r25_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r25_f1->size[0] * cpu_r25_f1->size[1];
    cpu_r25_f1->size[0] = 1;
    cpu_r25_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r25_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r26_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r26_f1->size[0] * cpu_r26_f1->size[1];
    cpu_r26_f1->size[0] = 1;
    cpu_r26_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r26_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r26_f1, &ex_DLModel_28_B.gpu_r26_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r25_f1, &ex_DLModel_28_B.gpu_r25_f1,
      true);
    ex_DLM_c2_ex_DLModel_28_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r26_f1, ex_DLModel_28_B.gpu_r25_f1, '\x75', '\x6d',
       '\x62', '\x72', '\x65', '\x6c', '\x6c', '\x61', '\x62', '\x61', '\x63',
       '\x6b', '\x70', '\x61', '\x63', '\x6b');
    ex_DL_emxInitStruct_cell_wrap_0(&r27_f1);
    ex_DLModel_28_B.b_startC_im = r27_f1->size[0] * r27_f1->size[1];
    r27_f1->size[0] = 1;
    r27_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r27_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r27_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv27[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r28_f1);
    ex_DLModel_28_B.b_startC_im = r28_f1->size[0] * r28_f1->size[1];
    r28_f1->size[0] = 1;
    r28_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r28_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r28_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv28[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r29_f1);
    ex_DLModel_28_B.b_startC_im = r29_f1->size[0] * r29_f1->size[1];
    r29_f1->size[0] = 1;
    r29_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r29_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r29_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv29[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r30_f1);
    ex_DLModel_28_B.b_startC_im = r30_f1->size[0] * r30_f1->size[1];
    r30_f1->size[0] = 1;
    r30_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r30_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r30_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv30[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r31_f1);
    ex_DLModel_28_B.b_startC_im = r31_f1->size[0] * r31_f1->size[1];
    r31_f1->size[0] = 1;
    r31_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r31_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r31_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv31[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r32_f1);
    ex_DLModel_28_B.b_startC_im = r32_f1->size[0] * r32_f1->size[1];
    r32_f1->size[0] = 1;
    r32_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(r32_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 9;
         ex_DLModel_28_B.b_startC_im++) {
      r32_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv32[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r33_f1);
    ex_DLModel_28_B.b_startC_im = r33_f1->size[0] * r33_f1->size[1];
    r33_f1->size[0] = 1;
    r33_f1->size[1] = 11;
    ex_DLM_emxEnsureCapacity_char_T(r33_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 11;
         ex_DLModel_28_B.b_startC_im++) {
      r33_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv33[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r34_f1);
    ex_DLModel_28_B.b_startC_im = r34_f1->size[0] * r34_f1->size[1];
    r34_f1->size[0] = 1;
    r34_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r34_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r34_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv34[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r35_f1);
    ex_DLModel_28_B.b_startC_im = r35_f1->size[0] * r35_f1->size[1];
    r35_f1->size[0] = 1;
    r35_f1->size[1] = 12;
    ex_DLM_emxEnsureCapacity_char_T(r35_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 12;
         ex_DLModel_28_B.b_startC_im++) {
      r35_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv35[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r36_f1);
    ex_DLModel_28_B.b_startC_im = r36_f1->size[0] * r36_f1->size[1];
    r36_f1->size[0] = 1;
    r36_f1->size[1] = 14;
    ex_DLM_emxEnsureCapacity_char_T(r36_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 14;
         ex_DLModel_28_B.b_startC_im++) {
      r36_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv36[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r37_f1);
    ex_DLModel_28_B.b_startC_im = r37_f1->size[0] * r37_f1->size[1];
    r37_f1->size[0] = 1;
    r37_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(r37_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 10;
         ex_DLModel_28_B.b_startC_im++) {
      r37_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv37[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r38_f1);
    ex_DLModel_28_B.b_startC_im = r38_f1->size[0] * r38_f1->size[1];
    r38_f1->size[0] = 1;
    r38_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(r38_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 9;
         ex_DLModel_28_B.b_startC_im++) {
      r38_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv38[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r39_f1);
    ex_DLModel_28_B.b_startC_im = r39_f1->size[0] * r39_f1->size[1];
    r39_f1->size[0] = 1;
    r39_f1->size[1] = 13;
    ex_DLM_emxEnsureCapacity_char_T(r39_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 13;
         ex_DLModel_28_B.b_startC_im++) {
      r39_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv39[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r40_f1);
    ex_DLModel_28_B.b_startC_im = r40_f1->size[0] * r40_f1->size[1];
    r40_f1->size[0] = 1;
    r40_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r40_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r40_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv40[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r41_f1);
    ex_DLModel_28_B.b_startC_im = r41_f1->size[0] * r41_f1->size[1];
    r41_f1->size[0] = 1;
    r41_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(r41_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 10;
         ex_DLModel_28_B.b_startC_im++) {
      r41_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv41[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r42_f1);
    ex_DLModel_28_B.b_startC_im = r42_f1->size[0] * r42_f1->size[1];
    r42_f1->size[0] = 1;
    r42_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r42_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r42_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv42[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r43_f1);
    ex_DLModel_28_B.b_startC_im = r43_f1->size[0] * r43_f1->size[1];
    r43_f1->size[0] = 1;
    r43_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r43_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r43_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv43[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r44_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r44_f1->size[0] * cpu_r44_f1->size[1];
    cpu_r44_f1->size[0] = 1;
    cpu_r44_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r44_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r45_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r45_f1->size[0] * cpu_r45_f1->size[1];
    cpu_r45_f1->size[0] = 1;
    cpu_r45_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r45_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r45_f1, &ex_DLModel_28_B.gpu_r45_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r44_f1, &ex_DLModel_28_B.gpu_r44_f1,
      true);
    ex_DLM_c2_ex_DLModel_28_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r45_f1, ex_DLModel_28_B.gpu_r44_f1, '\x73', '\x70',
       '\x6f', '\x6f', '\x6e', '\x6b', '\x6e', '\x69', '\x66', '\x65');
    ex_DL_emxInitStruct_cell_wrap_0(&r46_f1);
    ex_DLModel_28_B.b_startC_im = r46_f1->size[0] * r46_f1->size[1];
    r46_f1->size[0] = 1;
    r46_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r46_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r46_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv46[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r47_f1);
    ex_DLModel_28_B.b_startC_im = r47_f1->size[0] * r47_f1->size[1];
    r47_f1->size[0] = 1;
    r47_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r47_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r47_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv47[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r48_f1);
    ex_DLModel_28_B.b_startC_im = r48_f1->size[0] * r48_f1->size[1];
    r48_f1->size[0] = 1;
    r48_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r48_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r48_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv48[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r49_f1);
    ex_DLModel_28_B.b_startC_im = r49_f1->size[0] * r49_f1->size[1];
    r49_f1->size[0] = 1;
    r49_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r49_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r49_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv49[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r50_f1);
    ex_DLModel_28_B.b_startC_im = r50_f1->size[0] * r50_f1->size[1];
    r50_f1->size[0] = 1;
    r50_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r50_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r50_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv50[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r51_f1);
    ex_DLModel_28_B.b_startC_im = r51_f1->size[0] * r51_f1->size[1];
    r51_f1->size[0] = 1;
    r51_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r51_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r51_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv51[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r52_f1);
    ex_DLModel_28_B.b_startC_im = r52_f1->size[0] * r52_f1->size[1];
    r52_f1->size[0] = 1;
    r52_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r52_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r52_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv52[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r53_f1);
    ex_DLModel_28_B.b_startC_im = r53_f1->size[0] * r53_f1->size[1];
    r53_f1->size[0] = 1;
    r53_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r53_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r53_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv53[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r54_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r54_f1->size[0] * cpu_r54_f1->size[1];
    cpu_r54_f1->size[0] = 1;
    cpu_r54_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r54_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r55_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r55_f1->size[0] * cpu_r55_f1->size[1];
    cpu_r55_f1->size[0] = 1;
    cpu_r55_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r55_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r55_f1, &ex_DLModel_28_B.gpu_r55_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r54_f1, &ex_DLModel_28_B.gpu_r54_f1,
      true);
    ex_DLM_c2_ex_DLModel_28_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r55_f1, ex_DLModel_28_B.gpu_r54_f1, '\x64', '\x6f',
       '\x6e', '\x75', '\x74', '\x70', '\x69', '\x7a', '\x7a', '\x61');
    ex_DL_emxInitStruct_cell_wrap_0(&r56_f1);
    ex_DLModel_28_B.b_startC_im = r56_f1->size[0] * r56_f1->size[1];
    r56_f1->size[0] = 1;
    r56_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r56_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r56_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv56[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r57_f1);
    ex_DLModel_28_B.b_startC_im = r57_f1->size[0] * r57_f1->size[1];
    r57_f1->size[0] = 1;
    r57_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r57_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r57_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv57[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r58_f1);
    ex_DLModel_28_B.b_startC_im = r58_f1->size[0] * r58_f1->size[1];
    r58_f1->size[0] = 1;
    r58_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r58_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r58_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv58[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r59_f1);
    ex_DLModel_28_B.b_startC_im = r59_f1->size[0] * r59_f1->size[1];
    r59_f1->size[0] = 1;
    r59_f1->size[1] = 11;
    ex_DLM_emxEnsureCapacity_char_T(r59_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 11;
         ex_DLModel_28_B.b_startC_im++) {
      r59_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv59[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r60_f1);
    ex_DLModel_28_B.b_startC_im = r60_f1->size[0] * r60_f1->size[1];
    r60_f1->size[0] = 1;
    r60_f1->size[1] = 3;
    ex_DLM_emxEnsureCapacity_char_T(r60_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 3;
         ex_DLModel_28_B.b_startC_im++) {
      r60_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv60[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r61_f1);
    ex_DLModel_28_B.b_startC_im = r61_f1->size[0] * r61_f1->size[1];
    r61_f1->size[0] = 1;
    r61_f1->size[1] = 11;
    ex_DLM_emxEnsureCapacity_char_T(r61_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 11;
         ex_DLModel_28_B.b_startC_im++) {
      r61_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv61[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r62_f1);
    ex_DLModel_28_B.b_startC_im = r62_f1->size[0] * r62_f1->size[1];
    r62_f1->size[0] = 1;
    r62_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r62_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r62_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv62[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r63_f1);
    ex_DLModel_28_B.b_startC_im = r63_f1->size[0] * r63_f1->size[1];
    r63_f1->size[0] = 1;
    r63_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(r63_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 9;
         ex_DLModel_28_B.b_startC_im++) {
      r63_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv63[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r64_f1);
    ex_DLModel_28_B.b_startC_im = r64_f1->size[0] * r64_f1->size[1];
    r64_f1->size[0] = 1;
    r64_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r64_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r64_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv64[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r65_f1);
    ex_DLModel_28_B.b_startC_im = r65_f1->size[0] * r65_f1->size[1];
    r65_f1->size[0] = 1;
    r65_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r65_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r65_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv65[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r66_f1);
    ex_DLModel_28_B.b_startC_im = r66_f1->size[0] * r66_f1->size[1];
    r66_f1->size[0] = 1;
    r66_f1->size[1] = 6;
    ex_DLM_emxEnsureCapacity_char_T(r66_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 6;
         ex_DLModel_28_B.b_startC_im++) {
      r66_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv66[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r67_f1);
    ex_DLModel_28_B.b_startC_im = r67_f1->size[0] * r67_f1->size[1];
    r67_f1->size[0] = 1;
    r67_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r67_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r67_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv67[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r68_f1);
    ex_DLModel_28_B.b_startC_im = r68_f1->size[0] * r68_f1->size[1];
    r68_f1->size[0] = 1;
    r68_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(r68_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 10;
         ex_DLModel_28_B.b_startC_im++) {
      r68_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv68[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r70_f1);
    ex_DLModel_28_B.b_startC_im = r70_f1->size[0] * r70_f1->size[1];
    r70_f1->size[0] = 1;
    r70_f1->size[1] = 9;
    ex_DLM_emxEnsureCapacity_char_T(r70_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 9;
         ex_DLModel_28_B.b_startC_im++) {
      r70_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv69[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r71_f1);
    ex_DLModel_28_B.b_startC_im = r71_f1->size[0] * r71_f1->size[1];
    r71_f1->size[0] = 1;
    r71_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r71_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r71_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv70[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r72_f1);
    ex_DLModel_28_B.b_startC_im = r72_f1->size[0] * r72_f1->size[1];
    r72_f1->size[0] = 1;
    r72_f1->size[1] = 7;
    ex_DLM_emxEnsureCapacity_char_T(r72_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 7;
         ex_DLModel_28_B.b_startC_im++) {
      r72_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv71[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r73_f1);
    ex_DLModel_28_B.b_startC_im = r73_f1->size[0] * r73_f1->size[1];
    r73_f1->size[0] = 1;
    r73_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r73_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r73_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv72[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r74_f1);
    ex_DLModel_28_B.b_startC_im = r74_f1->size[0] * r74_f1->size[1];
    r74_f1->size[0] = 1;
    r74_f1->size[1] = 12;
    ex_DLM_emxEnsureCapacity_char_T(r74_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 12;
         ex_DLModel_28_B.b_startC_im++) {
      r74_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv73[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r75_f1);
    ex_DLModel_28_B.b_startC_im = r75_f1->size[0] * r75_f1->size[1];
    r75_f1->size[0] = 1;
    r75_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r75_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r75_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv74[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r76_f1);
    ex_DLModel_28_B.b_startC_im = r76_f1->size[0] * r76_f1->size[1];
    r76_f1->size[0] = 1;
    r76_f1->size[1] = 5;
    ex_DLM_emxEnsureCapacity_char_T(r76_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 5;
         ex_DLModel_28_B.b_startC_im++) {
      r76_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv75[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r77_f1);
    ex_DLModel_28_B.b_startC_im = r77_f1->size[0] * r77_f1->size[1];
    r77_f1->size[0] = 1;
    r77_f1->size[1] = 4;
    ex_DLM_emxEnsureCapacity_char_T(r77_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 4;
         ex_DLModel_28_B.b_startC_im++) {
      r77_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv76[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&r78_f1);
    ex_DLModel_28_B.b_startC_im = r78_f1->size[0] * r78_f1->size[1];
    r78_f1->size[0] = 1;
    r78_f1->size[1] = 8;
    ex_DLM_emxEnsureCapacity_char_T(r78_f1, ex_DLModel_28_B.b_startC_im);
    for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im < 8;
         ex_DLModel_28_B.b_startC_im++) {
      r78_f1->data[ex_DLModel_28_B.b_startC_im] =
        cv77[ex_DLModel_28_B.b_startC_im];
    }

    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r79_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r79_f1->size[0] * cpu_r79_f1->size[1];
    cpu_r79_f1->size[0] = 1;
    cpu_r79_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r79_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r80_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r80_f1->size[0] * cpu_r80_f1->size[1];
    cpu_r80_f1->size[0] = 1;
    cpu_r80_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r80_f1, ex_DLModel_28_B.b_startC_im);
    ex_DL_emxInitStruct_cell_wrap_0(&cpu_r81_f1);
    ex_DLModel_28_B.b_startC_im = cpu_r81_f1->size[0] * cpu_r81_f1->size[1];
    cpu_r81_f1->size[0] = 1;
    cpu_r81_f1->size[1] = 10;
    ex_DLM_emxEnsureCapacity_char_T(cpu_r81_f1, ex_DLModel_28_B.b_startC_im);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r81_f1, &ex_DLModel_28_B.gpu_r81_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r80_f1, &ex_DLModel_28_B.gpu_r80_f1,
      true);
    ex__gpuEmxEnsureCapacity_char_T(cpu_r79_f1, &ex_DLModel_28_B.gpu_r79_f1,
      true);
    ex_DL_c2_ex_DLModel_28_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (ex_DLModel_28_B.gpu_r81_f1, ex_DLModel_28_B.gpu_r80_f1,
       ex_DLModel_28_B.gpu_r79_f1, '\x74', '\x6f', '\x6f', '\x74', '\x68',
       '\x62', '\x72', '\x75', '\x73', '\x68', '\x68', '\x61', '\x69', '\x72',
       '\x20', '\x64', '\x72', '\x69', '\x65', '\x72', '\x74', '\x65', '\x64',
       '\x64', '\x79', '\x20', '\x62', '\x65', '\x61', '\x72');
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[0], &r_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[1], &r1_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r1_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[2], &r2_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r2_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r3_f1, &ex_DLModel_28_B.gpu_r3_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[3], &cpu_r3_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r3_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r4_f1, &ex_DLModel_28_B.gpu_r4_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[4], &cpu_r4_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r4_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[5], &r5_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r5_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r6_f1, &ex_DLModel_28_B.gpu_r6_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[6], &cpu_r6_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r6_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r7_f1, &ex_DLModel_28_B.gpu_r7_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[7], &cpu_r7_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r7_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[8], &r8_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r8_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[9], &r9_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r9_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[10], &r10_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r10_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[11], &r11_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r11_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[12], &r12_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r12_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[13], &r13_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r13_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[14], &r14_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r14_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r15_f1, &ex_DLModel_28_B.gpu_r15_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[15],
      &cpu_r15_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r15_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r16_f1, &ex_DLModel_28_B.gpu_r16_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[16],
      &cpu_r16_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r16_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r18_f1, &ex_DLModel_28_B.gpu_r18_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[17],
      &cpu_r18_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r18_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r19_f1, &ex_DLModel_28_B.gpu_r19_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[18],
      &cpu_r19_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r19_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[19], &r20_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r20_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[20], &r21_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r21_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[21], &r22_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r22_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[22], &r23_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r23_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[23], &r24_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r24_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r25_f1, &ex_DLModel_28_B.gpu_r25_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[24],
      &cpu_r25_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r25_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r26_f1, &ex_DLModel_28_B.gpu_r26_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[25],
      &cpu_r26_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r26_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[26], &r27_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r27_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[27], &r28_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r28_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[28], &r29_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r29_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[29], &r30_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r30_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[30], &r31_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r31_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[31], &r32_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r32_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[32], &r33_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r33_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[33], &r34_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r34_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[34], &r35_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r35_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[35], &r36_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r36_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[36], &r37_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r37_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[37], &r38_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r38_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[38], &r39_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r39_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[39], &r40_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r40_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[40], &r41_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r41_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[41], &r42_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r42_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[42], &r43_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r43_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r44_f1, &ex_DLModel_28_B.gpu_r44_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[43],
      &cpu_r44_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r44_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r45_f1, &ex_DLModel_28_B.gpu_r45_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[44],
      &cpu_r45_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r45_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[45], &r46_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r46_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[46], &r47_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r47_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[47], &r48_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r48_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[48], &r49_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r49_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[49], &r50_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r50_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[50], &r51_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r51_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[51], &r52_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r52_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[52], &r53_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r53_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r54_f1, &ex_DLModel_28_B.gpu_r54_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[53],
      &cpu_r54_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r54_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r55_f1, &ex_DLModel_28_B.gpu_r55_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[54],
      &cpu_r55_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r55_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[55], &r56_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r56_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[56], &r57_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r57_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[57], &r58_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r58_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[58], &r59_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r59_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[59], &r60_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r60_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[60], &r61_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r61_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[61], &r62_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r62_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[62], &r63_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r63_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[63], &r64_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r64_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[64], &r65_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r65_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[65], &r66_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r66_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[66], &r67_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r67_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[67], &r68_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r68_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[68], &r70_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r70_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[69], &r71_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r71_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[70], &r72_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r72_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[71], &r73_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r73_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[72], &r74_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r74_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[73], &r75_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r75_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[74], &r76_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r76_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[75], &r77_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r77_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[76], &r78_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&r78_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r79_f1, &ex_DLModel_28_B.gpu_r79_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[77],
      &cpu_r79_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r79_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r80_f1, &ex_DLModel_28_B.gpu_r80_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[78],
      &cpu_r80_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r80_f1);
    ex__gpuEmxMemcpyGpuToCpu_char_T(cpu_r81_f1, &ex_DLModel_28_B.gpu_r81_f1);
    ex_DL_emxCopyStruct_cell_wrap_0(&ex_DLModel_28_DW.classNames[79],
      &cpu_r81_f1);
    ex_DL_emxFreeStruct_cell_wrap_0(&cpu_r81_f1);
    ex_DLModel_28_DW.classNames_not_empty = true;
  }

  if (!ex_DLModel_28_DW.averageFPS_not_empty) {
    ex_DLModel_28_DW.averageFPS_not_empty = true;
    ex_DLModel_28_tic(&ex_DLModel_28_DW.tStart.tv_sec,
                      &ex_DLModel_28_DW.tStart.tv_nsec);
  }

  ex_DLModel_28_emxInit_uint8_T(&cpu_thisTextU16, 2);
  ex_DLModel_28_emxInit_int32_T(&cpu_b_ii, 2);
  ex_DLModel_28_emxInit_int32_T(&cpu_idxNewlineChar, 2);
  ex_DLModel_28_emxInit_uint16_T(&cpu_thisCharcodes_1b, 2);
  ex_DLModel_28_emxInit_uint16_T(&cpu_thisGlyphIdxs_1b, 2);
  ex_DLModel_28_emxInit_int8_T(&cpu_c_x, 2);
  ex_DLModel_28_emxInit_boolean_T(&cpu_isNewLineChar, 2);
  if ((bboxes_size[0] != 0) && (bboxes_size[1] != 0)) {
    ex_DLModel_28_B.b_nz = bboxes_size[0];
    ex_DLModel_28_B.b_nx = bboxes_size[1];
    ex_DLModel_28_B.nbytes = bboxes_size[1];
    ex_DLModel_28_emxInit_char_T(&cpu_b_str, 2);
    for (ex_DLModel_28_B.vlen = 0; ex_DLModel_28_B.vlen < ex_DLModel_28_B.b_nz;
         ex_DLModel_28_B.vlen++) {
      ex_DLModel_28_B.f = rt_roundf_snf(labels_data[ex_DLModel_28_B.vlen]);
      if (ex_DLModel_28_B.f < 2.14748365E+9F) {
        if (ex_DLModel_28_B.f >= -2.14748365E+9F) {
          ex_DLModel_28_B.b_nbytes = static_cast<int32_T>(ex_DLModel_28_B.f);
          ex_DLModel_28_B.i_vlen = static_cast<int32_T>(ex_DLModel_28_B.f);
        } else {
          ex_DLModel_28_B.b_nbytes = MIN_int32_T;
          ex_DLModel_28_B.i_vlen = MIN_int32_T;
        }
      } else {
        ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        ex_DLModel_28_B.i_vlen = MAX_int32_T;
      }

      ex_DLModel_28_B.classIndex = ex_DLModel_28_B.i_vlen - 1;
      ex_DLModel_28_B.f = rt_roundf_snf(scores_data[ex_DLModel_28_B.vlen] *
        100.0F);
      if (ex_DLModel_28_B.f < 2.14748365E+9F) {
        if (ex_DLModel_28_B.f >= -2.14748365E+9F) {
          ex_DLModel_28_B.i_vlen = static_cast<int32_T>(ex_DLModel_28_B.f);
        } else {
          ex_DLModel_28_B.i_vlen = MIN_int32_T;
        }
      } else {
        ex_DLModel_28_B.i_vlen = MAX_int32_T;
      }

      if (ex_DLModel_28_B.b_nbytes < 1) {
        ex_DLModel_28_B.classIndex = 0;
      } else if (ex_DLModel_28_B.b_nbytes > 80) {
        ex_DLModel_28_B.classIndex = 79;
      }

      ex_DLModel_28_B.In_outdatedOnGpu = false;
      ex_DLModel_28_B.b_nbytes =
        ex_DLModel_28_DW.classNames[ex_DLModel_28_B.classIndex].f1->size[1];
      ex_DLModel_28_B.textLocAndWidth_idx_1 = ex_DLModel_28_B.b_nbytes + 1;
      for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <
           ex_DLModel_28_B.b_nbytes; ex_DLModel_28_B.b_startC_im++) {
        ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat[ex_DLModel_28_B.b_startC_im]
          = ex_DLModel_28_DW.classNames[ex_DLModel_28_B.classIndex].f1->
          data[ex_DLModel_28_B.b_startC_im];
        ex_DLModel_28_B.In_outdatedOnGpu = true;
      }

      if (ex_DLModel_28_B.In_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_validatedHoleFilling_f1_dat,
          ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat, 15UL,
          cudaMemcpyHostToDevice), __FILE__, __LINE__);
      }

      ex_DL_c2_ex_DLModel_28_kernel11<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (ex_DLModel_28_B.b_nbytes, *gpu_validatedHoleFilling_f1_dat);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.b_nbytes), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel12<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_validatedHoleFilling_f1_dat,
          ex_DLModel_28_B.b_nbytes, *gpu_varargin_1_data);
      }

      ex_DLModel_28_checkCudaError(cudaMemcpy
        (ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat, *gpu_varargin_1_data,
         15UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      ex_DLModel_28_B.b_nbytes = (int32_T)std::snprintf(NULL, 0, "%s: %d%%",
        &ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat[0],
        ex_DLModel_28_B.i_vlen) + 1;
      ex_DLModel_28_B.b_startC_im = cpu_b_str->size[0] * cpu_b_str->size[1];
      cpu_b_str->size[0] = 1;
      cpu_b_str->size[1] = ex_DLModel_28_B.b_nbytes;
      ex_DLM_emxEnsureCapacity_char_T(cpu_b_str, ex_DLModel_28_B.b_startC_im);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.textLocAndWidth_idx_1 - 1), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel13<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_validatedHoleFilling_f1_dat,
          ex_DLModel_28_B.textLocAndWidth_idx_1 - 1, *gpu_varargin_1_data);
      }

      ex_DLModel_28_checkCudaError(cudaMemcpy
        (ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat, *gpu_varargin_1_data,
         15UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      std::snprintf(&cpu_b_str->data[0], (size_t)ex_DLModel_28_B.b_nbytes,
                    "%s: %d%%",
                    &ex_DLModel_28_B.cpu_validatedHoleFilling_f1_dat[0],
                    ex_DLModel_28_B.i_vlen);
      if (ex_DLModel_28_B.b_nbytes - 1 < 1) {
        ex_DLModel_28_B.i_vlen = -1;
      } else {
        ex_DLModel_28_B.i_vlen = ex_DLModel_28_B.b_nbytes - 2;
      }

      ex_DL_c2_ex_DLModel_28_kernel14<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_b_color_data, *gpu_color_data, MAX_uint8_T, MAX_uint8_T, 0);
      ex_DLModel_28_B.color_data_outdatedOnCpu = true;
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_nx
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      if (ex_DLModel_28_B.bboxes_data_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(gpu_bboxes_data, cpu_bboxes_data,
          static_cast<uint32_T>(bboxes_size[0] * bboxes_size[1]) * sizeof
          (real32_T), cudaMemcpyHostToDevice), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel15<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(gpu_bboxes_data, bboxes_size[0],
          ex_DLModel_28_B.vlen, ex_DLModel_28_B.b_nx - 1, *gpu_inPosition_data);
      }

      if (ex_DLModel_28_B.b_nx == 2) {
        ex_DLModel_28_B.position_size[1] = 2;
        ex_DL_c2_ex_DLModel_28_kernel16<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_inPosition_data, *gpu_position_data);
      } else {
        ex_DLModel_28_B.position_size[1] = ex_DLModel_28_B.b_nx;
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.b_nx - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel43<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(*gpu_inPosition_data,
            ex_DLModel_28_B.b_nx - 1, *gpu_position_data);
        }
      }

      ex_DL_c2_ex_DLModel_28_kernel17<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
        (*gpu_RGB);
      ex_DLModel_28_B.RGB_outdatedOnGpu = false;
      ex_DLModel_28_B.RGB_outdatedOnCpu = true;
      ex_DLModel_28_B.dimens2 = static_cast<uint32_T>
        (ex_DLModel_28_B.position_size[1]);
      ex_DL_c2_ex_DLModel_28_kernel18<<<dim3(5U, 1U, 1U), dim3(128U, 1U, 1U)>>>(*
        gpu_pixCount);
      ex_DLModel_28_B.In_outdatedOnGpu = true;
      ptrObj = NULL;
      constructDrawBaseObjectShape(&ptrObj);
      polygonEdgePtr = NULL;
      posPtr = NULL;
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_position_data,
        *gpu_position_data, 16UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      getPositionDataPointer(&posPtr, &ex_DLModel_28_B.cpu_position_data[0], 1U,
        static_cast<uint32_T>(ex_DLModel_28_B.position_size[1]));
      ptsDWPtr = NULL;
      getPtsDWPointer(&ptsDWPtr, 1, 2U, 1U, static_cast<uint32_T>
                      (ex_DLModel_28_B.position_size[1]));
      colPtr = NULL;
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_b_color_data, *
        gpu_b_color_data, 3UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      getColorDataPointer_uint8(&colPtr, &ex_DLModel_28_B.cpu_b_color_data[0],
        1U, 3U);
      for (ex_DLModel_28_B.b_nbytes = 0; ex_DLModel_28_B.b_nbytes < 2;
           ex_DLModel_28_B.b_nbytes++) {
        ex_DLModel_28_B.isInitialise = initialiseDrawbaseShape(ptrObj,
          static_cast<uint32_T>(ex_DLModel_28_B.b_nbytes), 1);
        if (!ex_DLModel_28_B.isInitialise) {
          ex_DLModel_28_B.isInitialise = bv[ex_DLModel_28_B.b_nbytes];
          allocatePolygonEdgePointer(&polygonEdgePtr, 1, 2U, 1U,
            ex_DLModel_28_B.dimens2, false, ex_DLModel_28_B.isInitialise);
          if (ex_DLModel_28_B.RGB_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_RGB_m,
              *gpu_RGB, 921600UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          if (ex_DLModel_28_B.In_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_In, *gpu_In, 921600UL,
              cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          if (ex_DLModel_28_B.In_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_pixCount,
              *gpu_pixCount, 640UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          instantiateDrawBaseShape_uint8(ptrObj, &ex_DLModel_28_B.cpu_RGB_m[0],
            &cpu_In[0], posPtr, colPtr, 0.6, 1, 1, true, 480U, 640U, 3U, 2U, 1U,
            ex_DLModel_28_B.dimens2, 1U, false, ex_DLModel_28_B.isInitialise,
            &ex_DLModel_28_B.cpu_pixCount[0], static_cast<uint32_T>
            (ex_DLModel_28_B.b_nbytes), ptsDWPtr, polygonEdgePtr);
          ex_DLModel_28_B.In_outdatedOnGpu = false;
          ex_DLModel_28_B.In_outdatedOnCpu = false;
          ex_DLModel_28_B.RGB_outdatedOnCpu = false;
          ex_DLModel_28_B.RGB_outdatedOnGpu = true;
        }
      }

      mDrawShapes(ptrObj, false, true, 1, 1, 480, 640);
      deallocateMemoryShape(ptrObj);
      deallocatePolygonEdgePointer(polygonEdgePtr);
      deletePositionDataPointer(posPtr);
      deletePtsDWPointer(ptsDWPtr);
      deleteColorDataPointer_uint8(colPtr);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.nbytes - 1), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      ex_DLModel_28_B.bboxes_data_outdatedOnGpu = false;
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel19<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(gpu_bboxes_data, bboxes_size[0],
          ex_DLModel_28_B.vlen, ex_DLModel_28_B.nbytes - 1, *gpu_position_data);
      }

      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_position_data,
        *gpu_position_data, 16UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      if (ex_DLModel_28_B.cpu_position_data[1] < -2147483647) {
        ex_DLModel_28_B.textLocAndWidth_idx_1 = MIN_int32_T;
      } else {
        ex_DLModel_28_B.textLocAndWidth_idx_1 =
          ex_DLModel_28_B.cpu_position_data[1] - 1;
      }

      if (ex_DLModel_28_B.RGB_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_RGB,
          ex_DLModel_28_B.cpu_RGB_m, 921600UL, cudaMemcpyHostToDevice), __FILE__,
          __LINE__);
      }

      ex_DLModel_28_B.RGB_outdatedOnGpu = false;
      ex_DL_c2_ex_DLModel_28_kernel20<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
        (*gpu_RGB, *gpu_In);
      ex_DLModel_28_B.In_outdatedOnGpu = false;
      ex_DLModel_28_B.In_outdatedOnCpu = true;
      cpu_thisTextU16->size[0] = 1;
      cpu_thisTextU16->size[1] = ex_DLModel_28_B.i_vlen + 1;
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.i_vlen), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      ex__gpuEmxEnsureCapacity_char_T(cpu_b_str, &ex_DLModel_28_B.gpu_b_str,
        false);
      ex_gpuEmxEnsureCapacity_uint8_T(cpu_thisTextU16,
        &ex_DLModel_28_B.gpu_thisTextU16, true);
      ex__gpuEmxMemcpyCpuToGpu_char_T(&ex_DLModel_28_B.gpu_b_str, cpu_b_str);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel21<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_b_str,
          ex_DLModel_28_B.i_vlen, ex_DLModel_28_B.gpu_thisTextU16);
      }

      if (cpu_thisTextU16->size[1] != 0) {
        ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
          cpu_isNewLineChar->size[1];
        cpu_isNewLineChar->size[0] = 1;
        ex_DLModel_28_B.i_vlen = cpu_thisTextU16->size[1];
        cpu_isNewLineChar->size[1] = cpu_thisTextU16->size[1];
        ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          ex_DLModel_28_B.b_startC_im);
        ex_DLModel_28_B.b_nbytes = cpu_thisTextU16->size[1];
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar, true);
        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel22<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
            ex_DLModel_28_B.b_nbytes - 1, ex_DLModel_28_B.gpu_isNewLineChar);
        }

        ex_DLModel_28_B.isInitialise = true;
        ex_DLModel_28_B.b_nbytes = 0;
        ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
        ex_DLModel_28_B.b_startC_im = cpu_b_ii->size[0] * cpu_b_ii->size[1];
        cpu_b_ii->size[0] = 1;
        cpu_b_ii->size[1] = ex_DLModel_28_B.i_vlen;
        ex_DL_emxEnsureCapacity_int32_T(cpu_b_ii, ex_DLModel_28_B.b_startC_im);
        ex_DLModel_28_B.classIndex = 1;
        exitg1 = false;
        while ((!exitg1) && (ex_DLModel_28_B.classIndex <=
                             ex_DLModel_28_B.i_vlen)) {
          if (ex_DLModel_28_B.isInitialise) {
            gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
              &ex_DLModel_28_B.gpu_isNewLineChar);
          }

          ex_DLModel_28_B.isInitialise = false;
          if (cpu_isNewLineChar->data[ex_DLModel_28_B.classIndex - 1]) {
            ex_DLModel_28_B.b_nbytes++;
            cpu_b_ii->data[ex_DLModel_28_B.b_nbytes - 1] =
              ex_DLModel_28_B.classIndex;
            ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
            if (ex_DLModel_28_B.b_nbytes >= ex_DLModel_28_B.i_vlen) {
              exitg1 = true;
            } else {
              ex_DLModel_28_B.classIndex++;
            }
          } else {
            ex_DLModel_28_B.classIndex++;
          }
        }

        if (cpu_isNewLineChar->size[1] == 1) {
          if (ex_DLModel_28_B.b_nbytes == 0) {
            ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
            cpu_b_ii->size[0] = 1;
            cpu_b_ii->size[1] = 0;
          }
        } else if (ex_DLModel_28_B.b_nbytes < 1) {
          cpu_b_ii->size[1] = 0;
        } else {
          ex_DLModel_28_B.b_startC_im = cpu_b_ii->size[0] * cpu_b_ii->size[1];
          cpu_b_ii->size[1] = ex_DLModel_28_B.b_nbytes;
          ex_DL_emxEnsureCapacity_int32_T(cpu_b_ii, ex_DLModel_28_B.b_startC_im);
        }

        ex_DLModel_28_B.b_startC_im = cpu_idxNewlineChar->size[0] *
          cpu_idxNewlineChar->size[1];
        cpu_idxNewlineChar->size[0] = 1;
        ex_DLModel_28_B.b_penX = cpu_b_ii->size[1];
        cpu_idxNewlineChar->size[1] = cpu_b_ii->size[1];
        ex_DL_emxEnsureCapacity_int32_T(cpu_idxNewlineChar,
          ex_DLModel_28_B.b_startC_im);
        ex_DLModel_28_B.b_nbytes = cpu_b_ii->size[1];
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        ex_gpuEmxEnsureCapacity_int32_T(cpu_b_ii, &ex_DLModel_28_B.gpu_b_ii,
          !ex_DLModel_28_B.b_ii_outdatedOnGpu);
        ex_gpuEmxEnsureCapacity_int32_T(cpu_idxNewlineChar,
          &ex_DLModel_28_B.gpu_idxNewlineChar, true);
        if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
          ex_gpuEmxMemcpyCpuToGpu_int32_T(&ex_DLModel_28_B.gpu_b_ii, cpu_b_ii);
        }

        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel23<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_b_ii,
            ex_DLModel_28_B.b_nbytes - 1, ex_DLModel_28_B.gpu_idxNewlineChar);
        }

        ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
        if (cpu_b_ii->size[1] == 0) {
          cpu_thisCharcodes_1b->size[0] = 1;
          cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.i_vlen;
          cpu_thisGlyphIdxs_1b->size[0] = 1;
          cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.i_vlen;
          ex_DLModel_28_B.b_startC_im = cpu_c_x->size[0] * cpu_c_x->size[1];
          cpu_c_x->size[0] = 1;
          cpu_c_x->size[1] = ex_DLModel_28_B.i_vlen;
          ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x, ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.i_vlen - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x,
            true);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
            &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
            &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
          if (ex_DLModel_28_B.iv6_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_iv6, cpu_iv6, 261UL,
              cudaMemcpyHostToDevice), __FILE__, __LINE__);
          }

          if (ex_DLModel_28_B.uv1_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv1, cpu_uv1, 512UL,
              cudaMemcpyHostToDevice), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel24<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_iv6, *gpu_uv1,
              ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.i_vlen - 1,
              ex_DLModel_28_B.gpu_c_x, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
              ex_DLModel_28_B.gpu_thisCharcodes_1b);
          }

          ex_DLModel_28_B.isInitialise = true;
          ex_DLModel_28_B.iv6_outdatedOnGpu = false;
          ex_DL_c2_ex_DLModel_28_kernel25<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
            (*gpu_iv6, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, gpu_b_cg);
          ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
          for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
               ex_DLModel_28_B.i_vlen - 2; ex_DLModel_28_B.b_startC_im++) {
            if (ex_DLModel_28_B.isInitialise) {
              ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x);
            }

            ex_DLModel_28_B.isInitialise = false;
            if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
              ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_b_cg,
                gpu_b_cg, 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
            }

            ex_DLModel_28_B.cpu_b_cg += static_cast<real_T>(cpu_c_x->
              data[ex_DLModel_28_B.b_startC_im + 1]);
            ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
          }

          ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
            cpu_isNewLineChar->size[1];
          cpu_isNewLineChar->size[0] = 1;
          cpu_isNewLineChar->size[1] = ex_DLModel_28_B.i_vlen;
          ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.i_vlen - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            &ex_DLModel_28_B.gpu_isNewLineChar, true);
          ex_DLModel_28_B.uv1_outdatedOnGpu = false;
          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel26<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_uv1,
              ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.i_vlen - 1,
              ex_DLModel_28_B.gpu_isNewLineChar);
          }

          gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
            &ex_DLModel_28_B.gpu_isNewLineChar);
          ex_DLModel_28_B.classIndex = cpu_isNewLineChar->data[0];
          for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
               ex_DLModel_28_B.i_vlen - 2; ex_DLModel_28_B.b_startC_im++) {
            ex_DLModel_28_B.classIndex += cpu_isNewLineChar->
              data[ex_DLModel_28_B.b_startC_im + 1];
          }

          if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_b_cg,
              gpu_b_cg, 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
            ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
              (ex_DLModel_28_B.cpu_b_cg);
          } else {
            ex_DLModel_28_B.b_nbytes = MAX_int32_T;
          }

          ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>
            (ex_DLModel_28_B.classIndex) * 4.0;
          if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
            if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
              ex_DLModel_28_B.classIndex = static_cast<int32_T>
                (ex_DLModel_28_B.cpu_b_cg);
            } else {
              ex_DLModel_28_B.classIndex = MIN_int32_T;
            }
          } else {
            ex_DLModel_28_B.classIndex = MAX_int32_T;
          }

          if ((ex_DLModel_28_B.b_nbytes > 0) && (ex_DLModel_28_B.classIndex >
               MAX_int32_T - ex_DLModel_28_B.b_nbytes)) {
            ex_DLModel_28_B.classIndex = MAX_int32_T;
          } else {
            ex_DLModel_28_B.classIndex += ex_DLModel_28_B.b_nbytes;
          }
        } else {
          if (static_cast<real_T>(cpu_b_ii->data[0]) - 1.0 < 1.0) {
            ex_DLModel_28_B.b_nbytes = -1;
          } else {
            ex_DLModel_28_B.b_nbytes = cpu_b_ii->data[0] - 2;
          }

          cpu_thisCharcodes_1b->size[0] = 1;
          cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.b_nbytes + 1;
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.b_nbytes), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
            &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel33<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
              ex_DLModel_28_B.b_nbytes, ex_DLModel_28_B.gpu_thisCharcodes_1b);
          }

          cpu_thisGlyphIdxs_1b->size[0] = 1;
          ex_DLModel_28_B.classIndex = cpu_thisCharcodes_1b->size[1];
          cpu_thisGlyphIdxs_1b->size[1] = cpu_thisCharcodes_1b->size[1];
          ex_DLModel_28_B.b_nbytes = cpu_thisCharcodes_1b->size[1];
          ex_DLModel_28_B.b_startC_im = cpu_c_x->size[0] * cpu_c_x->size[1];
          cpu_c_x->size[0] = 1;
          cpu_c_x->size[1] = cpu_thisCharcodes_1b->size[1];
          ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x, ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x,
            true);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
            &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
          if (ex_DLModel_28_B.iv6_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_iv6, cpu_iv6, 261UL,
              cudaMemcpyHostToDevice), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.iv6_outdatedOnGpu = false;
          if (ex_DLModel_28_B.uv1_outdatedOnGpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv1, cpu_uv1, 512UL,
              cudaMemcpyHostToDevice), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel34<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_iv6, *gpu_uv1,
              ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.b_nbytes - 1,
              ex_DLModel_28_B.gpu_c_x, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b);
          }

          ex_DLModel_28_B.isInitialise = true;
          if (cpu_thisCharcodes_1b->size[1] == 0) {
            ex_DLModel_28_B.cpu_b_lenFirstSegment = 0.0;
            ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = false;
          } else {
            ex_DL_c2_ex_DLModel_28_kernel42<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
              (*gpu_iv6, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
               gpu_b_lenFirstSegment);
            ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = true;
            for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                 ex_DLModel_28_B.classIndex - 2; ex_DLModel_28_B.b_startC_im++)
            {
              if (ex_DLModel_28_B.isInitialise) {
                ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x,
                  &ex_DLModel_28_B.gpu_c_x);
              }

              ex_DLModel_28_B.isInitialise = false;
              if (ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu) {
                ex_DLModel_28_checkCudaError(cudaMemcpy
                  (&ex_DLModel_28_B.cpu_b_lenFirstSegment, gpu_b_lenFirstSegment,
                   8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
              }

              ex_DLModel_28_B.cpu_b_lenFirstSegment += static_cast<real_T>
                (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
              ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = false;
            }
          }

          ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
            cpu_isNewLineChar->size[1];
          cpu_isNewLineChar->size[0] = 1;
          cpu_isNewLineChar->size[1] = ex_DLModel_28_B.classIndex;
          ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.classIndex - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            &ex_DLModel_28_B.gpu_isNewLineChar, true);
          ex_DLModel_28_B.uv1_outdatedOnGpu = false;
          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel35<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_uv1,
              ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.classIndex -
              1, ex_DLModel_28_B.gpu_isNewLineChar);
          }

          if (cpu_isNewLineChar->size[1] == 0) {
            ex_DLModel_28_B.f_nz = 0;
          } else {
            gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
              &ex_DLModel_28_B.gpu_isNewLineChar);
            ex_DLModel_28_B.f_nz = cpu_isNewLineChar->data[0];
            for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                 ex_DLModel_28_B.classIndex - 2; ex_DLModel_28_B.b_startC_im++)
            {
              ex_DLModel_28_B.f_nz += cpu_isNewLineChar->
                data[ex_DLModel_28_B.b_startC_im + 1];
            }
          }

          ex_DLModel_28_B.classIndex = 0;
          for (ex_DLModel_28_B.g_nz = 0; ex_DLModel_28_B.g_nz <=
               ex_DLModel_28_B.b_penX - 3; ex_DLModel_28_B.g_nz++) {
            if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
              ex_gpuEmxMemcpyGpuToCpu_int32_T(cpu_idxNewlineChar,
                &ex_DLModel_28_B.gpu_idxNewlineChar);
            }

            ex_DLModel_28_B.b_nbytes = cpu_idxNewlineChar->
              data[ex_DLModel_28_B.g_nz + 1];
            ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
            ex_DLModel_28_B.n_vlen = cpu_idxNewlineChar->
              data[ex_DLModel_28_B.g_nz + 2];
            if (static_cast<real_T>(ex_DLModel_28_B.b_nbytes) + 1.0 >
                static_cast<real_T>(ex_DLModel_28_B.n_vlen) - 1.0) {
              ex_DLModel_28_B.b_nbytes = 0;
              ex_DLModel_28_B.n_vlen = 0;
            } else {
              ex_DLModel_28_B.n_vlen--;
            }

            cpu_thisCharcodes_1b->size[0] = 1;
            ex_DLModel_28_B.n_vlen -= ex_DLModel_28_B.b_nbytes;
            cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.n_vlen;
            cpu_thisGlyphIdxs_1b->size[0] = 1;
            cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.n_vlen;
            ex_DLModel_28_B.b_startC_im = cpu_c_x->size[0] * cpu_c_x->size[1];
            cpu_c_x->size[0] = 1;
            cpu_c_x->size[1] = ex_DLModel_28_B.n_vlen;
            ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x, ex_DLModel_28_B.b_startC_im);
            mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
              (ex_DLModel_28_B.n_vlen - 1), &ex_DLModel_28_B.grid_p,
              &ex_DLModel_28_B.block_c, 65535U);
            ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x,
              true);
            e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
              &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
            e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
              &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
            ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
              (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
            if (ex_DLModel_28_B.validLaunchParams_d) {
              ex_DL_c2_ex_DLModel_28_kernel36<<<ex_DLModel_28_B.grid_p,
                ex_DLModel_28_B.block_c>>>(*gpu_iv6, *gpu_uv1,
                ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.b_nbytes,
                ex_DLModel_28_B.n_vlen - 1, ex_DLModel_28_B.gpu_c_x,
                ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
                ex_DLModel_28_B.gpu_thisCharcodes_1b);
            }

            ex_DLModel_28_B.isInitialise = true;
            if (cpu_thisCharcodes_1b->size[1] == 0) {
              ex_DLModel_28_B.cpu_c_lenThisSegment = 0.0;
              ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
            } else {
              ex_DL_c2_ex_DLModel_28_kernel38<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
                1U)>>>(*gpu_iv6, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
                       gpu_c_lenThisSegment);
              ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = true;
              for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                   ex_DLModel_28_B.n_vlen - 2; ex_DLModel_28_B.b_startC_im++) {
                if (ex_DLModel_28_B.isInitialise) {
                  ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x,
                    &ex_DLModel_28_B.gpu_c_x);
                }

                ex_DLModel_28_B.isInitialise = false;
                if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
                  ex_DLModel_28_checkCudaError(cudaMemcpy
                    (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment,
                     8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                }

                ex_DLModel_28_B.cpu_c_lenThisSegment += static_cast<real_T>
                  (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
                ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
              }
            }

            ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
              cpu_isNewLineChar->size[1];
            cpu_isNewLineChar->size[0] = 1;
            cpu_isNewLineChar->size[1] = ex_DLModel_28_B.n_vlen;
            ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
              ex_DLModel_28_B.b_startC_im);
            mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
              (ex_DLModel_28_B.n_vlen - 1), &ex_DLModel_28_B.grid_p,
              &ex_DLModel_28_B.block_c, 65535U);
            gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
              &ex_DLModel_28_B.gpu_isNewLineChar, true);
            ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
              (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
            if (ex_DLModel_28_B.validLaunchParams_d) {
              ex_DL_c2_ex_DLModel_28_kernel37<<<ex_DLModel_28_B.grid_p,
                ex_DLModel_28_B.block_c>>>(*gpu_uv1,
                ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.n_vlen - 1,
                ex_DLModel_28_B.gpu_isNewLineChar);
            }

            if (cpu_isNewLineChar->size[1] == 0) {
              ex_DLModel_28_B.b_nbytes = 0;
            } else {
              gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
                &ex_DLModel_28_B.gpu_isNewLineChar);
              ex_DLModel_28_B.b_nbytes = cpu_isNewLineChar->data[0];
              for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                   ex_DLModel_28_B.n_vlen - 2; ex_DLModel_28_B.b_startC_im++) {
                ex_DLModel_28_B.b_nbytes += cpu_isNewLineChar->
                  data[ex_DLModel_28_B.b_startC_im + 1];
              }
            }

            ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>
              (ex_DLModel_28_B.b_nbytes) * 4.0;
            if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
              if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
                ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
                  (ex_DLModel_28_B.cpu_b_cg);
              } else {
                ex_DLModel_28_B.b_nbytes = MIN_int32_T;
              }
            } else {
              ex_DLModel_28_B.b_nbytes = MAX_int32_T;
            }

            if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
              ex_DLModel_28_checkCudaError(cudaMemcpy
                (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment,
                 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
            }

            ex_DLModel_28_B.cpu_b_cg = ex_DLModel_28_B.cpu_c_lenThisSegment +
              static_cast<real_T>(ex_DLModel_28_B.b_nbytes);
            if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
              ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
                (ex_DLModel_28_B.cpu_b_cg);
            } else {
              ex_DLModel_28_B.b_nbytes = MAX_int32_T;
            }

            if (ex_DLModel_28_B.b_nbytes > ex_DLModel_28_B.classIndex) {
              ex_DLModel_28_B.classIndex = ex_DLModel_28_B.b_nbytes;
            }
          }

          if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
            ex_gpuEmxMemcpyGpuToCpu_int32_T(cpu_idxNewlineChar,
              &ex_DLModel_28_B.gpu_idxNewlineChar);
          }

          ex_DLModel_28_B.g_nz = cpu_idxNewlineChar->data
            [cpu_idxNewlineChar->size[1] - 1];
          if (static_cast<real_T>(ex_DLModel_28_B.g_nz) + 1.0 >
              cpu_thisTextU16->size[1]) {
            ex_DLModel_28_B.g_nz = 0;
            ex_DLModel_28_B.b_nbytes = 0;
          } else {
            ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.i_vlen;
          }

          cpu_thisCharcodes_1b->size[0] = 1;
          ex_DLModel_28_B.b_nbytes -= ex_DLModel_28_B.g_nz;
          cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.b_nbytes;
          cpu_thisGlyphIdxs_1b->size[0] = 1;
          cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.b_nbytes;
          ex_DLModel_28_B.b_startC_im = cpu_c_x->size[0] * cpu_c_x->size[1];
          cpu_c_x->size[0] = 1;
          cpu_c_x->size[1] = ex_DLModel_28_B.b_nbytes;
          ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x, ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x,
            true);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
            &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
          e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
            &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel39<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_iv6, *gpu_uv1,
              ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.g_nz,
              ex_DLModel_28_B.b_nbytes - 1, ex_DLModel_28_B.gpu_c_x,
              ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
              ex_DLModel_28_B.gpu_thisCharcodes_1b);
          }

          ex_DLModel_28_B.isInitialise = true;
          if (cpu_thisCharcodes_1b->size[1] == 0) {
            ex_DLModel_28_B.cpu_c_lenThisSegment = 0.0;
            ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
          } else {
            ex_DL_c2_ex_DLModel_28_kernel41<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
              (*gpu_iv6, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
               gpu_c_lenThisSegment);
            ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = true;
            for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                 ex_DLModel_28_B.b_nbytes - 2; ex_DLModel_28_B.b_startC_im++) {
              if (ex_DLModel_28_B.isInitialise) {
                ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x,
                  &ex_DLModel_28_B.gpu_c_x);
              }

              ex_DLModel_28_B.isInitialise = false;
              if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
                ex_DLModel_28_checkCudaError(cudaMemcpy
                  (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment,
                   8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
              }

              ex_DLModel_28_B.cpu_c_lenThisSegment += static_cast<real_T>
                (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
              ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
            }
          }

          ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
            cpu_isNewLineChar->size[1];
          cpu_isNewLineChar->size[0] = 1;
          cpu_isNewLineChar->size[1] = ex_DLModel_28_B.b_nbytes;
          ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            ex_DLModel_28_B.b_startC_im);
          mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
            (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
            &ex_DLModel_28_B.block_c, 65535U);
          gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
            &ex_DLModel_28_B.gpu_isNewLineChar, true);
          ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
            (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
          if (ex_DLModel_28_B.validLaunchParams_d) {
            ex_DL_c2_ex_DLModel_28_kernel40<<<ex_DLModel_28_B.grid_p,
              ex_DLModel_28_B.block_c>>>(*gpu_uv1,
              ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.b_nbytes - 1,
              ex_DLModel_28_B.gpu_isNewLineChar);
          }

          if (cpu_isNewLineChar->size[1] == 0) {
            ex_DLModel_28_B.g_nz = 0;
          } else {
            gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
              &ex_DLModel_28_B.gpu_isNewLineChar);
            ex_DLModel_28_B.g_nz = cpu_isNewLineChar->data[0];
            for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
                 ex_DLModel_28_B.b_nbytes - 2; ex_DLModel_28_B.b_startC_im++) {
              ex_DLModel_28_B.g_nz += cpu_isNewLineChar->
                data[ex_DLModel_28_B.b_startC_im + 1];
            }
          }

          ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>(ex_DLModel_28_B.f_nz) *
            4.0;
          if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
            if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
              ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
                (ex_DLModel_28_B.cpu_b_cg);
            } else {
              ex_DLModel_28_B.b_nbytes = MIN_int32_T;
            }
          } else {
            ex_DLModel_28_B.b_nbytes = MAX_int32_T;
          }

          if (ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy
              (&ex_DLModel_28_B.cpu_b_lenFirstSegment, gpu_b_lenFirstSegment,
               8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.cpu_b_cg = ex_DLModel_28_B.cpu_b_lenFirstSegment +
            static_cast<real_T>(ex_DLModel_28_B.b_nbytes);
          if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
            ex_DLModel_28_B.e_x[0] = static_cast<int32_T>
              (ex_DLModel_28_B.cpu_b_cg);
          } else {
            ex_DLModel_28_B.e_x[0] = MAX_int32_T;
          }

          ex_DLModel_28_B.e_x[1] = ex_DLModel_28_B.classIndex;
          ex_DLModel_28_B.cpu_b_lenFirstSegment = static_cast<real_T>
            (ex_DLModel_28_B.g_nz) * 4.0;
          if (ex_DLModel_28_B.cpu_b_lenFirstSegment < 2.147483648E+9) {
            if (ex_DLModel_28_B.cpu_b_lenFirstSegment >= -2.147483648E+9) {
              ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
                (ex_DLModel_28_B.cpu_b_lenFirstSegment);
            } else {
              ex_DLModel_28_B.b_nbytes = MIN_int32_T;
            }
          } else {
            ex_DLModel_28_B.b_nbytes = MAX_int32_T;
          }

          if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy
              (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment, 8UL,
               cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.cpu_b_lenFirstSegment =
            ex_DLModel_28_B.cpu_c_lenThisSegment + static_cast<real_T>
            (ex_DLModel_28_B.b_nbytes);
          if (ex_DLModel_28_B.cpu_b_lenFirstSegment < 2.147483648E+9) {
            ex_DLModel_28_B.e_x[2] = static_cast<int32_T>
              (ex_DLModel_28_B.cpu_b_lenFirstSegment);
          } else {
            ex_DLModel_28_B.e_x[2] = MAX_int32_T;
          }

          if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
            ex_DLModel_28_B.classIndex = static_cast<int32_T>
              (ex_DLModel_28_B.cpu_b_cg);
          } else {
            ex_DLModel_28_B.classIndex = MAX_int32_T;
          }

          for (ex_DLModel_28_B.b_nbytes = 0; ex_DLModel_28_B.b_nbytes < 2;
               ex_DLModel_28_B.b_nbytes++) {
            ex_DLModel_28_B.f_nz = ex_DLModel_28_B.e_x[ex_DLModel_28_B.b_nbytes
              + 1];
            if (ex_DLModel_28_B.classIndex < ex_DLModel_28_B.f_nz) {
              ex_DLModel_28_B.classIndex = ex_DLModel_28_B.f_nz;
            }
          }
        }

        ex_DLModel_28_B.d_tbWidth = ex_DLModel_28_B.cpu_position_data[2];
        if (ex_DLModel_28_B.classIndex >= ex_DLModel_28_B.cpu_position_data[2])
        {
          ex_DLModel_28_B.d_tbWidth = ex_DLModel_28_B.classIndex;
        }

        if (ex_DLModel_28_B.d_tbWidth > ex_DLModel_28_B.cpu_position_data[2]) {
          if (ex_DLModel_28_B.d_tbWidth > 2147483639) {
            ex_DLModel_28_B.d_tbWidth = MAX_int32_T;
          } else {
            ex_DLModel_28_B.d_tbWidth += 8;
          }
        }

        ex_DLModel_28_B.cpu_b_cg = ((static_cast<real_T>
          (cpu_idxNewlineChar->size[1]) + 1.0) - 1.0) * 14.0;
        if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
          ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
            (ex_DLModel_28_B.cpu_b_cg);
        } else {
          ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        }

        if (ex_DLModel_28_B.b_nbytes > 2147483632) {
          ex_DLModel_28_B.f_nz = MAX_int32_T;
        } else {
          ex_DLModel_28_B.f_nz = ex_DLModel_28_B.b_nbytes + 15;
        }

        if (ex_DLModel_28_B.f_nz > 2147483639) {
          ex_DLModel_28_B.f_nz = MAX_int32_T;
        } else {
          ex_DLModel_28_B.f_nz += 8;
        }

        if ((ex_DLModel_28_B.textLocAndWidth_idx_1 >= 0) &&
            (ex_DLModel_28_B.f_nz < ex_DLModel_28_B.textLocAndWidth_idx_1 -
             MAX_int32_T)) {
          ex_DLModel_28_B.g_nz = MAX_int32_T;
          ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        } else if ((ex_DLModel_28_B.textLocAndWidth_idx_1 < 0) &&
                   (ex_DLModel_28_B.f_nz > ex_DLModel_28_B.textLocAndWidth_idx_1
                    - MIN_int32_T)) {
          ex_DLModel_28_B.g_nz = MIN_int32_T;
          ex_DLModel_28_B.b_nbytes = MIN_int32_T;
        } else {
          ex_DLModel_28_B.g_nz = ex_DLModel_28_B.textLocAndWidth_idx_1 -
            ex_DLModel_28_B.f_nz;
          ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.g_nz;
        }

        ex_DLModel_28_B.n_vlen = ex_DLModel_28_B.b_nbytes + 1;
        ex_DLModel_28_B.b_penX = ex_DLModel_28_B.cpu_position_data[0];
        if ((ex_DLModel_28_B.cpu_position_data[2] > 0) &&
            (ex_DLModel_28_B.cpu_position_data[3] > 0)) {
          if ((ex_DLModel_28_B.g_nz + 1 < 0) && (ex_DLModel_28_B.f_nz <
               MAX_int32_T - ex_DLModel_28_B.g_nz)) {
            ex_DLModel_28_B.b_endR_im = MIN_int32_T;
          } else if ((ex_DLModel_28_B.g_nz + 1 > 0) && (ex_DLModel_28_B.f_nz >
                      2147483646 - ex_DLModel_28_B.g_nz)) {
            ex_DLModel_28_B.b_endR_im = MAX_int32_T;
          } else {
            ex_DLModel_28_B.b_endR_im = (ex_DLModel_28_B.g_nz +
              ex_DLModel_28_B.f_nz) + 1;
          }

          if (ex_DLModel_28_B.cpu_position_data[0] <= 640) {
            if ((ex_DLModel_28_B.cpu_position_data[0] < 0) &&
                (ex_DLModel_28_B.cpu_position_data[2] < MIN_int32_T
                 - ex_DLModel_28_B.cpu_position_data[0])) {
              ex_DLModel_28_B.b_nbytes = MIN_int32_T;
            } else if ((ex_DLModel_28_B.cpu_position_data[0] > 0) &&
                       (ex_DLModel_28_B.cpu_position_data[2] > MAX_int32_T
                        - ex_DLModel_28_B.cpu_position_data[0])) {
              ex_DLModel_28_B.b_nbytes = MAX_int32_T;
            } else {
              ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.cpu_position_data[0] +
                ex_DLModel_28_B.cpu_position_data[2];
            }

            if (ex_DLModel_28_B.b_nbytes < -2147483647) {
            } else {
              ex_DLModel_28_B.b_nbytes--;
            }

            if (ex_DLModel_28_B.b_nbytes >= 1) {
              if (ex_DLModel_28_B.b_endR_im <= 480) {
                if ((ex_DLModel_28_B.b_endR_im < 0) &&
                    (ex_DLModel_28_B.cpu_position_data[3] < MIN_int32_T
                     - ex_DLModel_28_B.b_endR_im)) {
                  ex_DLModel_28_B.b_endR_im = MIN_int32_T;
                } else if ((ex_DLModel_28_B.b_endR_im > 0) &&
                           (ex_DLModel_28_B.cpu_position_data[3] > MAX_int32_T -
                            ex_DLModel_28_B.b_endR_im)) {
                  ex_DLModel_28_B.b_endR_im = MAX_int32_T;
                } else {
                  ex_DLModel_28_B.b_endR_im +=
                    ex_DLModel_28_B.cpu_position_data[3];
                }

                if (ex_DLModel_28_B.b_endR_im < -2147483647) {
                  ex_DLModel_28_B.b_nbytes = MIN_int32_T;
                } else {
                  ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.b_endR_im - 1;
                }

                ex_DLModel_28_B.isInitialise = (ex_DLModel_28_B.b_nbytes >= 1);
              } else {
                ex_DLModel_28_B.isInitialise = false;
              }
            } else {
              ex_DLModel_28_B.isInitialise = false;
            }
          } else {
            ex_DLModel_28_B.isInitialise = false;
          }

          if (ex_DLModel_28_B.isInitialise) {
            if (ex_DLModel_28_B.g_nz + 1 < 1) {
              ex_DLModel_28_B.b_nbytes = (ex_DLModel_28_B.g_nz +
                ex_DLModel_28_B.f_nz) + 1;
              if ((ex_DLModel_28_B.b_nbytes < 0) &&
                  (ex_DLModel_28_B.cpu_position_data[3] < MIN_int32_T
                   - ex_DLModel_28_B.b_nbytes)) {
                ex_DLModel_28_B.b_nbytes = MIN_int32_T;
              } else if ((ex_DLModel_28_B.b_nbytes > 0) &&
                         (ex_DLModel_28_B.cpu_position_data[3] > MAX_int32_T
                          - ex_DLModel_28_B.b_nbytes)) {
                ex_DLModel_28_B.b_nbytes = MAX_int32_T;
              } else {
                ex_DLModel_28_B.b_nbytes += ex_DLModel_28_B.cpu_position_data[3];
              }

              if (ex_DLModel_28_B.b_nbytes >= 1) {
                if ((ex_DLModel_28_B.textLocAndWidth_idx_1 < 0) &&
                    (ex_DLModel_28_B.cpu_position_data[3] < MIN_int32_T
                     - ex_DLModel_28_B.textLocAndWidth_idx_1)) {
                  ex_DLModel_28_B.g_nz = MIN_int32_T;
                } else if ((ex_DLModel_28_B.textLocAndWidth_idx_1 > 0) &&
                           (ex_DLModel_28_B.cpu_position_data[3] > MAX_int32_T -
                            ex_DLModel_28_B.textLocAndWidth_idx_1)) {
                  ex_DLModel_28_B.g_nz = MAX_int32_T;
                } else {
                  ex_DLModel_28_B.g_nz = ex_DLModel_28_B.textLocAndWidth_idx_1 +
                    ex_DLModel_28_B.cpu_position_data[3];
                }

                if (ex_DLModel_28_B.g_nz > 2147483646) {
                  ex_DLModel_28_B.n_vlen = MAX_int32_T;
                } else {
                  ex_DLModel_28_B.n_vlen = ex_DLModel_28_B.g_nz + 1;
                }
              }
            }

            if ((ex_DLModel_28_B.cpu_position_data[0] < 0) &&
                (ex_DLModel_28_B.d_tbWidth < MIN_int32_T
                 - ex_DLModel_28_B.cpu_position_data[0])) {
              ex_DLModel_28_B.g_nz = MIN_int32_T;
            } else if ((ex_DLModel_28_B.cpu_position_data[0] > 0) &&
                       (ex_DLModel_28_B.d_tbWidth > MAX_int32_T
                        - ex_DLModel_28_B.cpu_position_data[0])) {
              ex_DLModel_28_B.g_nz = MAX_int32_T;
            } else {
              ex_DLModel_28_B.g_nz = ex_DLModel_28_B.cpu_position_data[0] +
                ex_DLModel_28_B.d_tbWidth;
            }

            if (static_cast<real_T>(ex_DLModel_28_B.g_nz) - 640.0 >=
                -2.147483648E+9) {
              ex_DLModel_28_B.classIndex = ex_DLModel_28_B.g_nz - 640;
            } else {
              ex_DLModel_28_B.classIndex = MIN_int32_T;
            }

            if ((ex_DLModel_28_B.classIndex > 0) &&
                (ex_DLModel_28_B.cpu_position_data[0] <= 640)) {
              if ((ex_DLModel_28_B.cpu_position_data[0] >= 0) &&
                  (ex_DLModel_28_B.classIndex <
                   ex_DLModel_28_B.cpu_position_data[0] - MAX_int32_T)) {
                ex_DLModel_28_B.b_nbytes = MAX_int32_T;
              } else if ((ex_DLModel_28_B.cpu_position_data[0] < 0) &&
                         (ex_DLModel_28_B.classIndex >
                          ex_DLModel_28_B.cpu_position_data[0] - MIN_int32_T)) {
                ex_DLModel_28_B.b_nbytes = MIN_int32_T;
              } else {
                ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.cpu_position_data[0]
                  - ex_DLModel_28_B.classIndex;
              }

              ex_DLModel_28_B.b_penX = ex_DLModel_28_B.b_nbytes + 1;
            }

            if (ex_DLModel_28_B.b_penX < 1) {
              if ((ex_DLModel_28_B.cpu_position_data[0] < 0) &&
                  (ex_DLModel_28_B.cpu_position_data[2] < MIN_int32_T
                   - ex_DLModel_28_B.cpu_position_data[0])) {
                ex_DLModel_28_B.b_nbytes = MIN_int32_T;
              } else if ((ex_DLModel_28_B.cpu_position_data[0] > 0) &&
                         (ex_DLModel_28_B.cpu_position_data[2] > MAX_int32_T
                          - ex_DLModel_28_B.cpu_position_data[0])) {
                ex_DLModel_28_B.b_nbytes = MAX_int32_T;
              } else {
                ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.cpu_position_data[0]
                  + ex_DLModel_28_B.cpu_position_data[2];
              }

              if (ex_DLModel_28_B.b_nbytes >= 1) {
                ex_DLModel_28_B.b_penX = 1;
              }
            }
          } else {
            ex_DLModel_28_B.n_vlen = -32767;
            ex_DLModel_28_B.b_penX = -32767;
          }
        }

        ex_DLModel_28_B.classIndex = ex_DLModel_28_B.n_vlen;
        if ((ex_DLModel_28_B.n_vlen < 0) && (ex_DLModel_28_B.f_nz < MIN_int32_T
             - ex_DLModel_28_B.n_vlen)) {
          ex_DLModel_28_B.f_nz = MIN_int32_T;
          ex_DLModel_28_B.b_nbytes = MIN_int32_T;
        } else if ((ex_DLModel_28_B.n_vlen > 0) && (ex_DLModel_28_B.f_nz >
                    MAX_int32_T - ex_DLModel_28_B.n_vlen)) {
          ex_DLModel_28_B.f_nz = MAX_int32_T;
          ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        } else {
          ex_DLModel_28_B.f_nz += ex_DLModel_28_B.n_vlen;
          ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.f_nz;
        }

        ex_DLModel_28_B.textLocAndWidth_idx_1 = ex_DLModel_28_B.b_nbytes - 1;
        ex_DLModel_28_B.textLocAndWidth_idx_0 = ex_DLModel_28_B.b_penX;
        if ((ex_DLModel_28_B.b_penX < 0) && (ex_DLModel_28_B.d_tbWidth <
             MIN_int32_T - ex_DLModel_28_B.b_penX)) {
          ex_DLModel_28_B.g_nz = MIN_int32_T;
        } else if ((ex_DLModel_28_B.b_penX > 0) && (ex_DLModel_28_B.d_tbWidth >
                    MAX_int32_T - ex_DLModel_28_B.b_penX)) {
          ex_DLModel_28_B.g_nz = MAX_int32_T;
        } else {
          ex_DLModel_28_B.g_nz = ex_DLModel_28_B.b_penX +
            ex_DLModel_28_B.d_tbWidth;
        }

        if (ex_DLModel_28_B.g_nz < -2147483647) {
        } else {
          ex_DLModel_28_B.g_nz--;
        }

        if ((ex_DLModel_28_B.n_vlen <= 480) && (ex_DLModel_28_B.f_nz - 1 >= 1) &&
            (ex_DLModel_28_B.b_penX <= 640) && (ex_DLModel_28_B.g_nz >= 1)) {
          if (ex_DLModel_28_B.n_vlen < 1) {
            ex_DLModel_28_B.classIndex = 1;
          }

          if (ex_DLModel_28_B.f_nz - 1 > 480) {
            ex_DLModel_28_B.textLocAndWidth_idx_1 = 480;
          }

          if (ex_DLModel_28_B.b_penX < 1) {
            ex_DLModel_28_B.textLocAndWidth_idx_0 = 1;
          }

          if (ex_DLModel_28_B.g_nz > 640) {
            ex_DLModel_28_B.g_nz = 640;
          }

          for (ex_DLModel_28_B.b_nbytes = 0; ex_DLModel_28_B.b_nbytes < 3;
               ex_DLModel_28_B.b_nbytes++) {
            ex_DLModel_28_B.i = ex_DLModel_28_computeEndIdx(static_cast<int64_T>
              (ex_DLModel_28_B.textLocAndWidth_idx_0), static_cast<int64_T>
              (ex_DLModel_28_B.g_nz), 1L);
            for (ex_DLModel_28_B.c_c = 0L; ex_DLModel_28_B.c_c <=
                 ex_DLModel_28_B.i; ex_DLModel_28_B.c_c++) {
              ex_DLModel_28_B.f_nz = static_cast<int32_T>
                (ex_DLModel_28_B.textLocAndWidth_idx_0 + ex_DLModel_28_B.c_c);
              ex_DLModel_28_B.i1 = ex_DLModel_28_computeEndIdx
                (static_cast<int64_T>(ex_DLModel_28_B.classIndex), static_cast<
                 int64_T>(ex_DLModel_28_B.textLocAndWidth_idx_1), 1L);
              for (ex_DLModel_28_B.b_r = 0L; ex_DLModel_28_B.b_r <=
                   ex_DLModel_28_B.i1; ex_DLModel_28_B.b_r++) {
                ex_DLModel_28_B.d_tbWidth = (((ex_DLModel_28_B.f_nz - 1) * 480 +
                  static_cast<int32_T>(ex_DLModel_28_B.classIndex +
                  ex_DLModel_28_B.b_r)) + ex_DLModel_28_B.b_nbytes * 307200) - 1;
                if (ex_DLModel_28_B.RGB_outdatedOnCpu) {
                  ex_DLModel_28_checkCudaError(cudaMemcpy
                    (ex_DLModel_28_B.cpu_RGB_m, *gpu_RGB, 921600UL,
                     cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                }

                if (ex_DLModel_28_B.color_data_outdatedOnCpu) {
                  ex_DLModel_28_checkCudaError(cudaMemcpy
                    (ex_DLModel_28_B.cpu_color_data, *gpu_color_data, 3UL,
                     cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                }

                ex_DLModel_28_B.color_data_outdatedOnCpu = false;
                ex_DLModel_28_B.cpu_RGB_m[ex_DLModel_28_B.d_tbWidth] =
                  static_cast<uint8_T>(static_cast<uint8_T>(static_cast<real_T>
                  (ex_DLModel_28_B.cpu_RGB_m[ex_DLModel_28_B.d_tbWidth]) * 0.4 +
                  0.5) + static_cast<uint8_T>(static_cast<real_T>
                  (ex_DLModel_28_B.cpu_color_data[ex_DLModel_28_B.b_nbytes]) *
                  0.6 + 0.5));
                ex_DLModel_28_B.RGB_outdatedOnCpu = false;
                ex_DLModel_28_B.RGB_outdatedOnGpu = true;
              }
            }
          }
        }

        if (ex_DLModel_28_B.b_penX > 2147483643) {
          ex_DLModel_28_B.textLocAndWidth_idx_0 = MAX_int32_T;
        } else {
          ex_DLModel_28_B.textLocAndWidth_idx_0 = ex_DLModel_28_B.b_penX + 4;
        }

        if (ex_DLModel_28_B.RGB_outdatedOnGpu) {
          ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_RGB,
            ex_DLModel_28_B.cpu_RGB_m, 921600UL, cudaMemcpyHostToDevice),
            __FILE__, __LINE__);
        }

        ex_DL_c2_ex_DLModel_28_kernel27<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
          (*gpu_RGB, *gpu_In);
        ex_DLModel_28_B.b_penX = ex_DLModel_28_B.textLocAndWidth_idx_0;
        if (ex_DLModel_28_B.n_vlen > 2147483643) {
          ex_DLModel_28_B.f_nz = MAX_int32_T;
        } else {
          ex_DLModel_28_B.f_nz = ex_DLModel_28_B.n_vlen + 4;
        }

        if (ex_DLModel_28_B.f_nz > 2147483635) {
          ex_DLModel_28_B.n_vlen = MAX_int32_T;
        } else {
          ex_DLModel_28_B.n_vlen = ex_DLModel_28_B.f_nz + 12;
        }

        ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
          cpu_isNewLineChar->size[1];
        cpu_isNewLineChar->size[0] = 1;
        cpu_isNewLineChar->size[1] = ex_DLModel_28_B.i_vlen;
        ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          ex_DLModel_28_B.b_startC_im);
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.i_vlen - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar, true);
        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel28<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
            ex_DLModel_28_B.i_vlen - 1, ex_DLModel_28_B.gpu_isNewLineChar);
        }

        ex_DLModel_28_B.isInitialise = true;
        for (ex_DLModel_28_B.textLocAndWidth_idx_1 = 0;
             ex_DLModel_28_B.textLocAndWidth_idx_1 < ex_DLModel_28_B.i_vlen;
             ex_DLModel_28_B.textLocAndWidth_idx_1++) {
          if (ex_DLModel_28_B.isInitialise) {
            gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
              &ex_DLModel_28_B.gpu_isNewLineChar);
          }

          ex_DLModel_28_B.isInitialise = false;
          if (cpu_isNewLineChar->data[ex_DLModel_28_B.textLocAndWidth_idx_1]) {
            if (ex_DLModel_28_B.n_vlen > 2147483633) {
              ex_DLModel_28_B.n_vlen = MAX_int32_T;
            } else {
              ex_DLModel_28_B.n_vlen += 14;
            }

            ex_DLModel_28_B.b_penX = ex_DLModel_28_B.textLocAndWidth_idx_0;
          } else {
            ex_DL_c2_ex_DLModel_28_kernel29<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
              (*gpu_uv1, ex_DLModel_28_B.textLocAndWidth_idx_1,
               ex_DLModel_28_B.gpu_thisTextU16, gpu_tmp3);
            ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_tmp3,
              gpu_tmp3, 2UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
            ex_DLModel_28_B.b_thisGlyphIdx_1b = static_cast<uint16_T>
              (ex_DLModel_28_B.cpu_tmp3 + 1);
            if (ex_DLModel_28_B.cpu_tmp3 == 0) {
              if (ex_DLModel_28_B.b_penX > 2147483643) {
                ex_DLModel_28_B.b_penX = MAX_int32_T;
              } else {
                ex_DLModel_28_B.b_penX += 4;
              }
            } else {
              ex_DLModel_28_B.classIndex = iv7[ex_DLModel_28_B.cpu_tmp3];
              if ((ex_DLModel_28_B.b_penX < 0) && (ex_DLModel_28_B.classIndex <
                   MIN_int32_T - ex_DLModel_28_B.b_penX)) {
                ex_DLModel_28_B.b_startC_im = MIN_int32_T;
              } else if ((ex_DLModel_28_B.b_penX > 0) &&
                         (ex_DLModel_28_B.classIndex > MAX_int32_T
                          - ex_DLModel_28_B.b_penX)) {
                ex_DLModel_28_B.b_startC_im = MAX_int32_T;
              } else {
                ex_DLModel_28_B.b_startC_im = ex_DLModel_28_B.b_penX +
                  ex_DLModel_28_B.classIndex;
              }

              ex_DLModel_28_B.d_tbWidth = ex_DLModel_28_B.n_vlen -
                iv8[ex_DLModel_28_B.cpu_tmp3];
              ex_DLModel_28_B.q1_tmp_l = uv6[ex_DLModel_28_B.cpu_tmp3];
              if (ex_DLModel_28_B.d_tbWidth > MAX_int32_T
                  - ex_DLModel_28_B.q1_tmp_l) {
                ex_DLModel_28_B.f_nz = MAX_int32_T;
                ex_DLModel_28_B.b_nbytes = MAX_int32_T;
              } else {
                ex_DLModel_28_B.f_nz = ex_DLModel_28_B.d_tbWidth +
                  ex_DLModel_28_B.q1_tmp_l;
                ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.f_nz;
              }

              ex_DLModel_28_B.b_endR_im = ex_DLModel_28_B.b_nbytes - 1;
              ex_DLModel_28_B.q1_tmp = uv7[ex_DLModel_28_B.cpu_tmp3];
              if (ex_DLModel_28_B.b_startC_im > MAX_int32_T
                  - ex_DLModel_28_B.q1_tmp) {
                ex_DLModel_28_B.g_nz = MAX_int32_T;
                ex_DLModel_28_B.b_nbytes = MAX_int32_T;
              } else {
                ex_DLModel_28_B.g_nz = ex_DLModel_28_B.b_startC_im +
                  ex_DLModel_28_B.q1_tmp;
                ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.g_nz;
              }

              ex_DLModel_28_B.b_endC_im = ex_DLModel_28_B.b_nbytes - 1;
              if ((ex_DLModel_28_B.d_tbWidth <= 480) && (ex_DLModel_28_B.f_nz -
                   1 >= 1) && (ex_DLModel_28_B.b_startC_im <= 640) &&
                  (ex_DLModel_28_B.g_nz - 1 >= 1)) {
                ex_DLModel_28_B.b_glIdx_startR_gl = 1;
                ex_DLModel_28_B.b_glIdx_startC_gl = 1;
                ex_DLModel_28_B.classIndex = ex_DLModel_28_B.q1_tmp_l;
                ex_DLModel_28_B.b_glIdx_endC_gl = ex_DLModel_28_B.q1_tmp;
                if (ex_DLModel_28_B.d_tbWidth < 1) {
                  ex_DLModel_28_B.b_glIdx_startR_gl = 2 -
                    ex_DLModel_28_B.d_tbWidth;
                  ex_DLModel_28_B.d_tbWidth = 1;
                }

                if (ex_DLModel_28_B.f_nz - 1 > 480) {
                  ex_DLModel_28_B.classIndex = (ex_DLModel_28_B.q1_tmp_l -
                    ex_DLModel_28_B.f_nz) + 481;
                  ex_DLModel_28_B.b_endR_im = 480;
                }

                if (ex_DLModel_28_B.b_startC_im < 1) {
                  if (-ex_DLModel_28_B.b_startC_im > 2147483645) {
                    ex_DLModel_28_B.b_glIdx_startC_gl = MAX_int32_T;
                  } else {
                    ex_DLModel_28_B.b_glIdx_startC_gl = 2 -
                      ex_DLModel_28_B.b_startC_im;
                  }

                  ex_DLModel_28_B.b_startC_im = 1;
                }

                if (ex_DLModel_28_B.g_nz - 1 > 640) {
                  ex_DLModel_28_B.b_glIdx_endC_gl = (ex_DLModel_28_B.q1_tmp -
                    ex_DLModel_28_B.g_nz) + 641;
                  ex_DLModel_28_B.b_endC_im = 640;
                }

                ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp =
                  uv8[ex_DLModel_28_B.cpu_tmp3];
                ex_DLModel_28_B.f_nz = ex_DLModel_28_B.q1_tmp *
                  ex_DLModel_28_B.q1_tmp_l;
                ex_DLModel_28_B.dimens2 = static_cast<uint32_T>
                  (ex_DLModel_28_B.f_nz) + static_cast<uint32_T>
                  (ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp);
                if (static_cast<uint32_T>
                    (ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp) + 1U >
                    ex_DLModel_28_B.dimens2) {
                  ex_DLModel_28_B.g_nz = 0;
                  ex_DLModel_28_B.b_nbytes = 0;
                } else {
                  ex_DLModel_28_B.g_nz =
                    ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp;
                  ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
                    (ex_DLModel_28_B.dimens2);
                }

                ex_DLModel_28_B.b_nbytes -= ex_DLModel_28_B.g_nz;
                mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
                  (ex_DLModel_28_B.b_nbytes - 1), &ex_DLModel_28_B.grid_p,
                  &ex_DLModel_28_B.block_c, 65535U);
                if (ex_DLModel_28_B.uv9_outdatedOnGpu) {
                  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv9, cpu_uv9,
                    10664UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
                }

                ex_DLModel_28_B.uv9_outdatedOnGpu = false;
                ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
                  (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
                if (ex_DLModel_28_B.validLaunchParams_d) {
                  ex_DL_c2_ex_DLModel_28_kernel30<<<ex_DLModel_28_B.grid_p,
                    ex_DLModel_28_B.block_c>>>(*gpu_uv9, ex_DLModel_28_B.g_nz,
                    ex_DLModel_28_B.b_nbytes - 1, *gpu_uv9_data);
                }

                ex_DLModel_28_B.numIters = ex_DLModel_28_computeNumIters_h
                  (ex_DLModel_28_B.q1_tmp - 1, ex_DLModel_28_B.q1_tmp_l - 1);
                mwGetLaunchParameters1D(ex_DLModel_28_B.numIters,
                  &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
                ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
                  (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
                if (ex_DLModel_28_B.validLaunchParams_d) {
                  ex_DL_c2_ex_DLModel_28_kernel31<<<ex_DLModel_28_B.grid_p,
                    ex_DLModel_28_B.block_c>>>(*gpu_uv9_data,
                    ex_DLModel_28_B.q1_tmp, static_cast<int32_T>
                    (ex_DLModel_28_B.q1_tmp_l), ex_DLModel_28_B.q1_tmp_l - 1,
                    ex_DLModel_28_B.q1_tmp - 1, *gpu_uv9_data_0);
                }

                mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
                  (ex_DLModel_28_B.f_nz - 1), &ex_DLModel_28_B.grid_p,
                  &ex_DLModel_28_B.block_c, 65535U);
                ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
                  (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
                if (ex_DLModel_28_B.validLaunchParams_d) {
                  ex_DL_c2_ex_DLModel_28_kernel32<<<ex_DLModel_28_B.grid_p,
                    ex_DLModel_28_B.block_c>>>(*gpu_uv9_data_0,
                    ex_DLModel_28_B.f_nz - 1, *gpu_b_thisGlyphBitmap_data);
                }

                ex_DLModel_28_B.color_data_outdatedOnCpu = true;
                if (ex_DLModel_28_B.b_glIdx_startR_gl >
                    ex_DLModel_28_B.classIndex) {
                  ex_DLModel_28_B.b_glIdx_startR_gl = 1;
                }

                if (ex_DLModel_28_B.b_glIdx_startC_gl >
                    ex_DLModel_28_B.b_glIdx_endC_gl) {
                  ex_DLModel_28_B.b_glIdx_startC_gl = 1;
                }

                for (ex_DLModel_28_B.b_nbytes = 0; ex_DLModel_28_B.b_nbytes < 3;
                     ex_DLModel_28_B.b_nbytes++) {
                  ex_DLModel_28_B.cpu_b_cg = 1.0;
                  ex_DLModel_28_B.i = ex_DLModel_28_computeEndIdx
                    (static_cast<int64_T>(ex_DLModel_28_B.b_startC_im),
                     static_cast<int64_T>(ex_DLModel_28_B.b_endC_im), 1L);
                  for (ex_DLModel_28_B.c_c = 0L; ex_DLModel_28_B.c_c <=
                       ex_DLModel_28_B.i; ex_DLModel_28_B.c_c++) {
                    ex_DLModel_28_B.i1 = ex_DLModel_28_computeEndIdx(
                      static_cast<int64_T>(ex_DLModel_28_B.d_tbWidth),
                      static_cast<int64_T>(ex_DLModel_28_B.b_endR_im), 1L);
                    for (ex_DLModel_28_B.b_r = 0L; ex_DLModel_28_B.b_r <=
                         ex_DLModel_28_B.i1; ex_DLModel_28_B.b_r++) {
                      if (ex_DLModel_28_B.color_data_outdatedOnCpu) {
                        ex_DLModel_28_checkCudaError(cudaMemcpy
                          (ex_DLModel_28_B.cpu_b_thisGlyphBitmap_data,
                           *gpu_b_thisGlyphBitmap_data, 144UL,
                           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                      }

                      ex_DLModel_28_B.color_data_outdatedOnCpu = false;
                      ex_DLModel_28_B.b_glyphVal =
                        ex_DLModel_28_B.cpu_b_thisGlyphBitmap_data
                        [(((ex_DLModel_28_B.b_glIdx_startC_gl + static_cast<
                            int32_T>(ex_DLModel_28_B.cpu_b_cg)) - 2) *
                          ex_DLModel_28_B.q1_tmp_l + (static_cast<int32_T>(
                            static_cast<real_T>(ex_DLModel_28_B.b_r) + 1.0) +
                           ex_DLModel_28_B.b_glIdx_startR_gl)) - 2];
                      if (ex_DLModel_28_B.b_glyphVal == 255) {
                        if (ex_DLModel_28_B.In_outdatedOnCpu) {
                          ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_In,
                            *gpu_In, 921600UL, cudaMemcpyDeviceToHost), __FILE__,
                            __LINE__);
                        }

                        cpu_In[((static_cast<int32_T>(ex_DLModel_28_B.d_tbWidth
                                  + ex_DLModel_28_B.b_r) + 480 *
                                 (static_cast<int32_T>
                                  (ex_DLModel_28_B.b_startC_im +
                                   ex_DLModel_28_B.c_c) - 1)) + 307200 *
                                ex_DLModel_28_B.b_nbytes) - 1] = 0U;
                        ex_DLModel_28_B.In_outdatedOnCpu = false;
                        ex_DLModel_28_B.In_outdatedOnGpu = true;
                      } else if (ex_DLModel_28_B.b_glyphVal != 0) {
                        ex_DLModel_28_B.classIndex = (((static_cast<int32_T>
                          (ex_DLModel_28_B.b_startC_im + ex_DLModel_28_B.c_c) -
                          1) * 480 + static_cast<int32_T>
                          (ex_DLModel_28_B.d_tbWidth + ex_DLModel_28_B.b_r)) +
                          307200 * ex_DLModel_28_B.b_nbytes) - 1;
                        if (ex_DLModel_28_B.In_outdatedOnCpu) {
                          ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_In,
                            *gpu_In, 921600UL, cudaMemcpyDeviceToHost), __FILE__,
                            __LINE__);
                        }

                        ex_DLModel_28_B.cpu_tmp3 = static_cast<uint16_T>((255 -
                          ex_DLModel_28_B.b_glyphVal) *
                          cpu_In[ex_DLModel_28_B.classIndex]);
                        ex_DLModel_28_B.b_tmp3 = static_cast<uint16_T>
                          (ex_DLModel_28_B.cpu_tmp3 / 255U);
                        ex_DLModel_28_B.cpu_tmp3 = static_cast<uint16_T>
                          (ex_DLModel_28_B.cpu_tmp3 - static_cast<uint32_T>
                           (ex_DLModel_28_B.b_tmp3 * 255));
                        if (ex_DLModel_28_B.cpu_tmp3 >= 128) {
                          ex_DLModel_28_B.b_tmp3 = static_cast<uint16_T>
                            (ex_DLModel_28_B.b_tmp3 + 1);
                        }

                        cpu_In[ex_DLModel_28_B.classIndex] = static_cast<uint8_T>
                          (ex_DLModel_28_B.b_tmp3);
                        ex_DLModel_28_B.In_outdatedOnCpu = false;
                        ex_DLModel_28_B.In_outdatedOnGpu = true;
                      }
                    }

                    ex_DLModel_28_B.cpu_b_cg++;
                  }
                }
              }

              ex_DLModel_28_B.classIndex =
                cpu_iv6[ex_DLModel_28_B.b_thisGlyphIdx_1b - 1];
              if ((ex_DLModel_28_B.b_penX < 0) && (ex_DLModel_28_B.classIndex <
                   MIN_int32_T - ex_DLModel_28_B.b_penX)) {
                ex_DLModel_28_B.b_penX = MIN_int32_T;
              } else if ((ex_DLModel_28_B.b_penX > 0) &&
                         (ex_DLModel_28_B.classIndex > MAX_int32_T
                          - ex_DLModel_28_B.b_penX)) {
                ex_DLModel_28_B.b_penX = MAX_int32_T;
              } else {
                ex_DLModel_28_B.b_penX += ex_DLModel_28_B.classIndex;
              }
            }
          }
        }
      }
    }

    ex_DLModel_28_emxFree_char_T(&cpu_b_str);
  }

  ex_DLModel_28_B.cpu_b_cg = ex_DLModel_28_toc(ex_DLModel_28_DW.tStart.tv_sec,
    ex_DLModel_28_DW.tStart.tv_nsec);
  if (ex_DLModel_28_B.cpu_b_cg > 0.0) {
    if (ex_DLModel_28_DW.averageFPS == 0.0F) {
      ex_DLModel_28_DW.averageFPS = static_cast<real32_T>(1.0 /
        ex_DLModel_28_B.cpu_b_cg);
    } else {
      ex_DLModel_28_DW.averageFPS = static_cast<real32_T>(1.0 /
        ex_DLModel_28_B.cpu_b_cg) * 0.1F + 0.9F * ex_DLModel_28_DW.averageFPS;
    }
  }

  ex_DLModel_28_tic(&ex_DLModel_28_DW.tStart.tv_sec,
                    &ex_DLModel_28_DW.tStart.tv_nsec);
  ex_DLModel_28_B.nbytes = (int32_T)std::snprintf(NULL, 0, "FPS: %0.1f",
    ex_DLModel_28_DW.averageFPS) + 1;
  ex_DLModel_28_emxInit_char_T(&cpu_str, 2);
  ex_DLModel_28_B.b_startC_im = cpu_str->size[0] * cpu_str->size[1];
  cpu_str->size[0] = 1;
  cpu_str->size[1] = ex_DLModel_28_B.nbytes;
  ex_DLM_emxEnsureCapacity_char_T(cpu_str, ex_DLModel_28_B.b_startC_im);
  std::snprintf(&cpu_str->data[0], (size_t)ex_DLModel_28_B.nbytes, "FPS: %0.1f",
                ex_DLModel_28_DW.averageFPS);
  if (ex_DLModel_28_B.nbytes - 1 < 1) {
    ex_DLModel_28_B.nbytes = -1;
  } else {
    ex_DLModel_28_B.nbytes -= 2;
  }

  cpu_thisTextU16->size[0] = 1;
  cpu_thisTextU16->size[1] = ex_DLModel_28_B.nbytes + 1;
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.nbytes),
    &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
  ex__gpuEmxEnsureCapacity_char_T(cpu_str, &ex_DLModel_28_B.gpu_str, false);
  ex_gpuEmxEnsureCapacity_uint8_T(cpu_thisTextU16,
    &ex_DLModel_28_B.gpu_thisTextU16, true);
  ex__gpuEmxMemcpyCpuToGpu_char_T(&ex_DLModel_28_B.gpu_str, cpu_str);
  ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
  if (ex_DLModel_28_B.validLaunchParams_d) {
    ex_DL_c2_ex_DLModel_28_kernel44<<<ex_DLModel_28_B.grid_p,
      ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_str, ex_DLModel_28_B.nbytes,
      ex_DLModel_28_B.gpu_thisTextU16);
  }

  ex_DLModel_28_emxFree_char_T(&cpu_str);
  if (cpu_thisTextU16->size[1] != 0) {
    ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_isNewLineChar->size[0] *
      cpu_isNewLineChar->size[1];
    cpu_isNewLineChar->size[0] = 1;
    ex_DLModel_28_B.vlen = cpu_thisTextU16->size[1];
    cpu_isNewLineChar->size[1] = cpu_thisTextU16->size[1];
    ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
      ex_DLModel_28_B.textLocAndWidth_idx_1);
    ex_DLModel_28_B.nbytes = cpu_thisTextU16->size[1];
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.nbytes
      - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
    gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
      &ex_DLModel_28_B.gpu_isNewLineChar, true);
    ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
    if (ex_DLModel_28_B.validLaunchParams_d) {
      ex_DL_c2_ex_DLModel_28_kernel45<<<ex_DLModel_28_B.grid_p,
        ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
        ex_DLModel_28_B.nbytes - 1, ex_DLModel_28_B.gpu_isNewLineChar);
    }

    ex_DLModel_28_B.isInitialise = true;
    ex_DLModel_28_B.nbytes = 0;
    ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
    ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_b_ii->size[0] * cpu_b_ii->size[1];
    cpu_b_ii->size[0] = 1;
    cpu_b_ii->size[1] = ex_DLModel_28_B.vlen;
    ex_DL_emxEnsureCapacity_int32_T(cpu_b_ii,
      ex_DLModel_28_B.textLocAndWidth_idx_1);
    ex_DLModel_28_B.b_nz = 1;
    exitg1 = false;
    while ((!exitg1) && (ex_DLModel_28_B.b_nz <= ex_DLModel_28_B.vlen)) {
      if (ex_DLModel_28_B.isInitialise) {
        gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar);
      }

      ex_DLModel_28_B.isInitialise = false;
      if (cpu_isNewLineChar->data[ex_DLModel_28_B.b_nz - 1]) {
        ex_DLModel_28_B.nbytes++;
        cpu_b_ii->data[ex_DLModel_28_B.nbytes - 1] = ex_DLModel_28_B.b_nz;
        ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
        if (ex_DLModel_28_B.nbytes >= ex_DLModel_28_B.vlen) {
          exitg1 = true;
        } else {
          ex_DLModel_28_B.b_nz++;
        }
      } else {
        ex_DLModel_28_B.b_nz++;
      }
    }

    if (cpu_isNewLineChar->size[1] == 1) {
      if (ex_DLModel_28_B.nbytes == 0) {
        ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
        cpu_b_ii->size[0] = 1;
        cpu_b_ii->size[1] = 0;
      }
    } else if (ex_DLModel_28_B.nbytes < 1) {
      cpu_b_ii->size[1] = 0;
    } else {
      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_b_ii->size[0] * cpu_b_ii->
        size[1];
      cpu_b_ii->size[1] = ex_DLModel_28_B.nbytes;
      ex_DL_emxEnsureCapacity_int32_T(cpu_b_ii,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
    }

    ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_idxNewlineChar->size[0] *
      cpu_idxNewlineChar->size[1];
    cpu_idxNewlineChar->size[0] = 1;
    ex_DLModel_28_B.i_vlen = cpu_b_ii->size[1];
    cpu_idxNewlineChar->size[1] = cpu_b_ii->size[1];
    ex_DL_emxEnsureCapacity_int32_T(cpu_idxNewlineChar,
      ex_DLModel_28_B.textLocAndWidth_idx_1);
    ex_DLModel_28_B.nbytes = cpu_b_ii->size[1];
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.nbytes
      - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
    ex_gpuEmxEnsureCapacity_int32_T(cpu_b_ii, &ex_DLModel_28_B.gpu_b_ii,
      !ex_DLModel_28_B.b_ii_outdatedOnGpu);
    ex_gpuEmxEnsureCapacity_int32_T(cpu_idxNewlineChar,
      &ex_DLModel_28_B.gpu_idxNewlineChar, true);
    if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
      ex_gpuEmxMemcpyCpuToGpu_int32_T(&ex_DLModel_28_B.gpu_b_ii, cpu_b_ii);
    }

    ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
    if (ex_DLModel_28_B.validLaunchParams_d) {
      ex_DL_c2_ex_DLModel_28_kernel46<<<ex_DLModel_28_B.grid_p,
        ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_b_ii,
        ex_DLModel_28_B.nbytes - 1, ex_DLModel_28_B.gpu_idxNewlineChar);
    }

    ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
    if (cpu_b_ii->size[1] == 0) {
      cpu_thisCharcodes_1b->size[0] = 1;
      cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.vlen;
      cpu_thisGlyphIdxs_1b->size[0] = 1;
      cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.vlen;
      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_c_x->size[0] * cpu_c_x->size[1];
      cpu_c_x->size[0] = 1;
      cpu_c_x->size[1] = ex_DLModel_28_B.vlen;
      ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.vlen
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x, true);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
        &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
        &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
      ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_iv3, cpu_iv3, 261UL,
        cudaMemcpyHostToDevice), __FILE__, __LINE__);
      if (ex_DLModel_28_B.uv1_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv1, cpu_uv1, 512UL,
          cudaMemcpyHostToDevice), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel47<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_iv3, *gpu_uv1,
          ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.vlen - 1,
          ex_DLModel_28_B.gpu_c_x, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
          ex_DLModel_28_B.gpu_thisCharcodes_1b);
      }

      ex_DLModel_28_B.isInitialise = true;
      ex_DL_c2_ex_DLModel_28_kernel48<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_iv3, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, gpu_b_cg);
      ex_DLModel_28_B.b_ii_outdatedOnGpu = true;
      for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
           ex_DLModel_28_B.vlen - 2; ex_DLModel_28_B.b_startC_im++) {
        if (ex_DLModel_28_B.isInitialise) {
          ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x);
        }

        ex_DLModel_28_B.isInitialise = false;
        if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
          ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_b_cg,
            gpu_b_cg, 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
        }

        ex_DLModel_28_B.cpu_b_cg += static_cast<real_T>(cpu_c_x->
          data[ex_DLModel_28_B.b_startC_im + 1]);
        ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
      }

      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_isNewLineChar->size[0] *
        cpu_isNewLineChar->size[1];
      cpu_isNewLineChar->size[0] = 1;
      cpu_isNewLineChar->size[1] = ex_DLModel_28_B.vlen;
      ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.vlen
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        &ex_DLModel_28_B.gpu_isNewLineChar, true);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel49<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_uv1,
          ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.vlen - 1,
          ex_DLModel_28_B.gpu_isNewLineChar);
      }

      gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
        &ex_DLModel_28_B.gpu_isNewLineChar);
      ex_DLModel_28_B.nbytes = cpu_isNewLineChar->data[0];
      for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
           ex_DLModel_28_B.vlen - 2; ex_DLModel_28_B.b_startC_im++) {
        ex_DLModel_28_B.nbytes += cpu_isNewLineChar->
          data[ex_DLModel_28_B.b_startC_im + 1];
      }

      if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_b_cg,
          gpu_b_cg, 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
        ex_DLModel_28_B.b_nbytes = static_cast<int32_T>(ex_DLModel_28_B.cpu_b_cg);
      } else {
        ex_DLModel_28_B.b_nbytes = MAX_int32_T;
      }

      ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>(ex_DLModel_28_B.nbytes) *
        7.0;
      if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
        if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
          ex_DLModel_28_B.classIndex = static_cast<int32_T>
            (ex_DLModel_28_B.cpu_b_cg);
        } else {
          ex_DLModel_28_B.classIndex = MIN_int32_T;
        }
      } else {
        ex_DLModel_28_B.classIndex = MAX_int32_T;
      }

      if ((ex_DLModel_28_B.b_nbytes > 0) && (ex_DLModel_28_B.classIndex >
           MAX_int32_T - ex_DLModel_28_B.b_nbytes)) {
        ex_DLModel_28_B.nbytes = MAX_int32_T;
      } else {
        ex_DLModel_28_B.nbytes = ex_DLModel_28_B.b_nbytes +
          ex_DLModel_28_B.classIndex;
      }
    } else {
      if (static_cast<real_T>(cpu_b_ii->data[0]) - 1.0 < 1.0) {
        ex_DLModel_28_B.nbytes = -1;
      } else {
        ex_DLModel_28_B.nbytes = cpu_b_ii->data[0] - 2;
      }

      cpu_thisCharcodes_1b->size[0] = 1;
      cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.nbytes + 1;
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.nbytes), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
        &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel57<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
          ex_DLModel_28_B.nbytes, ex_DLModel_28_B.gpu_thisCharcodes_1b);
      }

      cpu_thisGlyphIdxs_1b->size[0] = 1;
      ex_DLModel_28_B.b_nx = cpu_thisCharcodes_1b->size[1];
      cpu_thisGlyphIdxs_1b->size[1] = cpu_thisCharcodes_1b->size[1];
      ex_DLModel_28_B.nbytes = cpu_thisCharcodes_1b->size[1];
      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_c_x->size[0] * cpu_c_x->size[1];
      cpu_c_x->size[0] = 1;
      cpu_c_x->size[1] = cpu_thisCharcodes_1b->size[1];
      ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
        (ex_DLModel_28_B.nbytes - 1), &ex_DLModel_28_B.grid_p,
        &ex_DLModel_28_B.block_c, 65535U);
      ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x, true);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
        &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
      ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_iv3, cpu_iv3, 261UL,
        cudaMemcpyHostToDevice), __FILE__, __LINE__);
      if (ex_DLModel_28_B.uv1_outdatedOnGpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv1, cpu_uv1, 512UL,
          cudaMemcpyHostToDevice), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel58<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_iv3, *gpu_uv1,
          ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.nbytes - 1,
          ex_DLModel_28_B.gpu_c_x, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b);
      }

      ex_DLModel_28_B.isInitialise = true;
      if (cpu_thisCharcodes_1b->size[1] == 0) {
        ex_DLModel_28_B.cpu_b_lenFirstSegment = 0.0;
        ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = false;
      } else {
        ex_DL_c2_ex_DLModel_28_kernel66<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_iv3, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
           gpu_b_lenFirstSegment);
        ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = true;
        for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
             ex_DLModel_28_B.b_nx - 2; ex_DLModel_28_B.b_startC_im++) {
          if (ex_DLModel_28_B.isInitialise) {
            ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x);
          }

          ex_DLModel_28_B.isInitialise = false;
          if (ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy
              (&ex_DLModel_28_B.cpu_b_lenFirstSegment, gpu_b_lenFirstSegment,
               8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.cpu_b_lenFirstSegment += static_cast<real_T>
            (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
          ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu = false;
        }
      }

      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_isNewLineChar->size[0] *
        cpu_isNewLineChar->size[1];
      cpu_isNewLineChar->size[0] = 1;
      cpu_isNewLineChar->size[1] = ex_DLModel_28_B.b_nx;
      ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_nx
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        &ex_DLModel_28_B.gpu_isNewLineChar, true);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel59<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_uv1,
          ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.b_nx - 1,
          ex_DLModel_28_B.gpu_isNewLineChar);
      }

      if (cpu_isNewLineChar->size[1] == 0) {
        ex_DLModel_28_B.b_nz = 0;
      } else {
        gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar);
        ex_DLModel_28_B.b_nz = cpu_isNewLineChar->data[0];
        for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
             ex_DLModel_28_B.b_nx - 2; ex_DLModel_28_B.b_startC_im++) {
          ex_DLModel_28_B.b_nz += cpu_isNewLineChar->
            data[ex_DLModel_28_B.b_startC_im + 1];
        }
      }

      ex_DLModel_28_B.nbytes = 0;
      for (ex_DLModel_28_B.b_nx = 0; ex_DLModel_28_B.b_nx <=
           ex_DLModel_28_B.i_vlen - 3; ex_DLModel_28_B.b_nx++) {
        if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
          ex_gpuEmxMemcpyGpuToCpu_int32_T(cpu_idxNewlineChar,
            &ex_DLModel_28_B.gpu_idxNewlineChar);
        }

        ex_DLModel_28_B.b_nbytes = cpu_idxNewlineChar->data[ex_DLModel_28_B.b_nx
          + 1];
        ex_DLModel_28_B.b_ii_outdatedOnGpu = false;
        ex_DLModel_28_B.n_vlen = cpu_idxNewlineChar->data[ex_DLModel_28_B.b_nx +
          2];
        if (static_cast<real_T>(ex_DLModel_28_B.b_nbytes) + 1.0 >
            static_cast<real_T>(ex_DLModel_28_B.n_vlen) - 1.0) {
          ex_DLModel_28_B.b_nbytes = 0;
          ex_DLModel_28_B.classIndex = 0;
        } else {
          ex_DLModel_28_B.classIndex = ex_DLModel_28_B.n_vlen - 1;
        }

        cpu_thisCharcodes_1b->size[0] = 1;
        ex_DLModel_28_B.classIndex -= ex_DLModel_28_B.b_nbytes;
        cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.classIndex;
        cpu_thisGlyphIdxs_1b->size[0] = 1;
        cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.classIndex;
        ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_c_x->size[0] * cpu_c_x->
          size[1];
        cpu_c_x->size[0] = 1;
        cpu_c_x->size[1] = ex_DLModel_28_B.classIndex;
        ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x,
          ex_DLModel_28_B.textLocAndWidth_idx_1);
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.classIndex - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x, true);
        e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
          &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
        e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
          &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel60<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(*gpu_iv3, *gpu_uv1,
            ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.b_nbytes,
            ex_DLModel_28_B.classIndex - 1, ex_DLModel_28_B.gpu_c_x,
            ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
            ex_DLModel_28_B.gpu_thisCharcodes_1b);
        }

        ex_DLModel_28_B.isInitialise = true;
        if (cpu_thisCharcodes_1b->size[1] == 0) {
          ex_DLModel_28_B.cpu_c_lenThisSegment = 0.0;
          ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
        } else {
          ex_DL_c2_ex_DLModel_28_kernel62<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
            (*gpu_iv3, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
             gpu_c_lenThisSegment);
          ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = true;
          for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
               ex_DLModel_28_B.classIndex - 2; ex_DLModel_28_B.b_startC_im++) {
            if (ex_DLModel_28_B.isInitialise) {
              ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x);
            }

            ex_DLModel_28_B.isInitialise = false;
            if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
              ex_DLModel_28_checkCudaError(cudaMemcpy
                (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment,
                 8UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
            }

            ex_DLModel_28_B.cpu_c_lenThisSegment += static_cast<real_T>
              (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
            ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
          }
        }

        ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_isNewLineChar->size[0] *
          cpu_isNewLineChar->size[1];
        cpu_isNewLineChar->size[0] = 1;
        cpu_isNewLineChar->size[1] = ex_DLModel_28_B.classIndex;
        ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          ex_DLModel_28_B.textLocAndWidth_idx_1);
        mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
          (ex_DLModel_28_B.classIndex - 1), &ex_DLModel_28_B.grid_p,
          &ex_DLModel_28_B.block_c, 65535U);
        gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar, true);
        ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
          (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
        if (ex_DLModel_28_B.validLaunchParams_d) {
          ex_DL_c2_ex_DLModel_28_kernel61<<<ex_DLModel_28_B.grid_p,
            ex_DLModel_28_B.block_c>>>(*gpu_uv1,
            ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.classIndex - 1,
            ex_DLModel_28_B.gpu_isNewLineChar);
        }

        if (cpu_isNewLineChar->size[1] == 0) {
          ex_DLModel_28_B.b_nbytes = 0;
        } else {
          gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
            &ex_DLModel_28_B.gpu_isNewLineChar);
          ex_DLModel_28_B.b_nbytes = cpu_isNewLineChar->data[0];
          for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
               ex_DLModel_28_B.classIndex - 2; ex_DLModel_28_B.b_startC_im++) {
            ex_DLModel_28_B.b_nbytes += cpu_isNewLineChar->
              data[ex_DLModel_28_B.b_startC_im + 1];
          }
        }

        ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>(ex_DLModel_28_B.b_nbytes)
          * 7.0;
        if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
          if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
            ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
              (ex_DLModel_28_B.cpu_b_cg);
          } else {
            ex_DLModel_28_B.b_nbytes = MIN_int32_T;
          }
        } else {
          ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        }

        if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
          ex_DLModel_28_checkCudaError(cudaMemcpy
            (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment, 8UL,
             cudaMemcpyDeviceToHost), __FILE__, __LINE__);
        }

        ex_DLModel_28_B.cpu_b_cg = ex_DLModel_28_B.cpu_c_lenThisSegment +
          static_cast<real_T>(ex_DLModel_28_B.b_nbytes);
        if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
          ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
            (ex_DLModel_28_B.cpu_b_cg);
        } else {
          ex_DLModel_28_B.b_nbytes = MAX_int32_T;
        }

        if (ex_DLModel_28_B.b_nbytes > ex_DLModel_28_B.nbytes) {
          ex_DLModel_28_B.nbytes = ex_DLModel_28_B.b_nbytes;
        }
      }

      if (ex_DLModel_28_B.b_ii_outdatedOnGpu) {
        ex_gpuEmxMemcpyGpuToCpu_int32_T(cpu_idxNewlineChar,
          &ex_DLModel_28_B.gpu_idxNewlineChar);
      }

      ex_DLModel_28_B.i_vlen = cpu_idxNewlineChar->data[cpu_idxNewlineChar->
        size[1] - 1];
      if (static_cast<real_T>(ex_DLModel_28_B.i_vlen) + 1.0 >
          cpu_thisTextU16->size[1]) {
        ex_DLModel_28_B.i_vlen = 0;
        ex_DLModel_28_B.b_nx = 0;
      } else {
        ex_DLModel_28_B.b_nx = ex_DLModel_28_B.vlen;
      }

      cpu_thisCharcodes_1b->size[0] = 1;
      ex_DLModel_28_B.b_nx -= ex_DLModel_28_B.i_vlen;
      cpu_thisCharcodes_1b->size[1] = ex_DLModel_28_B.b_nx;
      cpu_thisGlyphIdxs_1b->size[0] = 1;
      cpu_thisGlyphIdxs_1b->size[1] = ex_DLModel_28_B.b_nx;
      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_c_x->size[0] * cpu_c_x->size[1];
      cpu_c_x->size[0] = 1;
      cpu_c_x->size[1] = ex_DLModel_28_B.b_nx;
      ex_DLM_emxEnsureCapacity_int8_T(cpu_c_x,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_nx
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      ex__gpuEmxEnsureCapacity_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x, true);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisGlyphIdxs_1b,
        &ex_DLModel_28_B.gpu_thisGlyphIdxs_1b, true);
      e_gpuEmxEnsureCapacity_uint16_T(cpu_thisCharcodes_1b,
        &ex_DLModel_28_B.gpu_thisCharcodes_1b, true);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel63<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_iv3, *gpu_uv1,
          ex_DLModel_28_B.gpu_thisTextU16, ex_DLModel_28_B.i_vlen,
          ex_DLModel_28_B.b_nx - 1, ex_DLModel_28_B.gpu_c_x,
          ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
          ex_DLModel_28_B.gpu_thisCharcodes_1b);
      }

      ex_DLModel_28_B.isInitialise = true;
      if (cpu_thisCharcodes_1b->size[1] == 0) {
        ex_DLModel_28_B.cpu_c_lenThisSegment = 0.0;
        ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
      } else {
        ex_DL_c2_ex_DLModel_28_kernel65<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_iv3, 0, ex_DLModel_28_B.gpu_thisGlyphIdxs_1b,
           gpu_c_lenThisSegment);
        ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = true;
        for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
             ex_DLModel_28_B.b_nx - 2; ex_DLModel_28_B.b_startC_im++) {
          if (ex_DLModel_28_B.isInitialise) {
            ex__gpuEmxMemcpyGpuToCpu_int8_T(cpu_c_x, &ex_DLModel_28_B.gpu_c_x);
          }

          ex_DLModel_28_B.isInitialise = false;
          if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
            ex_DLModel_28_checkCudaError(cudaMemcpy
              (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment, 8UL,
               cudaMemcpyDeviceToHost), __FILE__, __LINE__);
          }

          ex_DLModel_28_B.cpu_c_lenThisSegment += static_cast<real_T>
            (cpu_c_x->data[ex_DLModel_28_B.b_startC_im + 1]);
          ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu = false;
        }
      }

      ex_DLModel_28_B.textLocAndWidth_idx_1 = cpu_isNewLineChar->size[0] *
        cpu_isNewLineChar->size[1];
      cpu_isNewLineChar->size[0] = 1;
      cpu_isNewLineChar->size[1] = ex_DLModel_28_B.b_nx;
      ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        ex_DLModel_28_B.textLocAndWidth_idx_1);
      mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.b_nx
        - 1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
      gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
        &ex_DLModel_28_B.gpu_isNewLineChar, true);
      ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
        (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
      if (ex_DLModel_28_B.validLaunchParams_d) {
        ex_DL_c2_ex_DLModel_28_kernel64<<<ex_DLModel_28_B.grid_p,
          ex_DLModel_28_B.block_c>>>(*gpu_uv1,
          ex_DLModel_28_B.gpu_thisCharcodes_1b, ex_DLModel_28_B.b_nx - 1,
          ex_DLModel_28_B.gpu_isNewLineChar);
      }

      if (cpu_isNewLineChar->size[1] == 0) {
        ex_DLModel_28_B.i_vlen = 0;
      } else {
        gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar);
        ex_DLModel_28_B.i_vlen = cpu_isNewLineChar->data[0];
        for (ex_DLModel_28_B.b_startC_im = 0; ex_DLModel_28_B.b_startC_im <=
             ex_DLModel_28_B.b_nx - 2; ex_DLModel_28_B.b_startC_im++) {
          ex_DLModel_28_B.i_vlen += cpu_isNewLineChar->
            data[ex_DLModel_28_B.b_startC_im + 1];
        }
      }

      ex_DLModel_28_B.cpu_b_cg = static_cast<real_T>(ex_DLModel_28_B.b_nz) * 7.0;
      if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
        if (ex_DLModel_28_B.cpu_b_cg >= -2.147483648E+9) {
          ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
            (ex_DLModel_28_B.cpu_b_cg);
        } else {
          ex_DLModel_28_B.b_nbytes = MIN_int32_T;
        }
      } else {
        ex_DLModel_28_B.b_nbytes = MAX_int32_T;
      }

      if (ex_DLModel_28_B.b_lenFirstSegment_outdatedOnCpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy
          (&ex_DLModel_28_B.cpu_b_lenFirstSegment, gpu_b_lenFirstSegment, 8UL,
           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.cpu_b_cg = ex_DLModel_28_B.cpu_b_lenFirstSegment +
        static_cast<real_T>(ex_DLModel_28_B.b_nbytes);
      if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
        ex_DLModel_28_B.e_x[0] = static_cast<int32_T>(ex_DLModel_28_B.cpu_b_cg);
      } else {
        ex_DLModel_28_B.e_x[0] = MAX_int32_T;
      }

      ex_DLModel_28_B.e_x[1] = ex_DLModel_28_B.nbytes;
      ex_DLModel_28_B.cpu_b_lenFirstSegment = static_cast<real_T>
        (ex_DLModel_28_B.i_vlen) * 7.0;
      if (ex_DLModel_28_B.cpu_b_lenFirstSegment < 2.147483648E+9) {
        if (ex_DLModel_28_B.cpu_b_lenFirstSegment >= -2.147483648E+9) {
          ex_DLModel_28_B.b_nbytes = static_cast<int32_T>
            (ex_DLModel_28_B.cpu_b_lenFirstSegment);
        } else {
          ex_DLModel_28_B.b_nbytes = MIN_int32_T;
        }
      } else {
        ex_DLModel_28_B.b_nbytes = MAX_int32_T;
      }

      if (ex_DLModel_28_B.c_lenThisSegment_outdatedOnCpu) {
        ex_DLModel_28_checkCudaError(cudaMemcpy
          (&ex_DLModel_28_B.cpu_c_lenThisSegment, gpu_c_lenThisSegment, 8UL,
           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      ex_DLModel_28_B.cpu_b_lenFirstSegment =
        ex_DLModel_28_B.cpu_c_lenThisSegment + static_cast<real_T>
        (ex_DLModel_28_B.b_nbytes);
      if (ex_DLModel_28_B.cpu_b_lenFirstSegment < 2.147483648E+9) {
        ex_DLModel_28_B.e_x[2] = static_cast<int32_T>
          (ex_DLModel_28_B.cpu_b_lenFirstSegment);
      } else {
        ex_DLModel_28_B.e_x[2] = MAX_int32_T;
      }

      if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
        ex_DLModel_28_B.nbytes = static_cast<int32_T>(ex_DLModel_28_B.cpu_b_cg);
      } else {
        ex_DLModel_28_B.nbytes = MAX_int32_T;
      }

      for (ex_DLModel_28_B.b_nz = 0; ex_DLModel_28_B.b_nz < 2;
           ex_DLModel_28_B.b_nz++) {
        ex_DLModel_28_B.f_nz = ex_DLModel_28_B.e_x[ex_DLModel_28_B.b_nz + 1];
        if (ex_DLModel_28_B.nbytes < ex_DLModel_28_B.f_nz) {
          ex_DLModel_28_B.nbytes = ex_DLModel_28_B.f_nz;
        }
      }
    }

    if (ex_DLModel_28_B.nbytes < 0) {
      ex_DLModel_28_B.nbytes = 0;
    }

    if (ex_DLModel_28_B.nbytes > 0) {
      if (ex_DLModel_28_B.nbytes > 2147483633) {
        ex_DLModel_28_B.nbytes = MAX_int32_T;
      } else {
        ex_DLModel_28_B.nbytes += 14;
      }
    }

    ex_DLModel_28_B.cpu_b_cg = ((static_cast<real_T>(cpu_idxNewlineChar->size[1])
      + 1.0) - 1.0) * 26.0;
    if (ex_DLModel_28_B.cpu_b_cg < 2.147483648E+9) {
      ex_DLModel_28_B.b_nbytes = static_cast<int32_T>(ex_DLModel_28_B.cpu_b_cg);
    } else {
      ex_DLModel_28_B.b_nbytes = MAX_int32_T;
    }

    if (ex_DLModel_28_B.b_nbytes > 2147483621) {
      ex_DLModel_28_B.f_nz = MAX_int32_T;
    } else {
      ex_DLModel_28_B.f_nz = ex_DLModel_28_B.b_nbytes + 26;
    }

    if (ex_DLModel_28_B.f_nz > 2147483633) {
      ex_DLModel_28_B.f_nz = MAX_int32_T;
    } else {
      ex_DLModel_28_B.f_nz += 14;
    }

    if (ex_DLModel_28_B.f_nz > 2147483627) {
      ex_DLModel_28_B.b_nbytes = MAX_int32_T;
    } else {
      ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.f_nz + 20;
    }

    ex_DLModel_28_B.b_nz = ex_DLModel_28_B.b_nbytes - 1;
    if (ex_DLModel_28_B.nbytes > 2147483637) {
      ex_DLModel_28_B.b_nbytes = MAX_int32_T;
    } else {
      ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.nbytes + 10;
    }

    ex_DLModel_28_B.b_nx = ex_DLModel_28_B.b_nbytes - 1;
    if (ex_DLModel_28_B.f_nz > 2147483627) {
      ex_DLModel_28_B.b_nbytes = MAX_int32_T;
    } else {
      ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.f_nz + 20;
    }

    if (ex_DLModel_28_B.b_nbytes - 1 > 480) {
      ex_DLModel_28_B.b_nz = 480;
    }

    if (ex_DLModel_28_B.nbytes > 2147483637) {
      ex_DLModel_28_B.b_nbytes = MAX_int32_T;
    } else {
      ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.nbytes + 10;
    }

    if (ex_DLModel_28_B.b_nbytes - 1 > 640) {
      ex_DLModel_28_B.b_nx = 640;
    }

    ex_DLModel_28_B.numIters = ex_DLModel_2_computeNumIters_hp(2,
      ex_DLModel_28_B.b_nx - 10, ex_DLModel_28_B.b_nz - 20);
    mwGetLaunchParameters1D(ex_DLModel_28_B.numIters, &ex_DLModel_28_B.grid_p,
      &ex_DLModel_28_B.block_c, 65535U);
    if (ex_DLModel_28_B.In_outdatedOnGpu) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_In, cpu_In, 921600UL,
        cudaMemcpyHostToDevice), __FILE__, __LINE__);
    }

    ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
    if (ex_DLModel_28_B.validLaunchParams_d) {
      ex_DL_c2_ex_DLModel_28_kernel50<<<ex_DLModel_28_B.grid_p,
        ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.b_nz - 20,
        ex_DLModel_28_B.b_nx - 10, *gpu_In);
    }

    ex_DLModel_28_B.In_outdatedOnGpu = false;
    ex_DLModel_28_B.In_outdatedOnCpu = true;
    ex_DLModel_28_B.b_nx = 17;
    ex_DLModel_28_B.i_vlen = 48;
    ex_DLModel_28_B.b_startC_im = cpu_isNewLineChar->size[0] *
      cpu_isNewLineChar->size[1];
    cpu_isNewLineChar->size[0] = 1;
    cpu_isNewLineChar->size[1] = ex_DLModel_28_B.vlen;
    ex__emxEnsureCapacity_boolean_T(cpu_isNewLineChar,
      ex_DLModel_28_B.b_startC_im);
    mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters(ex_DLModel_28_B.vlen -
      1), &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
    gpuEmxEnsureCapacity_boolean_T(cpu_isNewLineChar,
      &ex_DLModel_28_B.gpu_isNewLineChar, true);
    ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
      (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
    if (ex_DLModel_28_B.validLaunchParams_d) {
      ex_DL_c2_ex_DLModel_28_kernel51<<<ex_DLModel_28_B.grid_p,
        ex_DLModel_28_B.block_c>>>(ex_DLModel_28_B.gpu_thisTextU16,
        ex_DLModel_28_B.vlen - 1, ex_DLModel_28_B.gpu_isNewLineChar);
    }

    ex_DLModel_28_B.isInitialise = true;
    for (ex_DLModel_28_B.b_nz = 0; ex_DLModel_28_B.b_nz < ex_DLModel_28_B.vlen;
         ex_DLModel_28_B.b_nz++) {
      if (ex_DLModel_28_B.isInitialise) {
        gpuEmxMemcpyGpuToCpu_boolean_T(cpu_isNewLineChar,
          &ex_DLModel_28_B.gpu_isNewLineChar);
      }

      ex_DLModel_28_B.isInitialise = false;
      if (cpu_isNewLineChar->data[ex_DLModel_28_B.b_nz]) {
        if (ex_DLModel_28_B.i_vlen > 2147483621) {
          ex_DLModel_28_B.i_vlen = MAX_int32_T;
        } else {
          ex_DLModel_28_B.i_vlen += 26;
        }

        ex_DLModel_28_B.b_nx = 17;
      } else {
        ex_DL_c2_ex_DLModel_28_kernel52<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_uv1, ex_DLModel_28_B.b_nz, ex_DLModel_28_B.gpu_thisTextU16,
           gpu_tmp3);
        ex_DLModel_28_checkCudaError(cudaMemcpy(&ex_DLModel_28_B.cpu_tmp3,
          gpu_tmp3, 2UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
        ex_DLModel_28_B.b_thisGlyphIdx_1b = static_cast<uint16_T>
          (ex_DLModel_28_B.cpu_tmp3 + 1);
        if (ex_DLModel_28_B.cpu_tmp3 == 0) {
          if (ex_DLModel_28_B.b_nx > 2147483640) {
            ex_DLModel_28_B.b_nx = MAX_int32_T;
          } else {
            ex_DLModel_28_B.b_nx += 7;
          }
        } else {
          ex_DLModel_28_B.classIndex = iv4[ex_DLModel_28_B.cpu_tmp3];
          if ((ex_DLModel_28_B.b_nx < 0) && (ex_DLModel_28_B.classIndex <
               MIN_int32_T - ex_DLModel_28_B.b_nx)) {
            ex_DLModel_28_B.b_penX = MIN_int32_T;
          } else if ((ex_DLModel_28_B.b_nx > 0) && (ex_DLModel_28_B.classIndex >
                      MAX_int32_T - ex_DLModel_28_B.b_nx)) {
            ex_DLModel_28_B.b_penX = MAX_int32_T;
          } else {
            ex_DLModel_28_B.b_penX = ex_DLModel_28_B.b_nx +
              ex_DLModel_28_B.classIndex;
          }

          ex_DLModel_28_B.textLocAndWidth_idx_1 = ex_DLModel_28_B.i_vlen -
            iv5[ex_DLModel_28_B.cpu_tmp3];
          ex_DLModel_28_B.q1_tmp_l = uv2[ex_DLModel_28_B.cpu_tmp3];
          if (ex_DLModel_28_B.textLocAndWidth_idx_1 > MAX_int32_T
              - ex_DLModel_28_B.q1_tmp_l) {
            ex_DLModel_28_B.f_nz = MAX_int32_T;
            ex_DLModel_28_B.b_nbytes = MAX_int32_T;
          } else {
            ex_DLModel_28_B.f_nz = ex_DLModel_28_B.textLocAndWidth_idx_1 +
              ex_DLModel_28_B.q1_tmp_l;
            ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.f_nz;
          }

          ex_DLModel_28_B.textLocAndWidth_idx_0 = ex_DLModel_28_B.b_nbytes - 1;
          ex_DLModel_28_B.q1_tmp = uv3[ex_DLModel_28_B.cpu_tmp3];
          if (ex_DLModel_28_B.b_penX > MAX_int32_T - ex_DLModel_28_B.q1_tmp) {
            ex_DLModel_28_B.g_nz = MAX_int32_T;
          } else {
            ex_DLModel_28_B.g_nz = ex_DLModel_28_B.b_penX +
              ex_DLModel_28_B.q1_tmp;
          }

          if (ex_DLModel_28_B.g_nz < -2147483647) {
          } else {
            ex_DLModel_28_B.g_nz--;
          }

          if ((ex_DLModel_28_B.textLocAndWidth_idx_1 <= 480) &&
              (ex_DLModel_28_B.f_nz - 1 >= 1) && (ex_DLModel_28_B.b_penX <= 640)
              && (ex_DLModel_28_B.g_nz >= 1)) {
            ex_DLModel_28_B.n_vlen = 1;
            ex_DLModel_28_B.b_nbytes = ex_DLModel_28_B.q1_tmp;
            if (ex_DLModel_28_B.f_nz - 1 > 480) {
              ex_DLModel_28_B.textLocAndWidth_idx_0 = 480;
            }

            if (ex_DLModel_28_B.b_penX < 1) {
              if (ex_DLModel_28_B.b_penX <= MIN_int32_T) {
                ex_DLModel_28_B.nbytes = MAX_int32_T;
              } else {
                ex_DLModel_28_B.nbytes = -ex_DLModel_28_B.b_penX;
              }

              if (ex_DLModel_28_B.nbytes > 2147483645) {
                ex_DLModel_28_B.n_vlen = MAX_int32_T;
              } else {
                ex_DLModel_28_B.n_vlen = ex_DLModel_28_B.nbytes + 2;
              }

              ex_DLModel_28_B.b_penX = 1;
            }

            if (ex_DLModel_28_B.g_nz > 640) {
              ex_DLModel_28_B.b_nbytes = (ex_DLModel_28_B.q1_tmp -
                ex_DLModel_28_B.g_nz) + 640;
              ex_DLModel_28_B.g_nz = 640;
            }

            ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp =
              uv4[ex_DLModel_28_B.cpu_tmp3];
            ex_DLModel_28_B.f_nz = ex_DLModel_28_B.q1_tmp *
              ex_DLModel_28_B.q1_tmp_l;
            ex_DLModel_28_B.dimens2 = static_cast<uint32_T>(ex_DLModel_28_B.f_nz)
              + static_cast<uint32_T>(ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp);
            if (static_cast<uint32_T>(ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp)
                + 1U > ex_DLModel_28_B.dimens2) {
              ex_DLModel_28_B.d_tbWidth = 0;
              ex_DLModel_28_B.nbytes = 0;
            } else {
              ex_DLModel_28_B.d_tbWidth =
                ex_DLModel_28_B.b_bitmapEndIdx_1b_tmp_tmp;
              ex_DLModel_28_B.nbytes = static_cast<int32_T>
                (ex_DLModel_28_B.dimens2);
            }

            ex_DLModel_28_B.nbytes -= ex_DLModel_28_B.d_tbWidth;
            mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
              (ex_DLModel_28_B.nbytes - 1), &ex_DLModel_28_B.grid_p,
              &ex_DLModel_28_B.block_c, 65535U);
            if (ex_DLModel_28_B.uv5_outdatedOnGpu) {
              ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_uv5, cpu_uv5, 31620UL,
                cudaMemcpyHostToDevice), __FILE__, __LINE__);
            }

            ex_DLModel_28_B.uv5_outdatedOnGpu = false;
            ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
              (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
            if (ex_DLModel_28_B.validLaunchParams_d) {
              ex_DL_c2_ex_DLModel_28_kernel53<<<ex_DLModel_28_B.grid_p,
                ex_DLModel_28_B.block_c>>>(*gpu_uv5, ex_DLModel_28_B.d_tbWidth,
                ex_DLModel_28_B.nbytes - 1, *gpu_uv5_data);
            }

            ex_DLModel_28_B.numIters = ex_DLModel_28_computeNumIters_h
              (ex_DLModel_28_B.q1_tmp - 1, ex_DLModel_28_B.q1_tmp_l - 1);
            mwGetLaunchParameters1D(ex_DLModel_28_B.numIters,
              &ex_DLModel_28_B.grid_p, &ex_DLModel_28_B.block_c, 65535U);
            ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
              (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
            if (ex_DLModel_28_B.validLaunchParams_d) {
              ex_DL_c2_ex_DLModel_28_kernel54<<<ex_DLModel_28_B.grid_p,
                ex_DLModel_28_B.block_c>>>(*gpu_uv5_data, ex_DLModel_28_B.q1_tmp,
                static_cast<int32_T>(ex_DLModel_28_B.q1_tmp_l),
                ex_DLModel_28_B.q1_tmp_l - 1, ex_DLModel_28_B.q1_tmp - 1,
                *gpu_uv5_data_0);
            }

            mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
              (ex_DLModel_28_B.f_nz - 1), &ex_DLModel_28_B.grid_p,
              &ex_DLModel_28_B.block_c, 65535U);
            ex_DLModel_28_B.validLaunchParams_d = mwValidateLaunchParameters
              (ex_DLModel_28_B.grid_p, ex_DLModel_28_B.block_c);
            if (ex_DLModel_28_B.validLaunchParams_d) {
              ex_DL_c2_ex_DLModel_28_kernel55<<<ex_DLModel_28_B.grid_p,
                ex_DLModel_28_B.block_c>>>(*gpu_uv5_data_0, ex_DLModel_28_B.f_nz
                - 1, *gpu_thisGlyphBitmap_data);
            }

            ex_DLModel_28_B.uv9_outdatedOnGpu = true;
            if (ex_DLModel_28_B.n_vlen > ex_DLModel_28_B.b_nbytes) {
              ex_DLModel_28_B.n_vlen = 1;
            }

            for (ex_DLModel_28_B.nbytes = 0; ex_DLModel_28_B.nbytes < 3;
                 ex_DLModel_28_B.nbytes++) {
              ex_DLModel_28_B.cpu_b_cg = 1.0;
              ex_DLModel_28_B.i = ex_DLModel_28_computeEndIdx
                (static_cast<int64_T>(ex_DLModel_28_B.b_penX),
                 static_cast<int64_T>(ex_DLModel_28_B.g_nz), 1L);
              for (ex_DLModel_28_B.c_c = 0L; ex_DLModel_28_B.c_c <=
                   ex_DLModel_28_B.i; ex_DLModel_28_B.c_c++) {
                ex_DLModel_28_B.i1 = ex_DLModel_28_computeEndIdx
                  (static_cast<int64_T>(ex_DLModel_28_B.textLocAndWidth_idx_1),
                   static_cast<int64_T>(ex_DLModel_28_B.textLocAndWidth_idx_0),
                   1L);
                for (ex_DLModel_28_B.b_r = 0L; ex_DLModel_28_B.b_r <=
                     ex_DLModel_28_B.i1; ex_DLModel_28_B.b_r++) {
                  if (ex_DLModel_28_B.uv9_outdatedOnGpu) {
                    ex_DLModel_28_checkCudaError(cudaMemcpy
                      (ex_DLModel_28_B.cpu_thisGlyphBitmap_data,
                       *gpu_thisGlyphBitmap_data, 441UL, cudaMemcpyDeviceToHost),
                      __FILE__, __LINE__);
                  }

                  ex_DLModel_28_B.uv9_outdatedOnGpu = false;
                  ex_DLModel_28_B.b_glyphVal =
                    ex_DLModel_28_B.cpu_thisGlyphBitmap_data
                    [(((ex_DLModel_28_B.n_vlen + static_cast<int32_T>
                        (ex_DLModel_28_B.cpu_b_cg)) - 2) *
                      ex_DLModel_28_B.q1_tmp_l + static_cast<int32_T>(
                       static_cast<real_T>(ex_DLModel_28_B.b_r) + 1.0)) - 1];
                  if (ex_DLModel_28_B.b_glyphVal == 255) {
                    if (ex_DLModel_28_B.In_outdatedOnCpu) {
                      ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_In, *gpu_In,
                        921600UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                    }

                    cpu_In[((static_cast<int32_T>
                             (ex_DLModel_28_B.textLocAndWidth_idx_1 +
                              ex_DLModel_28_B.b_r) + 480 * (static_cast<int32_T>
                              (ex_DLModel_28_B.b_penX + ex_DLModel_28_B.c_c) - 1))
                            + 307200 * ex_DLModel_28_B.nbytes) - 1] =
                      MAX_uint8_T;
                    ex_DLModel_28_B.In_outdatedOnCpu = false;
                    ex_DLModel_28_B.In_outdatedOnGpu = true;
                  } else if (ex_DLModel_28_B.b_glyphVal != 0) {
                    ex_DLModel_28_B.b_nbytes = (((static_cast<int32_T>
                      (ex_DLModel_28_B.b_penX + ex_DLModel_28_B.c_c) - 1) * 480
                      + static_cast<int32_T>
                      (ex_DLModel_28_B.textLocAndWidth_idx_1 +
                       ex_DLModel_28_B.b_r)) + 307200 * ex_DLModel_28_B.nbytes)
                      - 1;
                    if (ex_DLModel_28_B.In_outdatedOnCpu) {
                      ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_In, *gpu_In,
                        921600UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
                    }

                    ex_DLModel_28_B.dimens2 = static_cast<uint32_T>((255 -
                      ex_DLModel_28_B.b_glyphVal) *
                      cpu_In[ex_DLModel_28_B.b_nbytes]) + static_cast<uint32_T>
                      (255 * ex_DLModel_28_B.b_glyphVal);
                    if (ex_DLModel_28_B.dimens2 > 65535U) {
                      ex_DLModel_28_B.dimens2 = 65535U;
                    }

                    ex_DLModel_28_B.cpu_tmp3 = static_cast<uint16_T>
                      (ex_DLModel_28_B.dimens2 / 255U);
                    if (static_cast<uint16_T>(ex_DLModel_28_B.dimens2 -
                         static_cast<uint32_T>(ex_DLModel_28_B.cpu_tmp3 * 255)) >=
                        128) {
                      ex_DLModel_28_B.cpu_tmp3 = static_cast<uint16_T>
                        (ex_DLModel_28_B.cpu_tmp3 + 1);
                    }

                    if (ex_DLModel_28_B.cpu_tmp3 > 255) {
                      ex_DLModel_28_B.cpu_tmp3 = 255U;
                    }

                    cpu_In[ex_DLModel_28_B.b_nbytes] = static_cast<uint8_T>
                      (ex_DLModel_28_B.cpu_tmp3);
                    ex_DLModel_28_B.In_outdatedOnCpu = false;
                    ex_DLModel_28_B.In_outdatedOnGpu = true;
                  }
                }

                ex_DLModel_28_B.cpu_b_cg++;
              }
            }
          }

          ex_DLModel_28_B.classIndex = cpu_iv3[ex_DLModel_28_B.b_thisGlyphIdx_1b
            - 1];
          if ((ex_DLModel_28_B.b_nx < 0) && (ex_DLModel_28_B.classIndex <
               MIN_int32_T - ex_DLModel_28_B.b_nx)) {
            ex_DLModel_28_B.b_nx = MIN_int32_T;
          } else if ((ex_DLModel_28_B.b_nx > 0) && (ex_DLModel_28_B.classIndex >
                      MAX_int32_T - ex_DLModel_28_B.b_nx)) {
            ex_DLModel_28_B.b_nx = MAX_int32_T;
          } else {
            ex_DLModel_28_B.b_nx += ex_DLModel_28_B.classIndex;
          }
        }
      }
    }
  }

  ex_DLModel_28_emxFree_boolean_T(&cpu_isNewLineChar);
  ex_DLModel_28_emxFree_int8_T(&cpu_c_x);
  ex_DLModel_28_emxFree_uint16_T(&cpu_thisGlyphIdxs_1b);
  ex_DLModel_28_emxFree_uint16_T(&cpu_thisCharcodes_1b);
  ex_DLModel_28_emxFree_int32_T(&cpu_idxNewlineChar);
  ex_DLModel_28_emxFree_int32_T(&cpu_b_ii);
  ex_DLModel_28_emxFree_uint8_T(&cpu_thisTextU16);
  if (ex_DLModel_28_B.In_outdatedOnGpu) {
    ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_In, cpu_In, 921600UL,
      cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }

  ex_DL_c2_ex_DLModel_28_kernel56<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_In, *gpu_outB, *gpu_outG, *gpu_outR);
  ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_outR, *gpu_outR, 307200UL,
    cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_outG, *gpu_outG, 307200UL,
    cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(cpu_outB, *gpu_outB, 307200UL,
    cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(gpu_bboxes_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_In), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outR), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outG), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outB), __FILE__, __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r3_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r4_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r6_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r7_f1);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_validatedHoleFilling_f1_dat),
    __FILE__, __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_str);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_varargin_1_data), __FILE__,
    __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r15_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_b_str);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r16_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r18_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r19_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r25_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r26_f1);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_color_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_color_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_inPosition_data), __FILE__,
    __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r44_f1);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_RGB), __FILE__, __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r45_f1);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_pixCount), __FILE__, __LINE__);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r54_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r55_f1);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_position_data), __FILE__, __LINE__);
  ex_DLModel_2_gpuEmxFree_uint8_T(&ex_DLModel_28_B.gpu_thisTextU16);
  ex_DLModel_2_gpuEmxFree_int32_T(&ex_DLModel_28_B.gpu_b_ii);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r79_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r80_f1);
  ex_DLModel_28_gpuEmxFree_char_T(&ex_DLModel_28_B.gpu_r81_f1);
  ex_DLModel_2_gpuEmxFree_int32_T(&ex_DLModel_28_B.gpu_idxNewlineChar);
  ex_DLModel__gpuEmxFree_uint16_T(&ex_DLModel_28_B.gpu_thisCharcodes_1b);
  ex_DLModel__gpuEmxFree_uint16_T(&ex_DLModel_28_B.gpu_thisGlyphIdxs_1b);
  ex_DLModel_28_gpuEmxFree_int8_T(&ex_DLModel_28_B.gpu_c_x);
  ex_DLModel_28_checkCudaError(cudaFree(gpu_b_lenFirstSegment), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_thisGlyphBitmap_data), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(gpu_c_lenThisSegment), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(gpu_tmp3), __FILE__, __LINE__);
  ex_DLModel_gpuEmxFree_boolean_T(&ex_DLModel_28_B.gpu_isNewLineChar);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_b_thisGlyphBitmap_data), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(gpu_b_cg), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv5_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv5_data_0), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv9_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv9_data_0), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_iv3), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_iv6), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv5), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_uv9), __FILE__, __LINE__);
}

static __global__ __launch_bounds__(1024, 1) void ex_DLModel_28_Outputs_kernel1(
  const real32_T tmp_data[400], const int32_T tmp, real32_T bboxes[400])
{
  uint64_T gStride;
  uint64_T gThreadId;
  uint64_T loopEnd;
  gThreadId = mwGetGlobalThreadIndex();
  gStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(tmp);
  for (uint64_T idx = gThreadId; idx <= loopEnd; idx += gStride) {
    // MATLAB Function: '<Root>/YOLO-V9 '
    bboxes[static_cast<int32_T>(idx)] = tmp_data[static_cast<int32_T>(idx)];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void addFPSModelClass::ex_DLModel_28_dlnetwork_delete(Yolov9t0_ex_DLModel_280
  *obj)
{
  if (obj->isInitialized) {
    obj->cleanup();
  }
}

void addFPSModelClass::ex_DL_emxFreeMatrix_cell_wrap_0
  (cell_wrap_0_ex_DLModel_28_T pMatrix[80])
{
  int32_T i;
  for (i = 0; i < 80; i++) {
    ex_DL_emxFreeStruct_cell_wrap_0(&pMatrix[i].f1);
  }
}

void addFPSModelClass::ex_DLModel_28_gpuThrowError_h(uint32_T errorCode, const
  char_T *errorName, const char_T *errorString, const char_T *file, int32_T line)
{
  fprintf(stderr,
          "CUDA error [%d,%s] : %s\nFile: \"%s\"\nLine: %d\nTerminating execution...",
          errorCode, errorName, errorString, file, line);
  exit(1);
}

void addFPSModelClass::ex_DLModel_28_checkCudaError_h(cudaError_t errorCode,
  const char_T *file, int32_T line)
{
  if (errorCode != cudaSuccess) {
    ex_DLModel_28_gpuThrowError_h(errorCode, cudaGetErrorName(errorCode),
      cudaGetErrorString(errorCode), file, line);
  }
}

void addFPSModelClass::ex_DLModel__cleanupGpuResources(void)
{
  ex_DLModel_28_checkCudaError_h(cudaGetLastError(), __FILE__, __LINE__);
}

void addFPSModelClass::ex_DLModel_28_setupGpuResources(void)
{
  cudaGetLastError();
}

void addFPSModelClass::ex_DL_emxInitMatrix_cell_wrap_0
  (cell_wrap_0_ex_DLModel_28_T pMatrix[80])
{
  int32_T i;
  for (i = 0; i < 80; i++) {
    ex_DL_emxInitStruct_cell_wrap_0(&pMatrix[i].f1);
  }
}

void addFPSModelClass::ex_DLModel_28_SystemCore_setup
  (nvidiacoder_common_GstVisionD_T *obj)
{
  int32_T initStatus;
  char_T b[78];
  static const char_T b_0[78] = { 'r', 't', 's', 'p', ':', '/', '/', 'a', 'd',
    'm', 'i', 'n', ':', 'a', 'd', 'm', 'i', 'n', '1', '2', '3', '4', '@', '1',
    '9', '2', '.', '1', '6', '8', '.', '1', '.', '1', '0', '8', ':', '5', '5',
    '4', '/', 'c', 'a', 'm', '/', 'r', 'e', 'a', 'l', 'm', 'o', 'n', 'i', 't',
    'o', 'r', '?', 'c', 'h', 'a', 'n', 'n', 'e', 'l', '=', '1', '&', 's', 'u',
    'b', 't', 'y', 'p', 'e', '=', '1', '\x00', '\x00' };

  obj->isSetupComplete = false;

  // Start for MATLABSystem: '<Root>/Network Video Receive'
  obj->isInitialized = 1;
  for (initStatus = 0; initStatus < 78; initStatus++) {
    b[initStatus] = b_0[initStatus];
  }

  // Start for MATLABSystem: '<Root>/Network Video Receive'
  initStatus = Initialize(&obj->Pipeline, 1, 1, 640.0, 480.0, 3000.0, true, 1,
    &b[0]);
  if (initStatus == 0) {
    // Start for MATLABSystem: '<Root>/Network Video Receive'
    obj->Initialized = true;
  } else {
    // Start for MATLABSystem: '<Root>/Network Video Receive'
    Terminate(&obj->Pipeline);
  }

  obj->isSetupComplete = true;
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_h
  (const real32_T varargin_1[1228800], real32_T varargout_1[1228800])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 1228800) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithColMa(const real32_T varargin_1[1228800],
  real32_T varargout_1[1228800])
{
  dlnetwork_layerPredictWithCol_h<<<dim3(2400U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_hp
  (const real32_T varargin_1[614400], real32_T varargout_1[614400])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 614400) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCol_k(const real32_T varargin_1[614400], real32_T
  varargout_1[614400])
{
  dlnetwork_layerPredictWithCo_hp<<<dim3(1200U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithC_hpj
  (const real32_T varargin_1[614400], real32_T varargout_2[307200], real32_T
   varargout_1[307200])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_1;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_1 = static_cast<int32_T>(gThreadId % 120UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_1)) / 120UL;
  tmp = static_cast<int32_T>(gThreadId % 16UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 16UL;
  if (static_cast<int32_T>(gThreadId) < 160) {
    int32_T tmp_0;
    tmp_1 += 120 * static_cast<int32_T>(gThreadId);
    tmp_0 = 19200 * tmp + tmp_1;
    varargout_1[tmp_0] = varargin_1[(tmp + 16) * 19200 + tmp_1];
    varargout_2[tmp_0] = varargin_1[tmp_0];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCo_ky(const real32_T varargin_1[614400], real32_T
  varargout_1[307200], real32_T varargout_2[307200])
{
  dlnetwork_layerPredictWithC_hpj<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_2, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWith_hpjj
  (const real32_T varargin_1[307200], real32_T varargout_1[307200])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 307200) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithC_ky3(const real32_T varargin_1[307200], real32_T
  varargout_1[307200])
{
  dlnetwork_layerPredictWith_hpjj<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWit_hpjj3
  (const real32_T varargin_1[307200], real32_T varargout_2[153600], real32_T
   varargout_1[153600])
{
  uint64_T gThreadId;
  int32_T tmp;
  int32_T tmp_1;
  gThreadId = mwGetGlobalThreadIndex();
  tmp_1 = static_cast<int32_T>(gThreadId % 60UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp_1)) / 60UL;
  tmp = static_cast<int32_T>(gThreadId % 32UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(tmp)) / 32UL;
  if (static_cast<int32_T>(gThreadId) < 80) {
    int32_T tmp_0;
    tmp_1 += 60 * static_cast<int32_T>(gThreadId);
    tmp_0 = 4800 * tmp + tmp_1;
    varargout_1[tmp_0] = varargin_1[(tmp + 32) * 4800 + tmp_1];
    varargout_2[tmp_0] = varargin_1[tmp_0];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWit_ky3w2(const real32_T varargin_1[307200], real32_T
  varargout_1[153600], real32_T varargout_2[153600])
{
  dlnetwork_layerPredictWit_hpjj3<<<dim3(300U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_2, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWi_hpjj3v
  (const real32_T varargin_1[76800], real32_T varargout_1[76800])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 76800) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWi_ky3w2k(const real32_T varargin_1[76800], real32_T
  varargout_1[76800])
{
  dlnetwork_layerPredictWi_hpjj3v<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictW_hpjj3vv
  (const real32_T varargin_1[153600], real32_T varargout_1[153600])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 153600) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictW_ky3w2k1(const real32_T varargin_1[153600], real32_T
  varargout_1[153600])
{
  dlnetwork_layerPredictW_hpjj3vv<<<dim3(300U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredict_hpjj3vvu
  (const real32_T varargin_1[115200], real32_T varargout_1[115200])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 115200) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredict_ky3w2k15(const real32_T varargin_1[115200], real32_T
  varargout_1[115200])
{
  dlnetwork_layerPredict_hpjj3vvu<<<dim3(225U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredic_hpjj3vvuu
  (const real32_T varargin_1[115200], real32_T varargout_2[57600], real32_T
   varargout_1[57600])
{
  int32_T tmp;
  tmp = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (tmp < 57600) {
    varargout_1[tmp] = varargin_1[tmp + 57600];
    varargout_2[tmp] = varargin_1[tmp];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredic_ky3w2k15c(const real32_T varargin_1[115200], real32_T
  varargout_1[57600], real32_T varargout_2[57600])
{
  dlnetwork_layerPredic_hpjj3vvuu<<<dim3(113U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_2, varargout_1);
}

static __global__ __launch_bounds__(288, 1) void dlnetwork_layerPredi_hpjj3vvuuj
  (const real32_T varargin_1[28800], real32_T varargout_1[28800])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 28800) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredi_ky3w2k15cy(const real32_T varargin_1[28800], real32_T
  varargout_1[28800])
{
  dlnetwork_layerPredi_hpjj3vvuuj<<<dim3(100U, 1U, 1U), dim3(288U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPred_hpjj3vvuujy
  (const real32_T varargin_1[57600], real32_T varargout_1[57600])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 57600) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPred_ky3w2k15cyr(const real32_T varargin_1[57600], real32_T
  varargout_1[57600])
{
  dlnetwork_layerPred_hpjj3vvuujy<<<dim3(113U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(384, 1) void dlnetwork_layerPre_hpjj3vvuujyh
  (const real32_T varargin_1[38400], real32_T varargout_1[38400])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 38400) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPre_ky3w2k15cyr5(const real32_T varargin_1[38400], real32_T
  varargout_1[38400])
{
  dlnetwork_layerPre_hpjj3vvuujyh<<<dim3(100U, 1U, 1U), dim3(384U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(192, 1) void dlnetwork_layerPr_hpjj3vvuujyhl
  (const real32_T varargin_1[38400], real32_T varargout_2[19200], real32_T
   varargout_1[19200])
{
  int32_T tmp;
  tmp = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (tmp < 19200) {
    varargout_1[tmp] = varargin_1[tmp + 19200];
    varargout_2[tmp] = varargin_1[tmp];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPr_ky3w2k15cyr5m(const real32_T varargin_1[38400], real32_T
  varargout_1[19200], real32_T varargout_2[19200])
{
  dlnetwork_layerPr_hpjj3vvuujyhl<<<dim3(100U, 1U, 1U), dim3(192U, 1U, 1U)>>>
    (varargin_1, varargout_2, varargout_1);
}

static __global__ __launch_bounds__(128, 1) void dlnetwork_layerP_hpjj3vvuujyhly
  (const real32_T varargin_1[9600], real32_T varargout_1[9600])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 9600) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerP_ky3w2k15cyr5mq(const real32_T varargin_1[9600], real32_T
  varargout_1[9600])
{
  dlnetwork_layerP_hpjj3vvuujyhly<<<dim3(75U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(192, 1) void dlnetwork_layer_hpjj3vvuujyhlyi
  (const real32_T varargin_1[19200], real32_T varargout_1[19200])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 19200) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layer_ky3w2k15cyr5mql(const real32_T varargin_1[19200], real32_T
  varargout_1[19200])
{
  dlnetwork_layer_hpjj3vvuujyhlyi<<<dim3(100U, 1U, 1U), dim3(192U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_mk
  (const real32_T varargin_1[38400], const int8_T xq[30], real32_T out[76800])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T j;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 30UL);
  j = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i)) / 30UL);
  if (j < 2560) {
    out[i + 30 * j] = varargin_1[(15 * j + static_cast<int32_T>(xq[i])) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_o
  (const real32_T out[76800], real32_T in[76800])
{
  uint64_T gThreadId;
  int32_T i_k;
  int32_T j_k;
  gThreadId = mwGetGlobalThreadIndex();
  j_k = static_cast<int32_T>(gThreadId % 30UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(j_k)) / 30UL;
  i_k = static_cast<int32_T>(gThreadId % 20UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i_k)) / 20UL;
  if (static_cast<int32_T>(gThreadId) < 128) {
    in[(i_k + 20 * j_k) + 600 * static_cast<int32_T>(gThreadId)] = out[(i_k * 30
      + j_k) + static_cast<int32_T>(gThreadId) * 600];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_ms
  (const real32_T in[76800], const int8_T b_xq[40], real32_T b_out[153600])
{
  uint64_T gThreadId;
  int32_T e_k;
  int32_T i_k;
  gThreadId = mwGetGlobalThreadIndex();
  i_k = static_cast<int32_T>(gThreadId % 3840UL);
  e_k = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i_k)) / 3840UL);
  if (e_k < 40) {
    b_out[e_k + 40 * i_k] = in[(20 * i_k + static_cast<int32_T>(b_xq[e_k])) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_g5
  (const real32_T b_out[153600], real32_T varargout_1[153600])
{
  uint64_T gThreadId;
  int32_T i_k;
  int32_T j_k;
  gThreadId = mwGetGlobalThreadIndex();
  j_k = static_cast<int32_T>(gThreadId % 40UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(j_k)) / 40UL;
  i_k = static_cast<int32_T>(gThreadId % 30UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i_k)) / 30UL;
  if (static_cast<int32_T>(gThreadId) < 128) {
    varargout_1[(i_k + 30 * j_k) + 1200 * static_cast<int32_T>(gThreadId)] =
      b_out[(i_k * 40 + j_k) + static_cast<int32_T>(gThreadId) * 1200];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCol_f(const real32_T varargin_1[38400], real32_T
  varargout_1[153600])
{
  static const int8_T cpu_xq[30] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8,
    8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15 };

  static const int8_T cpu_b_xq[40] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7,
    8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17,
    18, 18, 19, 19, 20, 20 };

  real32_T (*gpu_b_out)[153600];
  real32_T (*gpu_in)[76800];
  real32_T (*gpu_out)[76800];
  int8_T (*gpu_b_xq)[40];
  int8_T (*gpu_xq)[30];
  cudaMalloc(&gpu_b_xq, 40UL);
  cudaMalloc(&gpu_xq, 30UL);
  cudaMalloc(&gpu_b_out, 614400UL);
  cudaMalloc(&gpu_in, 307200UL);
  cudaMalloc(&gpu_out, 307200UL);
  cudaMemcpy(*gpu_xq, cpu_xq, 30UL, cudaMemcpyHostToDevice);
  dlnetwork_layerPredictWithCo_mk<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, *gpu_xq, *gpu_out);
  dlnetwork_layerPredictWithCol_o<<<dim3(150U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_out, *gpu_in);
  cudaMemcpy(*gpu_b_xq, cpu_b_xq, 40UL, cudaMemcpyHostToDevice);
  dlnetwork_layerPredictWithCo_ms<<<dim3(300U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_in, *gpu_b_xq, *gpu_b_out);
  dlnetwork_layerPredictWithCo_g5<<<dim3(300U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_out, varargout_1);
  cudaFree(*gpu_out);
  cudaFree(*gpu_in);
  cudaFree(*gpu_b_out);
  cudaFree(*gpu_xq);
  cudaFree(*gpu_b_xq);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_jk
  (const real32_T varargin_1[115200], const int8_T xq[60], real32_T out[230400])
{
  uint64_T gThreadId;
  int32_T i;
  int32_T j;
  gThreadId = mwGetGlobalThreadIndex();
  i = static_cast<int32_T>(gThreadId % 60UL);
  j = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i)) / 60UL);
  if (j < 3840) {
    out[i + 60 * j] = varargin_1[(30 * j + static_cast<int32_T>(xq[i])) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_l
  (const real32_T out[230400], real32_T in[230400])
{
  uint64_T gThreadId;
  int32_T i_k;
  int32_T j_k;
  gThreadId = mwGetGlobalThreadIndex();
  j_k = static_cast<int32_T>(gThreadId % 60UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(j_k)) / 60UL;
  i_k = static_cast<int32_T>(gThreadId % 40UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i_k)) / 40UL;
  if (static_cast<int32_T>(gThreadId) < 96) {
    in[(i_k + 40 * j_k) + 2400 * static_cast<int32_T>(gThreadId)] = out[(i_k *
      60 + j_k) + static_cast<int32_T>(gThreadId) * 2400];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCol_b
  (const real32_T in[230400], const int8_T b_xq[80], real32_T b_out[460800])
{
  uint64_T gThreadId;
  int32_T e_k;
  int32_T i_k;
  gThreadId = mwGetGlobalThreadIndex();
  i_k = static_cast<int32_T>(gThreadId % 5760UL);
  e_k = static_cast<int32_T>((gThreadId - static_cast<uint64_T>(i_k)) / 5760UL);
  if (e_k < 80) {
    b_out[e_k + 80 * i_k] = in[(40 * i_k + static_cast<int32_T>(b_xq[e_k])) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_jh
  (const real32_T b_out[460800], real32_T varargout_1[460800])
{
  uint64_T gThreadId;
  int32_T i_k;
  int32_T j_k;
  gThreadId = mwGetGlobalThreadIndex();
  j_k = static_cast<int32_T>(gThreadId % 80UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(j_k)) / 80UL;
  i_k = static_cast<int32_T>(gThreadId % 60UL);
  gThreadId = (gThreadId - static_cast<uint64_T>(i_k)) / 60UL;
  if (static_cast<int32_T>(gThreadId) < 96) {
    varargout_1[(i_k + 60 * j_k) + 4800 * static_cast<int32_T>(gThreadId)] =
      b_out[(i_k * 80 + j_k) + static_cast<int32_T>(gThreadId) * 4800];
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCo_kr(const real32_T varargin_1[115200], real32_T
  varargout_1[460800])
{
  static const int8_T cpu_xq[60] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8,
    8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18,
    18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27,
    28, 28, 29, 29, 30, 30 };

  static const int8_T cpu_b_xq[80] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7,
    8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17,
    18, 18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27,
    27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36,
    37, 37, 38, 38, 39, 39, 40, 40 };

  real32_T (*gpu_b_out)[460800];
  real32_T (*gpu_in)[230400];
  real32_T (*gpu_out)[230400];
  int8_T (*gpu_b_xq)[80];
  int8_T (*gpu_xq)[60];
  cudaMalloc(&gpu_b_xq, 80UL);
  cudaMalloc(&gpu_xq, 60UL);
  cudaMalloc(&gpu_b_out, 1843200UL);
  cudaMalloc(&gpu_in, 921600UL);
  cudaMalloc(&gpu_out, 921600UL);
  cudaMemcpy(*gpu_xq, cpu_xq, 60UL, cudaMemcpyHostToDevice);
  dlnetwork_layerPredictWithCo_jk<<<dim3(450U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, *gpu_xq, *gpu_out);
  dlnetwork_layerPredictWithCol_l<<<dim3(450U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_out, *gpu_in);
  cudaMemcpy(*gpu_b_xq, cpu_b_xq, 80UL, cudaMemcpyHostToDevice);
  dlnetwork_layerPredictWithCol_b<<<dim3(900U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_in, *gpu_b_xq, *gpu_b_out);
  dlnetwork_layerPredictWithCo_jh<<<dim3(900U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_b_out, varargout_1);
  cudaFree(*gpu_out);
  cudaFree(*gpu_in);
  cudaFree(*gpu_b_out);
  cudaFree(*gpu_xq);
  cudaFree(*gpu_b_xq);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_oo
  (const real32_T varargin_1[384000], real32_T varargout_1[384000])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 384000) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCol_j(const real32_T varargin_1[384000], real32_T
  varargout_1[384000])
{
  dlnetwork_layerPredictWithCo_oo<<<dim3(750U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(512, 1) void dlnetwork_layerPredictWithCo_hb
  (const real32_T varargin_1[96000], real32_T varargout_1[96000])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 96000) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCol_p(const real32_T varargin_1[96000], real32_T
  varargout_1[96000])
{
  dlnetwork_layerPredictWithCo_hb<<<dim3(188U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

static __global__ __launch_bounds__(224, 1) void dlnetwork_layerPredictWithCo_bl
  (const real32_T varargin_1[24000], real32_T varargout_1[24000])
{
  int32_T k;
  k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (k < 24000) {
    real32_T varargin_1_0;
    varargin_1_0 = varargin_1[k];
    varargout_1[k] = 1.0F / (expf(-varargin_1_0) + 1.0F) * varargin_1_0;
  }
}

// Function for MATLAB Function: '<Root>/YOLO-V9 '
void dlnetwork_layerPredictWithCol_m(const real32_T varargin_1[24000], real32_T
  varargout_1[24000])
{
  dlnetwork_layerPredictWithCo_bl<<<dim3(108U, 1U, 1U), dim3(224U, 1U, 1U)>>>
    (varargin_1, varargout_1);
}

// Model step function
void addFPSModelClass::step()
{
  real32_T (*gpu_bboxes)[400];
  real32_T (*gpu_tmp_data)[400];
  real32_T (*gpu_tmp_data_0)[100];
  real32_T (*gpu_tmp_data_1)[100];
  uint8_T (*gpu_RGB)[921600];
  uint8_T (*gpu_outB)[307200];
  uint8_T (*gpu_outG)[307200];
  uint8_T (*gpu_outR)[307200];
  uint8_T (*gpu_pln1)[307200];
  uint8_T (*gpu_pln2)[307200];
  uint8_T (*gpu_pln3)[307200];
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outB, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outG, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_outR, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_bboxes, 1600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_RGB, 921600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_tmp_data_1, 400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_tmp_data_0, 400UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_tmp_data, 1600UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_pln3, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_pln2, 307200UL), __FILE__,
    __LINE__);
  ex_DLModel_28_checkCudaError(cudaMalloc(&gpu_pln1, 307200UL), __FILE__,
    __LINE__);

  // MATLABSystem: '<Root>/Network Video Receive'
  ex_DLModel_28_SystemCore_step(&ex_DLModel_28_DW.obj_d,
    ex_DLModel_28_B.cpu_pln1, ex_DLModel_28_B.cpu_pln2, ex_DLModel_28_B.cpu_pln3);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_pln1, ex_DLModel_28_B.cpu_pln1,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_pln2, ex_DLModel_28_B.cpu_pln2,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_pln3, ex_DLModel_28_B.cpu_pln3,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);

  // MATLAB Function: '<Root>/RGBToImg'
  ex_DLModel_28_c5_ex_DLModel_28(*gpu_pln1, *gpu_pln2, *gpu_pln3, *gpu_RGB);

  // MATLAB Function: '<Root>/YOLO-V9 '
  ex_DLModel_28_c1_ex_DLModel_28(*gpu_RGB, *gpu_tmp_data,
    ex_DLModel_28_B.tmp_size, *gpu_tmp_data_0, ex_DLModel_28_B.tmp_size_m,
    *gpu_tmp_data_1, ex_DLModel_28_B.tmp_size_n);
  ex_DLModel_28_B.tmp_data_outdatedOnCpu_j = true;
  ex_DLModel_28_B.tmp_data_outdatedOnCpu = true;

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  // MATLAB Function: '<Root>/YOLO-V9 ' incorporates:
  //   MATLABSystem: '<S3>/MATLAB System'
  //
  for (ex_DLModel_28_B.i2 = 0; ex_DLModel_28_B.i2 < 2; ex_DLModel_28_B.i2++) {
    ex_DLModel_28_DW.SFunction_DIMS4[ex_DLModel_28_B.i2] =
      ex_DLModel_28_B.tmp_size_n[ex_DLModel_28_B.i2];
  }

  // End of Outputs for SubSystem: '<Root>/SDL Video Display1'
  ex_DLModel_28_B.loop_ub = ex_DLModel_28_B.tmp_size_n[0];

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  for (ex_DLModel_28_B.i2 = 0; ex_DLModel_28_B.i2 < ex_DLModel_28_B.loop_ub;
       ex_DLModel_28_B.i2++) {
    if (ex_DLModel_28_B.tmp_data_outdatedOnCpu_j) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_tmp_data_k,
        *gpu_tmp_data_1, 400UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    ex_DLModel_28_B.tmp_data_outdatedOnCpu_j = false;
    ex_DLModel_28_B.labelIds[ex_DLModel_28_B.i2] =
      ex_DLModel_28_B.cpu_tmp_data_k[ex_DLModel_28_B.i2];
  }

  for (ex_DLModel_28_B.i2 = 0; ex_DLModel_28_B.i2 < 2; ex_DLModel_28_B.i2++) {
    ex_DLModel_28_DW.SFunction_DIMS3[ex_DLModel_28_B.i2] =
      ex_DLModel_28_B.tmp_size_m[ex_DLModel_28_B.i2];
  }

  // End of Outputs for SubSystem: '<Root>/SDL Video Display1'
  ex_DLModel_28_B.loop_ub = ex_DLModel_28_B.tmp_size_m[0];

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  for (ex_DLModel_28_B.i2 = 0; ex_DLModel_28_B.i2 < ex_DLModel_28_B.loop_ub;
       ex_DLModel_28_B.i2++) {
    if (ex_DLModel_28_B.tmp_data_outdatedOnCpu) {
      ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_tmp_data_c,
        *gpu_tmp_data_0, 400UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    ex_DLModel_28_B.tmp_data_outdatedOnCpu = false;
    ex_DLModel_28_B.scores[ex_DLModel_28_B.i2] =
      ex_DLModel_28_B.cpu_tmp_data_c[ex_DLModel_28_B.i2];
  }

  for (ex_DLModel_28_B.i2 = 0; ex_DLModel_28_B.i2 < 2; ex_DLModel_28_B.i2++) {
    ex_DLModel_28_DW.SFunction_DIMS2[ex_DLModel_28_B.i2] =
      ex_DLModel_28_B.tmp_size[ex_DLModel_28_B.i2];
  }

  // End of Outputs for SubSystem: '<Root>/SDL Video Display1'
  mwGetLaunchParameters1D(ex_DLModel_28_computeNumIters
    (ex_DLModel_28_B.tmp_size[0] * ex_DLModel_28_B.tmp_size[1] - 1),
    &ex_DLModel_28_B.grid, &ex_DLModel_28_B.block, 65535U);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_bboxes, ex_DLModel_28_B.bboxes,
    1600UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_B.validLaunchParams = mwValidateLaunchParameters
    (ex_DLModel_28_B.grid, ex_DLModel_28_B.block);
  if (ex_DLModel_28_B.validLaunchParams) {
    // MATLAB Function: '<Root>/YOLO-V9 '
    ex_DLModel_28_Outputs_kernel1<<<ex_DLModel_28_B.grid, ex_DLModel_28_B.block>>>
      (*gpu_tmp_data, ex_DLModel_28_B.tmp_size[0] * ex_DLModel_28_B.tmp_size[1]
       - 1, *gpu_bboxes);
  }

  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.bboxes, *gpu_bboxes,
    1600UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_RGB, *gpu_RGB,
    921600UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);

  // MATLAB Function: '<Root>/Detection and Tracking'
  for (ex_DLModel_28_B.i3 = 0; ex_DLModel_28_B.i3 < 2; ex_DLModel_28_B.i3++) {
    ex_DLModel_28_B.tmp_size[ex_DLModel_28_B.i3] =
      ex_DLModel_28_DW.SFunction_DIMS2[ex_DLModel_28_B.i3];
  }

  ex_DLModel_28_c2_ex_DLModel_28(ex_DLModel_28_B.bboxes,
    ex_DLModel_28_B.tmp_size, ex_DLModel_28_B.scores, ex_DLModel_28_B.labelIds,
    ex_DLModel_28_B.cpu_RGB, ex_DLModel_28_B.cpu_pln1, ex_DLModel_28_B.cpu_pln2,
    ex_DLModel_28_B.cpu_pln3);
  memcpy(&ex_DLModel_28_B.outB[0], &ex_DLModel_28_B.cpu_pln3[0], 307200U *
         sizeof(uint8_T));
  memcpy(&ex_DLModel_28_B.outG[0], &ex_DLModel_28_B.cpu_pln2[0], 307200U *
         sizeof(uint8_T));
  memcpy(&ex_DLModel_28_B.outR[0], &ex_DLModel_28_B.cpu_pln1[0], 307200U *
         sizeof(uint8_T));

  // End of MATLAB Function: '<Root>/Detection and Tracking'
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_outB, ex_DLModel_28_B.outB,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_outG, ex_DLModel_28_B.outG,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(*gpu_outR, ex_DLModel_28_B.outR,
    307200UL, cudaMemcpyHostToDevice), __FILE__, __LINE__);

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  // MATLABSystem: '<S3>/MATLAB System'
  ex_DLModel_28_Outputs_kernel2<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_outB, *gpu_pln3, *gpu_outG, *gpu_pln2, *gpu_outR, *gpu_pln1);

  // End of Outputs for SubSystem: '<Root>/SDL Video Display1'
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.outR, *gpu_outR,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.outG, *gpu_outG,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.outB, *gpu_outB,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_pln1, *gpu_pln1,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_pln2, *gpu_pln2,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaMemcpy(ex_DLModel_28_B.cpu_pln3, *gpu_pln3,
    307200UL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);

  // Outputs for Atomic SubSystem: '<Root>/SDL Video Display1'
  // MATLABSystem: '<S3>/MATLAB System'
  MW_SDL_videoDisplayOutput(&ex_DLModel_28_B.cpu_pln1[0],
    &ex_DLModel_28_B.cpu_pln2[0], &ex_DLModel_28_B.cpu_pln3[0]);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_pln1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_pln2), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_pln3), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_tmp_data), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_tmp_data_0), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_tmp_data_1), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_RGB), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_bboxes), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outR), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outG), __FILE__, __LINE__);
  ex_DLModel_28_checkCudaError(cudaFree(*gpu_outB), __FILE__, __LINE__);
}

// Model initialize function
void addFPSModelClass::initialize()
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));
  ex_DLModel_28_setupGpuResources();
  ex_DL_emxInitMatrix_cell_wrap_0(ex_DLModel_28_DW.classNames);

  // Start for MATLABSystem: '<S3>/MATLAB System'
  ex_DLModel_28_DW.obj.matlabCodegenIsDeleted = false;
  ex_DLModel_28_DW.obj.isSetupComplete = false;
  ex_DLModel_28_DW.obj.isInitialized = 1;
  ex_DLModel_28_DW.obj.PixelFormatEnum = 1;
  MW_SDL_videoDisplayInit(ex_DLModel_28_DW.obj.PixelFormatEnum, 1, 1, 640.0,
    480.0);
  ex_DLModel_28_DW.obj.isSetupComplete = true;

  // End of SystemInitialize for SubSystem: '<Root>/SDL Video Display1'

  // Start for MATLABSystem: '<Root>/Network Video Receive'
  ex_DLModel_28_DW.obj_d.Initialized = false;
  ex_DLModel_28_DW.obj_d.isInitialized = 0;
  ex_DLModel_28_DW.obj_d.matlabCodegenIsDeleted = false;
  ex_DLModel_28_SystemCore_setup(&ex_DLModel_28_DW.obj_d);
}

// Model terminate function
void addFPSModelClass::terminate()
{
  // Terminate for MATLABSystem: '<Root>/Network Video Receive'
  if (!ex_DLModel_28_DW.obj_d.matlabCodegenIsDeleted) {
    ex_DLModel_28_DW.obj_d.matlabCodegenIsDeleted = true;
    if ((ex_DLModel_28_DW.obj_d.isInitialized == 1) &&
        ex_DLModel_28_DW.obj_d.isSetupComplete &&
        ex_DLModel_28_DW.obj_d.Initialized) {
      Terminate(&ex_DLModel_28_DW.obj_d.Pipeline);
    }
  }

  // End of Terminate for MATLABSystem: '<Root>/Network Video Receive'

  // Terminate for MATLAB Function: '<Root>/YOLO-V9 '
  if (!ex_DLModel_28_DL_ref->det.matlabCodegenIsDeleted) {
    ex_DLModel_28_DL_ref->det.matlabCodegenIsDeleted = true;
    ex_DLModel_28_dlnetwork_delete(&ex_DLModel_28_DL_ref->det);
  }

  // End of Terminate for MATLAB Function: '<Root>/YOLO-V9 '
  ex_DL_emxFreeMatrix_cell_wrap_0(ex_DLModel_28_DW.classNames);

  // Terminate for MATLABSystem: '<S3>/MATLAB System'
  if (!ex_DLModel_28_DW.obj.matlabCodegenIsDeleted) {
    ex_DLModel_28_DW.obj.matlabCodegenIsDeleted = true;
    if ((ex_DLModel_28_DW.obj.isInitialized == 1) &&
        ex_DLModel_28_DW.obj.isSetupComplete) {
      MW_SDL_videoDisplayTerminate(0, 0);
    }
  }

  // End of Terminate for MATLABSystem: '<S3>/MATLAB System'
  // End of Terminate for SubSystem: '<Root>/SDL Video Display1'
  ex_DLModel__cleanupGpuResources();
}

const char_T* addFPSModelClass::RT_MODEL_ex_DLModel_28_T::getErrorStatus() const
{
  return (errorStatus);
}

void addFPSModelClass::RT_MODEL_ex_DLModel_28_T::setErrorStatus(const char_T*
  const volatile aErrorStatus)
{
  (errorStatus = aErrorStatus);
}

// Constructor
addFPSModelClass::addFPSModelClass(DeepLearning_ex_DLModel_28_T
  *ex_DLModel_28_DeepLearning) :
  ex_DLModel_28_B(),
  ex_DLModel_28_DW(),
  ex_DLModel_28_DL_ref(),
  ex_DLModel_28_M()
{
  ex_DLModel_28_DL_ref = ex_DLModel_28_DeepLearning;
}

// Destructor
addFPSModelClass::~addFPSModelClass()
{
  // Currently there is no destructor body generated.
}

// Real-Time Model get method
addFPSModelClass::RT_MODEL_ex_DLModel_28_T * addFPSModelClass::getRTM()
{
  return (&ex_DLModel_28_M);
}

//
// File trailer for generated code.
//
// [EOF]
//
