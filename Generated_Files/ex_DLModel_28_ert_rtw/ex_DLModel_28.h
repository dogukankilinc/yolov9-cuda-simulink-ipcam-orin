//
// File: ex_DLModel_28.h
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
#ifndef ex_DLModel_28_h_
#define ex_DLModel_28_h_
#include <cstdio>
#include "rtwtypes.h"
#include "coder_posix_time.h"
#include "insertShapeUtilsCore_api.hpp"
#include "MW_gstNetworkVideoReceive.h"
#include "MW_SDL_video_display.h"
#include <cuda_runtime.h>
#include "Yolov9t0_ex_DLModel_280.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280179.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280178.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280177.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280176.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280167.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280166.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280165.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280164.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280163.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280162.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280161.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280160.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280159.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280158.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280157.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280156.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280155.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280154.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280153.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280152.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280151.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280150.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280149.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280148.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280147.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2808.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280146.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280145.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280175.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280174.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280173.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280172.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280144.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280143.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280142.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280141.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280140.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280139.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280138.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280137.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280136.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280135.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280134.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280133.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280132.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280131.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280130.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280129.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280128.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280127.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280126.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280125.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280124.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2807.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280123.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280122.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280171.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280170.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280169.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280168.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280121.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280120.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280119.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280118.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280117.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280116.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280115.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280114.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280113.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280112.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280111.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280110.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280109.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280108.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280107.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280106.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280105.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280104.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280103.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280102.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280101.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_280100.h"
#include "MWResize2DLayer_Yolov9t0_ex_DLModel_2802.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28099.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28098.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28097.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28096.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28095.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28094.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28093.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28092.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28091.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28090.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28089.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28088.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28087.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28086.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28085.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28084.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28083.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28082.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28081.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28080.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28079.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2805.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28078.h"
#include "MWResize2DLayer_Yolov9t0_ex_DLModel_2801.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28077.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28076.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28075.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28074.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28073.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28072.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28071.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28070.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28069.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28068.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28067.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28066.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28065.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28064.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28063.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28062.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28061.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28060.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28059.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28058.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28057.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28056.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28055.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2804.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28054.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28053.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28052.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28051.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28050.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28049.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28048.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28047.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28046.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28045.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28044.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28043.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28042.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28041.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28040.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28039.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28038.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28037.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28036.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28035.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28034.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28033.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28032.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28031.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28030.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28029.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28028.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28027.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28026.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28025.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28024.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28023.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28022.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28021.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28020.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28019.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28018.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28017.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28016.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28015.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28014.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28013.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28012.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28011.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_28010.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2809.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2802.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2808.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2807.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2806.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2805.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2804.h"
#include "MWCustomSliceLayer_Yolov9t0_ex_DLModel_2801.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2803.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2802.h"
#include "MWSwishLayer_Yolov9t0_ex_DLModel_2801.h"
#include "ex_DLModel_28_types.h"

extern "C"
{

#include "rt_nonfinite.h"

}

#include <stddef.h>

// Class declaration for model ex_DLModel_28
class addFPSModelClass
{
  // public data and function members
 public:
  // Block signals (default storage)
  struct B_ex_DLModel_28_T {
    uint8_T cpu_RGB[921600];
    uint8_T cpu_RGB_m[921600];
    uint8_T outG[307200];              // '<Root>/Detection and Tracking'
    uint8_T outB[307200];              // '<Root>/Detection and Tracking'
    uint8_T cpu_pln1[307200];
    uint8_T cpu_pln2[307200];
    uint8_T cpu_pln3[307200];
    real_T cpu_centersArray[12600];
    real_T cpu_idx_data[6300];
    real_T cpu_X_data[4800];
    real32_T cpu_b_xdata[6300];
    real32_T area_data[6300];
    real32_T x2_data[6300];
    real32_T y2_data[6300];
    real32_T in1_data[6300];
    int16_T cpu_iv14_data[6300];
    int16_T cpu_tmp_data[6300];
    boolean_T selectedIndex_data[6300];
    boolean_T b_index_data[6300];
    real32_T bboxes[400];              // '<Root>/YOLO-V9 '
    uint8_T cpu_pixCount[640];
    uint8_T cpu_thisGlyphBitmap_data[441];
    real32_T scores[100];              // '<Root>/YOLO-V9 '
    real32_T labelIds[100];            // '<Root>/YOLO-V9 '
    uint8_T outR[307200];              // '<Root>/Detection and Tracking'
    real32_T cpu_tmp_data_c[100];
    real32_T cpu_tmp_data_k[100];
    uint8_T cpu_b_thisGlyphBitmap_data[144];
    emxArray_real32_T_ex_DLModel__T gpu_pred_Data;
    emxArray_real32_T_ex_DLModel__T gpu_c_x_Data;
    emxArray_real32_T_ex_DLModel__T gpu_box;
    emxArray_real32_T_ex_DLModel__T gpu_d_x;
    emxArray_real32_T_ex_DLModel__T gpu_box_c;
    emxArray_real32_T_ex_DLModel__T gpu_output;
    emxArray_real_T_ex_DLModel_28_T gpu_centers;
    emxArray_boolean_T_ex_DLModel_T gpu_isNewLineChar;
    emxArray_int8_T_ex_DLModel_28_T gpu_c_x;
    emxArray_uint16_T_ex_DLModel__T gpu_thisGlyphIdxs_1b;
    emxArray_uint16_T_ex_DLModel__T gpu_thisCharcodes_1b;
    emxArray_int32_T_ex_DLModel_2_T gpu_b_ii;
    emxArray_int32_T_ex_DLModel_2_T gpu_idxNewlineChar;
    emxArray_char_T_ex_DLModel_28_T gpu_r4_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r3_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r7_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r6_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r16_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r15_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r19_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r18_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r26_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r25_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r45_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r44_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r55_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r54_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r81_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r80_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_r79_f1;
    emxArray_char_T_ex_DLModel_28_T gpu_b_str;
    emxArray_char_T_ex_DLModel_28_T gpu_str;
    emxArray_uint8_T_ex_DLModel_2_T gpu_thisTextU16;
    int32_T cpu_position_data[4];
    char_T cpu_validatedHoleFilling_f1_dat[15];
    int32_T e_x[3];
    dim3 grid;
    dim3 block;
    dim3 grid_p;
    dim3 block_c;
    dim3 grid_f;
    dim3 block_g;
    real_T cpu_b_lenFirstSegment;
    real_T cpu_c_lenThisSegment;
    real_T cpu_b_cg;
    real_T apnd;
    real_T cdiff;
    int64_T c_c;
    int64_T b_r;
    int64_T i;
    int64_T i1;
    uint64_T numIters;
    uint64_T numIters_g;
    int32_T tmp_size[2];
    int32_T tmp_size_m[2];
    int32_T tmp_size_n[2];
    int32_T position_size[2];
    int32_T inDims[2];
    int16_T b_sizes[2];
    real32_T f;
    int32_T i2;
    int32_T loop_ub;
    int32_T i3;
    int32_T classIndex;
    int32_T nbytes;
    int32_T b_nbytes;
    int32_T b_nx;
    int32_T vlen;
    int32_T b_nz;
    int32_T i_vlen;
    int32_T f_nz;
    int32_T d_tbWidth;
    int32_T n_vlen;
    int32_T g_nz;
    int32_T b_penX;
    int32_T b_endR_im;
    int32_T b_startC_im;
    int32_T b_endC_im;
    int32_T b_glIdx_startR_gl;
    int32_T b_glIdx_startC_gl;
    int32_T b_glIdx_endC_gl;
    int32_T textLocAndWidth_idx_1;
    int32_T textLocAndWidth_idx_0;
    int32_T currentIndex;
    int32_T ndbl;
    int32_T nm1d2;
    int32_T b;
    int32_T i3_idx_0;
    int32_T c_out_size;
    int32_T idx_size;
    int32_T selectedIndex_size;
    int32_T varargin_1_tmp_size;
    int32_T y_data_tmp;
    uint32_T dimens2;
    uint8_T cpu_color_data[3];
    uint8_T cpu_b_color_data[3];
    int16_T b_bitmapEndIdx_1b_tmp_tmp;
    int16_T output_tmp;
    int16_T tmp_size_p;
    uint16_T cpu_tmp3;
    uint16_T b_thisGlyphIdx_1b;
    uint16_T b_tmp3;
    int8_T q1_tmp;
    int8_T q1_tmp_l;
    int8_T sizes;
    int8_T i4;
    int8_T i5;
    int8_T i6;
    int8_T i7;
    int8_T i8;
    uint8_T b_glyphVal;
    boolean_T tmp_data_outdatedOnCpu;
    boolean_T tmp_data_outdatedOnCpu_j;
    boolean_T validLaunchParams;
    boolean_T isInitialise;
    boolean_T bboxes_data_outdatedOnGpu;
    boolean_T In_outdatedOnCpu;
    boolean_T In_outdatedOnGpu;
    boolean_T color_data_outdatedOnCpu;
    boolean_T RGB_outdatedOnCpu;
    boolean_T RGB_outdatedOnGpu;
    boolean_T b_ii_outdatedOnGpu;
    boolean_T b_lenFirstSegment_outdatedOnCpu;
    boolean_T c_lenThisSegment_outdatedOnCpu;
    boolean_T uv1_outdatedOnGpu;
    boolean_T iv6_outdatedOnGpu;
    boolean_T uv5_outdatedOnGpu;
    boolean_T uv9_outdatedOnGpu;
    boolean_T validLaunchParams_d;
    boolean_T empty_non_axis_sizes;
    boolean_T centersArray_outdatedOnCpu;
    boolean_T centersArray_outdatedOnGpu;
    boolean_T X_data_outdatedOnCpu;
    boolean_T centers_outdatedOnCpu;
    boolean_T tmp_data_outdatedOnGpu;
    boolean_T box_needsGpuEnsureCapacity;
    boolean_T validLaunchParams_g;
  };

  // Block states (default storage) for system '<Root>'
  struct DW_ex_DLModel_28_T {
    sdAmwXbnJnEmimT0NaJRtAD_ex_DL_T tStart;// '<Root>/Detection and Tracking'
    codertarget_linux_blocks_SDLV_T obj;// '<S3>/MATLAB System'
    nvidiacoder_common_GstVisionD_T obj_d;// '<Root>/Network Video Receive'
    real_T freq;                       // '<Root>/Detection and Tracking'
    cell_wrap_0_ex_DLModel_28_T classNames[80];// '<Root>/Detection and Tracking' 
    real32_T averageFPS;               // '<Root>/Detection and Tracking'
    int32_T SFunction_DIMS2[2];        // '<Root>/YOLO-V9 '
    int32_T SFunction_DIMS3[2];        // '<Root>/YOLO-V9 '
    int32_T SFunction_DIMS4[2];        // '<Root>/YOLO-V9 '
    boolean_T doneDoubleBufferReInit;  // '<Root>/YOLO-V9 '
    boolean_T det_not_empty;           // '<Root>/YOLO-V9 '
    boolean_T classNames_not_empty;    // '<Root>/Detection and Tracking'
    boolean_T averageFPS_not_empty;    // '<Root>/Detection and Tracking'
    boolean_T freq_not_empty;          // '<Root>/Detection and Tracking'
  };

  // Deep learning network, for system '<Root>'
  struct DeepLearning_ex_DLModel_28_T {
    Yolov9t0_ex_DLModel_280 det;       // '<Root>/YOLO-V9 '
  };

  // Real-time Model Data Structure
  struct RT_MODEL_ex_DLModel_28_T {
    const char_T * volatile errorStatus;
    const char_T* getErrorStatus() const;
    void setErrorStatus(const char_T* const volatile aErrorStatus);
  };

  // Real-Time Model get method
  addFPSModelClass::RT_MODEL_ex_DLModel_28_T * getRTM();

  // Constructor
  addFPSModelClass(DeepLearning_ex_DLModel_28_T *ex_DLModel_28_DeepLearning);

  // model initialize function
  void initialize();

  // model step function
  void step();

  // model terminate function
  void terminate();

  // Destructor
  ~addFPSModelClass();

  // private data and function members
 private:
  // Block signals
  B_ex_DLModel_28_T ex_DLModel_28_B;

  // Block states
  DW_ex_DLModel_28_T ex_DLModel_28_DW;

  // Deep learning network
  DeepLearning_ex_DLModel_28_T *ex_DLModel_28_DL_ref;

  // private member function(s) for subsystem '<Root>'
  void e_GstVisionDataReceive_stepImpl(nvidiacoder_common_GstVisionD_T *obj,
    uint8_T varargout_1[307200], uint8_T varargout_2[307200], uint8_T
    varargout_3[307200]);
  void ex_DLModel_28_SystemCore_step(nvidiacoder_common_GstVisionD_T *obj,
    uint8_T varargout_1[307200], uint8_T varargout_2[307200], uint8_T
    varargout_3[307200]);
  void ex_DLModel_28_c5_ex_DLModel_28(const uint8_T R[307200], const uint8_T G
    [307200], const uint8_T B[307200], uint8_T RGB[921600]);
  void ex_DLModel_gpuEmxReset_real32_T(emxArray_real32_T_ex_DLModel__T *gpu);
  void ex_DLModel_2_gpuEmxReset_real_T(emxArray_real_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_28_dlnetwork_setup(Yolov9t0_ex_DLModel_280 *obj);
  void ex_DLModel_28_gpuThrowError(uint32_T errorCode, const char_T *errorName,
    const char_T *errorString, const char_T *file, int32_T line);
  void ex_DLModel_28_checkCudaError(cudaError_t errorCode, const char_T *file,
    int32_T line);
  void ex_DLModel_28_dlnetwork_predict(Yolov9t0_ex_DLModel_280 *obj, const
    real32_T varargin_1_Data[921600], real32_T varargout_1_Data[691200],
    real32_T varargout_2_Data[172800], real32_T varargout_3_Data[43200]);
  void ex_DLModel_28_convolution(const real32_T *inputTensor, const real32_T
    *weights, const real32_T *bias, real32_T *outputTensor);
  void conv2dCudaImplicitGemmColMajor(const real32_T X[403200], real32_T Z[25200]);
  void ex_DLModel_28_emxInit_real_T(emxArray_real_T_ex_DLModel_28_T **pEmxArray,
    int32_T numDimensions);
  uint64_T ex_DLModel_28_computeNumIters(int32_T ub);
  void ex_DLModel_28_gpuThrowError_hp(const char_T *file, int32_T line);
  uint64_T ex_DLModel_28_computeNumIters_h(int32_T ub, int32_T ub_0);
  void ex_DLM_emxEnsureCapacity_real_T(emxArray_real_T_ex_DLModel_28_T *emxArray,
    int32_T oldNumel);
  void ex__gpuEmxEnsureCapacity_real_T(const emxArray_real_T_ex_DLModel_28_T
    *cpu, emxArray_real_T_ex_DLModel_28_T *gpu, boolean_T needsCopy);
  void ex__gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T_ex_DLModel_28_T *cpu,
    const emxArray_real_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_28_emxFree_real_T(emxArray_real_T_ex_DLModel_28_T **pEmxArray);
  void ex_DLModel_28_emxInit_real32_T(emxArray_real32_T_ex_DLModel__T
    **pEmxArray, int32_T numDimensions);
  void e_gpuEmxEnsureCapacity_real32_T(const emxArray_real32_T_ex_DLModel__T
    *cpu, emxArray_real32_T_ex_DLModel__T *gpu, boolean_T needsCopy);
  void ex_DLM_emxInitStruct_dlarray_38(emxArray_real32_T_ex_DLModel__T
    **pStruct_Data);
  void ex_D_emxEnsureCapacity_real32_T(emxArray_real32_T_ex_DLModel__T *emxArray,
    int32_T oldNumel);
  void e_gpuEmxMemcpyGpuToCpu_real32_T(emxArray_real32_T_ex_DLModel__T *cpu,
    const emxArray_real32_T_ex_DLModel__T *gpu);
  void ex_DLModel_28_emxFree_real32_T(emxArray_real32_T_ex_DLModel__T
    **pEmxArray);
  void ex_DLM_emxFreeStruct_dlarray_38(emxArray_real32_T_ex_DLModel__T
    **pStruct_Data);
  void e_gpuEmxMemcpyCpuToGpu_real32_T(emxArray_real32_T_ex_DLModel__T *gpu,
    const emxArray_real32_T_ex_DLModel__T *cpu);
  void ex_DLModel_28_binary_expand_op(emxArray_real32_T_ex_DLModel__T *in1,
    const emxArray_real32_T_ex_DLModel__T *in2);
  void ex_DLModel__gpuEmxFree_real32_T(emxArray_real32_T_ex_DLModel__T *gpu);
  void ex_DLModel_28_gpuEmxFree_real_T(emxArray_real_T_ex_DLModel_28_T *gpu);
  void ex_D_selectStrongestBboxCodegen(const emxArray_real32_T_ex_DLModel__T
    *bbox, const real32_T label_data[], boolean_T selectedIndex_data[], int32_T *
    selectedIndex_size);
  void ex_DLModel_28_c1_ex_DLModel_28(const uint8_T image[921600], real32_T
    bboxes_data[], int32_T bboxes_size[2], real32_T scores_data[], int32_T
    scores_size[2], real32_T labelIds_data[], int32_T labelIds_size[2]);
  void ex_DLMode_gpuEmxReset_boolean_T(emxArray_boolean_T_ex_DLModel_T *gpu);
  void ex_DLModel_2_gpuEmxReset_int8_T(emxArray_int8_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_gpuEmxReset_uint16_T(emxArray_uint16_T_ex_DLModel__T *gpu);
  void ex_DLModel__gpuEmxReset_int32_T(emxArray_int32_T_ex_DLModel_2_T *gpu);
  void ex_DLModel_2_gpuEmxReset_char_T(emxArray_char_T_ex_DLModel_28_T *gpu);
  void ex_DLModel__gpuEmxReset_uint8_T(emxArray_uint8_T_ex_DLModel_2_T *gpu);
  void ex_DLModel_28_emxInit_char_T(emxArray_char_T_ex_DLModel_28_T **pEmxArray,
    int32_T numDimensions);
  void ex_DL_emxInitStruct_cell_wrap_0(emxArray_char_T_ex_DLModel_28_T
    **pStruct_f1);
  void ex_DLM_emxEnsureCapacity_char_T(emxArray_char_T_ex_DLModel_28_T *emxArray,
    int32_T oldNumel);
  void ex__gpuEmxEnsureCapacity_char_T(const emxArray_char_T_ex_DLModel_28_T
    *cpu, emxArray_char_T_ex_DLModel_28_T *gpu, boolean_T needsCopy);
  void ex_DLModel_28_emxCopy_char_T(emxArray_char_T_ex_DLModel_28_T **dst,
    emxArray_char_T_ex_DLModel_28_T * const *src);
  void ex_DL_emxCopyStruct_cell_wrap_0(cell_wrap_0_ex_DLModel_28_T *dst,
    emxArray_char_T_ex_DLModel_28_T **src_f1);
  void ex_DLModel_28_emxFree_char_T(emxArray_char_T_ex_DLModel_28_T **pEmxArray);
  void ex_DL_emxFreeStruct_cell_wrap_0(emxArray_char_T_ex_DLModel_28_T
    **pStruct_f1);
  void ex__gpuEmxMemcpyGpuToCpu_char_T(emxArray_char_T_ex_DLModel_28_T *cpu,
    const emxArray_char_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_28_tic(real_T *tstart_tv_sec, real_T *tstart_tv_nsec);
  void ex_DLModel_28_emxInit_uint8_T(emxArray_uint8_T_ex_DLModel_2_T **pEmxArray,
    int32_T numDimensions);
  void ex_DLModel_28_emxInit_int32_T(emxArray_int32_T_ex_DLModel_2_T **pEmxArray,
    int32_T numDimensions);
  void ex_DLModel_28_emxInit_uint16_T(emxArray_uint16_T_ex_DLModel__T
    **pEmxArray, int32_T numDimensions);
  void ex_DLModel_28_emxInit_int8_T(emxArray_int8_T_ex_DLModel_28_T **pEmxArray,
    int32_T numDimensions);
  void ex_DLModel_28_emxInit_boolean_T(emxArray_boolean_T_ex_DLModel_T
    **pEmxArray, int32_T numDimensions);
  void ex_gpuEmxEnsureCapacity_uint8_T(const emxArray_uint8_T_ex_DLModel_2_T
    *cpu, emxArray_uint8_T_ex_DLModel_2_T *gpu, boolean_T needsCopy);
  void ex__gpuEmxMemcpyCpuToGpu_char_T(emxArray_char_T_ex_DLModel_28_T *gpu,
    const emxArray_char_T_ex_DLModel_28_T *cpu);
  void ex__emxEnsureCapacity_boolean_T(emxArray_boolean_T_ex_DLModel_T *emxArray,
    int32_T oldNumel);
  void gpuEmxEnsureCapacity_boolean_T(const emxArray_boolean_T_ex_DLModel_T *cpu,
    emxArray_boolean_T_ex_DLModel_T *gpu, boolean_T needsCopy);
  void ex_DL_emxEnsureCapacity_int32_T(emxArray_int32_T_ex_DLModel_2_T *emxArray,
    int32_T oldNumel);
  void gpuEmxMemcpyGpuToCpu_boolean_T(emxArray_boolean_T_ex_DLModel_T *cpu,
    const emxArray_boolean_T_ex_DLModel_T *gpu);
  void ex_gpuEmxEnsureCapacity_int32_T(const emxArray_int32_T_ex_DLModel_2_T
    *cpu, emxArray_int32_T_ex_DLModel_2_T *gpu, boolean_T needsCopy);
  void ex_gpuEmxMemcpyCpuToGpu_int32_T(emxArray_int32_T_ex_DLModel_2_T *gpu,
    const emxArray_int32_T_ex_DLModel_2_T *cpu);
  void e_gpuEmxEnsureCapacity_uint16_T(const emxArray_uint16_T_ex_DLModel__T
    *cpu, emxArray_uint16_T_ex_DLModel__T *gpu, boolean_T needsCopy);
  void ex_DLM_emxEnsureCapacity_int8_T(emxArray_int8_T_ex_DLModel_28_T *emxArray,
    int32_T oldNumel);
  void ex__gpuEmxEnsureCapacity_int8_T(const emxArray_int8_T_ex_DLModel_28_T
    *cpu, emxArray_int8_T_ex_DLModel_28_T *gpu, boolean_T needsCopy);
  void ex__gpuEmxMemcpyGpuToCpu_int8_T(emxArray_int8_T_ex_DLModel_28_T *cpu,
    const emxArray_int8_T_ex_DLModel_28_T *gpu);
  void ex_gpuEmxMemcpyGpuToCpu_int32_T(emxArray_int32_T_ex_DLModel_2_T *cpu,
    const emxArray_int32_T_ex_DLModel_2_T *gpu);
  int64_T ex_DLModel_28_computeEndIdx(int64_T start, int64_T end, int64_T stride);
  real_T ex_DLModel_28_toc(real_T tstart_tv_sec, real_T tstart_tv_nsec);
  uint64_T ex_DLModel_2_computeNumIters_hp(int32_T ub, int32_T ub_0, int32_T
    ub_1);
  void ex_DLModel_28_emxFree_boolean_T(emxArray_boolean_T_ex_DLModel_T
    **pEmxArray);
  void ex_DLModel_28_emxFree_int8_T(emxArray_int8_T_ex_DLModel_28_T **pEmxArray);
  void ex_DLModel_28_emxFree_uint16_T(emxArray_uint16_T_ex_DLModel__T
    **pEmxArray);
  void ex_DLModel_28_emxFree_int32_T(emxArray_int32_T_ex_DLModel_2_T **pEmxArray);
  void ex_DLModel_28_emxFree_uint8_T(emxArray_uint8_T_ex_DLModel_2_T **pEmxArray);
  void ex_DLModel_28_gpuEmxFree_char_T(emxArray_char_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_2_gpuEmxFree_uint8_T(emxArray_uint8_T_ex_DLModel_2_T *gpu);
  void ex_DLModel_2_gpuEmxFree_int32_T(emxArray_int32_T_ex_DLModel_2_T *gpu);
  void ex_DLModel__gpuEmxFree_uint16_T(emxArray_uint16_T_ex_DLModel__T *gpu);
  void ex_DLModel_28_gpuEmxFree_int8_T(emxArray_int8_T_ex_DLModel_28_T *gpu);
  void ex_DLModel_gpuEmxFree_boolean_T(emxArray_boolean_T_ex_DLModel_T *gpu);
  void ex_DLModel_28_c2_ex_DLModel_28(const real32_T cpu_bboxes_data[], const
    int32_T bboxes_size[2], const real32_T scores_data[], const real32_T
    labels_data[], uint8_T cpu_In[921600], uint8_T cpu_outR[307200], uint8_T
    cpu_outG[307200], uint8_T cpu_outB[307200]);
  void ex_DLModel_28_dlnetwork_delete(Yolov9t0_ex_DLModel_280 *obj);
  void ex_DL_emxFreeMatrix_cell_wrap_0(cell_wrap_0_ex_DLModel_28_T pMatrix[80]);
  void ex_DLModel_28_gpuThrowError_h(uint32_T errorCode, const char_T *errorName,
    const char_T *errorString, const char_T *file, int32_T line);
  void ex_DLModel_28_checkCudaError_h(cudaError_t errorCode, const char_T *file,
    int32_T line);
  void ex_DLModel__cleanupGpuResources(void);
  void ex_DLModel_28_setupGpuResources(void);
  void ex_DL_emxInitMatrix_cell_wrap_0(cell_wrap_0_ex_DLModel_28_T pMatrix[80]);
  void ex_DLModel_28_SystemCore_setup(nvidiacoder_common_GstVisionD_T *obj);

  // Real-Time Model
  RT_MODEL_ex_DLModel_28_T ex_DLModel_28_M;
};

extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

//-
//  The generated code includes comments that allow you to trace directly
//  back to the appropriate location in the model.  The basic format
//  is <system>/block_name, where system is the system number (uniquely
//  assigned by Simulink) and block_name is the name of the block.
//
//  Use the MATLAB hilite_system command to trace the generated code back
//  to the model.  For example,
//
//  hilite_system('<S3>')    - opens system 3
//  hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
//
//  Here is the system hierarchy for this model
//
//  '<Root>' : 'ex_DLModel_28'
//  '<S1>'   : 'ex_DLModel_28/Detection and Tracking'
//  '<S2>'   : 'ex_DLModel_28/RGBToImg'
//  '<S3>'   : 'ex_DLModel_28/SDL Video Display1'
//  '<S4>'   : 'ex_DLModel_28/YOLO-V9 '

#endif                                 // ex_DLModel_28_h_

//
// File trailer for generated code.
//
// [EOF]
//
