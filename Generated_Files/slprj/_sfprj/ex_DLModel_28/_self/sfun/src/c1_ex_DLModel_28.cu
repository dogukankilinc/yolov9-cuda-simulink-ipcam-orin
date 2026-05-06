/* Include files */

#include "ex_DLModel_28_sfun.h"
#include "c1_ex_DLModel_28.h"
#include <string.h>
#include "mwmathutil.h"
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

#include "MWLaunchParametersUtilities.hpp"
#include "MWSortWithIndexUtility.h"
#include "MWConstants.h"
#include "MWSortFunctors.h"
#include "MWShuffleUtility.h"
#include "MWCudaDimUtility.hpp"
#include "string.h"
#include "stdlib.h"

/* Forward Declarations */

/* Type Definitions */

/* Named Constants */
const int32_T CALL_EVENT = -1;

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;

/* Function Declarations */
static void c1_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint8_T c1_cpu_image[921600], real32_T c1_b_bboxes_data[], int32_T
  c1_bboxes_size[2], real32_T c1_b_scores_data[], int32_T c1_scores_size[2],
  real32_T c1_b_labelIds_data[], int32_T c1_labelIds_size[2]);
static void initialize_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void initialize_params_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance);
static void mdl_start_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void mdl_terminate_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void mdl_setup_runtime_resources_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance);
static void enable_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void disable_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void sf_gateway_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void ext_mode_exec_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static const mxArray *get_sim_state_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance);
static void set_sim_state_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_st);
static void c1_dlnetwork_setup(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj);
static void c1_dlnetwork_predict(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj, real32_T c1_varargin_1_Data[921600],
  real32_T c1_varargout_1_Data[691200], real32_T c1_varargout_2_Data[172800],
  real32_T c1_varargout_3_Data[43200]);
static void c1_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [1228800], real32_T c1_varargout_1[1228800]);
static void c1_b_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [614400], real32_T c1_varargout_1[614400]);
static void c1_c_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [614400], real32_T c1_varargout_1[307200], real32_T c1_varargout_2[307200]);
static void c1_d_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[307200]);
static void c1_e_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[307200]);
static void c1_f_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[153600], real32_T c1_varargout_2[153600]);
static void c1_g_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[76800],
   real32_T c1_varargout_1[76800]);
static void c1_h_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [153600], real32_T c1_varargout_1[153600]);
static void c1_i_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargout_1[115200]);
static void c1_j_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargout_1[57600], real32_T c1_varargout_2[57600]);
static void c1_k_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[28800],
   real32_T c1_varargout_1[28800]);
static void c1_m_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[57600],
   real32_T c1_varargout_1[57600]);
static void c1_o_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargout_1[38400]);
static void c1_p_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargout_1[19200], real32_T c1_varargout_2[19200]);
static void c1_q_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[9600],
   real32_T c1_varargout_1[9600]);
static void c1_r_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[19200],
   real32_T c1_varargout_1[19200]);
static void c1_s_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargin_2[115200], real32_T c1_varargout_1[153600]);
static void c1_t_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargin_2[307200], real32_T c1_varargout_1[460800]);
static void c1_u_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [384000], real32_T c1_varargout_1[384000]);
static void c1_v_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[76800],
   real32_T c1_varargout_1[76800]);
static void c1_w_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[96000],
   real32_T c1_varargout_1[96000]);
static void c1_x_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[24000],
   real32_T c1_varargout_1[24000]);
static void c1_conv2dCudaImplicitGemmColMajor(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, real32_T c1_X[403200], real32_T c1_Z[25200]);
static void c1_selectStrongestBboxCodegen(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_bbox, real32_T c1_label_data[],
  int32_T c1_label_size[1], boolean_T c1_selectedIndex_data[], int32_T
  c1_selectedIndex_size[1]);
static void c1_indexShapeCheck(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  int32_T c1_matrixSize, int32_T c1_indexSize[2]);
static void c1_dlnetwork_delete(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj);
static void c1_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const mxArray *c1_nullptr, const char_T *c1_identifier, real32_T c1_y_data[],
  int32_T c1_y_size[2]);
static void c1_b_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real32_T c1_y_data[], int32_T c1_y_size[2]);
static void c1_c_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_nullptr, const char_T *c1_identifier,
  real32_T c1_y_data[], int32_T c1_y_size[2]);
static void c1_d_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real32_T c1_y_data[], int32_T c1_y_size[2]);
static void c1_convolution(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const real32_T *c1_inputTensor, const real32_T *c1_weights, const real32_T
  *c1_bias, real32_T *c1_gpu_outputTensor);
static __global__ void c1_convolutionKernel(const real32_T *c1_inputTensor,
  const real32_T *c1_weights, const real32_T *c1_bias, real32_T *c1_outputTensor);
static __global__ void c1_ReduceNonFirstDimLargeFirstDimKernel(real32_T
  c1_input[403200], real32_T c1_output[25200], uint32_T c1_preReduceDimSize,
  uint32_T c1_reduceDimSize, uint32_T c1_level, uint32_T c1_offsetOfLevel[4],
  uint32_T c1_totalTempArraysSize, boolean_T c1_isLastLevel);
static __global__ void c1_b_ReduceNonFirstDimLargeFirstDimKernel(real32_T
  c1_input[403200], real32_T c1_output[25200], uint32_T c1_preReduceDimSize,
  uint32_T c1_reduceDimSize, uint32_T c1_level, uint32_T c1_offsetOfLevel[4],
  uint32_T c1_totalTempArraysSize, boolean_T c1_isLastLevel);
static void c1_binary_expand_op(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T *c1_in1, c1_emxArray_real32_T *c1_in2);
static void c1_emxEnsureCapacity_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_emxArray, int32_T c1_oldNumel);
static void c1_emxEnsureCapacity_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_emxArray, int32_T c1_oldNumel);
static void c1_emxInit_real32_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T **c1_pEmxArray, int32_T c1_numDimensions);
static void c1_emxInitStruct_dlarray_38(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T **c1_pStruct_Data);
static void c1_emxInit_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T **c1_pEmxArray, int32_T c1_numDimensions);
static void c1_emxFree_real32_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T **c1_pEmxArray);
static void c1_emxFreeStruct_dlarray_38(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T **c1_pStruct_Data);
static void c1_emxFree_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T **c1_pEmxArray);
static void c1_emxConvertDynamicMatrixFromEmx_(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance, c1_emxArray_real32_T_100x4 *c1_emx, real32_T c1_data[400],
  int32_T c1_size[2]);
static void c1_b_emxConvertDynamicMatrixFromEmx_
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, c1_emxArray_real32_T_100x1
   *c1_emx, real32_T c1_data[100], int32_T c1_size[2]);
static int64_T c1_div_nzp_s64(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  int64_T c1_numerator, int64_T c1_denominator, int32_T c1_EMLOvCount_src_loc,
  uint32_T c1_ssid_src_loc, int32_T c1_offset_src_loc, int32_T c1_length_src_loc);
static __global__ void c1_c1_ex_DLModel_28_kernel1(int16_T c1_aux1[960]);
static __global__ void c1_c1_ex_DLModel_28_kernel2(int16_T c1_aux2[1280]);
static __global__ void c1_c1_ex_DLModel_28_kernel3(const int16_T c1_aux1[960],
  int16_T c1_ipRowIndices[960], int8_T c1_rowWeights[960]);
static __global__ void c1_c1_ex_DLModel_28_kernel4(const int16_T c1_aux2[1280],
  int16_T c1_ipColIndices[1280], int8_T c1_colWeights[1280]);
static __global__ void c1_c1_ex_DLModel_28_kernel5(const int8_T c1_rowWeights
  [960], real_T c1_rowWeightsTotal[480]);
static __global__ void c1_c1_ex_DLModel_28_kernel6(const int8_T c1_colWeights
  [1280], real_T c1_colWeightsTotal[640]);
static __global__ void c1_c1_ex_DLModel_28_kernel7(const real_T
  c1_rowWeightsTotal[480], const int8_T c1_rowWeights[960], const uint8_T
  c1_b_image[921600], const int16_T c1_ipRowIndices[960], uint8_T
  c1_partialResize[921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel8(const real_T
  c1_colWeightsTotal[640], const int8_T c1_colWeights[1280], const uint8_T
  c1_partialResize[921600], const int16_T c1_ipColIndices[1280], uint8_T c1_out
  [921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel9(const uint8_T c1_out[921600],
  uint8_T c1_img[921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel10(const uint8_T c1_img[921600],
  uint8_T c1_partialResize[921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel11(const uint8_T
  c1_partialResize[921600], uint8_T c1_img[921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel12(const uint8_T c1_img[921600],
  real32_T c1_expl_temp_Data[921600]);
static __global__ void c1_c1_ex_DLModel_28_kernel13(const real32_T c1_objX_Data
  [691200], real32_T c1_objdata[691200]);
static __global__ void c1_c1_ex_DLModel_28_kernel14(const real32_T c1_objX_Data
  [172800], real32_T c1_objdata[172800]);
static __global__ void c1_c1_ex_DLModel_28_kernel15(const real32_T c1_objX_Data
  [43200], real32_T c1_objdata[43200]);
static __global__ void c1_c1_ex_DLModel_28_kernel16(const real32_T c1_objdata
  [691200], real32_T c1_matrixToCat[691200]);
static __global__ void c1_c1_ex_DLModel_28_kernel17(const real32_T c1_objdata
  [172800], real32_T c1_matrixToCat[172800]);
static __global__ void c1_c1_ex_DLModel_28_kernel18(const real32_T c1_objdata
  [43200], real32_T c1_matrixToCat[43200]);
static __global__ void c1_c1_ex_DLModel_28_kernel19(const real32_T
  c1_matrixToCat[43200], const int32_T c1_iy, real32_T c1_intermediateResult
  [907200]);
static __global__ void c1_c1_ex_DLModel_28_kernel20(const real32_T
  c1_intermediateResult[907200], real32_T c1_out_Data[907200]);
static __global__ void c1_c1_ex_DLModel_28_kernel21(const real32_T c1_out_Data
  [907200], real32_T c1_b_x[504000]);
static __global__ void c1_c1_ex_DLModel_28_kernel22(real32_T c1_splitout2_Data
  [504000], real32_T c1_b_x[504000]);
static __global__ void c1_c1_ex_DLModel_28_kernel23(const real32_T c1_out_Data
  [907200], real32_T c1_objX_Data[403200]);
static __global__ void c1_c1_ex_DLModel_28_kernel24(uint32_T c1_offsetOfLevel[4]);
static __global__ void c1_c1_ex_DLModel_28_kernel25(const real32_T c1_maxVal
  [25200], const real32_T c1_objX_Data[403200], real32_T c1_xdata[403200]);
static __global__ void c1_c1_ex_DLModel_28_kernel26(real32_T c1_xdata[403200]);
static __global__ void c1_c1_ex_DLModel_28_kernel27(uint32_T c1_offsetOfLevel[4]);
static __global__ void c1_c1_ex_DLModel_28_kernel28(const real32_T c1_maxVal
  [25200], const real32_T c1_xdata[403200], real32_T c1_b_obj_Data[403200]);
static __global__ void c1_c1_ex_DLModel_28_kernel29(const real32_T
  c1_b_obj_Data[403200], real32_T c1_xdata[403200]);
static __global__ void c1_c1_ex_DLModel_28_kernel30(const real32_T c1_objX_Data
  [25200], real32_T c1_splitoutFc[25200], real32_T c1_maxVal[25200]);
static __global__ void c1_c1_ex_DLModel_28_kernel31(real_T c1_centersArray[12600]);
static __global__ void c1_c1_ex_DLModel_28_kernel32(real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel33(const real_T c1_b1, const
  int32_T c1_ndbl, real_T c1_y_data[80]);
static uint64_T c1_computeNumIters(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, int32_T c1_ub);
static __global__ void c1_c1_ex_DLModel_28_kernel34(const real_T c1_b1, const
  int32_T c1_n, const int32_T c1_i, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel35(const real_T c1_b1, const
  int32_T c1_nm1d2, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel36(real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel37(const real_T c1_b1, const
  int32_T c1_ndbl, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel38(const real_T c1_b1, const
  int32_T c1_n, const int32_T c1_i1, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel39(const real_T c1_b1, const
  int32_T c1_nm1d2, real_T c1_y_data[80]);
static uint64_T c1_b_computeNumIters(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, int32_T c1_ub, int32_T c1_b_ub);
static __global__ void c1_c1_ex_DLModel_28_kernel40(const real_T c1_y_data[80],
  const int32_T c1_Y_size_dim0, const real_T c1_b_y_data[80], const int32_T
  c1_X_size_dim0, const int32_T c1_i, const int32_T c1_i1, real_T c1_c_Y_data
  [4800], real_T c1_b_X_data[4800]);
static __global__ void c1_c1_ex_DLModel_28_kernel41(const real_T c1_c_Y_data
  [4800], const int32_T c1_loop_ub, c1_emxArray_real_T c1_centers);
static __global__ void c1_c1_ex_DLModel_28_kernel42(const real_T c1_b_X_data
  [4800], const int32_T c1_loop_ub, c1_emxArray_real_T c1_centers, int32_T
  c1_centers_dim0);
static __global__ void c1_c1_ex_DLModel_28_kernel43(const c1_emxArray_real_T
  c1_centers, const int32_T c1_i2, const int32_T c1_i3, real_T c1_centersArray
  [12600], int32_T c1_centers_dim0);
static __global__ void c1_c1_ex_DLModel_28_kernel44(const real_T c1_b1, const
  int32_T c1_nm1d2, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel45(const real_T c1_b1, const
  int32_T c1_nm1d2, real_T c1_y_data[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel46(const real_T
  c1_centersArray[12600], real32_T c1_ConstantArray1[12600]);
static __global__ void c1_c1_ex_DLModel_28_kernel47(const real32_T
  c1_splitoutFc[25200], real32_T c1_ConstantArray1[12600], real32_T c1_sub1
  [12600]);
static __global__ void c1_c1_ex_DLModel_28_kernel48(const real32_T c1_sub1[12600],
  real32_T c1_ConstantArray1[12600], real32_T c1_varargin_1[12600]);
static __global__ void c1_c1_ex_DLModel_28_kernel49(const real32_T
  c1_ConstantArray1[12600], const int32_T c1_iy, real32_T c1_maxVal[25200]);
static __global__ void c1_c1_ex_DLModel_28_kernel50(const int8_T c1_fv[6300],
  const real32_T c1_maxVal[25200], real32_T c1_dataArgs_f1[25200]);
static __global__ void c1_c1_ex_DLModel_28_kernel51(const real32_T
  c1_splitout2_Data[504000], const int32_T c1_iy, real32_T
  c1_intermediateResult[529200]);
static __global__ void c1_c1_ex_DLModel_28_kernel52(int32_T
  c1_processedVarargin_f1[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel53(real_T
  c1_processedVarargin_f2[80]);
static __global__ void c1_c1_ex_DLModel_28_kernel54(const real32_T
  c1_intermediateResult[529200], real32_T c1_c_x_Data[504000]);
static __global__ void c1_c1_ex_DLModel_28_kernel55(const real32_T
  c1_intermediateResult[529200], const real_T c1_processedVarargin_f2[80], const
  int32_T c1_processedVarargin_f1[6300], const real32_T c1_c_x_Data[504000],
  real32_T c1_xdata[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel56(const real32_T
  c1_intermediateResult[529200], const int16_T c1_iv_data[6300], const int32_T
  c1_iv_size, c1_emxArray_real32_T c1_pred_Data, int32_T c1_pred_Data_dim0);
static __global__ void c1_c1_ex_DLModel_28_kernel57(const real32_T
  c1_intermediateResult[529200], const int16_T c1_iv_data[6300], const int32_T
  c1_iv_size, c1_emxArray_real32_T c1_c_x_Data, int32_T c1_x_Data_dim0);
static __global__ void c1_c1_ex_DLModel_28_kernel58(const real32_T
  c1_c_box_data[6300], const int32_T c1_i1, c1_emxArray_real32_T c1_box);
static __global__ void c1_c1_ex_DLModel_28_kernel59(const c1_emxArray_real32_T
  c1_pred_Data, const int32_T c1_iv_size, c1_emxArray_real32_T c1_b_x, int32_T
  c1_x_dim0, int32_T c1_pred_Data_dim0);
static __global__ void c1_c1_ex_DLModel_28_kernel60(const int32_T c1_dv, int16_T
  c1_ii_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel61(const int16_T c1_ii_data
  [6300], const int32_T c1_ii_size, int8_T c1_obj_Data_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel62(const real32_T c1_dh_data
  [6300], const int32_T c1_dh_size, real_T c1_score_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel63(const real_T c1_score_data
  [6300], const int32_T c1_score_size, real_T c1_idx_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel64(const int8_T
  c1_obj_Data_data[6300], const int32_T c1_obj_Data_size, real_T c1_b_out_data
  [6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel65(const real32_T c1_dh_data
  [6300], const int32_T c1_i, real32_T c1_fv3_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel66(const real32_T c1_dh_data
  [6300], const int32_T c1_i, real32_T c1_fv4_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel67(const real32_T c1_dh_data
  [6300], const int32_T c1_i, real32_T c1_fv5_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel68(const real32_T c1_dh_data
  [6300], const int32_T c1_i, real32_T c1_fv6_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel69(const real_T c1_score_data
  [6300], const int32_T c1_score_size, real_T c1_b_out_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel70(const int32_T c1_dv, real_T
  c1_idx_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel71(const int8_T
  c1_obj_Data_data[6300], const real_T c1_idx_data[6300], const int32_T
  c1_loop_ub, real32_T c1_b_obj_Data_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel72(const real_T c1_score_data
  [6300], const int16_T c1_iv3_data[6300], const int32_T c1_loop_ub, real_T
  c1_idx_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel73(const int8_T
  c1_obj_Data_data[6300], const int16_T c1_iv3_data[6300], const int32_T
  c1_loop_ub, real_T c1_b_out_data[6300]);
static __global__ void c1_c1_ex_DLModel_28_kernel74(const c1_emxArray_real32_T
  c1_b_x, const c1_emxArray_real32_T c1_c_x_Data, const int32_T c1_b, const
  int32_T c1_stride, const int32_T c1_i, int16_T c1_ii_data[6300], real32_T
  c1_dh_data[6300]);
static __global__ void c1_dlnetwork_predict_kernel75(const real32_T
  c1_varargin_1_Data[921600], real32_T c1_inputDataT_0_f1[921600]);
static __global__ void c1_dlnetwork_predict_kernel76(const real32_T c1_in[691200],
  real32_T c1_outputDataAfterTranspose_f1[691200]);
static __global__ void c1_dlnetwork_predict_kernel77(const real32_T c1_in[172800],
  real32_T c1_outputDataAfterTranspose_f2[172800]);
static __global__ void c1_dlnetwork_predict_kernel78(const real32_T c1_in[43200],
  real32_T c1_outputDataAfterTranspose_f3[43200]);
static __global__ void c1_dlnetwork_predict_kernel79(const real32_T
  c1_outputDataAfterTranspose_f1[691200], real32_T c1_varargout_1_Data[691200]);
static __global__ void c1_dlnetwork_predict_kernel80(const real32_T
  c1_outputDataAfterTranspose_f2[172800], real32_T c1_varargout_2_Data[172800]);
static __global__ void c1_dlnetwork_predict_kernel81(const real32_T
  c1_outputDataAfterTranspose_f3[43200], real32_T c1_varargout_3_Data[43200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel82(const
  real32_T c1_varargin_1[1228800], real32_T c1_varargout_1[1228800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel83(const
  real32_T c1_varargin_1[614400], real32_T c1_varargout_1[614400]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel84(const
  real32_T c1_varargin_1[614400], real32_T c1_varargout_2[307200], real32_T
  c1_varargout_1[307200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel85(const
  real32_T c1_varargin_1[307200], real32_T c1_varargout_1[307200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel86(const
  real32_T c1_varargin_1[307200], real32_T c1_varargout_1[307200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel87(const
  real32_T c1_varargin_1[307200], real32_T c1_varargout_2[153600], real32_T
  c1_varargout_1[153600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel88(const
  real32_T c1_varargin_1[76800], real32_T c1_varargout_1[76800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel89(const
  real32_T c1_varargin_1[153600], real32_T c1_varargout_1[153600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel90(const
  real32_T c1_varargin_1[115200], real32_T c1_varargout_1[115200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel91(const
  real32_T c1_varargin_1[115200], real32_T c1_varargout_2[57600], real32_T
  c1_varargout_1[57600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel92(const
  real32_T c1_varargin_1[28800], real32_T c1_varargout_1[28800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel93(const
  real32_T c1_varargin_1[57600], real32_T c1_varargout_1[57600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel94(const
  real32_T c1_varargin_1[38400], real32_T c1_varargout_1[38400]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel95(const
  real32_T c1_varargin_1[38400], real32_T c1_varargout_2[19200], real32_T
  c1_varargout_1[19200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel96(const
  real32_T c1_varargin_1[9600], real32_T c1_varargout_1[9600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel97(const
  real32_T c1_varargin_1[19200], real32_T c1_varargout_1[19200]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel98(const
  real32_T c1_varargin_1[38400], const int8_T c1_xq[30], real32_T c1_out[76800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel99(const
  real32_T c1_out[76800], real32_T c1_in[76800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel100(const
  real32_T c1_in[76800], const int8_T c1_xq[40], real32_T c1_out[153600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel101(const
  real32_T c1_out[153600], real32_T c1_varargout_1[153600]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel102(const
  real32_T c1_varargin_1[115200], const int8_T c1_xq[60], real32_T c1_out[230400]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel103(const
  real32_T c1_out[230400], real32_T c1_in[230400]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel104(const
  real32_T c1_in[230400], const int8_T c1_xq[80], real32_T c1_out[460800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel105(const
  real32_T c1_out[460800], real32_T c1_varargout_1[460800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel106(const
  real32_T c1_varargin_1[384000], real32_T c1_varargout_1[384000]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel107(const
  real32_T c1_varargin_1[76800], real32_T c1_varargout_1[76800]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel108(const
  real32_T c1_varargin_1[96000], real32_T c1_varargout_1[96000]);
static __global__ void c1_dlnetwork_layerPredictWithColMajority_kernel109(const
  real32_T c1_varargin_1[24000], real32_T c1_varargout_1[24000]);
static __global__ void c1_conv2dCudaImplicitGemmColMajor_kernel110(real32_T
  c1_formattedWeights[16]);
static __global__ void c1_conv2dCudaImplicitGemmColMajor_kernel111(real32_T
  c1_formattedBias[4]);
static
#ifdef __CUDACC__

__device__
#endif

int32_T c1_div_nzp_s32_device(int32_T c1_numerator, int32_T c1_denominator,
  int32_T c1_EMLOvCount_src_loc, uint32_T c1_ssid_src_loc, int32_T
  c1_offset_src_loc, int32_T c1_length_src_loc);
static
#ifdef __CUDACC__

__device__
#endif

int64_T c1_computeEndIdx_device(int64_T c1_start, int64_T c1_end, int64_T
  c1_stride);
static
#ifdef __CUDACC__

__device__
#endif

int64_T c1_div_nzp_s64_device(int64_T c1_numerator, int64_T c1_denominator,
  int32_T c1_EMLOvCount_src_loc, uint32_T c1_ssid_src_loc, int32_T
  c1_offset_src_loc, int32_T c1_length_src_loc);
static void c1_a____gpu_emx_ensure_capacity__(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, void *c1_cpuVar, void *c1_gpuVar, boolean_T c1_needsCopy);
static void c1_a____gpu_emx_cpu_allocate_or_resize__
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, void *c1_cpuVar, boolean_T
   c1_needsCopy);
static void c1_a____gpu_emx_sync_to_cpu__(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, void *c1_cpuVar, void *c1_gpuVar);
static void c1_a____gpu_emx_sync_to_gpu__(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, void *c1_cpuVar, void *c1_gpuVar);
static void c1_a____gpu_emx_reset__(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, void *c1_gpuVar);
static void c1_a____gpu_emx_free__(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, void *c1_gpuVar);
static void c1_gpuEmxReset_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_gpu);
static void c1_gpuEmxReset_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu);
static void c1_gpuEmxEnsureCapacity_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const c1_emxArray_real_T *c1_cpu, c1_emxArray_real_T *c1_gpu,
  boolean_T c1_needsCopy);
static void c1_gpuEmxMemcpyCpuToGpu_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_gpu, const c1_emxArray_real_T *c1_cpu);
static void c1_gpuEmxEnsureCapacity_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const c1_emxArray_real32_T *c1_cpu, c1_emxArray_real32_T
  *c1_gpu, boolean_T c1_needsCopy);
static void c1_gpuEmxMemcpyCpuToGpu_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu, const c1_emxArray_real32_T
  *c1_cpu);
static void c1_cpuEmxAllocateOrResize_real32_T(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance, c1_emxArray_real32_T *c1_cpu, boolean_T c1_needsCopy);
static void c1_gpuEmxMemcpyGpuToCpu_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_cpu, c1_emxArray_real32_T *c1_gpu);
static void c1_gpuEmxFree_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu);
static void c1_gpuEmxFree_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T *c1_gpu);
static void c1_checkCleanupCudaError(cudaError_t c1_errCode, const char_T
  *c1_file, uint32_T c1_line);
static emlrtRTEInfo c1_createEmlrtInfoStruct(const char_T *c1_file, uint32_T
  c1_line);
static void c1_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c1_errorCode, const char_T *c1_errorName, const char_T
  *c1_errorString, const char_T *c1_file, int32_T c1_line);
static void c1_checkCudaError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c1_errorCode, const char_T *c1_file, int32_T c1_line);
static void c1_b_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c1_errorCode, const char_T *c1_errorName, const char_T
  *c1_errorString, const char_T *c1_file, int32_T c1_line);
static void c1_b_checkCudaError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c1_errorCode, const char_T *c1_file, int32_T c1_line);
static void c1_c_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const char_T *c1_file, int32_T c1_line);
static void init_dsm_address_info(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance);

/* Function Definitions */
static void c1_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint8_T c1_cpu_image[921600], real32_T c1_b_bboxes_data[], int32_T
  c1_bboxes_size[2], real32_T c1_b_scores_data[], int32_T c1_scores_size[2],
  real32_T c1_b_labelIds_data[], int32_T c1_labelIds_size[2])
{
  static int8_T c1_cpu_fv[6300] = { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
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
    8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
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

  static int8_T c1_sizes[6] = { 60, 30, 15, 80, 40, 20 };

  c1_emxArray_real32_T c1_b_gpu_x;
  c1_emxArray_real32_T c1_e_gpu_x_Data;
  c1_emxArray_real32_T c1_gpu_box;
  c1_emxArray_real32_T c1_gpu_pred_Data;
  c1_emxArray_real32_T *c1_b_cpu_x_Data;
  c1_emxArray_real32_T *c1_box;
  c1_emxArray_real32_T *c1_cpu_box;
  c1_emxArray_real32_T *c1_cpu_pred_Data;
  c1_emxArray_real32_T *c1_cpu_x;
  c1_emxArray_real32_T *c1_output;
  c1_emxArray_real32_T *c1_varargin_1;
  c1_emxArray_real_T c1_gpu_centers;
  c1_emxArray_real_T *c1_cpu_centers;
  dim3 c1_block;
  dim3 c1_grid;
  real_T c1_apnd;
  real_T c1_b1;
  real_T c1_b_apnd;
  real_T c1_b_b1;
  real_T c1_b_cdiff;
  real_T c1_cdiff;
  uint64_T c1_ab_numIters;
  uint64_T c1_b_numIters;
  uint64_T c1_bb_numIters;
  uint64_T c1_c_numIters;
  uint64_T c1_d_numIters;
  uint64_T c1_e_numIters;
  uint64_T c1_f_numIters;
  uint64_T c1_g_numIters;
  uint64_T c1_h_numIters;
  uint64_T c1_i_numIters;
  uint64_T c1_j_numIters;
  uint64_T c1_k_numIters;
  uint64_T c1_m_numIters;
  uint64_T c1_numIters;
  uint64_T c1_o_numIters;
  uint64_T c1_p_numIters;
  uint64_T c1_q_numIters;
  uint64_T c1_r_numIters;
  uint64_T c1_s_numIters;
  uint64_T c1_t_numIters;
  uint64_T c1_u_numIters;
  uint64_T c1_v_numIters;
  uint64_T c1_w_numIters;
  uint64_T c1_x_numIters;
  uint64_T c1_y_numIters;
  int32_T c1_b_i3[2];
  int32_T c1_inDims[2];
  int32_T c1_iv[2];
  int32_T c1_dh_size[1];
  int32_T c1_idx_size[1];
  int32_T c1_obj_Data_size[1];
  int32_T c1_out_size[1];
  int32_T c1_selectedIndex_size[1];
  int32_T c1_b_box_size_idx_0;
  int32_T c1_b_i2;
  int32_T c1_b_ii;
  int32_T c1_b_iy;
  int32_T c1_b_j;
  int32_T c1_b_k;
  int32_T c1_b_loop_ub;
  int32_T c1_b_ndbl;
  int32_T c1_b_nm1d2;
  int32_T c1_b_nx;
  int32_T c1_b_output_idx_0;
  int32_T c1_b_partialTrueCount;
  int32_T c1_b_sizes_idx_0;
  int32_T c1_b_trueCount;
  int32_T c1_box_size_idx_0;
  int32_T c1_c_box_size_idx_0;
  int32_T c1_c_i;
  int32_T c1_c_i3;
  int32_T c1_c_iy;
  int32_T c1_c_j;
  int32_T c1_c_k;
  int32_T c1_c_loop_ub;
  int32_T c1_c_nx;
  int32_T c1_c_output_idx_0;
  int32_T c1_c_sizes_idx_0;
  int32_T c1_currentIndex;
  int32_T c1_d;
  int32_T c1_d_i;
  int32_T c1_d_j;
  int32_T c1_d_k;
  int32_T c1_d_loop_ub;
  int32_T c1_d_nx;
  int32_T c1_d_sizes_idx_0;
  int32_T c1_e_i;
  int32_T c1_e_k;
  int32_T c1_e_loop_ub;
  int32_T c1_end;
  int32_T c1_f_i;
  int32_T c1_f_loop_ub;
  int32_T c1_g_i;
  int32_T c1_g_loop_ub;
  int32_T c1_h_i;
  int32_T c1_h_loop_ub;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i10;
  int32_T c1_i11;
  int32_T c1_i12;
  int32_T c1_i13;
  int32_T c1_i14;
  int32_T c1_i15;
  int32_T c1_i16;
  int32_T c1_i17;
  int32_T c1_i18;
  int32_T c1_i19;
  int32_T c1_i2;
  int32_T c1_i20;
  int32_T c1_i21;
  int32_T c1_i22;
  int32_T c1_i23;
  int32_T c1_i24;
  int32_T c1_i25;
  int32_T c1_i26;
  int32_T c1_i27;
  int32_T c1_i28;
  int32_T c1_i29;
  int32_T c1_i3;
  int32_T c1_i30;
  int32_T c1_i31;
  int32_T c1_i32;
  int32_T c1_i33;
  int32_T c1_i34;
  int32_T c1_i35;
  int32_T c1_i36;
  int32_T c1_i37;
  int32_T c1_i38;
  int32_T c1_i39;
  int32_T c1_i4;
  int32_T c1_i40;
  int32_T c1_i41;
  int32_T c1_i42;
  int32_T c1_i43;
  int32_T c1_i44;
  int32_T c1_i45;
  int32_T c1_i46;
  int32_T c1_i47;
  int32_T c1_i48;
  int32_T c1_i49;
  int32_T c1_i5;
  int32_T c1_i50;
  int32_T c1_i6;
  int32_T c1_i7;
  int32_T c1_i8;
  int32_T c1_i9;
  int32_T c1_idx;
  int32_T c1_index_size_idx_0;
  int32_T c1_initAuxVar;
  int32_T c1_iy;
  int32_T c1_j;
  int32_T c1_k;
  int32_T c1_loop_ub;
  int32_T c1_n;
  int32_T c1_ndbl;
  int32_T c1_nm1d2;
  int32_T c1_numCols;
  int32_T c1_nx;
  int32_T c1_output_idx_0;
  int32_T c1_partialTrueCount;
  int32_T c1_sortDim;
  int32_T c1_trueCount;
  real32_T c1_c_box_data[6300];
  real32_T c1_cpu_fv5_data[6300];
  real32_T c1_cpu_fv6_data[6300];
  int16_T c1_cpu_iv3_data[6300];
  int16_T c1_cpu_iv_data[6300];
  int16_T c1_iv_size[1];
  int16_T c1_sizes_idx_0;
  int8_T c1_b_input_sizes_idx_1;
  int8_T c1_c_input_sizes_idx_1;
  int8_T c1_input_sizes_idx_1;
  boolean_T c1_index_data[6300];
  boolean_T c1_selectedIndex_data[6300];
  boolean_T c1_b_intermediateResult_outdatedOnGpu;
  boolean_T c1_b_matrixToCat_outdatedOnCpu;
  boolean_T c1_box_data_outdatedOnGpu;
  boolean_T c1_box_outdatedOnCpu;
  boolean_T c1_box_outdatedOnGpu;
  boolean_T c1_dataArgs_f1_outdatedOnCpu;
  boolean_T c1_dh_data_outdatedOnGpu;
  boolean_T c1_empty_non_axis_sizes;
  boolean_T c1_exitg1;
  boolean_T c1_fv3_data_outdatedOnCpu;
  boolean_T c1_fv4_data_outdatedOnCpu;
  boolean_T c1_fv5_data_outdatedOnCpu;
  boolean_T c1_fv6_data_outdatedOnCpu;
  boolean_T c1_idx_data_outdatedOnCpu;
  boolean_T c1_intermediateResult_outdatedOnCpu;
  boolean_T c1_intermediateResult_outdatedOnGpu;
  boolean_T c1_iv3_data_outdatedOnGpu;
  boolean_T c1_iv_data_outdatedOnGpu;
  boolean_T c1_matrixToCat_outdatedOnCpu;
  boolean_T c1_maxVal_outdatedOnGpu;
  boolean_T c1_out_data_outdatedOnCpu;
  boolean_T c1_validLaunchParams;
  boolean_T c1_varargin_1_outdatedOnCpu;
  boolean_T c1_xdata_outdatedOnCpu;
  if (!chartInstance->c1_c1_ex_DLModel_28_constsCopied) {
    chartInstance->c1_c1_ex_DLModel_28_constsCopied = true;
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_global_gpu_fv,
      c1_cpu_fv, sizeof(int8_T [6300]), cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_gpuEmxReset_real_T(chartInstance, &c1_gpu_centers);
  c1_gpuEmxReset_real32_T(chartInstance, &c1_b_gpu_x);
  c1_gpuEmxReset_real32_T(chartInstance, &c1_gpu_box);
  c1_gpuEmxReset_real32_T(chartInstance, &c1_e_gpu_x_Data);
  c1_gpuEmxReset_real32_T(chartInstance, &c1_gpu_pred_Data);
  c1_iv3_data_outdatedOnGpu = false;
  c1_iv_data_outdatedOnGpu = false;
  c1_bboxes_size[0] = 0;
  c1_bboxes_size[1] = 4;
  c1_scores_size[0] = 0;
  c1_scores_size[1] = 1;
  c1_labelIds_size[0] = 0;
  c1_labelIds_size[1] = 1;
  if (!chartInstance->c1_det_not_empty) {
    c1_dlnetwork_setup(chartInstance, &chartInstance->c1_det);
    chartInstance->c1_det.matlabCodegenIsDeleted = false;
    chartInstance->c1_det_not_empty = true;
  }

  c1_c1_ex_DLModel_28_kernel1<<<dim3(8U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_aux1);
  c1_c1_ex_DLModel_28_kernel2<<<dim3(10U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_aux2);
  c1_c1_ex_DLModel_28_kernel3<<<dim3(8U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_aux1, *chartInstance->c1_gpu_ipRowIndices,
     *chartInstance->c1_gpu_rowWeights);
  c1_c1_ex_DLModel_28_kernel4<<<dim3(10U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_aux2, *chartInstance->c1_gpu_ipColIndices,
     *chartInstance->c1_gpu_colWeights);
  c1_c1_ex_DLModel_28_kernel5<<<dim3(4U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_rowWeights, *chartInstance->c1_gpu_rowWeightsTotal);
  c1_c1_ex_DLModel_28_kernel6<<<dim3(5U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_colWeights, *chartInstance->c1_gpu_colWeightsTotal);
  c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_image,
    c1_cpu_image, 921600ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  c1_c1_ex_DLModel_28_kernel7<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_rowWeightsTotal, *chartInstance->c1_gpu_rowWeights, *
     chartInstance->c1_gpu_image, *chartInstance->c1_gpu_ipRowIndices,
     *chartInstance->c1_gpu_partialResize);
  c1_c1_ex_DLModel_28_kernel8<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_colWeightsTotal, *chartInstance->c1_gpu_colWeights, *
     chartInstance->c1_gpu_partialResize, *chartInstance->c1_gpu_ipColIndices,
     *chartInstance->c1_gpu_out);
  c1_c1_ex_DLModel_28_kernel9<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_out, *chartInstance->c1_gpu_img);
  c1_c1_ex_DLModel_28_kernel10<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_img, *chartInstance->c1_gpu_partialResize);
  c1_c1_ex_DLModel_28_kernel11<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_partialResize, *chartInstance->c1_gpu_img);
  c1_c1_ex_DLModel_28_kernel12<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_img, *chartInstance->c1_gpu_expl_temp_Data);
  c1_dlnetwork_predict(chartInstance, &chartInstance->c1_det,
                       *chartInstance->c1_gpu_expl_temp_Data,
                       *chartInstance->c1_e_gpu_objX_Data,
                       *chartInstance->c1_d_gpu_objX_Data,
                       *chartInstance->c1_c_gpu_objX_Data);
  c1_c1_ex_DLModel_28_kernel13<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_e_gpu_objX_Data, *chartInstance->c1_d_gpu_objdata);
  c1_c1_ex_DLModel_28_kernel14<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_d_gpu_objX_Data, *chartInstance->c1_c_gpu_objdata);
  c1_c1_ex_DLModel_28_kernel15<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*chartInstance->c1_c_gpu_objX_Data, *chartInstance->c1_b_gpu_objdata);
  c1_intermediateResult_outdatedOnGpu = false;
  c1_iy = -1;
  c1_c1_ex_DLModel_28_kernel16<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_d_gpu_objdata, *chartInstance->c1_c_gpu_matrixToCat);
  c1_matrixToCat_outdatedOnCpu = true;
  for (c1_j = 0; c1_j < 691200; c1_j++) {
    c1_iy = c1_j;
    if (c1_matrixToCat_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy
                        (chartInstance->c1_cpu_matrixToCat,
                         *chartInstance->c1_c_gpu_matrixToCat, 2764800ULL,
                         cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    c1_matrixToCat_outdatedOnCpu = false;
    chartInstance->c1_cpu_intermediateResult[c1_j] =
      chartInstance->c1_cpu_matrixToCat[c1_j];
    c1_intermediateResult_outdatedOnGpu = true;
  }

  c1_c1_ex_DLModel_28_kernel17<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_c_gpu_objdata, *chartInstance->c1_b_gpu_matrixToCat);
  c1_b_matrixToCat_outdatedOnCpu = true;
  c1_initAuxVar = c1_iy;
  for (c1_b_j = 0; c1_b_j < 172800; c1_b_j++) {
    c1_iy = (c1_initAuxVar + c1_b_j) + 1;
    if (c1_b_matrixToCat_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy
                        (chartInstance->c1_b_cpu_matrixToCat,
                         *chartInstance->c1_b_gpu_matrixToCat, 691200ULL,
                         cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    c1_b_matrixToCat_outdatedOnCpu = false;
    chartInstance->c1_cpu_intermediateResult[c1_iy] =
      chartInstance->c1_b_cpu_matrixToCat[c1_b_j];
    c1_intermediateResult_outdatedOnGpu = true;
  }

  c1_c1_ex_DLModel_28_kernel18<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*chartInstance->c1_b_gpu_objdata, *chartInstance->c1_gpu_matrixToCat);
  if (c1_intermediateResult_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy
                      (*chartInstance->c1_b_gpu_intermediateResult,
                       chartInstance->c1_cpu_intermediateResult, 3628800ULL,
                       cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }

  c1_c1_ex_DLModel_28_kernel19<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_matrixToCat, c1_iy,
     *chartInstance->c1_b_gpu_intermediateResult);
  c1_c1_ex_DLModel_28_kernel20<<<dim3(1772U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_b_gpu_intermediateResult,
     *chartInstance->c1_b_gpu_out_Data);
  c1_c1_ex_DLModel_28_kernel21<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_b_gpu_out_Data, *chartInstance->c1_gpu_x);
  c1_c1_ex_DLModel_28_kernel22<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_splitout2_Data, *chartInstance->c1_gpu_x);
  c1_c1_ex_DLModel_28_kernel23<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_b_gpu_out_Data, *chartInstance->c1_b_gpu_objX_Data);
  c1_c1_ex_DLModel_28_kernel24<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c1_b_gpu_offsetOfLevel);
  c1_ReduceNonFirstDimLargeFirstDimKernel<<<dim3(788U, 1U, 1U), dim3(128U, 1U,
    1U)>>>(*chartInstance->c1_b_gpu_objX_Data, *chartInstance->c1_gpu_maxVal,
           6300U, 16U, 0U, *chartInstance->c1_b_gpu_offsetOfLevel, 0U, true);
  c1_c1_ex_DLModel_28_kernel25<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_maxVal, *chartInstance->c1_b_gpu_objX_Data,
     *chartInstance->c1_d_gpu_xdata);
  c1_c1_ex_DLModel_28_kernel26<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_d_gpu_xdata);
  c1_c1_ex_DLModel_28_kernel27<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_offsetOfLevel);
  c1_b_ReduceNonFirstDimLargeFirstDimKernel<<<dim3(788U, 1U, 1U), dim3(128U, 1U,
    1U)>>>(*chartInstance->c1_d_gpu_xdata, *chartInstance->c1_gpu_maxVal, 6300U,
           16U, 0U, *chartInstance->c1_gpu_offsetOfLevel, 0U, true);
  c1_c1_ex_DLModel_28_kernel28<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_maxVal, *chartInstance->c1_d_gpu_xdata,
     *chartInstance->c1_gpu_obj_Data);
  c1_c1_ex_DLModel_28_kernel29<<<dim3(788U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_obj_Data, *chartInstance->c1_d_gpu_xdata);
  c1_conv2dCudaImplicitGemmColMajor(chartInstance,
    *chartInstance->c1_d_gpu_xdata, *chartInstance->c1_gpu_objX_Data);
  c1_c1_ex_DLModel_28_kernel30<<<dim3(99U, 1U, 1U), dim3(256U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_objX_Data, *chartInstance->c1_gpu_splitoutFc,
     *chartInstance->c1_gpu_maxVal);
  c1_c1_ex_DLModel_28_kernel31<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_centersArray);
  c1_currentIndex = 0;
  c1_emxInit_real_T(chartInstance, &c1_cpu_centers, 2);
  for (c1_i = 0; c1_i < 3; c1_i++) {
    c1_numCols = c1_sizes[c1_i + 3];
    c1_ndbl = static_cast<int32_T>(muDoubleScalarFloor(((static_cast<real_T>
      (c1_sizes[c1_i]) - 0.5) - 0.5) + 0.5));
    c1_apnd = static_cast<real_T>(c1_ndbl) + 0.5;
    c1_cdiff = (static_cast<real_T>(c1_ndbl) + 0.5) - (static_cast<real_T>
      (c1_sizes[c1_i]) - 0.5);
    if (muDoubleScalarAbs(c1_cdiff) < 4.4408920985006262E-16 *
        (static_cast<real_T>(c1_sizes[c1_i]) - 0.5)) {
      c1_ndbl++;
      c1_b1 = static_cast<real_T>(c1_sizes[c1_i]) - 0.5;
    } else if (c1_cdiff > 0.0) {
      c1_b1 = (static_cast<real_T>(c1_ndbl) - 1.0) + 0.5;
    } else {
      c1_ndbl++;
      c1_b1 = c1_apnd;
    }

    c1_c1_ex_DLModel_28_kernel32<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c1_c_gpu_y_data);
    c1_c1_ex_DLModel_28_kernel33<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(c1_b1,
      c1_ndbl, *chartInstance->c1_c_gpu_y_data);
    c1_nm1d2 = (c1_ndbl - 1) >> 1;
    c1_numIters = c1_computeNumIters(chartInstance, c1_nm1d2 - 2);
    mwGetLaunchParameters1D(c1_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel34<<<c1_grid, c1_block>>>(c1_b1, c1_ndbl,
        c1_nm1d2 - 2, *chartInstance->c1_c_gpu_y_data);
    }

    if (c1_nm1d2 << 1 == c1_ndbl - 1) {
      c1_c1_ex_DLModel_28_kernel35<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (c1_b1, c1_nm1d2, *chartInstance->c1_c_gpu_y_data);
    } else {
      c1_c1_ex_DLModel_28_kernel45<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (c1_b1, c1_nm1d2, *chartInstance->c1_c_gpu_y_data);
    }

    c1_b_ndbl = static_cast<int32_T>(muDoubleScalarFloor(((static_cast<real_T>
      (c1_sizes[c1_i + 3]) - 0.5) - 0.5) + 0.5));
    c1_b_apnd = static_cast<real_T>(c1_b_ndbl) + 0.5;
    c1_b_cdiff = (static_cast<real_T>(c1_b_ndbl) + 0.5) - (static_cast<real_T>
      (c1_numCols) - 0.5);
    if (muDoubleScalarAbs(c1_b_cdiff) < 4.4408920985006262E-16 *
        (static_cast<real_T>(c1_sizes[c1_i + 3]) - 0.5)) {
      c1_b_ndbl++;
      c1_b_b1 = static_cast<real_T>(c1_numCols) - 0.5;
    } else if (c1_b_cdiff > 0.0) {
      c1_b_b1 = (static_cast<real_T>(c1_b_ndbl) - 1.0) + 0.5;
    } else {
      c1_b_ndbl++;
      c1_b_b1 = c1_b_apnd;
    }

    c1_c1_ex_DLModel_28_kernel36<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c1_b_gpu_y_data);
    c1_c1_ex_DLModel_28_kernel37<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (c1_b_b1, c1_b_ndbl, *chartInstance->c1_b_gpu_y_data);
    c1_b_nm1d2 = (c1_b_ndbl - 1) >> 1;
    c1_b_numIters = c1_computeNumIters(chartInstance, c1_b_nm1d2 - 2);
    mwGetLaunchParameters1D(c1_b_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel38<<<c1_grid, c1_block>>>(c1_b_b1, c1_b_ndbl,
        c1_b_nm1d2 - 2, *chartInstance->c1_b_gpu_y_data);
    }

    if (c1_b_nm1d2 << 1 == c1_b_ndbl - 1) {
      c1_c1_ex_DLModel_28_kernel39<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (c1_b_b1, c1_b_nm1d2, *chartInstance->c1_b_gpu_y_data);
    } else {
      c1_c1_ex_DLModel_28_kernel44<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (c1_b_b1, c1_b_nm1d2, *chartInstance->c1_b_gpu_y_data);
    }

    c1_c_numIters = c1_b_computeNumIters(chartInstance, c1_ndbl - 1, c1_b_ndbl -
      1);
    mwGetLaunchParameters1D(c1_c_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel40<<<c1_grid, c1_block>>>
        (*chartInstance->c1_b_gpu_y_data, c1_b_ndbl,
         *chartInstance->c1_c_gpu_y_data, c1_b_ndbl, c1_b_ndbl - 1, c1_ndbl - 1,
         *chartInstance->c1_gpu_Y_data, *chartInstance->c1_gpu_X_data);
    }

    c1_cpu_centers->size[0] = c1_b_ndbl * c1_ndbl;
    c1_cpu_centers->size[1] = 2;
    c1_loop_ub = c1_b_ndbl * c1_ndbl - 1;
    c1_e_numIters = c1_computeNumIters(chartInstance, c1_loop_ub);
    mwGetLaunchParameters1D(c1_e_numIters, &c1_grid, &c1_block, 65535U);
    c1_gpuEmxEnsureCapacity_real_T(chartInstance, c1_cpu_centers,
      &c1_gpu_centers, true);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel41<<<c1_grid, c1_block>>>
        (*chartInstance->c1_gpu_Y_data, c1_loop_ub, c1_gpu_centers);
    }

    c1_b_loop_ub = c1_b_ndbl * c1_ndbl - 1;
    c1_f_numIters = c1_computeNumIters(chartInstance, c1_b_loop_ub);
    mwGetLaunchParameters1D(c1_f_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel42<<<c1_grid, c1_block>>>
        (*chartInstance->c1_gpu_X_data, c1_b_loop_ub, c1_gpu_centers,
         c1_cpu_centers->size[0U]);
    }

    c1_d = c1_currentIndex + c1_cpu_centers->size[0];
    if (c1_currentIndex + 1 > c1_d) {
      c1_i2 = 0;
      c1_i3 = 0;
    } else {
      c1_i2 = c1_currentIndex;
      c1_i3 = c1_d;
    }

    c1_b_i3[0] = c1_i3 - c1_i2;
    c1_h_numIters = c1_b_computeNumIters(chartInstance, 1, c1_b_i3[0] - 1);
    mwGetLaunchParameters1D(c1_h_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel43<<<c1_grid, c1_block>>>(c1_gpu_centers, c1_i2,
        c1_b_i3[0] - 1, *chartInstance->c1_gpu_centersArray,
        c1_cpu_centers->size[0U]);
    }

    c1_currentIndex += c1_cpu_centers->size[0];
  }

  c1_emxFree_real_T(chartInstance, &c1_cpu_centers);
  c1_c1_ex_DLModel_28_kernel46<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_centersArray, *chartInstance->c1_gpu_ConstantArray1);
  c1_c1_ex_DLModel_28_kernel47<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_splitoutFc, *chartInstance->c1_gpu_ConstantArray1,
     *chartInstance->c1_gpu_sub1);
  c1_c1_ex_DLModel_28_kernel48<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_sub1, *chartInstance->c1_gpu_ConstantArray1,
     *chartInstance->c1_gpu_varargin_1);
  c1_varargin_1_outdatedOnCpu = true;
  c1_maxVal_outdatedOnGpu = false;
  c1_b_iy = -1;
  for (c1_c_j = 0; c1_c_j < 12600; c1_c_j++) {
    c1_b_iy = c1_c_j;
    if (c1_varargin_1_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy
                        (chartInstance->c1_cpu_varargin_1,
                         *chartInstance->c1_gpu_varargin_1, 50400ULL,
                         cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    c1_varargin_1_outdatedOnCpu = false;
    chartInstance->c1_cpu_maxVal[c1_c_j] = chartInstance->
      c1_cpu_varargin_1[c1_c_j];
    c1_maxVal_outdatedOnGpu = true;
  }

  if (c1_maxVal_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_maxVal,
      chartInstance->c1_cpu_maxVal, 100800ULL, cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_c1_ex_DLModel_28_kernel49<<<dim3(99U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_ConstantArray1, c1_b_iy,
     *chartInstance->c1_gpu_maxVal);
  c1_c1_ex_DLModel_28_kernel50<<<dim3(99U, 1U, 1U), dim3(256U, 1U, 1U)>>>
    (*chartInstance->c1_global_gpu_fv, *chartInstance->c1_gpu_maxVal,
     *chartInstance->c1_gpu_dataArgs_f1);
  c1_dataArgs_f1_outdatedOnCpu = true;
  c1_b_intermediateResult_outdatedOnGpu = false;
  c1_c_iy = -1;
  for (c1_d_j = 0; c1_d_j < 25200; c1_d_j++) {
    c1_c_iy = c1_d_j;
    if (c1_dataArgs_f1_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy
                        (chartInstance->c1_cpu_dataArgs_f1,
                         *chartInstance->c1_gpu_dataArgs_f1, 100800ULL,
                         cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    }

    c1_dataArgs_f1_outdatedOnCpu = false;
    chartInstance->c1_b_cpu_intermediateResult[c1_d_j] =
      chartInstance->c1_cpu_dataArgs_f1[c1_d_j];
    c1_b_intermediateResult_outdatedOnGpu = true;
  }

  if (c1_b_intermediateResult_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy
                      (*chartInstance->c1_gpu_intermediateResult,
                       chartInstance->c1_b_cpu_intermediateResult, 2116800ULL,
                       cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }

  c1_c1_ex_DLModel_28_kernel51<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_splitout2_Data, c1_c_iy,
     *chartInstance->c1_gpu_intermediateResult);
  c1_intermediateResult_outdatedOnCpu = true;
  c1_c1_ex_DLModel_28_kernel52<<<dim3(50U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_processedVarargin_f1);
  c1_c1_ex_DLModel_28_kernel53<<<dim3(1U, 1U, 1U), dim3(96U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_processedVarargin_f2);
  c1_c1_ex_DLModel_28_kernel54<<<dim3(985U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_intermediateResult, *chartInstance->c1_c_gpu_x_Data);
  c1_c1_ex_DLModel_28_kernel55<<<dim3(50U, 1U, 1U), dim3(128U, 1U, 1U)>>>
    (*chartInstance->c1_gpu_intermediateResult,
     *chartInstance->c1_gpu_processedVarargin_f2,
     *chartInstance->c1_gpu_processedVarargin_f1,
     *chartInstance->c1_c_gpu_x_Data, *chartInstance->c1_b_gpu_xdata);
  c1_xdata_outdatedOnCpu = true;
  c1_trueCount = 0;
  for (c1_c_i = 0; c1_c_i < 6300; c1_c_i++) {
    if (c1_xdata_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(chartInstance->c1_cpu_xdata,
        *chartInstance->c1_b_gpu_xdata, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_xdata_outdatedOnCpu = false;
    if (chartInstance->c1_cpu_xdata[c1_c_i] > 0.25F) {
      c1_trueCount++;
    }
  }

  c1_iv_size[0] = static_cast<int16_T>(c1_trueCount);
  c1_partialTrueCount = 0;
  for (c1_d_i = 0; c1_d_i < 6300; c1_d_i++) {
    if (c1_xdata_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(chartInstance->c1_cpu_xdata,
        *chartInstance->c1_b_gpu_xdata, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_xdata_outdatedOnCpu = false;
    if (chartInstance->c1_cpu_xdata[c1_d_i] > 0.25F) {
      c1_cpu_iv_data[c1_partialTrueCount] = static_cast<int16_T>(c1_d_i);
      c1_iv_data_outdatedOnGpu = true;
      c1_partialTrueCount++;
    }
  }

  c1_emxInit_real32_T(chartInstance, &c1_cpu_pred_Data, 2);
  c1_cpu_pred_Data->size[0] = c1_trueCount;
  c1_cpu_pred_Data->size[1] = 84;
  c1_d_numIters = c1_b_computeNumIters(chartInstance, 83, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_d_numIters, &c1_grid, &c1_block, 65535U);
  c1_gpuEmxEnsureCapacity_real32_T(chartInstance, c1_cpu_pred_Data,
    &c1_gpu_pred_Data, true);
  if (c1_iv_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_iv_data,
      c1_cpu_iv_data, 12600ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel56<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_intermediateResult, *chartInstance->c1_gpu_iv_data,
       c1_trueCount - 1, c1_gpu_pred_Data, c1_cpu_pred_Data->size[0U]);
  }

  c1_emxInitStruct_dlarray_38(chartInstance, &c1_b_cpu_x_Data);
  c1_b_cpu_x_Data->size[0] = c1_trueCount;
  c1_b_cpu_x_Data->size[1] = 80;
  c1_g_numIters = c1_b_computeNumIters(chartInstance, 79, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_g_numIters, &c1_grid, &c1_block, 65535U);
  c1_gpuEmxEnsureCapacity_real32_T(chartInstance, c1_b_cpu_x_Data,
    &c1_e_gpu_x_Data, true);
  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel57<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_intermediateResult, *chartInstance->c1_gpu_iv_data,
       c1_trueCount - 1, c1_e_gpu_x_Data, c1_b_cpu_x_Data->size[0U]);
  }

  c1_emxInit_real32_T(chartInstance, &c1_cpu_box, 2);
  c1_box_outdatedOnGpu = false;
  c1_e_i = c1_cpu_box->size[0] * c1_cpu_box->size[1];
  c1_cpu_box->size[0] = c1_trueCount;
  c1_cpu_box->size[1] = 4;
  c1_emxEnsureCapacity_real32_T(chartInstance, c1_cpu_box, c1_e_i);
  for (c1_i1 = 0; c1_i1 < 4; c1_i1++) {
    c1_c_loop_ub = c1_trueCount;
    for (c1_c_i3 = 0; c1_c_i3 < c1_c_loop_ub; c1_c_i3++) {
      if (c1_intermediateResult_outdatedOnCpu) {
        c1_checkCudaError(chartInstance, cudaMemcpy
                          (chartInstance->c1_b_cpu_intermediateResult,
                           *chartInstance->c1_gpu_intermediateResult, 2116800ULL,
                           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      c1_intermediateResult_outdatedOnCpu = false;
      c1_cpu_box->data[c1_c_i3 + c1_cpu_box->size[0] * c1_i1] =
        chartInstance->c1_b_cpu_intermediateResult[c1_cpu_iv_data[c1_c_i3] +
        6300 * c1_i1];
      c1_box_outdatedOnGpu = true;
    }
  }

  c1_box_data_outdatedOnGpu = false;
  for (c1_b_i2 = 0; c1_b_i2 < c1_iv_size[0]; c1_b_i2++) {
    chartInstance->c1_cpu_box_data[c1_b_i2] = c1_cpu_box->data[c1_b_i2] -
      c1_cpu_box->data[c1_b_i2 + (c1_cpu_box->size[0] << 1)] / 2.0F;
    c1_box_data_outdatedOnGpu = true;
  }

  c1_i_numIters = c1_computeNumIters(chartInstance, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_i_numIters, &c1_grid, &c1_block, 65535U);
  c1_gpuEmxEnsureCapacity_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box,
    !c1_box_outdatedOnGpu);
  if (c1_box_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_box_data,
      chartInstance->c1_cpu_box_data, 25200ULL, cudaMemcpyHostToDevice),
                      __FILE__, __LINE__);
  }

  if (c1_box_outdatedOnGpu) {
    c1_gpuEmxMemcpyCpuToGpu_real32_T(chartInstance, &c1_gpu_box, c1_cpu_box);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel58<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_box_data, c1_trueCount - 1, c1_gpu_box);
  }

  c1_box_outdatedOnCpu = true;
  c1_box_size_idx_0 = c1_cpu_box->size[0];
  for (c1_i4 = 0; c1_i4 < c1_cpu_box->size[0]; c1_i4++) {
    if (c1_box_outdatedOnCpu) {
      c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box);
    }

    c1_box_outdatedOnCpu = false;
    chartInstance->c1_box_data[c1_i4] = c1_cpu_box->data[c1_i4 +
      c1_cpu_box->size[0]] - c1_cpu_box->data[c1_i4 + c1_cpu_box->size[0] * 3] /
      2.0F;
  }

  for (c1_i5 = 0; c1_i5 < c1_box_size_idx_0; c1_i5++) {
    if (c1_box_outdatedOnCpu) {
      c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box);
    }

    c1_cpu_box->data[c1_i5 + c1_cpu_box->size[0]] = chartInstance->
      c1_box_data[c1_i5];
    c1_box_outdatedOnCpu = false;
  }

  c1_nx = c1_cpu_box->size[0] << 2;
  for (c1_k = 0; c1_k < c1_nx; c1_k++) {
    if (c1_box_outdatedOnCpu) {
      c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box);
    }

    c1_cpu_box->data[c1_k] = muSingleScalarFloor(c1_cpu_box->data[c1_k]);
    c1_box_outdatedOnCpu = false;
  }

  c1_end = c1_cpu_box->size[0] << 2;
  for (c1_f_i = 0; c1_f_i < c1_end; c1_f_i++) {
    if (c1_box_outdatedOnCpu) {
      c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box);
    }

    c1_box_outdatedOnCpu = false;
    if (c1_cpu_box->data[c1_f_i] < 1.0F) {
      c1_cpu_box->data[static_cast<int16_T>(c1_f_i)] = 1.0F;
    }
  }

  c1_emxInit_real32_T(chartInstance, &c1_cpu_x, 2);
  c1_cpu_x->size[0] = c1_trueCount;
  c1_cpu_x->size[1] = 80;
  c1_j_numIters = c1_b_computeNumIters(chartInstance, 79, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_j_numIters, &c1_grid, &c1_block, 65535U);
  c1_gpuEmxEnsureCapacity_real32_T(chartInstance, c1_cpu_x, &c1_b_gpu_x, true);
  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel59<<<c1_grid, c1_block>>>(c1_gpu_pred_Data,
      c1_trueCount - 1, c1_b_gpu_x, c1_cpu_x->size[0U], c1_cpu_pred_Data->size
      [0U]);
  }

  c1_emxFree_real32_T(chartInstance, &c1_cpu_pred_Data);
  c1_dh_size[0] = c1_trueCount;
  c1_k_numIters = c1_computeNumIters(chartInstance, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_k_numIters, &c1_grid, &c1_block, 65535U);
  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel60<<<c1_grid, c1_block>>>(c1_trueCount - 1,
      *chartInstance->c1_gpu_ii_data);
  }

  if (c1_trueCount == 0) {
    c1_dh_data_outdatedOnGpu = false;
    c1_dh_size[0] = 0;
  } else {
    c1_m_numIters = c1_computeNumIters(chartInstance, c1_trueCount - 1);
    mwGetLaunchParameters1D(c1_m_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel74<<<c1_grid, c1_block>>>(c1_b_gpu_x,
        c1_e_gpu_x_Data, c1_trueCount * 79, c1_trueCount, c1_trueCount - 1,
        *chartInstance->c1_gpu_ii_data, *chartInstance->c1_gpu_dh_data);
    }

    c1_dh_data_outdatedOnGpu = false;
  }

  c1_emxFree_real32_T(chartInstance, &c1_cpu_x);
  c1_emxFreeStruct_dlarray_38(chartInstance, &c1_b_cpu_x_Data);
  c1_o_numIters = c1_computeNumIters(chartInstance, c1_trueCount - 1);
  mwGetLaunchParameters1D(c1_o_numIters, &c1_grid, &c1_block, 65535U);
  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel61<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_ii_data, c1_trueCount - 1,
       *chartInstance->c1_b_gpu_obj_Data_data);
  }

  c1_p_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
  mwGetLaunchParameters1D(c1_p_numIters, &c1_grid, &c1_block, 65535U);
  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel62<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_dh_data, c1_dh_size[0] - 1,
       *chartInstance->c1_gpu_score_data);
  }

  c1_emxInit_real32_T(chartInstance, &c1_varargin_1, 2);
  if (c1_cpu_box->size[0] == 0) {
    c1_i6 = c1_varargin_1->size[0] * c1_varargin_1->size[1];
    c1_varargin_1->size[0] = c1_cpu_box->size[0];
    c1_varargin_1->size[1] = 4;
    c1_emxEnsureCapacity_real32_T(chartInstance, c1_varargin_1, c1_i6);
    for (c1_i7 = 0; c1_i7 < (c1_cpu_box->size[0] << 2); c1_i7++) {
      if (c1_box_outdatedOnCpu) {
        c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box, &c1_gpu_box);
      }

      c1_box_outdatedOnCpu = false;
      c1_varargin_1->data[c1_i7] = c1_cpu_box->data[c1_i7];
    }

    c1_idx_size[0] = c1_dh_size[0];
    c1_q_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
    mwGetLaunchParameters1D(c1_q_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel63<<<c1_grid, c1_block>>>
        (*chartInstance->c1_gpu_score_data, c1_dh_size[0] - 1,
         *chartInstance->c1_gpu_idx_data);
    }

    c1_idx_data_outdatedOnCpu = true;
    c1_out_size[0] = c1_trueCount;
    c1_u_numIters = c1_computeNumIters(chartInstance, c1_trueCount - 1);
    mwGetLaunchParameters1D(c1_u_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel64<<<c1_grid, c1_block>>>
        (*chartInstance->c1_b_gpu_obj_Data_data, c1_trueCount - 1,
         *chartInstance->c1_gpu_out_data);
    }

    c1_out_data_outdatedOnCpu = true;
  } else {
    c1_idx_data_outdatedOnCpu = false;
    c1_idx_size[0] = c1_dh_size[0];
    if (c1_dh_size[0] != 0) {
      c1_sortDim = 2;
      if (c1_dh_size[0] != 1) {
        c1_sortDim = 1;
      }

      c1_inDims[0] = c1_dh_size[0];
      c1_inDims[1] = 1;
      c1_r_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
      mwGetLaunchParameters1D(c1_r_numIters, &c1_grid, &c1_block, 65535U);
      c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
      if (c1_validLaunchParams) {
        c1_c1_ex_DLModel_28_kernel69<<<c1_grid, c1_block>>>
          (*chartInstance->c1_gpu_score_data, c1_dh_size[0] - 1,
           *chartInstance->c1_gpu_out_data);
      }

      c1_idx_size[0] = c1_dh_size[0];
      c1_t_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
      mwGetLaunchParameters1D(c1_t_numIters, &c1_grid, &c1_block, 65535U);
      c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
      if (c1_validLaunchParams) {
        c1_c1_ex_DLModel_28_kernel70<<<c1_grid, c1_block>>>(c1_dh_size[0] - 1,
          *chartInstance->c1_gpu_idx_data);
      }

      gpu_sort_with_index(&(*chartInstance->c1_gpu_out_data)[0],
                          &(*chartInstance->c1_gpu_idx_data)[0], 2.0,
                          &c1_inDims[0], c1_sortDim, false, false);
      c1_idx_data_outdatedOnCpu = true;
    }

    c1_emxInit_real32_T(chartInstance, &c1_box, 2);
    c1_i8 = c1_box->size[0] * c1_box->size[1];
    c1_box->size[0] = c1_idx_size[0];
    c1_box->size[1] = 4;
    c1_emxEnsureCapacity_real32_T(chartInstance, c1_box, c1_i8);
    for (c1_i9 = 0; c1_i9 < 4; c1_i9++) {
      c1_d_loop_ub = c1_idx_size[0];
      for (c1_i10 = 0; c1_i10 < c1_d_loop_ub; c1_i10++) {
        if (c1_box_outdatedOnCpu) {
          c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box,
            &c1_gpu_box);
        }

        c1_box_outdatedOnCpu = false;
        if (c1_idx_data_outdatedOnCpu) {
          c1_checkCudaError(chartInstance, cudaMemcpy
                            (chartInstance->c1_cpu_idx_data,
                             *chartInstance->c1_gpu_idx_data, 50400ULL,
                             cudaMemcpyDeviceToHost), __FILE__, __LINE__);
        }

        c1_idx_data_outdatedOnCpu = false;
        c1_box->data[c1_i10 + c1_box->size[0] * c1_i9] = c1_cpu_box->data[(
          static_cast<int32_T>(chartInstance->c1_cpu_idx_data[c1_i10]) +
          c1_cpu_box->size[0] * c1_i9) - 1];
      }
    }

    c1_obj_Data_size[0] = c1_idx_size[0];
    c1_s_numIters = c1_computeNumIters(chartInstance, c1_idx_size[0] - 1);
    mwGetLaunchParameters1D(c1_s_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel71<<<c1_grid, c1_block>>>
        (*chartInstance->c1_b_gpu_obj_Data_data, *chartInstance->c1_gpu_idx_data,
         c1_idx_size[0] - 1, *chartInstance->c1_gpu_obj_Data_data);
    }

    c1_checkCudaError(chartInstance, cudaMemcpy
                      (chartInstance->c1_cpu_obj_Data_data,
                       *chartInstance->c1_gpu_obj_Data_data, 25200ULL,
                       cudaMemcpyDeviceToHost), __FILE__, __LINE__);
    c1_selectStrongestBboxCodegen(chartInstance, c1_box,
      chartInstance->c1_cpu_obj_Data_data, c1_obj_Data_size,
      c1_selectedIndex_data, c1_selectedIndex_size);
    c1_emxFree_real32_T(chartInstance, &c1_box);
    c1_index_size_idx_0 = c1_selectedIndex_size[0];
    c1_e_loop_ub = c1_selectedIndex_size[0];
    for (c1_i11 = 0; c1_i11 < c1_e_loop_ub; c1_i11++) {
      if (c1_idx_data_outdatedOnCpu) {
        c1_checkCudaError(chartInstance, cudaMemcpy
                          (chartInstance->c1_cpu_idx_data,
                           *chartInstance->c1_gpu_idx_data, 50400ULL,
                           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      c1_idx_data_outdatedOnCpu = false;
      c1_index_data[static_cast<int32_T>(chartInstance->c1_cpu_idx_data[c1_i11])
        - 1] = c1_selectedIndex_data[c1_i11];
    }

    c1_b_trueCount = 0;
    for (c1_g_i = 0; c1_g_i < c1_index_size_idx_0; c1_g_i++) {
      if (c1_index_data[c1_g_i]) {
        c1_b_trueCount++;
      }
    }

    c1_b_partialTrueCount = 0;
    for (c1_h_i = 0; c1_h_i < c1_index_size_idx_0; c1_h_i++) {
      if (c1_index_data[c1_h_i]) {
        c1_cpu_iv3_data[c1_b_partialTrueCount] = static_cast<int16_T>(c1_h_i);
        c1_iv3_data_outdatedOnGpu = true;
        c1_b_partialTrueCount++;
      }
    }

    c1_i12 = c1_varargin_1->size[0] * c1_varargin_1->size[1];
    c1_varargin_1->size[0] = c1_b_trueCount;
    c1_varargin_1->size[1] = 4;
    c1_emxEnsureCapacity_real32_T(chartInstance, c1_varargin_1, c1_i12);
    for (c1_i13 = 0; c1_i13 < 4; c1_i13++) {
      for (c1_i14 = 0; c1_i14 < c1_b_trueCount; c1_i14++) {
        if (c1_box_outdatedOnCpu) {
          c1_gpuEmxMemcpyGpuToCpu_real32_T(chartInstance, c1_cpu_box,
            &c1_gpu_box);
        }

        c1_box_outdatedOnCpu = false;
        c1_varargin_1->data[c1_i14 + c1_varargin_1->size[0] * c1_i13] =
          c1_cpu_box->data[c1_cpu_iv3_data[c1_i14] + c1_cpu_box->size[0] *
          c1_i13];
      }
    }

    c1_idx_size[0] = c1_b_trueCount;
    c1_v_numIters = c1_computeNumIters(chartInstance, c1_b_trueCount - 1);
    mwGetLaunchParameters1D(c1_v_numIters, &c1_grid, &c1_block, 65535U);
    if (c1_iv3_data_outdatedOnGpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy
                        (*chartInstance->c1_gpu_iv3_data, c1_cpu_iv3_data,
                         12600ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
    }

    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel72<<<c1_grid, c1_block>>>
        (*chartInstance->c1_gpu_score_data, *chartInstance->c1_gpu_iv3_data,
         c1_b_trueCount - 1, *chartInstance->c1_gpu_idx_data);
    }

    c1_idx_data_outdatedOnCpu = true;
    c1_out_size[0] = c1_b_trueCount;
    c1_w_numIters = c1_computeNumIters(chartInstance, c1_b_trueCount - 1);
    mwGetLaunchParameters1D(c1_w_numIters, &c1_grid, &c1_block, 65535U);
    c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
    if (c1_validLaunchParams) {
      c1_c1_ex_DLModel_28_kernel73<<<c1_grid, c1_block>>>
        (*chartInstance->c1_b_gpu_obj_Data_data, *chartInstance->c1_gpu_iv3_data,
         c1_b_trueCount - 1, *chartInstance->c1_gpu_out_data);
    }

    c1_out_data_outdatedOnCpu = true;
    c1_idx = 0;
    c1_b_ii = 1;
    c1_exitg1 = false;
    while ((!c1_exitg1) && (c1_b_ii <= c1_index_size_idx_0)) {
      if (c1_index_data[c1_b_ii - 1]) {
        c1_idx++;
        if (c1_idx >= c1_index_size_idx_0) {
          c1_exitg1 = true;
        } else {
          c1_b_ii++;
        }
      } else {
        c1_b_ii++;
      }
    }

    if (c1_selectedIndex_size[0] != 1) {
      c1_iv[0] = 1;
      if (c1_idx < 1) {
        c1_iv[1] = 0;
      } else {
        c1_iv[1] = c1_idx;
      }

      c1_indexShapeCheck(chartInstance, c1_selectedIndex_size[0], c1_iv);
    }
  }

  if (c1_varargin_1->size[0] != 0) {
    c1_sizes_idx_0 = static_cast<int16_T>(c1_varargin_1->size[0]);
  } else if (c1_idx_size[0] != 0) {
    c1_sizes_idx_0 = static_cast<int16_T>(c1_idx_size[0]);
  } else if (c1_out_size[0] != 0) {
    c1_sizes_idx_0 = static_cast<int16_T>(c1_out_size[0]);
  } else {
    c1_sizes_idx_0 = 0;
  }

  c1_empty_non_axis_sizes = (c1_sizes_idx_0 == 0);
  if (c1_empty_non_axis_sizes || (c1_varargin_1->size[0] != 0)) {
    c1_input_sizes_idx_1 = 4;
  } else {
    c1_input_sizes_idx_1 = 0;
  }

  if (c1_empty_non_axis_sizes || (c1_idx_size[0] != 0)) {
    c1_b_input_sizes_idx_1 = 1;
  } else {
    c1_b_input_sizes_idx_1 = 0;
  }

  if (c1_empty_non_axis_sizes || (c1_out_size[0] != 0)) {
    c1_c_input_sizes_idx_1 = 1;
  } else {
    c1_c_input_sizes_idx_1 = 0;
  }

  c1_b_sizes_idx_0 = c1_sizes_idx_0;
  c1_c_sizes_idx_0 = c1_sizes_idx_0;
  c1_d_sizes_idx_0 = c1_sizes_idx_0;
  c1_emxInit_real32_T(chartInstance, &c1_output, 2);
  c1_i15 = c1_output->size[0] * c1_output->size[1];
  c1_output->size[0] = c1_sizes_idx_0;
  c1_output->size[1] = (c1_input_sizes_idx_1 + c1_b_input_sizes_idx_1) +
    c1_c_input_sizes_idx_1;
  c1_emxEnsureCapacity_real32_T(chartInstance, c1_output, c1_i15);
  c1_f_loop_ub = c1_input_sizes_idx_1;
  for (c1_i16 = 0; c1_i16 < c1_f_loop_ub; c1_i16++) {
    for (c1_i17 = 0; c1_i17 < c1_b_sizes_idx_0; c1_i17++) {
      c1_output->data[c1_i17 + c1_output->size[0] * c1_i16] =
        c1_varargin_1->data[c1_i17 + c1_sizes_idx_0 * c1_i16];
    }
  }

  c1_emxFree_real32_T(chartInstance, &c1_varargin_1);
  c1_g_loop_ub = c1_b_input_sizes_idx_1;
  for (c1_i18 = 0; c1_i18 < c1_g_loop_ub; c1_i18++) {
    for (c1_i19 = 0; c1_i19 < c1_c_sizes_idx_0; c1_i19++) {
      if (c1_idx_data_outdatedOnCpu) {
        c1_checkCudaError(chartInstance, cudaMemcpy
                          (chartInstance->c1_cpu_idx_data,
                           *chartInstance->c1_gpu_idx_data, 50400ULL,
                           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      c1_idx_data_outdatedOnCpu = false;
      c1_output->data[c1_i19 + c1_output->size[0] * c1_input_sizes_idx_1] =
        static_cast<real32_T>(chartInstance->c1_cpu_idx_data[c1_i19]);
    }
  }

  c1_h_loop_ub = c1_c_input_sizes_idx_1;
  for (c1_i20 = 0; c1_i20 < c1_h_loop_ub; c1_i20++) {
    for (c1_i22 = 0; c1_i22 < c1_d_sizes_idx_0; c1_i22++) {
      if (c1_out_data_outdatedOnCpu) {
        c1_checkCudaError(chartInstance, cudaMemcpy
                          (chartInstance->c1_cpu_out_data,
                           *chartInstance->c1_gpu_out_data, 50400ULL,
                           cudaMemcpyDeviceToHost), __FILE__, __LINE__);
      }

      c1_out_data_outdatedOnCpu = false;
      c1_output->data[c1_i22 + c1_output->size[0] * (c1_input_sizes_idx_1 +
        c1_b_input_sizes_idx_1)] = static_cast<real32_T>
        (chartInstance->c1_cpu_out_data[c1_i22]);
    }
  }

  c1_i21 = c1_cpu_box->size[0] * c1_cpu_box->size[1];
  c1_cpu_box->size[0] = c1_output->size[0];
  c1_cpu_box->size[1] = 4;
  c1_emxEnsureCapacity_real32_T(chartInstance, c1_cpu_box, c1_i21);
  for (c1_i23 = 0; c1_i23 < 4; c1_i23++) {
    for (c1_i25 = 0; c1_i25 < c1_output->size[0]; c1_i25++) {
      c1_cpu_box->data[c1_i25 + c1_cpu_box->size[0] * c1_i23] = c1_output->
        data[c1_i25 + c1_output->size[0] * c1_i23];
    }
  }

  for (c1_i24 = 0; c1_i24 < c1_output->size[0]; c1_i24++) {
    c1_cpu_box->data[c1_i24 + (c1_cpu_box->size[0] << 1)] = (c1_output->
      data[c1_i24] + c1_output->data[c1_i24 + (c1_output->size[0] << 1)]) - 1.0F;
  }

  if (c1_cpu_box->size[0] == c1_output->size[0]) {
    c1_b_box_size_idx_0 = c1_cpu_box->size[0];
    for (c1_i26 = 0; c1_i26 < c1_cpu_box->size[0]; c1_i26++) {
      chartInstance->c1_b_box_data[c1_i26] = (c1_cpu_box->data[c1_i26 +
        c1_cpu_box->size[0]] + c1_output->data[c1_i26 + c1_output->size[0] * 3])
        - 1.0F;
    }

    for (c1_i28 = 0; c1_i28 < c1_b_box_size_idx_0; c1_i28++) {
      c1_cpu_box->data[c1_i28 + c1_cpu_box->size[0] * 3] =
        chartInstance->c1_b_box_data[c1_i28];
    }
  } else {
    c1_binary_expand_op(chartInstance, c1_cpu_box, c1_output);
  }

  c1_output_idx_0 = c1_output->size[0];
  for (c1_i27 = 0; c1_i27 < 4; c1_i27++) {
    for (c1_i30 = 0; c1_i30 < c1_output_idx_0; c1_i30++) {
      c1_output->data[c1_i30 + c1_output->size[0] * c1_i27] = c1_cpu_box->
        data[c1_i30 + c1_cpu_box->size[0] * c1_i27];
    }
  }

  c1_i29 = c1_cpu_box->size[0] * c1_cpu_box->size[1];
  c1_cpu_box->size[0] = c1_output->size[0];
  c1_cpu_box->size[1] = 4;
  c1_emxEnsureCapacity_real32_T(chartInstance, c1_cpu_box, c1_i29);
  for (c1_i31 = 0; c1_i31 < 4; c1_i31++) {
    for (c1_i33 = 0; c1_i33 < c1_output->size[0]; c1_i33++) {
      c1_cpu_box->data[c1_i33 + c1_cpu_box->size[0] * c1_i31] = c1_output->
        data[c1_i33 + c1_output->size[0] * c1_i31];
    }
  }

  for (c1_i32 = 0; c1_i32 < c1_output->size[0]; c1_i32++) {
    c1_cpu_box->data[c1_i32] = c1_output->data[c1_i32];
  }

  c1_dh_size[0] = c1_cpu_box->size[0];
  for (c1_b_k = 0; c1_b_k < c1_cpu_box->size[0]; c1_b_k++) {
    chartInstance->c1_cpu_dh_data[c1_b_k] = muSingleScalarMin(c1_cpu_box->
      data[c1_b_k], 640.0F);
    c1_dh_data_outdatedOnGpu = true;
  }

  c1_x_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
  mwGetLaunchParameters1D(c1_x_numIters, &c1_grid, &c1_block, 65535U);
  if (c1_dh_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_dh_data,
      chartInstance->c1_cpu_dh_data, 25200ULL, cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel65<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_dh_data, c1_dh_size[0] - 1,
       *chartInstance->c1_gpu_fv3_data);
  }

  c1_fv3_data_outdatedOnCpu = true;
  for (c1_i34 = 0; c1_i34 < c1_cpu_box->size[0]; c1_i34++) {
    if (c1_fv3_data_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(chartInstance->c1_cpu_fv3_data,
        *chartInstance->c1_gpu_fv3_data, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_fv3_data_outdatedOnCpu = false;
    c1_cpu_box->data[c1_i34] = chartInstance->c1_cpu_fv3_data[c1_i34];
  }

  c1_dh_data_outdatedOnGpu = false;
  c1_dh_size[0] = c1_cpu_box->size[0];
  c1_b_nx = c1_cpu_box->size[0];
  for (c1_c_k = 0; c1_c_k < c1_b_nx; c1_c_k++) {
    chartInstance->c1_cpu_dh_data[c1_c_k] = muSingleScalarMin(c1_cpu_box->
      data[c1_c_k + (c1_cpu_box->size[0] << 1)], 640.0F);
    c1_dh_data_outdatedOnGpu = true;
  }

  c1_y_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
  mwGetLaunchParameters1D(c1_y_numIters, &c1_grid, &c1_block, 65535U);
  if (c1_dh_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_dh_data,
      chartInstance->c1_cpu_dh_data, 25200ULL, cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel66<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_dh_data, c1_dh_size[0] - 1,
       *chartInstance->c1_gpu_fv4_data);
  }

  c1_fv4_data_outdatedOnCpu = true;
  for (c1_i35 = 0; c1_i35 < c1_cpu_box->size[0]; c1_i35++) {
    if (c1_fv4_data_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(chartInstance->c1_cpu_fv4_data,
        *chartInstance->c1_gpu_fv4_data, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_fv4_data_outdatedOnCpu = false;
    c1_cpu_box->data[c1_i35 + (c1_cpu_box->size[0] << 1)] =
      chartInstance->c1_cpu_fv4_data[c1_i35];
  }

  c1_dh_data_outdatedOnGpu = false;
  c1_dh_size[0] = c1_cpu_box->size[0];
  c1_c_nx = c1_cpu_box->size[0];
  for (c1_d_k = 0; c1_d_k < c1_c_nx; c1_d_k++) {
    chartInstance->c1_cpu_dh_data[c1_d_k] = muSingleScalarMin(c1_cpu_box->
      data[c1_d_k + c1_cpu_box->size[0]], 480.0F);
    c1_dh_data_outdatedOnGpu = true;
  }

  c1_ab_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
  mwGetLaunchParameters1D(c1_ab_numIters, &c1_grid, &c1_block, 65535U);
  if (c1_dh_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_dh_data,
      chartInstance->c1_cpu_dh_data, 25200ULL, cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel67<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_dh_data, c1_dh_size[0] - 1,
       *chartInstance->c1_gpu_fv5_data);
  }

  c1_fv5_data_outdatedOnCpu = true;
  for (c1_i36 = 0; c1_i36 < c1_cpu_box->size[0]; c1_i36++) {
    if (c1_fv5_data_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(c1_cpu_fv5_data,
        *chartInstance->c1_gpu_fv5_data, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_fv5_data_outdatedOnCpu = false;
    c1_cpu_box->data[c1_i36 + c1_cpu_box->size[0]] = c1_cpu_fv5_data[c1_i36];
  }

  c1_dh_data_outdatedOnGpu = false;
  c1_dh_size[0] = c1_cpu_box->size[0];
  c1_d_nx = c1_cpu_box->size[0];
  for (c1_e_k = 0; c1_e_k < c1_d_nx; c1_e_k++) {
    chartInstance->c1_cpu_dh_data[c1_e_k] = muSingleScalarMin(c1_cpu_box->
      data[c1_e_k + c1_cpu_box->size[0] * 3], 480.0F);
    c1_dh_data_outdatedOnGpu = true;
  }

  c1_bb_numIters = c1_computeNumIters(chartInstance, c1_dh_size[0] - 1);
  mwGetLaunchParameters1D(c1_bb_numIters, &c1_grid, &c1_block, 65535U);
  if (c1_dh_data_outdatedOnGpu) {
    c1_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c1_gpu_dh_data,
      chartInstance->c1_cpu_dh_data, 25200ULL, cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }

  c1_validLaunchParams = mwValidateLaunchParameters(c1_grid, c1_block);
  if (c1_validLaunchParams) {
    c1_c1_ex_DLModel_28_kernel68<<<c1_grid, c1_block>>>
      (*chartInstance->c1_gpu_dh_data, c1_dh_size[0] - 1,
       *chartInstance->c1_gpu_fv6_data);
  }

  c1_fv6_data_outdatedOnCpu = true;
  for (c1_i37 = 0; c1_i37 < c1_cpu_box->size[0]; c1_i37++) {
    if (c1_fv6_data_outdatedOnCpu) {
      c1_checkCudaError(chartInstance, cudaMemcpy(c1_cpu_fv6_data,
        *chartInstance->c1_gpu_fv6_data, 25200ULL, cudaMemcpyDeviceToHost),
                        __FILE__, __LINE__);
    }

    c1_fv6_data_outdatedOnCpu = false;
    c1_cpu_box->data[c1_i37 + c1_cpu_box->size[0] * 3] = c1_cpu_fv6_data[c1_i37];
  }

  c1_b_output_idx_0 = c1_output->size[0];
  for (c1_i38 = 0; c1_i38 < 4; c1_i38++) {
    for (c1_i40 = 0; c1_i40 < c1_b_output_idx_0; c1_i40++) {
      c1_output->data[c1_i40 + c1_output->size[0] * c1_i38] = c1_cpu_box->
        data[c1_i40 + c1_cpu_box->size[0] * c1_i38];
    }
  }

  c1_i39 = c1_cpu_box->size[0] * c1_cpu_box->size[1];
  c1_cpu_box->size[0] = c1_output->size[0];
  c1_cpu_box->size[1] = 4;
  c1_emxEnsureCapacity_real32_T(chartInstance, c1_cpu_box, c1_i39);
  for (c1_i41 = 0; c1_i41 < 4; c1_i41++) {
    for (c1_i43 = 0; c1_i43 < c1_output->size[0]; c1_i43++) {
      c1_cpu_box->data[c1_i43 + c1_cpu_box->size[0] * c1_i41] = c1_output->
        data[c1_i43 + c1_output->size[0] * c1_i41];
    }
  }

  for (c1_i42 = 0; c1_i42 < c1_output->size[0]; c1_i42++) {
    c1_cpu_box->data[c1_i42 + (c1_cpu_box->size[0] << 1)] = (c1_output->
      data[c1_i42 + (c1_output->size[0] << 1)] - c1_output->data[c1_i42]) + 1.0F;
  }

  c1_c_box_size_idx_0 = c1_cpu_box->size[0];
  for (c1_i44 = 0; c1_i44 < c1_cpu_box->size[0]; c1_i44++) {
    c1_c_box_data[c1_i44] = (c1_cpu_box->data[c1_i44 + c1_cpu_box->size[0] * 3]
      - c1_cpu_box->data[c1_i44 + c1_cpu_box->size[0]]) + 1.0F;
  }

  for (c1_i45 = 0; c1_i45 < c1_c_box_size_idx_0; c1_i45++) {
    c1_cpu_box->data[c1_i45 + c1_cpu_box->size[0] * 3] = c1_c_box_data[c1_i45];
  }

  c1_c_output_idx_0 = c1_output->size[0];
  for (c1_i46 = 0; c1_i46 < 4; c1_i46++) {
    for (c1_i47 = 0; c1_i47 < c1_c_output_idx_0; c1_i47++) {
      c1_output->data[c1_i47 + c1_output->size[0] * c1_i46] = c1_cpu_box->
        data[c1_i47 + c1_cpu_box->size[0] * c1_i46];
    }
  }

  c1_emxFree_real32_T(chartInstance, &c1_cpu_box);
  c1_n = static_cast<int32_T>(muDoubleScalarMin(static_cast<real_T>
    (c1_output->size[0]), 100.0));
  if (c1_n > 0) {
    c1_bboxes_size[0] = c1_n;
    c1_bboxes_size[1] = 4;
    for (c1_i48 = 0; c1_i48 < 4; c1_i48++) {
      for (c1_i49 = 0; c1_i49 < c1_n; c1_i49++) {
        c1_b_bboxes_data[c1_i49 + c1_n * c1_i48] = c1_output->data[c1_i49 +
          c1_output->size[0] * c1_i48];
      }
    }

    c1_scores_size[0] = c1_n;
    c1_scores_size[1] = 1;
    c1_labelIds_size[0] = c1_n;
    c1_labelIds_size[1] = 1;
    for (c1_i50 = 0; c1_i50 < c1_n; c1_i50++) {
      c1_b_scores_data[c1_i50] = c1_output->data[c1_i50 + (c1_output->size[0] <<
        2)];
      c1_b_labelIds_data[c1_i50] = c1_output->data[c1_i50 + c1_output->size[0] *
        5];
    }
  }

  c1_emxFree_real32_T(chartInstance, &c1_output);
  c1_gpuEmxFree_real32_T(chartInstance, &c1_gpu_pred_Data);
  c1_gpuEmxFree_real32_T(chartInstance, &c1_e_gpu_x_Data);
  c1_gpuEmxFree_real32_T(chartInstance, &c1_gpu_box);
  c1_gpuEmxFree_real32_T(chartInstance, &c1_b_gpu_x);
  c1_gpuEmxFree_real_T(chartInstance, &c1_gpu_centers);
}

static void initialize_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  emlrtInitGPU(chartInstance->c1_fEmlrtCtx);
  cudaGetLastError();
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_c_global_gpu_xq,
    sizeof(int8_T [60])), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_d_global_gpu_xq,
    sizeof(int8_T [80])), __FILE__, __LINE__);
  chartInstance->c1_b_dlnetwork_layerPredictWithColMajority_constsCopied = false;
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_global_gpu_xq,
    sizeof(int8_T [30])), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_global_gpu_xq,
    sizeof(int8_T [40])), __FILE__, __LINE__);
  chartInstance->c1_dlnetwork_layerPredictWithColMajority_constsCopied = false;
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_global_gpu_fv,
    sizeof(int8_T [6300])), __FILE__, __LINE__);
  chartInstance->c1_c1_ex_DLModel_28_constsCopied = false;
  emlrtLicenseCheckR2022a(chartInstance->c1_fEmlrtCtx,
    "EMLRT:runTime:MexFunctionNeedsLicense", "distrib_computing_toolbox", 2);
  emlrtLicenseCheckR2022a(chartInstance->c1_fEmlrtCtx,
    "EMLRT:runTime:MexFunctionNeedsLicense", "neural_network_toolbox", 2);
  emlrtLicenseCheckR2022a(chartInstance->c1_fEmlrtCtx,
    "EMLRT:runTime:MexFunctionNeedsLicense", "image_toolbox", 2);
  emlrtLicenseCheckR2022a(chartInstance->c1_fEmlrtCtx,
    "EMLRT:runTime:MexFunctionNeedsLicense", "video_and_image_blockset", 2);
  sim_mode_is_external(chartInstance->S);
  chartInstance->c1_det_not_empty = false;
  chartInstance->c1_det.matlabCodegenIsDeleted = true;
  chartInstance->c1_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_obj_Data_data, 25200ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_box_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_offsetOfLevel, 16ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_b_gpu_offsetOfLevel, 16ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_expl_temp_Data, 3686400ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_fv6_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_fv5_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_fv4_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_fv3_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_dh_data,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_ii_data,
    12600ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_iv3_data,
    12600ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_Y_data,
    38400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_idx_data,
    50400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_out_data,
    50400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_X_data,
    38400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_score_data,
    50400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_b_gpu_obj_Data_data, 6300ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_iv_data,
    12600ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_gpu_y_data,
    640ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_gpu_xdata,
    25200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_c_gpu_x_Data,
    2016000ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_processedVarargin_f2, 640ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_processedVarargin_f1, 25200ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_intermediateResult, 2116800ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_dataArgs_f1,
    100800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_varargin_1,
    50400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_c_gpu_y_data,
    640ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_sub1,
    50400ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_ConstantArray1, 50400ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_centersArray, 100800ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_splitoutFc,
    100800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_objX_Data,
    100800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_obj_Data,
    1612800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_d_gpu_xdata,
    1612800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_maxVal,
    100800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_gpu_objX_Data,
    1612800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_splitout2_Data, 2016000ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_x,
    2016000ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_gpu_out_Data,
    3628800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_matrixToCat,
    172800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_b_gpu_matrixToCat, 691200ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_c_gpu_matrixToCat, 2764800ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_b_gpu_intermediateResult, 3628800ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_b_gpu_objdata,
    172800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_c_gpu_objdata,
    691200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_d_gpu_objdata,
    2764800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_c_gpu_objX_Data,
    172800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_d_gpu_objX_Data,
    691200ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_e_gpu_objX_Data,
    2764800ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_img,
    921600ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_out,
    921600ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_partialResize, 921600ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_colWeightsTotal, 5120ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_rowWeightsTotal, 3840ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_colWeights,
    1280ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_ipColIndices, 2560ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_rowWeights,
    960ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&chartInstance->c1_gpu_ipRowIndices, 1920ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_aux2,
    2560ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_aux1,
    1920ULL), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c1_gpu_image,
    921600ULL), __FILE__, __LINE__);
}

static void initialize_params_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance)
{
}

static void mdl_start_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  sim_mode_is_external(chartInstance->S);
}

static void mdl_terminate_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_obj_Data_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_box_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_offsetOfLevel),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_b_gpu_offsetOfLevel), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_expl_temp_Data), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_fv6_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_fv5_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_fv4_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_fv3_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_dh_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_ii_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_iv3_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_Y_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_idx_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_out_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_X_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_score_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_b_gpu_obj_Data_data), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_iv_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_y_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_xdata),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_gpu_x_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_processedVarargin_f2), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_processedVarargin_f1), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_intermediateResult), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_dataArgs_f1),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_varargin_1),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_gpu_y_data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_sub1),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_ConstantArray1), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_centersArray),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_splitoutFc),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_objX_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_obj_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_d_gpu_xdata),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_maxVal),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_objX_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_splitout2_Data), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_x), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_out_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_matrixToCat),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_matrixToCat),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_gpu_matrixToCat),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_b_gpu_intermediateResult), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_gpu_objdata),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_gpu_objdata),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_d_gpu_objdata),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_gpu_objX_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_d_gpu_objX_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_e_gpu_objX_Data),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_img),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_out),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_partialResize),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_colWeightsTotal), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree
                    (*chartInstance->c1_gpu_rowWeightsTotal), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_colWeights),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_ipColIndices),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_rowWeights),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_ipRowIndices),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_aux2),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_aux1),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_gpu_image),
                    __FILE__, __LINE__);
  c1_b_checkCudaError(chartInstance, cudaGetLastError(), __FILE__, __LINE__);
  if (!chartInstance->c1_det.matlabCodegenIsDeleted) {
    chartInstance->c1_det.matlabCodegenIsDeleted = true;
    c1_dlnetwork_delete(chartInstance, &chartInstance->c1_det);
  }

  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_global_gpu_fv),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_global_gpu_xq),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_b_global_gpu_xq),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_c_global_gpu_xq),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*chartInstance->c1_d_global_gpu_xq),
                    __FILE__, __LINE__);
}

static void mdl_setup_runtime_resources_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  sfSetAnimationVectors(chartInstance->S, &chartInstance->c1_JITStateAnimation[0],
                        &chartInstance->c1_JITTransitionAnimation[0]);
}

static void mdl_cleanup_runtime_resources_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
}

static void enable_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void sf_gateway_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  c1_emxArray_real32_T_100x1 c1_labelIds;
  c1_emxArray_real32_T_100x1 c1_scores;
  c1_emxArray_real32_T_100x4 c1_bboxes;
  int32_T c1_i;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_JITTransitionAnimation[0] = 0U;
  chartInstance->c1_sfEvent = CALL_EVENT;
  for (c1_i = 0; c1_i < 921600; c1_i++) {
    chartInstance->c1_uv[c1_i] = (*chartInstance->c1_image)[c1_i];
  }

  c1_c1_ex_DLModel_28(chartInstance, chartInstance->c1_uv, c1_bboxes.data,
                      c1_bboxes.size, c1_scores.data, c1_scores.size,
                      c1_labelIds.data, c1_labelIds.size);
  c1_emxConvertDynamicMatrixFromEmx_(chartInstance, &c1_bboxes,
    *chartInstance->c1_bboxes_data, *chartInstance->c1_bboxes_sizes);
  c1_b_emxConvertDynamicMatrixFromEmx_(chartInstance, &c1_scores,
    *chartInstance->c1_scores_data, *chartInstance->c1_scores_sizes);
  c1_b_emxConvertDynamicMatrixFromEmx_(chartInstance, &c1_labelIds,
    *chartInstance->c1_labelIds_data, *chartInstance->c1_labelIds_sizes);
}

static void ext_mode_exec_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
}

static const mxArray *get_sim_state_c1_ex_DLModel_28
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  const mxArray *c1_b_y = NULL;
  const mxArray *c1_c_y = NULL;
  const mxArray *c1_d_y = NULL;
  const mxArray *c1_st;
  const mxArray *c1_y = NULL;
  c1_st = NULL;
  c1_st = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_createcellmatrix(3, 1), false);
  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_create("y", chartInstance->c1_bboxes_data, 1, 0U,
    1, 0U, 2, (*chartInstance->c1_bboxes_sizes)[0],
    (*chartInstance->c1_bboxes_sizes)[1]), false);
  sf_mex_setcell(c1_y, 0, c1_b_y);
  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", chartInstance->c1_labelIds_data, 1,
    0U, 1, 0U, 2, (*chartInstance->c1_labelIds_sizes)[0], 1), false);
  sf_mex_setcell(c1_y, 1, c1_c_y);
  c1_d_y = NULL;
  sf_mex_assign(&c1_d_y, sf_mex_create("y", chartInstance->c1_scores_data, 1, 0U,
    1, 0U, 2, (*chartInstance->c1_scores_sizes)[0], 1), false);
  sf_mex_setcell(c1_y, 2, c1_d_y);
  sf_mex_assign(&c1_st, c1_y, false);
  return c1_st;
}

static void set_sim_state_c1_ex_DLModel_28(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_st)
{
  const mxArray *c1_u;
  int32_T c1_b_tmp_size[2];
  int32_T c1_c_tmp_size[2];
  int32_T c1_tmp_size[2];
  int32_T c1_b_loop_ub;
  int32_T c1_c_loop_ub;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  int32_T c1_loop_ub;
  real32_T c1_tmp_data[400];
  real32_T c1_b_tmp_data[100];
  real32_T c1_c_tmp_data[100];
  chartInstance->c1_doneDoubleBufferReInit = true;
  c1_u = sf_mex_dup(c1_st);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 0)),
                      "bboxes", c1_tmp_data, c1_tmp_size);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 1, 0, c1_tmp_size[0]);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 1, 1, c1_tmp_size[1]);
  c1_loop_ub = c1_tmp_size[0] * c1_tmp_size[1] - 1;
  for (c1_i = 0; c1_i <= c1_loop_ub; c1_i++) {
    (*chartInstance->c1_bboxes_data)[c1_i] = c1_tmp_data[c1_i];
  }

  c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 1)),
                        "labelIds", c1_b_tmp_data, c1_b_tmp_size);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 3, 0,
    c1_b_tmp_size[0]);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 3, 1, 1);
  c1_b_loop_ub = c1_b_tmp_size[0] * c1_b_tmp_size[1] - 1;
  for (c1_i1 = 0; c1_i1 <= c1_b_loop_ub; c1_i1++) {
    (*chartInstance->c1_labelIds_data)[c1_i1] = c1_b_tmp_data[c1_i1];
  }

  c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 2)),
                        "scores", c1_c_tmp_data, c1_c_tmp_size);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 2, 0,
    c1_c_tmp_size[0]);
  ssSetCurrentOutputPortDimensions_wrapper(chartInstance->S, 2, 1, 1);
  c1_c_loop_ub = c1_c_tmp_size[0] * c1_c_tmp_size[1] - 1;
  for (c1_i2 = 0; c1_i2 <= c1_c_loop_ub; c1_i2++) {
    (*chartInstance->c1_scores_data)[c1_i2] = c1_c_tmp_data[c1_i2];
  }

  sf_mex_destroy(&c1_u);
  sf_mex_destroy(&c1_st);
}

static void c1_dlnetwork_setup(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj)
{
  c1_obj->setup(chartInstance);
}

static void c1_dlnetwork_predict(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj, real32_T c1_varargin_1_Data[921600],
  real32_T c1_varargout_1_Data[691200], real32_T c1_varargout_2_Data[172800],
  real32_T c1_varargout_3_Data[43200])
{
  real32_T (*c1_gpu_inputDataT_0_f1)[921600];
  real32_T (*c1_c_gpu_in)[691200];
  real32_T (*c1_gpu_outputDataAfterTranspose_f1)[691200];
  real32_T (*c1_b_gpu_in)[172800];
  real32_T (*c1_gpu_outputDataAfterTranspose_f2)[172800];
  real32_T (*c1_gpu_in)[43200];
  real32_T (*c1_gpu_outputDataAfterTranspose_f3)[43200];
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&c1_gpu_outputDataAfterTranspose_f3, 172800ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&c1_gpu_outputDataAfterTranspose_f2, 691200ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc
                    (&c1_gpu_outputDataAfterTranspose_f1, 2764800ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_gpu_in, 172800ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_b_gpu_in, 691200ULL), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_c_gpu_in, 2764800ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_gpu_inputDataT_0_f1,
    3686400ULL), __FILE__, __LINE__);
  c1_dlnetwork_predict_kernel75<<<dim3(1800U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (c1_varargin_1_Data, *c1_gpu_inputDataT_0_f1);
  c1_checkCudaError(chartInstance, cudaMemcpy(c1_obj->getInputDataPointer(0),
    *c1_gpu_inputDataT_0_f1, c1_obj->getLayerOutputSize(0, 0),
    cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
  c1_obj->activations(583);
  c1_checkCudaError(chartInstance, cudaMemcpy(*c1_c_gpu_in,
    c1_obj->getLayerOutput(407, 0), c1_obj->getLayerOutputSize(407, 0),
    cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMemcpy(*c1_b_gpu_in,
    c1_obj->getLayerOutput(495, 0), c1_obj->getLayerOutputSize(495, 0),
    cudaMemcpyDeviceToDevice), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMemcpy(*c1_gpu_in, c1_obj->getLayerOutput
    (583, 0), c1_obj->getLayerOutputSize(583, 0), cudaMemcpyDeviceToDevice),
                    __FILE__, __LINE__);
  c1_dlnetwork_predict_kernel76<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*c1_c_gpu_in, *c1_gpu_outputDataAfterTranspose_f1);
  c1_dlnetwork_predict_kernel77<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*c1_b_gpu_in, *c1_gpu_outputDataAfterTranspose_f2);
  c1_dlnetwork_predict_kernel78<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*c1_gpu_in, *c1_gpu_outputDataAfterTranspose_f3);
  c1_dlnetwork_predict_kernel79<<<dim3(1350U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*c1_gpu_outputDataAfterTranspose_f1, c1_varargout_1_Data);
  c1_dlnetwork_predict_kernel80<<<dim3(338U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*c1_gpu_outputDataAfterTranspose_f2, c1_varargout_2_Data);
  c1_dlnetwork_predict_kernel81<<<dim3(97U, 1U, 1U), dim3(448U, 1U, 1U)>>>
    (*c1_gpu_outputDataAfterTranspose_f3, c1_varargout_3_Data);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_inputDataT_0_f1), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_c_gpu_in), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_b_gpu_in), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_in), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_outputDataAfterTranspose_f1),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_outputDataAfterTranspose_f2),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_outputDataAfterTranspose_f3),
                    __FILE__, __LINE__);
}

static void c1_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [1228800], real32_T c1_varargout_1[1228800])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel82<<<dim3(2400U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_b_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [614400], real32_T c1_varargout_1[614400])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel83<<<dim3(1200U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_c_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [614400], real32_T c1_varargout_1[307200], real32_T c1_varargout_2[307200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel84<<<dim3(600U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_2, c1_varargout_1);
}

static void c1_d_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[307200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel85<<<dim3(600U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_e_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[307200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel86<<<dim3(600U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_f_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [307200], real32_T c1_varargout_1[153600], real32_T c1_varargout_2[153600])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel87<<<dim3(300U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_2, c1_varargout_1);
}

static void c1_g_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[76800],
   real32_T c1_varargout_1[76800])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel88<<<dim3(150U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_h_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [153600], real32_T c1_varargout_1[153600])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel89<<<dim3(300U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_i_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargout_1[115200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel90<<<dim3(225U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_j_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargout_1[57600], real32_T c1_varargout_2[57600])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel91<<<dim3(113U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_2, c1_varargout_1);
}

static void c1_k_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[28800],
   real32_T c1_varargout_1[28800])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel92<<<dim3(100U, 1U, 1U), dim3
    (288U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_m_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[57600],
   real32_T c1_varargout_1[57600])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel93<<<dim3(113U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_o_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargout_1[38400])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel94<<<dim3(100U, 1U, 1U), dim3
    (384U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_p_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargout_1[19200], real32_T c1_varargout_2[19200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel95<<<dim3(100U, 1U, 1U), dim3
    (192U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_2, c1_varargout_1);
}

static void c1_q_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[9600],
   real32_T c1_varargout_1[9600])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel96<<<dim3(75U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_r_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[19200],
   real32_T c1_varargout_1[19200])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel97<<<dim3(100U, 1U, 1U), dim3
    (192U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_s_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[38400],
   real32_T c1_varargin_2[115200], real32_T c1_varargout_1[153600])
{
  static int8_T c1_b_cpu_xq[40] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8,
    8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18,
    18, 19, 19, 20, 20 };

  static int8_T c1_cpu_xq[30] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8,
    9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15 };

  real32_T (*c1_b_gpu_out)[153600];
  real32_T (*c1_c_gpu_out)[76800];
  real32_T (*c1_gpu_in)[76800];
  if (!chartInstance->c1_dlnetwork_layerPredictWithColMajority_constsCopied) {
    chartInstance->c1_dlnetwork_layerPredictWithColMajority_constsCopied = true;
    cudaMemcpy(*chartInstance->c1_global_gpu_xq, c1_cpu_xq, sizeof(int8_T [30]),
               cudaMemcpyHostToDevice);
    cudaMemcpy(*chartInstance->c1_b_global_gpu_xq, c1_b_cpu_xq, sizeof(int8_T
                [40]), cudaMemcpyHostToDevice);
  }

  cudaMalloc(&c1_b_gpu_out, 614400ULL);
  cudaMalloc(&c1_gpu_in, 307200ULL);
  cudaMalloc(&c1_c_gpu_out, 307200ULL);
  c1_dlnetwork_layerPredictWithColMajority_kernel98<<<dim3(150U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, *chartInstance->c1_global_gpu_xq,
                      *c1_c_gpu_out);
  c1_dlnetwork_layerPredictWithColMajority_kernel99<<<dim3(150U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_c_gpu_out, *c1_gpu_in);
  c1_dlnetwork_layerPredictWithColMajority_kernel100<<<dim3(300U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_gpu_in, *chartInstance->c1_b_global_gpu_xq,
                      *c1_b_gpu_out);
  c1_dlnetwork_layerPredictWithColMajority_kernel101<<<dim3(300U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_b_gpu_out, c1_varargout_1);
  cudaFree(*c1_c_gpu_out);
  cudaFree(*c1_gpu_in);
  cudaFree(*c1_b_gpu_out);
}

static void c1_t_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [115200], real32_T c1_varargin_2[307200], real32_T c1_varargout_1[460800])
{
  static int8_T c1_b_cpu_xq[80] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8,
    8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18,
    18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27,
    28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37,
    37, 38, 38, 39, 39, 40, 40 };

  static int8_T c1_cpu_xq[60] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8,
    9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18,
    19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28,
    28, 29, 29, 30, 30 };

  real32_T (*c1_b_gpu_out)[460800];
  real32_T (*c1_c_gpu_out)[230400];
  real32_T (*c1_gpu_in)[230400];
  if (!chartInstance->c1_b_dlnetwork_layerPredictWithColMajority_constsCopied) {
    chartInstance->c1_b_dlnetwork_layerPredictWithColMajority_constsCopied =
      true;
    cudaMemcpy(*chartInstance->c1_c_global_gpu_xq, c1_cpu_xq, sizeof(int8_T [60]),
               cudaMemcpyHostToDevice);
    cudaMemcpy(*chartInstance->c1_d_global_gpu_xq, c1_b_cpu_xq, sizeof(int8_T
                [80]), cudaMemcpyHostToDevice);
  }

  cudaMalloc(&c1_b_gpu_out, 1843200ULL);
  cudaMalloc(&c1_gpu_in, 921600ULL);
  cudaMalloc(&c1_c_gpu_out, 921600ULL);
  c1_dlnetwork_layerPredictWithColMajority_kernel102<<<dim3(450U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, *chartInstance->c1_c_global_gpu_xq,
                      *c1_c_gpu_out);
  c1_dlnetwork_layerPredictWithColMajority_kernel103<<<dim3(450U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_c_gpu_out, *c1_gpu_in);
  c1_dlnetwork_layerPredictWithColMajority_kernel104<<<dim3(900U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_gpu_in, *chartInstance->c1_d_global_gpu_xq,
                      *c1_b_gpu_out);
  c1_dlnetwork_layerPredictWithColMajority_kernel105<<<dim3(900U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(*c1_b_gpu_out, c1_varargout_1);
  cudaFree(*c1_c_gpu_out);
  cudaFree(*c1_gpu_in);
  cudaFree(*c1_b_gpu_out);
}

static void c1_u_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1
   [384000], real32_T c1_varargout_1[384000])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel106<<<dim3(750U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_v_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[76800],
   real32_T c1_varargout_1[76800])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel107<<<dim3(150U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_w_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[96000],
   real32_T c1_varargout_1[96000])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel108<<<dim3(188U, 1U, 1U), dim3
    (512U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_x_dlnetwork_layerPredictWithColMajority
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, real32_T c1_varargin_1[24000],
   real32_T c1_varargout_1[24000])
{
  c1_dlnetwork_layerPredictWithColMajority_kernel109<<<dim3(108U, 1U, 1U), dim3
    (224U, 1U, 1U)>>>(c1_varargin_1, c1_varargout_1);
}

static void c1_conv2dCudaImplicitGemmColMajor(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, real32_T c1_X[403200], real32_T c1_Z[25200])
{
  real32_T (*c1_gpu_formattedWeights)[16];
  real32_T (*c1_gpu_formattedBias)[4];
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_gpu_formattedBias, 16ULL),
                    __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMalloc(&c1_gpu_formattedWeights, 64ULL),
                    __FILE__, __LINE__);
  c1_conv2dCudaImplicitGemmColMajor_kernel110<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
    1U)>>>(*c1_gpu_formattedWeights);
  c1_conv2dCudaImplicitGemmColMajor_kernel111<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
    1U)>>>(*c1_gpu_formattedBias);
  c1_convolution(chartInstance, &c1_X[0], &(*c1_gpu_formattedWeights)[0],
                 &(*c1_gpu_formattedBias)[0], &c1_Z[0]);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_formattedWeights), __FILE__,
                    __LINE__);
  c1_checkCudaError(chartInstance, cudaFree(*c1_gpu_formattedBias), __FILE__,
                    __LINE__);
}

static void c1_selectStrongestBboxCodegen(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_bbox, real32_T c1_label_data[],
  int32_T c1_label_size[1], boolean_T c1_selectedIndex_data[], int32_T
  c1_selectedIndex_size[1])
{
  int32_T c1_b_i2;
  int32_T c1_b_j;
  int32_T c1_c_i;
  int32_T c1_c_i1;
  int32_T c1_currentBox;
  int32_T c1_d_i;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  int32_T c1_i3;
  int32_T c1_j;
  int32_T c1_loop_ub;
  real32_T c1_area_data[6300];
  real32_T c1_x2_data[6300];
  real32_T c1_y2_data[6300];
  real32_T c1_areaOfIntersect;
  real32_T c1_height;
  real32_T c1_width;
  c1_selectedIndex_size[0] = c1_bbox->size[0];
  for (c1_i = 0; c1_i < c1_bbox->size[0]; c1_i++) {
    c1_selectedIndex_data[c1_i] = true;
    c1_area_data[c1_i] = c1_bbox->data[c1_i + (c1_bbox->size[0] << 1)] *
      c1_bbox->data[c1_i + c1_bbox->size[0] * 3];
    c1_x2_data[c1_i] = c1_bbox->data[c1_i] + c1_bbox->data[c1_i + (c1_bbox->
      size[0] << 1)];
    c1_y2_data[c1_i] = c1_bbox->data[c1_i + c1_bbox->size[0]] + c1_bbox->
      data[c1_i + c1_bbox->size[0] * 3];
  }

  c1_currentBox = -1;
  c1_c_i = c1_bbox->size[0];
  for (c1_d_i = 0; c1_d_i < c1_c_i; c1_d_i++) {
    c1_currentBox = c1_d_i;
    if (muSingleScalarIsNaN(c1_label_data[c1_d_i])) {
      c1_selectedIndex_data[c1_d_i] = false;
    } else {
      if (c1_selectedIndex_data[c1_d_i]) {
        c1_c_i1 = 2;
      } else {
        c1_c_i1 = 1;
      }

      if (c1_c_i1 != 1) {
        c1_i3 = c1_bbox->size[0] - c1_d_i;
        for (c1_j = 0; c1_j <= c1_i3 - 2; c1_j++) {
          c1_b_j = (c1_d_i + c1_j) + 1;
          if (c1_selectedIndex_data[c1_b_j] && (!(c1_label_data[c1_b_j] !=
                c1_label_data[c1_d_i]))) {
            c1_width = muSingleScalarMin(c1_x2_data[c1_d_i], c1_x2_data[c1_b_j])
              - muSingleScalarMax(c1_bbox->data[c1_d_i], c1_bbox->data[c1_b_j]);
            if (!(c1_width <= 0.0F)) {
              c1_height = muSingleScalarMin(c1_y2_data[c1_d_i],
                c1_y2_data[c1_b_j]) - muSingleScalarMax(c1_bbox->data[c1_d_i +
                c1_bbox->size[0]], c1_bbox->data[c1_b_j + c1_bbox->size[0]]);
              if (!(c1_height <= 0.0F)) {
                c1_areaOfIntersect = c1_width * c1_height;
                if (static_cast<real_T>(c1_areaOfIntersect /
                                        ((c1_area_data[c1_d_i] +
                       c1_area_data[c1_b_j]) - c1_areaOfIntersect)) > 0.7) {
                  c1_selectedIndex_data[c1_b_j] = false;
                }
              }
            }
          }
        }
      }
    }
  }

  if (c1_currentBox + 2 > c1_selectedIndex_size[0]) {
    c1_i1 = 0;
    c1_i2 = 0;
  } else {
    c1_i1 = c1_currentBox + 1;
    c1_i2 = c1_selectedIndex_size[0];
  }

  c1_loop_ub = c1_i2 - c1_i1;
  for (c1_b_i2 = 0; c1_b_i2 < c1_loop_ub; c1_b_i2++) {
    c1_selectedIndex_data[c1_i1 + c1_b_i2] = false;
  }
}

static void c1_indexShapeCheck(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  int32_T c1_matrixSize, int32_T c1_indexSize[2])
{
}

static void c1_dlnetwork_delete(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_c1_Yolov9t0_ex_DLModel_280 *c1_obj)
{
  if (c1_obj->isInitialized) {
    c1_obj->cleanup();
  }
}

const mxArray *sf_c1_ex_DLModel_28_get_eml_resolved_functions_info()
{
  const mxArray *c1_nameCaptureInfo = NULL;
  const char_T *c1_data[11] = {
    "789ced5b4d6fe3441876d12eec01d882041784b49c1151374d1bca2d71dc346dbeda34db2f23e2386f9249fcd5193bb16f7be7c01f0071e0e38090b820ce20a4"
    "95f80ffc1644d2789ac45acb59259d755cbf97e9f4f5ccf37aded1f34c5edbdc46a1b4c171dcbbdcc48cfca47dc7ed6fbaed1bdcbc79fd1b6efbb6a74fed21f7",
    "606e1cf57fe3b6b2ae99609b938e26a9703bb2a5ab489334f3d43180c340746500ad1b4f1b29708a54a8cd76cae39eba3fe3baed8c5de3bff92ec8fd9aa572b8"
    "4ba6112ab39ddbf568f8dcef8380f5f09a773dbcd7dd173c7ae1abe2d1f9bf0dc0a3feabfa97fc17629d0026624eef587d494bf491823459ac6890c368004f3e",
    "7bd2461d2009595713261e5d265b2a6826114b99d362262b0ab6a41a0a10f124b995dc698ada00b59024f28a44086a3b67d09425b5a04aa3392a5af9592157c8"
    "1c8249746d1feb6a0da9d608aeef4e225ee88a3ed83313aa64ceae47c3e77e1f2fb81ede767afda39bf69fbffedd6089f7fcbfc2114b3c6aaf0bcff6996fd1fd",
    "fca10fdea6c78fb60b0743a17be6f0f6b68d0612e492a9143f8da31a80131407e7d367357fc367fc5df1d0b2797b2f008ffabba0188013060603eb3210aa31cb"
    "de37c57de81bc7c46321cdfc7c06efd192fcfb932fdebcff4a0819ff7e3ac98438cd4442e5d8f186f8822d0f738fbfff8d299e6b51e7e1f342c16e1df78bfdf6",
    "e9b17d72d4ed096673371b1d1e8ef9e1e5fc60f8dcf7a2ebe297874d4febea8502a60938abdbabdadf1f04e053bfacb746f023d100ac494a829818691d6e75fb"
    "e3c78038a83fb4fbe3363337db8319df1dffc9f81cffc998d562fd58b57e149ba99dcc6eded92a677a396bdf4059e234f7a3a31f0d9ff177758e67c5cbbc45cc",
    "1129284886a2e4007e5df7bb2cfffe108047fd577cc8f8d79b8009fd46967fb9afbfcb30c5736d5df977d1f34d6a8033d7f2f04830206be57b764f01dde262fe"
    "f5da5dd78fe9fc6ff9e24d3ca3e3780bc96668f87e7349fefd35009ffaaf2ae127e00d9a1ceefef054d4f1589d83eb97e567bbf95aae573eb8aef73a4e55daae",
    "caf99887bdc6aa9ebd68dedcfa440734c092093c8c2b0564757af0a66f1c134f4bb79a0a4cf196e5e35f7cf1e6fda1ad477832e11e8ba35bd7fe5bfe9d299e6b"
    "51e7637e2064f9cb5af1a2a223b353ad0ab6fdb41ea1ba76c3677c58f9f8fd003ceaa7cf177562ce3d60a4713c5f328e8f02e2a0fe1680312d1b4faac82d45c2",
    "5872e6e259b67ef173403cd41f5abe9ec9d498ab23cbd31fbff883299e6b51e7690b2ac9a2916a0f8ef6d24ec1b99465ac9484e8f074cc0f2fe707c67a722e5f"
    "c8c36ed27686ddc9ff633d09e97e99c9144b3d899f47de2d1eab7ab8d52f1e96aab87c5ec2581f5e909a245cb7b9584f22c30f3e7ac2aa8eeeeac9989e461c65",
    "3bacea4404699dd93ad1bd7f6fe53603f17b2babc4a3b6ae3ab170bd3eb5c5ebb0e37477f1d9c95e3d53e64f8144a83e14eb44287e77105952e0aba66e83a78e"
    "d558320ed67ab1f6fb612613f1ef8a582f5e552f3ae9a7fd7272681f160615746c5ce64b045a11fa5e29e68797f303e3efaa640519b372b1b67ab1f6df4d4c33",
    "c1f4bbaa582fee168f955e344facfdf69ec20b67e934a4f0c1791dcad7b9582f22a31761a943d9ce4dad7c5d75220275283703711d6a9578d4a2ae13e9831d52"
    "dd13d25b5837cb6da573e81c64f408bc37fa3f53f1f0ba", "" };

  c1_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c1_data[0], 18312U, &c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const mxArray *c1_nullptr, const char_T *c1_identifier, real32_T c1_y_data[],
  int32_T c1_y_size[2])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_nullptr), &c1_thisId,
                        c1_y_data, c1_y_size);
  sf_mex_destroy(&c1_nullptr);
}

static void c1_b_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real32_T c1_y_data[], int32_T c1_y_size[2])
{
  int32_T c1_fv_size[2];
  int32_T c1_iv[2];
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  real32_T c1_fv_data[400];
  boolean_T c1_bv[2];
  for (c1_i = 0; c1_i < 2; c1_i++) {
    c1_iv[c1_i] = -96 * c1_i + 100;
  }

  c1_fv_size[0] = sf_mex_get_dimension(c1_u, 0);
  c1_fv_size[1] = sf_mex_get_dimension(c1_u, 1);
  for (c1_i1 = 0; c1_i1 < 2; c1_i1++) {
    c1_bv[c1_i1] = true;
  }

  sf_mex_import_vs(c1_parentId, sf_mex_dup(c1_u), &c1_fv_data, 0, 1, 0U, 1, 0U,
                   2, c1_bv, c1_iv, c1_fv_size);
  c1_y_size[0] = c1_fv_size[0];
  c1_y_size[1] = c1_fv_size[1];
  for (c1_i2 = 0; c1_i2 < c1_fv_size[0] * c1_fv_size[1]; c1_i2++) {
    c1_y_data[c1_i2] = c1_fv_data[c1_i2];
  }

  sf_mex_destroy(&c1_u);
}

static void c1_c_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_nullptr, const char_T *c1_identifier,
  real32_T c1_y_data[], int32_T c1_y_size[2])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_nullptr), &c1_thisId,
                        c1_y_data, c1_y_size);
  sf_mex_destroy(&c1_nullptr);
}

static void c1_d_emlrt_marshallIn(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real32_T c1_y_data[], int32_T c1_y_size[2])
{
  static boolean_T c1_b_bv[2] = { true, false };

  int32_T c1_fv_size[2];
  int32_T c1_iv[2];
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  real32_T c1_fv_data[100];
  boolean_T c1_bv[2];
  for (c1_i = 0; c1_i < 2; c1_i++) {
    c1_iv[c1_i] = -99 * c1_i + 100;
  }

  c1_fv_size[0] = sf_mex_get_dimension(c1_u, 0);
  c1_fv_size[1] = sf_mex_get_dimension(c1_u, 1);
  for (c1_i1 = 0; c1_i1 < 2; c1_i1++) {
    c1_bv[c1_i1] = c1_b_bv[c1_i1];
  }

  sf_mex_import_vs(c1_parentId, sf_mex_dup(c1_u), &c1_fv_data, 0, 1, 0U, 1, 0U,
                   2, c1_bv, c1_iv, c1_fv_size);
  c1_y_size[0] = c1_fv_size[0];
  c1_y_size[1] = 1;
  for (c1_i2 = 0; c1_i2 < c1_fv_size[0]; c1_i2++) {
    c1_y_data[c1_i2] = c1_fv_data[c1_i2];
  }

  sf_mex_destroy(&c1_u);
}

static void c1_convolution(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const real32_T *c1_inputTensor, const real32_T *c1_weights, const real32_T
  *c1_bias, real32_T *c1_gpu_outputTensor)
{
  real32_T *c1_cpu_outputTensor;
  c1_cpu_outputTensor = static_cast<real32_T *>(malloc(sizeof(real32_T)));
  c1_checkCudaError(chartInstance, cudaMemcpy(c1_cpu_outputTensor,
    c1_gpu_outputTensor, 4ULL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMemcpy(c1_gpu_outputTensor,
    c1_cpu_outputTensor, 4ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  c1_convolutionKernel<<<dim3(788, 1U, 1U), dim3(64, 1U, 1U)>>>(c1_inputTensor,
    c1_weights, c1_bias, c1_gpu_outputTensor);
  c1_checkCudaError(chartInstance, cudaMemcpy(c1_cpu_outputTensor,
    c1_gpu_outputTensor, 4ULL, cudaMemcpyDeviceToHost), __FILE__, __LINE__);
  c1_checkCudaError(chartInstance, cudaMemcpy(c1_gpu_outputTensor,
    c1_cpu_outputTensor, 4ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  free(c1_cpu_outputTensor);
}

static __global__ __launch_bounds__(64, 12) void c1_convolutionKernel(const
  real32_T *c1_inputTensor, const real32_T *c1_weights, const real32_T *c1_bias,
  real32_T *c1_outputTensor)
{
  __shared__ real32_T c1_sharedMemoryA[256];
  __shared__ real32_T c1_sharedMemoryB[256];
  float4 c1_regA;
  float4 c1_regB;
  int32_T c1_b_convHeightIdx;
  int32_T c1_b_convImageIdx;
  int32_T c1_b_convWidthIdx;
  int32_T c1_b_innerIdx;
  int32_T c1_b_inputBaseOffset;
  int32_T c1_b_inputHeightIdx;
  int32_T c1_b_inputWidthIdx;
  int32_T c1_b_offset;
  int32_T c1_b_tmp;
  int32_T c1_b_widthIdx;
  int32_T c1_c_convHeightIdx;
  int32_T c1_c_convImageIdx;
  int32_T c1_c_convWidthIdx;
  int32_T c1_c_innerIdx;
  int32_T c1_c_inputBaseOffset;
  int32_T c1_c_inputHeightIdx;
  int32_T c1_c_inputWidthIdx;
  int32_T c1_c_tmp;
  int32_T c1_convHeightIdx;
  int32_T c1_convImageIdx;
  int32_T c1_convWidthIdx;
  int32_T c1_d_convHeightIdx;
  int32_T c1_d_convImageIdx;
  int32_T c1_d_convWidthIdx;
  int32_T c1_d_innerIdx;
  int32_T c1_d_inputBaseOffset;
  int32_T c1_d_inputHeightIdx;
  int32_T c1_d_inputWidthIdx;
  int32_T c1_d_tmp;
  int32_T c1_e_innerIdx;
  int32_T c1_e_tmp;
  int32_T c1_f_tmp;
  int32_T c1_heightIdx;
  int32_T c1_i;
  int32_T c1_innerDimStartIdx;
  int32_T c1_innerIdx;
  int32_T c1_inputBaseOffset;
  int32_T c1_inputHeightIdx;
  int32_T c1_inputWidthIdx;
  int32_T c1_offset;
  int32_T c1_outputMatrixHeight;
  int32_T c1_tmp;
  int32_T c1_widthIdx;
  int32_T c1_workGroupIdx;
  int32_T c1_workGroupOutputHeightIdx;
  int32_T c1_workItemIdx;
  int32_T c1_workItemOutputHeightIdx;
  int32_T c1_workItemOutputHeightIdxInWorkGroup;
  int32_T c1_workItemOutputWidthIdxInWorkGroup;
  real32_T c1_b_globalLoadRegA;
  real32_T c1_b_outputReg;
  real32_T c1_biasReg_w;
  real32_T c1_biasReg_x;
  real32_T c1_biasReg_y;
  real32_T c1_biasReg_z;
  real32_T c1_c_globalLoadRegA;
  real32_T c1_c_outputReg;
  real32_T c1_d_globalLoadRegA;
  real32_T c1_d_outputReg;
  real32_T c1_e_outputReg;
  real32_T c1_f_outputReg;
  real32_T c1_g_outputReg;
  real32_T c1_globalLoadRegA;
  real32_T c1_globalLoadRegB;
  real32_T c1_h_outputReg;
  real32_T c1_i_outputReg;
  real32_T c1_j_outputReg;
  real32_T c1_k_outputReg;
  real32_T c1_m_outputReg;
  real32_T c1_o_outputReg;
  real32_T c1_outputReg;
  real32_T c1_p_outputReg;
  real32_T c1_q_outputReg;
  real32_T c1_r_outputReg;
  real32_T *c1_sharedMemoryAPtr;
  real32_T *c1_sharedMemoryBPtr;
  c1_workItemIdx = static_cast<int32_T>(mwGetThreadIndexWithinBlock());
  c1_workGroupIdx = static_cast<int32_T>(mwGetBlockIndex());
  c1_workItemOutputHeightIdxInWorkGroup = (c1_workItemIdx % 8) << 2;
  c1_workItemOutputWidthIdxInWorkGroup = ((c1_div_nzp_s32_device(c1_workItemIdx,
    8, 0, 0U, 0, 0) % 4) << 2) + ((c1_div_nzp_s32_device(c1_workItemIdx, 32, 0,
    0U, 0, 0) % 2) << 4);
  c1_workGroupOutputHeightIdx = (c1_workGroupIdx % 788) << 5;
  c1_workItemOutputHeightIdx = c1_workGroupOutputHeightIdx +
    c1_workItemOutputHeightIdxInWorkGroup;
  c1_innerDimStartIdx = (c1_div_nzp_s32_device(c1_workGroupIdx, 788, 0, 0U, 0, 0)
    << 4) + 16;
  c1_outputReg = 0.0F;
  c1_b_outputReg = 0.0F;
  c1_c_outputReg = 0.0F;
  c1_d_outputReg = 0.0F;
  c1_e_outputReg = 0.0F;
  c1_f_outputReg = 0.0F;
  c1_g_outputReg = 0.0F;
  c1_h_outputReg = 0.0F;
  c1_i_outputReg = 0.0F;
  c1_j_outputReg = 0.0F;
  c1_k_outputReg = 0.0F;
  c1_m_outputReg = 0.0F;
  c1_o_outputReg = 0.0F;
  c1_p_outputReg = 0.0F;
  c1_q_outputReg = 0.0F;
  c1_r_outputReg = 0.0F;
  c1_sharedMemoryAPtr = (real32_T *)c1_sharedMemoryA;
  c1_sharedMemoryBPtr = (real32_T *)c1_sharedMemoryB;
  c1_heightIdx = c1_workGroupOutputHeightIdx + c1_workItemIdx % 8;
  c1_inputHeightIdx = c1_heightIdx % 6300;
  c1_inputWidthIdx = c1_div_nzp_s32_device(c1_heightIdx, 6300, 0, 0U, 0, 0) % 4;
  c1_inputBaseOffset = c1_inputHeightIdx + 6300 * c1_inputWidthIdx;
  c1_heightIdx = (c1_workGroupOutputHeightIdx + c1_workItemIdx % 8) + 8;
  c1_b_inputHeightIdx = c1_heightIdx % 6300;
  c1_b_inputWidthIdx = c1_div_nzp_s32_device(c1_heightIdx, 6300, 0, 0U, 0, 0) %
    4;
  c1_b_inputBaseOffset = c1_b_inputHeightIdx + 6300 * c1_b_inputWidthIdx;
  c1_heightIdx = (c1_workGroupOutputHeightIdx + c1_workItemIdx % 8) + 16;
  c1_tmp = c1_div_nzp_s32_device(c1_heightIdx, 6300, 0, 0U, 0, 0);
  c1_c_inputHeightIdx = c1_heightIdx % 6300;
  c1_c_inputWidthIdx = c1_tmp % 4;
  c1_c_inputBaseOffset = c1_c_inputHeightIdx + 6300 * (c1_c_inputWidthIdx +
    (c1_div_nzp_s32_device(c1_tmp, 4, 0, 0U, 0, 0) << 6));
  c1_outputMatrixHeight = c1_heightIdx;
  c1_heightIdx = (c1_workGroupOutputHeightIdx + c1_workItemIdx % 8) + 24;
  c1_b_tmp = c1_div_nzp_s32_device(c1_heightIdx, 6300, 0, 0U, 0, 0);
  c1_d_inputHeightIdx = c1_heightIdx % 6300;
  c1_d_inputWidthIdx = c1_b_tmp % 4;
  c1_d_inputBaseOffset = c1_d_inputHeightIdx + 6300 * (c1_d_inputWidthIdx +
    (c1_div_nzp_s32_device(c1_b_tmp, 4, 0, 0U, 0, 0) << 6));
  if (c1_workItemOutputWidthIdxInWorkGroup < 1) {
    c1_biasReg_x = ((float4 *)&c1_bias[c1_workItemOutputWidthIdxInWorkGroup])->x;
    c1_biasReg_y = ((float4 *)&c1_bias[c1_workItemOutputWidthIdxInWorkGroup])->y;
    c1_biasReg_z = ((float4 *)&c1_bias[c1_workItemOutputWidthIdxInWorkGroup])->z;
    c1_biasReg_w = ((float4 *)&c1_bias[c1_workItemOutputWidthIdxInWorkGroup])->w;
  }

  c1_innerIdx = (c1_innerDimStartIdx + c1_div_nzp_s32_device(c1_workItemIdx, 8,
    0, 0U, 0, 0)) - 16;
  if (c1_innerIdx < c1_innerDimStartIdx) {
    if ((static_cast<int32_T>(c1_inputHeightIdx >= 0)) && (static_cast<int32_T>
         (c1_inputWidthIdx >= 0))) {
      c1_globalLoadRegA = c1_inputTensor[c1_inputBaseOffset + c1_innerIdx *
        25200];
    } else {
      c1_globalLoadRegA = 0.0F;
    }

    if ((static_cast<int32_T>(c1_b_inputHeightIdx >= 0)) && (static_cast<int32_T>
         (c1_b_inputWidthIdx >= 0))) {
      c1_b_globalLoadRegA = c1_inputTensor[c1_b_inputBaseOffset + c1_innerIdx *
        25200];
    } else {
      c1_b_globalLoadRegA = 0.0F;
    }

    if ((static_cast<int32_T>(c1_outputMatrixHeight < 25200)) &&
        (static_cast<int32_T>((static_cast<int32_T>(c1_c_inputBaseOffset <
            403200)) && (static_cast<int32_T>((static_cast<int32_T>
             (c1_c_inputHeightIdx >= 0)) && (static_cast<int32_T>
             (c1_c_inputWidthIdx >= 0))))))) {
      c1_c_globalLoadRegA = c1_inputTensor[c1_c_inputBaseOffset + c1_innerIdx *
        25200];
    } else {
      c1_c_globalLoadRegA = 0.0F;
    }

    if ((static_cast<int32_T>(c1_heightIdx < 25200)) && (static_cast<int32_T>((
           static_cast<int32_T>(c1_d_inputBaseOffset < 403200)) && (static_cast<
           int32_T>((static_cast<int32_T>(c1_d_inputHeightIdx >= 0)) && (
             static_cast<int32_T>(c1_d_inputWidthIdx >= 0))))))) {
      c1_d_globalLoadRegA = c1_inputTensor[c1_d_inputBaseOffset + c1_innerIdx *
        25200];
    } else {
      c1_d_globalLoadRegA = 0.0F;
    }
  } else {
    c1_globalLoadRegA = 0.0F;
    c1_b_globalLoadRegA = 0.0F;
    c1_c_globalLoadRegA = 0.0F;
    c1_d_globalLoadRegA = 0.0F;
  }

  c1_b_innerIdx = (c1_innerDimStartIdx + c1_div_nzp_s32_device(c1_workItemIdx, 8,
    0, 0U, 0, 0)) - 16;
  c1_widthIdx = c1_workItemIdx % 8;
  if ((static_cast<int32_T>(c1_b_innerIdx < c1_innerDimStartIdx)) && (
       static_cast<int32_T>(c1_widthIdx < 1))) {
    c1_globalLoadRegB = c1_weights[c1_widthIdx + c1_b_innerIdx];
  } else {
    c1_globalLoadRegB = 0.0F;
  }

  c1_i = static_cast<int32_T>(c1_computeEndIdx_device(static_cast<int64_T>
    (c1_innerDimStartIdx - 16), static_cast<int64_T>(c1_innerDimStartIdx - 1),
    8LL));
  for (c1_c_innerIdx = 0; c1_c_innerIdx <= c1_i; c1_c_innerIdx++) {
    c1_offset = c1_workItemIdx % 8 + (c1_div_nzp_s32_device(c1_workItemIdx, 8, 0,
      0U, 0, 0) << 5);
    c1_sharedMemoryAPtr[c1_offset] = c1_globalLoadRegA;
    c1_sharedMemoryAPtr[c1_offset + 8] = c1_b_globalLoadRegA;
    c1_sharedMemoryAPtr[c1_offset + 16] = c1_c_globalLoadRegA;
    c1_sharedMemoryAPtr[c1_offset + 24] = c1_d_globalLoadRegA;
    c1_b_offset = c1_workItemIdx % 8 + (c1_div_nzp_s32_device(c1_workItemIdx, 8,
      0, 0U, 0, 0) << 5);
    c1_sharedMemoryBPtr[c1_b_offset] = c1_globalLoadRegB;
    c1_sharedMemoryBPtr[c1_b_offset + 8] = 0.0F;
    c1_sharedMemoryBPtr[c1_b_offset + 16] = 0.0F;
    c1_sharedMemoryBPtr[c1_b_offset + 24] = 0.0F;
    if ((c1_innerDimStartIdx + (c1_c_innerIdx << 3)) - 8 < c1_innerDimStartIdx)
    {
      c1_d_innerIdx = ((c1_innerDimStartIdx + (c1_c_innerIdx << 3)) +
                       c1_div_nzp_s32_device(c1_workItemIdx, 8, 0, 0U, 0, 0)) -
        8;
      if (c1_d_innerIdx < c1_innerDimStartIdx) {
        if ((static_cast<int32_T>(c1_inputHeightIdx >= 0)) &&
            (static_cast<int32_T>(c1_inputWidthIdx >= 0))) {
          c1_globalLoadRegA = c1_inputTensor[c1_inputBaseOffset + c1_d_innerIdx *
            25200];
        } else {
          c1_globalLoadRegA = 0.0F;
        }

        if ((static_cast<int32_T>(c1_b_inputHeightIdx >= 0)) &&
            (static_cast<int32_T>(c1_b_inputWidthIdx >= 0))) {
          c1_b_globalLoadRegA = c1_inputTensor[c1_b_inputBaseOffset +
            c1_d_innerIdx * 25200];
        } else {
          c1_b_globalLoadRegA = 0.0F;
        }

        if ((static_cast<int32_T>(c1_outputMatrixHeight < 25200)) && (
             static_cast<int32_T>((static_cast<int32_T>(c1_c_inputBaseOffset <
                403200)) && (static_cast<int32_T>((static_cast<int32_T>
                 (c1_c_inputHeightIdx >= 0)) && (static_cast<int32_T>
                 (c1_c_inputWidthIdx >= 0))))))) {
          c1_c_globalLoadRegA = c1_inputTensor[c1_c_inputBaseOffset +
            c1_d_innerIdx * 25200];
        } else {
          c1_c_globalLoadRegA = 0.0F;
        }

        if ((static_cast<int32_T>(c1_heightIdx < 25200)) && (static_cast<int32_T>
             ((static_cast<int32_T>(c1_d_inputBaseOffset < 403200)) && (
               static_cast<int32_T>((static_cast<int32_T>(c1_d_inputHeightIdx >=
                  0)) && (static_cast<int32_T>(c1_d_inputWidthIdx >= 0))))))) {
          c1_d_globalLoadRegA = c1_inputTensor[c1_d_inputBaseOffset +
            c1_d_innerIdx * 25200];
        } else {
          c1_d_globalLoadRegA = 0.0F;
        }
      } else {
        c1_globalLoadRegA = 0.0F;
        c1_b_globalLoadRegA = 0.0F;
        c1_c_globalLoadRegA = 0.0F;
        c1_d_globalLoadRegA = 0.0F;
      }

      c1_e_innerIdx = ((c1_innerDimStartIdx + (c1_c_innerIdx << 3)) +
                       c1_div_nzp_s32_device(c1_workItemIdx, 8, 0, 0U, 0, 0)) -
        8;
      c1_b_widthIdx = c1_workItemIdx % 8;
      if ((static_cast<int32_T>(c1_e_innerIdx < c1_innerDimStartIdx)) && (
           static_cast<int32_T>(c1_b_widthIdx < 1))) {
        c1_globalLoadRegB = c1_weights[c1_b_widthIdx + c1_e_innerIdx];
      } else {
        c1_globalLoadRegB = 0.0F;
      }
    }

    __syncthreads();
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 32];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 32];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 64];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 64];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 96];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 96];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 128];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 128];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 160];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 160];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 192];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 192];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    c1_regA = *(float4 *)
      &c1_sharedMemoryAPtr[c1_workItemOutputHeightIdxInWorkGroup + 224];
    c1_regB = *(float4 *)
      &c1_sharedMemoryBPtr[c1_workItemOutputWidthIdxInWorkGroup + 224];
    c1_outputReg += c1_regA.x * c1_regB.x;
    c1_b_outputReg += c1_regA.y * c1_regB.x;
    c1_c_outputReg += c1_regA.z * c1_regB.x;
    c1_d_outputReg += c1_regA.w * c1_regB.x;
    c1_e_outputReg += c1_regA.x * c1_regB.y;
    c1_f_outputReg += c1_regA.y * c1_regB.y;
    c1_g_outputReg += c1_regA.z * c1_regB.y;
    c1_h_outputReg += c1_regA.w * c1_regB.y;
    c1_i_outputReg += c1_regA.x * c1_regB.z;
    c1_j_outputReg += c1_regA.y * c1_regB.z;
    c1_k_outputReg += c1_regA.z * c1_regB.z;
    c1_m_outputReg += c1_regA.w * c1_regB.z;
    c1_o_outputReg += c1_regA.x * c1_regB.w;
    c1_p_outputReg += c1_regA.y * c1_regB.w;
    c1_q_outputReg += c1_regA.z * c1_regB.w;
    c1_r_outputReg += c1_regA.w * c1_regB.w;
    __syncthreads();
  }

  if (c1_workItemOutputHeightIdx < 25200) {
    c1_c_tmp = c1_div_nzp_s32_device(c1_workItemOutputHeightIdx, 6300, 0, 0U, 0,
      0);
    c1_convHeightIdx = c1_workItemOutputHeightIdx % 6300;
    c1_convWidthIdx = c1_c_tmp % 4;
    c1_convImageIdx = c1_div_nzp_s32_device(c1_c_tmp, 4, 0, 0U, 0, 0);
    if (c1_workItemOutputWidthIdxInWorkGroup < 1) {
      c1_outputTensor[c1_convHeightIdx + 6300 * (c1_convWidthIdx +
        ((c1_workItemOutputWidthIdxInWorkGroup + c1_convImageIdx) << 2))] =
        c1_outputReg + c1_biasReg_x;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup < 0) {
      c1_outputTensor[c1_convHeightIdx + 6300 * (c1_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_convImageIdx) + 1) << 2))] =
        c1_e_outputReg + c1_biasReg_y;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 2 < 1) {
      c1_outputTensor[c1_convHeightIdx + 6300 * (c1_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_convImageIdx) + 2) << 2))] =
        c1_i_outputReg + c1_biasReg_z;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 3 < 1) {
      c1_outputTensor[c1_convHeightIdx + 6300 * (c1_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_convImageIdx) + 3) << 2))] =
        c1_o_outputReg + c1_biasReg_w;
    }
  }

  if (c1_workItemOutputHeightIdx + 1 < 25200) {
    c1_d_tmp = c1_div_nzp_s32_device(c1_workItemOutputHeightIdx + 1, 6300, 0, 0U,
      0, 0);
    c1_b_convHeightIdx = (c1_workItemOutputHeightIdx + 1) % 6300;
    c1_b_convWidthIdx = c1_d_tmp % 4;
    c1_b_convImageIdx = c1_div_nzp_s32_device(c1_d_tmp, 4, 0, 0U, 0, 0);
    if (c1_workItemOutputWidthIdxInWorkGroup < 1) {
      c1_outputTensor[c1_b_convHeightIdx + 6300 * (c1_b_convWidthIdx +
        ((c1_workItemOutputWidthIdxInWorkGroup + c1_b_convImageIdx) << 2))] =
        c1_b_outputReg + c1_biasReg_x;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup < 0) {
      c1_outputTensor[c1_b_convHeightIdx + 6300 * (c1_b_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_b_convImageIdx) + 1) << 2))]
        = c1_f_outputReg + c1_biasReg_y;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 2 < 1) {
      c1_outputTensor[c1_b_convHeightIdx + 6300 * (c1_b_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_b_convImageIdx) + 2) << 2))]
        = c1_j_outputReg + c1_biasReg_z;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 3 < 1) {
      c1_outputTensor[c1_b_convHeightIdx + 6300 * (c1_b_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_b_convImageIdx) + 3) << 2))]
        = c1_p_outputReg + c1_biasReg_w;
    }
  }

  if (c1_workItemOutputHeightIdx + 2 < 25200) {
    c1_e_tmp = c1_div_nzp_s32_device(c1_workItemOutputHeightIdx + 2, 6300, 0, 0U,
      0, 0);
    c1_c_convHeightIdx = (c1_workItemOutputHeightIdx + 2) % 6300;
    c1_c_convWidthIdx = c1_e_tmp % 4;
    c1_c_convImageIdx = c1_div_nzp_s32_device(c1_e_tmp, 4, 0, 0U, 0, 0);
    if (c1_workItemOutputWidthIdxInWorkGroup < 1) {
      c1_outputTensor[c1_c_convHeightIdx + 6300 * (c1_c_convWidthIdx +
        ((c1_workItemOutputWidthIdxInWorkGroup + c1_c_convImageIdx) << 2))] =
        c1_c_outputReg + c1_biasReg_x;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup < 0) {
      c1_outputTensor[c1_c_convHeightIdx + 6300 * (c1_c_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_c_convImageIdx) + 1) << 2))]
        = c1_g_outputReg + c1_biasReg_y;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 2 < 1) {
      c1_outputTensor[c1_c_convHeightIdx + 6300 * (c1_c_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_c_convImageIdx) + 2) << 2))]
        = c1_k_outputReg + c1_biasReg_z;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 3 < 1) {
      c1_outputTensor[c1_c_convHeightIdx + 6300 * (c1_c_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_c_convImageIdx) + 3) << 2))]
        = c1_q_outputReg + c1_biasReg_w;
    }
  }

  if (c1_workItemOutputHeightIdx + 3 < 25200) {
    c1_f_tmp = c1_div_nzp_s32_device(c1_workItemOutputHeightIdx + 3, 6300, 0, 0U,
      0, 0);
    c1_d_convHeightIdx = (c1_workItemOutputHeightIdx + 3) % 6300;
    c1_d_convWidthIdx = c1_f_tmp % 4;
    c1_d_convImageIdx = c1_div_nzp_s32_device(c1_f_tmp, 4, 0, 0U, 0, 0);
    if (c1_workItemOutputWidthIdxInWorkGroup < 1) {
      c1_outputTensor[c1_d_convHeightIdx + 6300 * (c1_d_convWidthIdx +
        ((c1_workItemOutputWidthIdxInWorkGroup + c1_d_convImageIdx) << 2))] =
        c1_d_outputReg + c1_biasReg_x;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup < 0) {
      c1_outputTensor[c1_d_convHeightIdx + 6300 * (c1_d_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_d_convImageIdx) + 1) << 2))]
        = c1_h_outputReg + c1_biasReg_y;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 2 < 1) {
      c1_outputTensor[c1_d_convHeightIdx + 6300 * (c1_d_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_d_convImageIdx) + 2) << 2))]
        = c1_m_outputReg + c1_biasReg_z;
    }

    if (c1_workItemOutputWidthIdxInWorkGroup + 3 < 1) {
      c1_outputTensor[c1_d_convHeightIdx + 6300 * (c1_d_convWidthIdx +
        (((c1_workItemOutputWidthIdxInWorkGroup + c1_d_convImageIdx) + 3) << 2))]
        = c1_r_outputReg + c1_biasReg_w;
    }
  }
}

static __global__ __launch_bounds__(128, 1) void
  c1_ReduceNonFirstDimLargeFirstDimKernel(real32_T c1_input[403200], real32_T
  c1_output[25200], uint32_T c1_preReduceDimSize, uint32_T c1_reduceDimSize,
  uint32_T c1_level, uint32_T c1_offsetOfLevel[4], uint32_T
  c1_totalTempArraysSize, boolean_T c1_isLastLevel)
{
  __shared__ real32_T c1_shared[128];
  int32_T c1_i;
  int32_T c1_i1;
  real32_T c1_v_0;
  uint32_T c1_actualElemsPerThread;
  uint32_T c1_b_loadIdx;
  uint32_T c1_colIdx;
  uint32_T c1_gridSizeX;
  uint32_T c1_linearIdx;
  uint32_T c1_loadIdx;
  uint32_T c1_rowIdx;
  uint32_T c1_u;
  uint32_T c1_u1;
  uint32_T c1_warpId;
  c1_actualElemsPerThread = 32U;
  if (c1_reduceDimSize < 128U) {
    c1_actualElemsPerThread = static_cast<uint32_T>(static_cast<int32_T>
      ((c1_reduceDimSize - 1U) >> 2) + 1);
  }

  c1_gridSizeX = static_cast<uint32_T>(static_cast<int32_T>((c1_preReduceDimSize
    - 1U) >> 5) + 1);
  c1_u = c1_actualElemsPerThread << 2;
  if (c1_u == 0U) {
    c1_i = MAX_int32_T;
  } else {
    c1_i = static_cast<int32_T>((c1_reduceDimSize - 1U) / c1_u);
  }

  c1_u1 = c1_gridSizeX * static_cast<uint32_T>(c1_i + 1);
  if (c1_u1 == 0U) {
    c1_i1 = MAX_int32_T;
  } else {
    c1_i1 = static_cast<int32_T>(mwGetBlockIndex() / c1_u1);
  }

  c1_warpId = mwGetThreadIndexWithinBlock() >> 5;
  c1_rowIdx = ((mwGetBlockIndex() % (c1_gridSizeX * static_cast<uint32_T>(c1_i +
    1)) % c1_gridSizeX) << 5) + mwGetThreadIndexWithinBlock() % 32U;
  c1_colIdx = ((mwGetBlockIndex() % (c1_gridSizeX * static_cast<uint32_T>(c1_i +
    1)) / c1_gridSizeX * c1_actualElemsPerThread) << 2) + c1_warpId;
  c1_linearIdx = (c1_preReduceDimSize * c1_reduceDimSize * static_cast<uint32_T>
                  (c1_i1) + c1_preReduceDimSize * c1_colIdx) + c1_rowIdx;
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_rowIdx <
          c1_preReduceDimSize)) && (static_cast<int32_T>(c1_colIdx <
          c1_reduceDimSize)))) && (static_cast<int32_T>(c1_level == 0U))) {
    c1_shared[mwGetThreadIndexWithinBlock()] = c1_input[c1_linearIdx];
  }

  for (c1_loadIdx = 1U; c1_loadIdx < c1_actualElemsPerThread; c1_loadIdx++) {
    c1_linearIdx += c1_preReduceDimSize << 2;
    if ((static_cast<int32_T>(c1_rowIdx < c1_preReduceDimSize)) &&
        (static_cast<int32_T>(c1_colIdx + (c1_loadIdx << 2) < c1_reduceDimSize)))
    {
      if (c1_level == 0U) {
        c1_v_0 = c1_input[c1_linearIdx];
      }

      c1_shared[mwGetThreadIndexWithinBlock()] = fmaxf
        (c1_shared[mwGetThreadIndexWithinBlock()], c1_v_0);
    }
  }

  __syncthreads();
  if ((static_cast<int32_T>(c1_warpId == 0U)) && (static_cast<int32_T>(c1_rowIdx
        < c1_preReduceDimSize))) {
    c1_v_0 = c1_shared[mwGetThreadIndexWithinBlock()];
    c1_b_loadIdx = 1U;
    while ((static_cast<int32_T>(c1_b_loadIdx < 4U)) && (static_cast<int32_T>
            (c1_colIdx + c1_b_loadIdx < c1_reduceDimSize))) {
      c1_v_0 = fmaxf(c1_shared[mwGetThreadIndexWithinBlock() + (c1_b_loadIdx <<
        5)], c1_v_0);
      c1_b_loadIdx++;
    }

    if (c1_isLastLevel) {
      c1_output[static_cast<uint32_T>(c1_i1) * c1_preReduceDimSize + c1_rowIdx] =
        c1_v_0;
    }
  }
}

static __global__ __launch_bounds__(128, 1) void
  c1_b_ReduceNonFirstDimLargeFirstDimKernel(real32_T c1_input[403200], real32_T
  c1_output[25200], uint32_T c1_preReduceDimSize, uint32_T c1_reduceDimSize,
  uint32_T c1_level, uint32_T c1_offsetOfLevel[4], uint32_T
  c1_totalTempArraysSize, boolean_T c1_isLastLevel)
{
  __shared__ real32_T c1_shared[128];
  int32_T c1_i;
  int32_T c1_i1;
  real32_T c1_v_0;
  uint32_T c1_actualElemsPerThread;
  uint32_T c1_b_loadIdx;
  uint32_T c1_colIdx;
  uint32_T c1_gridSizeX;
  uint32_T c1_linearIdx;
  uint32_T c1_loadIdx;
  uint32_T c1_rowIdx;
  uint32_T c1_u;
  uint32_T c1_u1;
  uint32_T c1_warpId;
  c1_actualElemsPerThread = 32U;
  if (c1_reduceDimSize < 128U) {
    c1_actualElemsPerThread = static_cast<uint32_T>(static_cast<int32_T>
      ((c1_reduceDimSize - 1U) >> 2) + 1);
  }

  c1_gridSizeX = static_cast<uint32_T>(static_cast<int32_T>((c1_preReduceDimSize
    - 1U) >> 5) + 1);
  c1_u = c1_actualElemsPerThread << 2;
  if (c1_u == 0U) {
    c1_i = MAX_int32_T;
  } else {
    c1_i = static_cast<int32_T>((c1_reduceDimSize - 1U) / c1_u);
  }

  c1_u1 = c1_gridSizeX * static_cast<uint32_T>(c1_i + 1);
  if (c1_u1 == 0U) {
    c1_i1 = MAX_int32_T;
  } else {
    c1_i1 = static_cast<int32_T>(mwGetBlockIndex() / c1_u1);
  }

  c1_warpId = mwGetThreadIndexWithinBlock() >> 5;
  c1_rowIdx = ((mwGetBlockIndex() % (c1_gridSizeX * static_cast<uint32_T>(c1_i +
    1)) % c1_gridSizeX) << 5) + mwGetThreadIndexWithinBlock() % 32U;
  c1_colIdx = ((mwGetBlockIndex() % (c1_gridSizeX * static_cast<uint32_T>(c1_i +
    1)) / c1_gridSizeX * c1_actualElemsPerThread) << 2) + c1_warpId;
  c1_linearIdx = (c1_preReduceDimSize * c1_reduceDimSize * static_cast<uint32_T>
                  (c1_i1) + c1_preReduceDimSize * c1_colIdx) + c1_rowIdx;
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_rowIdx <
          c1_preReduceDimSize)) && (static_cast<int32_T>(c1_colIdx <
          c1_reduceDimSize)))) && (static_cast<int32_T>(c1_level == 0U))) {
    c1_shared[mwGetThreadIndexWithinBlock()] = c1_input[c1_linearIdx];
  }

  for (c1_loadIdx = 1U; c1_loadIdx < c1_actualElemsPerThread; c1_loadIdx++) {
    c1_linearIdx += c1_preReduceDimSize << 2;
    if ((static_cast<int32_T>(c1_rowIdx < c1_preReduceDimSize)) &&
        (static_cast<int32_T>(c1_colIdx + (c1_loadIdx << 2) < c1_reduceDimSize)))
    {
      if (c1_level == 0U) {
        c1_v_0 = c1_input[c1_linearIdx];
      }

      c1_shared[mwGetThreadIndexWithinBlock()] += c1_v_0;
    }
  }

  __syncthreads();
  if ((static_cast<int32_T>(c1_warpId == 0U)) && (static_cast<int32_T>(c1_rowIdx
        < c1_preReduceDimSize))) {
    c1_v_0 = c1_shared[mwGetThreadIndexWithinBlock()];
    c1_b_loadIdx = 1U;
    while ((static_cast<int32_T>(c1_b_loadIdx < 4U)) && (static_cast<int32_T>
            (c1_colIdx + c1_b_loadIdx < c1_reduceDimSize))) {
      c1_v_0 += c1_shared[mwGetThreadIndexWithinBlock() + (c1_b_loadIdx << 5)];
      c1_b_loadIdx++;
    }

    if (c1_isLastLevel) {
      c1_output[static_cast<uint32_T>(c1_i1) * c1_preReduceDimSize + c1_rowIdx] =
        c1_v_0;
    }
  }
}

static void c1_binary_expand_op(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T *c1_in1, c1_emxArray_real32_T *c1_in2)
{
  int32_T c1_aux_0_0;
  int32_T c1_aux_1_0;
  int32_T c1_b_in1;
  int32_T c1_b_in2;
  int32_T c1_c_in1;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_stride_0_0;
  int32_T c1_stride_1_0;
  real32_T c1_in1_data[6300];
  c1_b_in1 = c1_in1->size[0];
  c1_b_in2 = c1_in2->size[0];
  c1_c_in1 = c1_in1->size[0];
  c1_stride_0_0 = static_cast<int32_T>(c1_b_in1 != 1);
  c1_stride_1_0 = static_cast<int32_T>(c1_b_in2 != 1);
  c1_aux_0_0 = 0;
  c1_aux_1_0 = 0;
  for (c1_i = 0; c1_i < c1_c_in1; c1_i++) {
    c1_in1_data[c1_i] = (c1_in1->data[c1_aux_0_0 + c1_in1->size[0]] +
                         c1_in2->data[c1_aux_1_0 + c1_in2->size[0] * 3]) - 1.0F;
    c1_aux_1_0 += c1_stride_1_0;
    c1_aux_0_0 += c1_stride_0_0;
  }

  for (c1_i1 = 0; c1_i1 < c1_c_in1; c1_i1++) {
    c1_in1->data[c1_i1 + c1_in1->size[0] * 3] = c1_in1_data[c1_i1];
  }
}

static void c1_emxEnsureCapacity_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_emxArray, int32_T c1_oldNumel)
{
  int32_T c1_i;
  int32_T c1_newCapacity;
  int32_T c1_newNumel;
  void *c1_newData;
  if (c1_oldNumel < 0) {
    c1_oldNumel = 0;
  }

  c1_newNumel = 1;
  for (c1_i = 0; c1_i < c1_emxArray->numDimensions; c1_i++) {
    c1_newNumel *= c1_emxArray->size[c1_i];
  }

  if (c1_newNumel > c1_emxArray->allocatedSize) {
    c1_newCapacity = c1_emxArray->allocatedSize;
    if (c1_newCapacity < 16) {
      c1_newCapacity = 16;
    }

    while (c1_newCapacity < c1_newNumel) {
      if (c1_newCapacity > 1073741823) {
        c1_newCapacity = MAX_int32_T;
      } else {
        c1_newCapacity <<= 1;
      }
    }

    c1_newData = emlrtMallocMex(static_cast<uint32_T>(c1_newCapacity) * sizeof
      (real32_T));
    if (c1_emxArray->data != NULL) {
      memcpy(c1_newData, c1_emxArray->data, sizeof(real32_T)
             * static_cast<uint32_T>(c1_oldNumel));
      if (c1_emxArray->canFreeData) {
        emlrtFreeMex(c1_emxArray->data);
      }
    }

    c1_emxArray->data = static_cast<real32_T *>(c1_newData);
    c1_emxArray->allocatedSize = c1_newCapacity;
    c1_emxArray->canFreeData = true;
  }
}

static void c1_emxEnsureCapacity_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_emxArray, int32_T c1_oldNumel)
{
  int32_T c1_i;
  int32_T c1_newCapacity;
  int32_T c1_newNumel;
  void *c1_newData;
  if (c1_oldNumel < 0) {
    c1_oldNumel = 0;
  }

  c1_newNumel = 1;
  for (c1_i = 0; c1_i < c1_emxArray->numDimensions; c1_i++) {
    c1_newNumel *= c1_emxArray->size[c1_i];
  }

  if (c1_newNumel > c1_emxArray->allocatedSize) {
    c1_newCapacity = c1_emxArray->allocatedSize;
    if (c1_newCapacity < 16) {
      c1_newCapacity = 16;
    }

    while (c1_newCapacity < c1_newNumel) {
      if (c1_newCapacity > 1073741823) {
        c1_newCapacity = MAX_int32_T;
      } else {
        c1_newCapacity <<= 1;
      }
    }

    c1_newData = emlrtMallocMex(static_cast<uint32_T>(c1_newCapacity) * sizeof
      (real_T));
    if (c1_emxArray->data != NULL) {
      memcpy(c1_newData, c1_emxArray->data, sizeof(real_T)
             * static_cast<uint32_T>(c1_oldNumel));
      if (c1_emxArray->canFreeData) {
        emlrtFreeMex(c1_emxArray->data);
      }
    }

    c1_emxArray->data = static_cast<real_T *>(c1_newData);
    c1_emxArray->allocatedSize = c1_newCapacity;
    c1_emxArray->canFreeData = true;
  }
}

static void c1_emxInit_real32_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T **c1_pEmxArray, int32_T c1_numDimensions)
{
  c1_emxArray_real32_T *c1_emxArray;
  int32_T c1_i;
  *c1_pEmxArray = static_cast<c1_emxArray_real32_T *>(emlrtMallocMex(sizeof
    (c1_emxArray_real32_T)));
  c1_emxArray = *c1_pEmxArray;
  c1_emxArray->data = static_cast<real32_T *>(NULL);
  c1_emxArray->numDimensions = c1_numDimensions;
  c1_emxArray->size = static_cast<int32_T *>(emlrtMallocMex(sizeof(int32_T) *
    static_cast<uint32_T>(c1_numDimensions)));
  c1_emxArray->allocatedSize = 0;
  c1_emxArray->canFreeData = true;
  for (c1_i = 0; c1_i < c1_numDimensions; c1_i++) {
    c1_emxArray->size[c1_i] = 0;
  }
}

static void c1_emxInitStruct_dlarray_38(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T **c1_pStruct_Data)
{
  c1_emxInit_real32_T(chartInstance, c1_pStruct_Data, 2);
}

static void c1_emxInit_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T **c1_pEmxArray, int32_T c1_numDimensions)
{
  c1_emxArray_real_T *c1_emxArray;
  int32_T c1_i;
  *c1_pEmxArray = static_cast<c1_emxArray_real_T *>(emlrtMallocMex(sizeof
    (c1_emxArray_real_T)));
  c1_emxArray = *c1_pEmxArray;
  c1_emxArray->data = static_cast<real_T *>(NULL);
  c1_emxArray->numDimensions = c1_numDimensions;
  c1_emxArray->size = static_cast<int32_T *>(emlrtMallocMex(sizeof(int32_T) *
    static_cast<uint32_T>(c1_numDimensions)));
  c1_emxArray->allocatedSize = 0;
  c1_emxArray->canFreeData = true;
  for (c1_i = 0; c1_i < c1_numDimensions; c1_i++) {
    c1_emxArray->size[c1_i] = 0;
  }
}

static void c1_emxFree_real32_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real32_T **c1_pEmxArray)
{
  if (*c1_pEmxArray != static_cast<c1_emxArray_real32_T *>(NULL)) {
    if (((*c1_pEmxArray)->data != static_cast<real32_T *>(NULL)) &&
        (*c1_pEmxArray)->canFreeData) {
      emlrtFreeMex((*c1_pEmxArray)->data);
    }

    emlrtFreeMex((*c1_pEmxArray)->size);
    emlrtFreeMex(*c1_pEmxArray);
    *c1_pEmxArray = static_cast<c1_emxArray_real32_T *>(NULL);
  }
}

static void c1_emxFreeStruct_dlarray_38(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T **c1_pStruct_Data)
{
  c1_emxFree_real32_T(chartInstance, c1_pStruct_Data);
}

static void c1_emxFree_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T **c1_pEmxArray)
{
  if (*c1_pEmxArray != static_cast<c1_emxArray_real_T *>(NULL)) {
    if (((*c1_pEmxArray)->data != static_cast<real_T *>(NULL)) && (*c1_pEmxArray)
        ->canFreeData) {
      emlrtFreeMex((*c1_pEmxArray)->data);
    }

    emlrtFreeMex((*c1_pEmxArray)->size);
    emlrtFreeMex(*c1_pEmxArray);
    *c1_pEmxArray = static_cast<c1_emxArray_real_T *>(NULL);
  }
}

static void c1_emxConvertDynamicMatrixFromEmx_(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance, c1_emxArray_real32_T_100x4 *c1_emx, real32_T c1_data[400],
  int32_T c1_size[2])
{
  memcpy((void *)c1_data, &c1_emx->data, sizeof(real32_T) * static_cast<uint32_T>
         (c1_emx->size[0] * c1_emx->size[1]));
  memcpy((void *)c1_size, &c1_emx->size, sizeof(int32_T) << 1);
}

static void c1_b_emxConvertDynamicMatrixFromEmx_
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance, c1_emxArray_real32_T_100x1
   *c1_emx, real32_T c1_data[100], int32_T c1_size[2])
{
  memcpy((void *)c1_data, &c1_emx->data, sizeof(real32_T) * static_cast<uint32_T>
         (c1_emx->size[0] * c1_emx->size[1]));
  memcpy((void *)c1_size, &c1_emx->size, sizeof(int32_T) << 1);
}

static int64_T c1_div_nzp_s64(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  int64_T c1_numerator, int64_T c1_denominator, int32_T c1_EMLOvCount_src_loc,
  uint32_T c1_ssid_src_loc, int32_T c1_offset_src_loc, int32_T c1_length_src_loc)
{
  int64_T c1_quotient;
  uint64_T c1_tempAbsQuotient;
  uint64_T c1_u;
  uint64_T c1_u1;
  if (c1_numerator < 0LL) {
    c1_u = ~static_cast<uint64_T>(c1_numerator) + 1ULL;
  } else {
    c1_u = static_cast<uint64_T>(c1_numerator);
  }

  if (c1_denominator < 0LL) {
    c1_u1 = ~static_cast<uint64_T>(c1_denominator) + 1ULL;
  } else {
    c1_u1 = static_cast<uint64_T>(c1_denominator);
  }

  c1_tempAbsQuotient = c1_u / c1_u1;
  if (static_cast<int32_T>(c1_numerator < 0LL) != static_cast<int32_T>
      (c1_denominator < 0LL)) {
    c1_quotient = -static_cast<int64_T>(c1_tempAbsQuotient);
  } else {
    c1_quotient = static_cast<int64_T>(c1_tempAbsQuotient);
  }

  return c1_quotient;
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel1
  (int16_T c1_aux1[960])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 960) {
    if (c1_i + 1 <= 480) {
      c1_aux1[c1_i] = static_cast<int16_T>(c1_i + 1);
    } else {
      c1_aux1[c1_i] = static_cast<int16_T>(960 - c1_i);
    }
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel2
  (int16_T c1_aux2[1280])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 1280) {
    if (c1_i + 1 <= 640) {
      c1_aux2[c1_i] = static_cast<int16_T>(c1_i + 1);
    } else {
      c1_aux2[c1_i] = static_cast<int16_T>(1280 - c1_i);
    }
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel3(
  const int16_T c1_aux1[960], int16_T c1_ipRowIndices[960], int8_T
  c1_rowWeights[960])
{
  uint64_T c1_gThreadId;
  int32_T c1_j_l;
  int32_T c1_k;
  int32_T c1_oldIdx;
  int32_T c1_rowIdx;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 2ULL);
  c1_rowIdx = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_k)) /
    2ULL);
  if ((static_cast<int32_T>(c1_rowIdx < 480)) && (static_cast<int32_T>(c1_k < 2)))
  {
    c1_rowWeights[c1_rowIdx + 480 * c1_k] = static_cast<int8_T>((1 - c1_k) *
      static_cast<int32_T>(-c1_k < 0) + (c1_k + 1) * static_cast<int32_T>(-c1_k >=
      0));
    c1_oldIdx = (c1_rowIdx + c1_k) + 1;
    c1_j_l = c1_oldIdx - 1;
    if (c1_oldIdx - 1 == 0) {
      c1_j_l = 0;
    }

    c1_ipRowIndices[c1_rowIdx + 480 * c1_k] = c1_aux1[c1_j_l];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel4(
  const int16_T c1_aux2[1280], int16_T c1_ipColIndices[1280], int8_T
  c1_colWeights[1280])
{
  uint64_T c1_gThreadId;
  int32_T c1_colIdx;
  int32_T c1_j_l;
  int32_T c1_k;
  int32_T c1_oldIdx;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 2ULL);
  c1_colIdx = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_k)) /
    2ULL);
  if ((static_cast<int32_T>(c1_colIdx < 640)) && (static_cast<int32_T>(c1_k < 2)))
  {
    c1_colWeights[c1_colIdx + 640 * c1_k] = static_cast<int8_T>((1 - c1_k) *
      static_cast<int32_T>(-c1_k < 0) + (c1_k + 1) * static_cast<int32_T>(-c1_k >=
      0));
    c1_oldIdx = (c1_colIdx + c1_k) + 1;
    c1_j_l = c1_oldIdx - 1;
    if (c1_oldIdx - 1 == 0) {
      c1_j_l = 0;
    }

    c1_ipColIndices[c1_colIdx + 640 * c1_k] = c1_aux2[c1_j_l];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel5(
  const int8_T c1_rowWeights[960], real_T c1_rowWeightsTotal[480])
{
  int32_T c1_j;
  c1_j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_j < 480) {
    c1_rowWeightsTotal[c1_j] = static_cast<real_T>(c1_rowWeights[c1_j]);
    c1_rowWeightsTotal[c1_j] += static_cast<real_T>(c1_rowWeights[c1_j + 480]);
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel6(
  const int8_T c1_colWeights[1280], real_T c1_colWeightsTotal[640])
{
  int32_T c1_j;
  c1_j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_j < 640) {
    c1_colWeightsTotal[c1_j] = static_cast<real_T>(c1_colWeights[c1_j]);
    c1_colWeightsTotal[c1_j] += static_cast<real_T>(c1_colWeights[c1_j + 640]);
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel7(
  const real_T c1_rowWeightsTotal[480], const int8_T c1_rowWeights[960], const
  uint8_T c1_b_image[921600], const int16_T c1_ipRowIndices[960], uint8_T
  c1_partialResize[921600])
{
  real_T c1_d;
  real_T c1_sumVal;
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_colIdx;
  int32_T c1_dimIdx;
  int32_T c1_j_l;
  int32_T c1_rowIdx;
  uint8_T c1_u;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_dimIdx = static_cast<int32_T>(c1_gThreadId % 3ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_dimIdx)) / 3ULL;
  c1_rowIdx = static_cast<int32_T>(c1_tmpIndex % 480ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_rowIdx)) / 480ULL;
  c1_colIdx = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_colIdx < 640)) && (
         static_cast<int32_T>(c1_rowIdx < 480)))) && (static_cast<int32_T>
       (c1_dimIdx < 3))) {
    c1_sumVal = 0.0;
    for (c1_j_l = 0; c1_j_l < 2; c1_j_l++) {
      c1_sumVal += static_cast<real_T>(c1_b_image[((static_cast<int32_T>
        (c1_ipRowIndices[c1_rowIdx + 480 * c1_j_l]) + 480 * c1_colIdx) + 307200 *
        (2 - c1_dimIdx)) - 1]) * (static_cast<real_T>(c1_rowWeights[c1_rowIdx +
        480 * c1_j_l]) / c1_rowWeightsTotal[c1_rowIdx]);
    }

    c1_d = round(c1_sumVal);
    if (c1_d < 256.0) {
      c1_u = static_cast<uint8_T>(c1_d);
    } else if (c1_d >= 256.0) {
      c1_u = MAX_uint8_T;
    } else {
      c1_u = static_cast<uint8_T>(0U);
    }

    c1_partialResize[(c1_rowIdx + 480 * c1_colIdx) + 307200 * c1_dimIdx] = c1_u;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel8(
  const real_T c1_colWeightsTotal[640], const int8_T c1_colWeights[1280], const
  uint8_T c1_partialResize[921600], const int16_T c1_ipColIndices[1280], uint8_T
  c1_out[921600])
{
  real_T c1_d;
  real_T c1_sumVal;
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_colIdx;
  int32_T c1_dimIdx;
  int32_T c1_j_l;
  int32_T c1_rowIdx;
  uint8_T c1_u;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_dimIdx = static_cast<int32_T>(c1_gThreadId % 3ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_dimIdx)) / 3ULL;
  c1_rowIdx = static_cast<int32_T>(c1_tmpIndex % 480ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_rowIdx)) / 480ULL;
  c1_colIdx = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_colIdx < 640)) && (
         static_cast<int32_T>(c1_rowIdx < 480)))) && (static_cast<int32_T>
       (c1_dimIdx < 3))) {
    c1_sumVal = 0.0;
    for (c1_j_l = 0; c1_j_l < 2; c1_j_l++) {
      c1_sumVal += static_cast<real_T>(c1_partialResize[(c1_rowIdx + 480 * (
        static_cast<int32_T>(c1_ipColIndices[c1_colIdx + 640 * c1_j_l]) - 1)) +
        307200 * c1_dimIdx]) * (static_cast<real_T>(c1_colWeights[c1_colIdx +
        640 * c1_j_l]) / c1_colWeightsTotal[c1_colIdx]);
    }

    c1_d = round(c1_sumVal);
    if (c1_d < 256.0) {
      c1_u = static_cast<uint8_T>(c1_d);
    } else if (c1_d >= 256.0) {
      c1_u = MAX_uint8_T;
    } else {
      c1_u = static_cast<uint8_T>(0U);
    }

    c1_out[(c1_rowIdx + 480 * c1_colIdx) + 307200 * c1_dimIdx] = c1_u;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel9(
  const uint8_T c1_out[921600], uint8_T c1_img[921600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_j;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 480ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 480ULL;
  c1_j = static_cast<int32_T>(c1_tmpIndex % 640ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_j)) / 640ULL;
  c1_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_k < 3)) &&
        (static_cast<int32_T>(c1_j < 640)))) && (static_cast<int32_T>(c1_i < 480)))
  {
    c1_img[(c1_i + 480 * c1_j) + 307200 * c1_k] = c1_out[(c1_i + 480 * c1_j) +
      307200 * c1_k];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel10(
  const uint8_T c1_img[921600], uint8_T c1_partialResize[921600])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 921600) {
    c1_partialResize[c1_i] = c1_img[c1_i];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel11(
  const uint8_T c1_partialResize[921600], uint8_T c1_img[921600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_j;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 480ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 480ULL;
  c1_j = static_cast<int32_T>(c1_tmpIndex % 640ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_j)) / 640ULL;
  c1_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_k < 3)) &&
        (static_cast<int32_T>(c1_j < 640)))) && (static_cast<int32_T>(c1_i < 480)))
  {
    c1_img[(c1_i + 480 * c1_j) + 307200 * c1_k] = c1_partialResize[(c1_i + 480 *
      c1_j) + 307200 * c1_k];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel12(
  const uint8_T c1_img[921600], real32_T c1_expl_temp_Data[921600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 480ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 480ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 640ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 640ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 3)) &&
        (static_cast<int32_T>(c1_i1 < 640)))) && (static_cast<int32_T>(c1_i <
        480))) {
    c1_expl_temp_Data[(c1_i + 480 * c1_i1) + 307200 * c1_i2] =
      static_cast<real32_T>(c1_img[(c1_i + 480 * c1_i1) + 307200 * (2 - c1_i2)])
      / 255.0F;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel13(
  const real32_T c1_objX_Data[691200], real32_T c1_objdata[691200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 60ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 60ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 80ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 80ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 144)) && (
         static_cast<int32_T>(c1_b_k < 80)))) && (static_cast<int32_T>(c1_k < 60)))
  {
    c1_objdata[(c1_b_k + 80 * c1_k) + 4800 * c1_c_k] = c1_objX_Data[(c1_k + 60 *
      c1_b_k) + 4800 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel14(
  const real32_T c1_objX_Data[172800], real32_T c1_objdata[172800])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 30ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 30ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 40ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 40ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 144)) && (
         static_cast<int32_T>(c1_b_k < 40)))) && (static_cast<int32_T>(c1_k < 30)))
  {
    c1_objdata[(c1_b_k + 40 * c1_k) + 1200 * c1_c_k] = c1_objX_Data[(c1_k + 30 *
      c1_b_k) + 1200 * c1_c_k];
  }
}

static __global__ __launch_bounds__(448, 1) void c1_c1_ex_DLModel_28_kernel15(
  const real32_T c1_objX_Data[43200], real32_T c1_objdata[43200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 15ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 15ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 20ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 20ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 144)) && (
         static_cast<int32_T>(c1_b_k < 20)))) && (static_cast<int32_T>(c1_k < 15)))
  {
    c1_objdata[(c1_b_k + 20 * c1_k) + 300 * c1_c_k] = c1_objX_Data[(c1_k + 15 *
      c1_b_k) + 300 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel16(
  const real32_T c1_objdata[691200], real32_T c1_matrixToCat[691200])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 144ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    144ULL);
  if ((static_cast<int32_T>(c1_i1 < 4800)) && (static_cast<int32_T>(c1_i < 144)))
  {
    c1_matrixToCat[c1_i + 144 * c1_i1] = c1_objdata[c1_i1 + 4800 * c1_i];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel17(
  const real32_T c1_objdata[172800], real32_T c1_matrixToCat[172800])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 144ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    144ULL);
  if ((static_cast<int32_T>(c1_i1 < 1200)) && (static_cast<int32_T>(c1_i < 144)))
  {
    c1_matrixToCat[c1_i + 144 * c1_i1] = c1_objdata[c1_i1 + 1200 * c1_i];
  }
}

static __global__ __launch_bounds__(448, 1) void c1_c1_ex_DLModel_28_kernel18(
  const real32_T c1_objdata[43200], real32_T c1_matrixToCat[43200])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 144ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    144ULL);
  if ((static_cast<int32_T>(c1_i1 < 300)) && (static_cast<int32_T>(c1_i < 144)))
  {
    c1_matrixToCat[c1_i + 144 * c1_i1] = c1_objdata[c1_i1 + 300 * c1_i];
  }
}

static __global__ __launch_bounds__(448, 1) void c1_c1_ex_DLModel_28_kernel19(
  const real32_T c1_matrixToCat[43200], const int32_T c1_iy, real32_T
  c1_intermediateResult[907200])
{
  int32_T c1_j;
  c1_j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_j < 43200) {
    c1_intermediateResult[(c1_iy + c1_j) + 1] = c1_matrixToCat[c1_j];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel20(
  const real32_T c1_intermediateResult[907200], real32_T c1_out_Data[907200])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_i1 < 144)) && (static_cast<int32_T>(c1_i < 6300)))
  {
    c1_out_Data[c1_i + 6300 * c1_i1] = c1_intermediateResult[c1_i1 + 144 * c1_i];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel21(
  const real32_T c1_out_Data[907200], real32_T c1_b_x[504000])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_i1 < 80)) && (static_cast<int32_T>(c1_i < 6300)))
  {
    c1_b_x[c1_i + 6300 * c1_i1] = -c1_out_Data[c1_i + 6300 * (c1_i1 + 64)];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel22
  (real32_T c1_splitout2_Data[504000], real32_T c1_b_x[504000])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 504000) {
    c1_b_x[c1_k] = expf(c1_b_x[c1_k]);
    c1_splitout2_Data[c1_k] = 1.0F / (c1_b_x[c1_k] + 1.0F);
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel23(
  const real32_T c1_out_Data[907200], real32_T c1_objX_Data[403200])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 403200) {
    c1_objX_Data[c1_i] = c1_out_Data[c1_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel24
  (uint32_T c1_offsetOfLevel[4])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_offsetOfLevel[0U] = 0U;
    c1_offsetOfLevel[1U] = 0U;
    c1_offsetOfLevel[2U] = 0U;
    c1_offsetOfLevel[3U] = 0U;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel25(
  const real32_T c1_maxVal[25200], const real32_T c1_objX_Data[403200], real32_T
  c1_xdata[403200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 6300ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 16ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 16ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 4)) &&
        (static_cast<int32_T>(c1_i1 < 16)))) && (static_cast<int32_T>(c1_i <
        6300))) {
    c1_xdata[(c1_i + 6300 * c1_i1) + 100800 * c1_i2] = c1_objX_Data[(c1_i + 6300
      * c1_i1) + 100800 * c1_i2] - c1_maxVal[c1_i + 6300 * c1_i2];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel26
  (real32_T c1_xdata[403200])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 403200) {
    c1_xdata[c1_k] = expf(c1_xdata[c1_k]);
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel27
  (uint32_T c1_offsetOfLevel[4])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_offsetOfLevel[0U] = 0U;
    c1_offsetOfLevel[1U] = 0U;
    c1_offsetOfLevel[2U] = 0U;
    c1_offsetOfLevel[3U] = 0U;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel28(
  const real32_T c1_maxVal[25200], const real32_T c1_xdata[403200], real32_T
  c1_b_obj_Data[403200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 6300ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 16ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 16ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 4)) &&
        (static_cast<int32_T>(c1_i1 < 16)))) && (static_cast<int32_T>(c1_i <
        6300))) {
    c1_b_obj_Data[(c1_i + 6300 * c1_i1) + 100800 * c1_i2] = c1_xdata[(c1_i +
      6300 * c1_i1) + 100800 * c1_i2] / c1_maxVal[c1_i + 6300 * c1_i2];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel29(
  const real32_T c1_b_obj_Data[403200], real32_T c1_xdata[403200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 6300ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 16ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 16ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 4)) && (static_cast<
         int32_T>(c1_b_k < 16)))) && (static_cast<int32_T>(c1_k < 6300))) {
    c1_xdata[(c1_k + 6300 * c1_c_k) + 25200 * c1_b_k] = c1_b_obj_Data[(c1_k +
      6300 * c1_b_k) + 100800 * c1_c_k];
  }
}

static __global__ __launch_bounds__(256, 1) void c1_c1_ex_DLModel_28_kernel30(
  const real32_T c1_objX_Data[25200], real32_T c1_splitoutFc[25200], real32_T
  c1_maxVal[25200])
{
  uint64_T c1_gThreadId;
  int32_T c1_b_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_b_k = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_k)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_b_k < 4)) && (static_cast<int32_T>(c1_k < 6300)))
  {
    c1_maxVal[c1_b_k + (c1_k << 2)] = c1_objX_Data[c1_k + 6300 * c1_b_k];
    c1_splitoutFc[c1_k + 6300 * c1_b_k] = c1_maxVal[c1_b_k + (c1_k << 2)];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel31
  (real_T c1_centersArray[12600])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 12600) {
    c1_centersArray[c1_i] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel32
  (real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[0] = 0.5;
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel33(
  const real_T c1_b1, const int32_T c1_ndbl, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_ndbl - 1] = c1_b1;
  }
}

static uint64_T c1_computeNumIters(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, int32_T c1_ub)
{
  uint64_T c1_n;
  c1_n = 0ULL;
  if (c1_ub >= 0) {
    c1_n = static_cast<uint64_T>(c1_ub + 1);
  }

  return c1_n;
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel34(
  const real_T c1_b1, const int32_T c1_n, const int32_T c1_i, real_T c1_y_data
  [80])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_y_data[c1_k + 1] = (static_cast<real_T>(c1_k) + 1.0) + 0.5;
    c1_y_data[(c1_n - c1_k) - 2] = c1_b1 - (static_cast<real_T>(c1_k) + 1.0);
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel35(
  const real_T c1_b1, const int32_T c1_nm1d2, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_nm1d2] = (c1_b1 + 0.5) / 2.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel36
  (real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[0] = 0.5;
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel37(
  const real_T c1_b1, const int32_T c1_ndbl, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_ndbl - 1] = c1_b1;
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel38(
  const real_T c1_b1, const int32_T c1_n, const int32_T c1_i1, real_T c1_y_data
  [80])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i1);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_y_data[c1_k + 1] = (static_cast<real_T>(c1_k) + 1.0) + 0.5;
    c1_y_data[(c1_n - c1_k) - 2] = c1_b1 - (static_cast<real_T>(c1_k) + 1.0);
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel39(
  const real_T c1_b1, const int32_T c1_nm1d2, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_nm1d2] = (c1_b1 + 0.5) / 2.0;
  }
}

static uint64_T c1_b_computeNumIters(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, int32_T c1_ub, int32_T c1_b_ub)
{
  uint64_T c1_n;
  uint64_T c1_numIters;
  boolean_T c1_overflow;
  c1_overflow = false;
  c1_n = 0ULL;
  if (c1_ub >= 0) {
    c1_n = static_cast<uint64_T>(c1_ub + 1);
  }

  c1_numIters = c1_n;
  c1_n = 0ULL;
  if (c1_b_ub >= 0) {
    c1_n = static_cast<uint64_T>(c1_b_ub + 1);
    if (c1_numIters > MAX_uint64_T / c1_n) {
      c1_overflow = true;
    }
  }

  c1_numIters *= c1_n;
  if (c1_overflow) {
    c1_c_gpuThrowError(chartInstance, __FILE__, __LINE__);
  }

  return c1_numIters;
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel40(
  const real_T c1_y_data[80], const int32_T c1_Y_size_dim0, const real_T
  c1_b_y_data[80], const int32_T c1_X_size_dim0, const int32_T c1_i, const
  int32_T c1_i1, real_T c1_c_Y_data[4800], real_T c1_b_X_data[4800])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_c_i;
  int32_T c1_j;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = (static_cast<uint64_T>(c1_i1) + 1ULL) * (static_cast<uint64_T>
    (c1_i) + 1ULL) - 1ULL;
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_c_i = static_cast<int32_T>(c1_idx % (static_cast<uint64_T>(c1_i) + 1ULL));
    c1_j = static_cast<int32_T>((c1_idx - static_cast<uint64_T>(c1_c_i)) / (
      static_cast<uint64_T>(c1_i) + 1ULL));
    c1_b_X_data[c1_c_i + c1_X_size_dim0 * c1_j] = c1_b_y_data[c1_j];
    c1_c_Y_data[c1_c_i + c1_Y_size_dim0 * c1_j] = c1_y_data[c1_c_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel41(
  const real_T c1_c_Y_data[4800], const int32_T c1_loop_ub, c1_emxArray_real_T
  c1_centers)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_loop_ub);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_centers.data[c1_i] = c1_c_Y_data[c1_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel42(
  const real_T c1_b_X_data[4800], const int32_T c1_loop_ub, c1_emxArray_real_T
  c1_centers, int32_T c1_centers_dim0)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_loop_ub);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_centers.data[c1_i + c1_centers_dim0] = c1_b_X_data[c1_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel43(
  const c1_emxArray_real_T c1_centers, const int32_T c1_i2, const int32_T c1_i3,
  real_T c1_centersArray[12600], int32_T c1_centers_dim0)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = 2ULL * (static_cast<uint64_T>(c1_i3) + 1ULL) - 1ULL;
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx % (static_cast<uint64_T>(c1_i3) + 1ULL));
    c1_i1 = static_cast<int32_T>((c1_idx - static_cast<uint64_T>(c1_i)) / (
      static_cast<uint64_T>(c1_i3) + 1ULL));
    c1_centersArray[(c1_i2 + c1_i) + 6300 * c1_i1] = c1_centers.data[c1_i +
      c1_centers_dim0 * c1_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel44(
  const real_T c1_b1, const int32_T c1_nm1d2, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_nm1d2] = static_cast<real_T>(c1_nm1d2) + 0.5;
    c1_y_data[c1_nm1d2 + 1] = c1_b1 - static_cast<real_T>(c1_nm1d2);
  }
}

static __global__ __launch_bounds__(32, 1) void c1_c1_ex_DLModel_28_kernel45(
  const real_T c1_b1, const int32_T c1_nm1d2, real_T c1_y_data[80])
{
  int32_T c1_tmpIdx;
  c1_tmpIdx = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_tmpIdx < 1) {
    c1_y_data[c1_nm1d2] = static_cast<real_T>(c1_nm1d2) + 0.5;
    c1_y_data[c1_nm1d2 + 1] = c1_b1 - static_cast<real_T>(c1_nm1d2);
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel46(
  const real_T c1_centersArray[12600], real32_T c1_ConstantArray1[12600])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 12600) {
    c1_ConstantArray1[c1_i] = static_cast<real32_T>(c1_centersArray[c1_i]);
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel47(
  const real32_T c1_splitoutFc[25200], real32_T c1_ConstantArray1[12600],
  real32_T c1_sub1[12600])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_i1 < 2)) && (static_cast<int32_T>(c1_i < 6300)))
  {
    c1_sub1[c1_i + 6300 * c1_i1] = c1_ConstantArray1[c1_i + 6300 * c1_i1] -
      c1_splitoutFc[c1_i + 6300 * c1_i1];
    c1_ConstantArray1[c1_i + 6300 * c1_i1] += c1_splitoutFc[c1_i + 6300 * (c1_i1
      + 2)];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel48(
  const real32_T c1_sub1[12600], real32_T c1_ConstantArray1[12600], real32_T
  c1_varargin_1[12600])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 12600) {
    c1_varargin_1[c1_i] = (c1_sub1[c1_i] + c1_ConstantArray1[c1_i]) / 2.0F;
    c1_ConstantArray1[c1_i] -= c1_sub1[c1_i];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel49(
  const real32_T c1_ConstantArray1[12600], const int32_T c1_iy, real32_T
  c1_maxVal[25200])
{
  int32_T c1_j;
  c1_j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_j < 12600) {
    c1_maxVal[(c1_iy + c1_j) + 1] = c1_ConstantArray1[c1_j];
  }
}

static __global__ __launch_bounds__(256, 1) void c1_c1_ex_DLModel_28_kernel50(
  const int8_T c1_fv[6300], const real32_T c1_maxVal[25200], real32_T
  c1_dataArgs_f1[25200])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_i1 < 4)) && (static_cast<int32_T>(c1_i < 6300)))
  {
    c1_dataArgs_f1[c1_i + 6300 * c1_i1] = c1_maxVal[c1_i + 6300 * c1_i1] *
      static_cast<real32_T>(c1_fv[c1_i]);
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel51(
  const real32_T c1_splitout2_Data[504000], const int32_T c1_iy, real32_T
  c1_intermediateResult[529200])
{
  int32_T c1_j;
  c1_j = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_j < 504000) {
    c1_intermediateResult[(c1_iy + c1_j) + 1] = c1_splitout2_Data[c1_j];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel52
  (int32_T c1_processedVarargin_f1[6300])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 6300) {
    c1_processedVarargin_f1[c1_i] = c1_i + 1;
  }
}

static __global__ __launch_bounds__(96, 1) void c1_c1_ex_DLModel_28_kernel53
  (real_T c1_processedVarargin_f2[80])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 80) {
    c1_processedVarargin_f2[c1_i] = static_cast<real_T>(c1_i) + 5.0;
  }
}

static __global__ __launch_bounds__(512, 1) void c1_c1_ex_DLModel_28_kernel54(
  const real32_T c1_intermediateResult[529200], real32_T c1_c_x_Data[504000])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 6300ULL);
  c1_i1 = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_i)) /
    6300ULL);
  if ((static_cast<int32_T>(c1_i1 < 80)) && (static_cast<int32_T>(c1_i < 6300)))
  {
    c1_c_x_Data[c1_i + 6300 * c1_i1] = c1_intermediateResult[c1_i + 6300 *
      (c1_i1 + 4)];
  }
}

static __global__ __launch_bounds__(128, 1) void c1_c1_ex_DLModel_28_kernel55(
  const real32_T c1_intermediateResult[529200], const real_T
  c1_processedVarargin_f2[80], const int32_T c1_processedVarargin_f1[6300],
  const real32_T c1_c_x_Data[504000], real32_T c1_xdata[6300])
{
  int32_T c1_i;
  int32_T c1_ix;
  int32_T c1_v;
  boolean_T c1_p;
  c1_v = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_v < 6300) {
    c1_xdata[c1_v] = c1_c_x_Data[c1_v];
    for (c1_i = 0; c1_i < 79; c1_i++) {
      c1_ix = (c1_v + (c1_i + 1) * 6300) + 1;
      if (isnan(c1_c_x_Data[c1_ix - 1])) {
        c1_p = false;
      } else if (isnan(c1_xdata[c1_v])) {
        c1_p = true;
      } else {
        c1_p = (c1_xdata[c1_v] < c1_intermediateResult[(c1_processedVarargin_f1
                 [(c1_ix - 1) % 6300] + 6300 * (static_cast<int32_T>
                  (c1_processedVarargin_f2[static_cast<int32_T>
                   (static_cast<uint32_T>(c1_ix - 1) / 6300U)]) - 1)) - 1]);
      }

      if (c1_p) {
        c1_xdata[c1_v] = c1_c_x_Data[c1_ix - 1];
      }
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel56(
  const real32_T c1_intermediateResult[529200], const int16_T c1_iv_data[6300],
  const int32_T c1_iv_size, c1_emxArray_real32_T c1_pred_Data, int32_T
  c1_pred_Data_dim0)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = 84ULL * (static_cast<uint64_T>(c1_iv_size) + 1ULL) - 1ULL;
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx % (static_cast<uint64_T>(c1_iv_size) +
      1ULL));
    c1_i1 = static_cast<int32_T>((c1_idx - static_cast<uint64_T>(c1_i)) / (
      static_cast<uint64_T>(c1_iv_size) + 1ULL));
    c1_pred_Data.data[c1_i + c1_pred_Data_dim0 * c1_i1] = c1_intermediateResult[
      static_cast<int32_T>(c1_iv_data[c1_i]) + 6300 * c1_i1];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel57(
  const real32_T c1_intermediateResult[529200], const int16_T c1_iv_data[6300],
  const int32_T c1_iv_size, c1_emxArray_real32_T c1_c_x_Data, int32_T
  c1_x_Data_dim0)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = 80ULL * (static_cast<uint64_T>(c1_iv_size) + 1ULL) - 1ULL;
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx % (static_cast<uint64_T>(c1_iv_size) +
      1ULL));
    c1_i1 = static_cast<int32_T>((c1_idx - static_cast<uint64_T>(c1_i)) / (
      static_cast<uint64_T>(c1_iv_size) + 1ULL));
    c1_c_x_Data.data[c1_i + c1_x_Data_dim0 * c1_i1] = c1_intermediateResult[
      static_cast<int32_T>(c1_iv_data[c1_i]) + 6300 * (c1_i1 + 4)];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel58(
  const real32_T c1_c_box_data[6300], const int32_T c1_i1, c1_emxArray_real32_T
  c1_box)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i1);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_box.data[c1_i] = c1_c_box_data[c1_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel59(
  const c1_emxArray_real32_T c1_pred_Data, const int32_T c1_iv_size,
  c1_emxArray_real32_T c1_b_x, int32_T c1_x_dim0, int32_T c1_pred_Data_dim0)
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  int32_T c1_i1;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = 80ULL * (static_cast<uint64_T>(c1_iv_size) + 1ULL) - 1ULL;
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx % (static_cast<uint64_T>(c1_iv_size) +
      1ULL));
    c1_i1 = static_cast<int32_T>((c1_idx - static_cast<uint64_T>(c1_i)) / (
      static_cast<uint64_T>(c1_iv_size) + 1ULL));
    c1_b_x.data[c1_i + c1_x_dim0 * c1_i1] = c1_pred_Data.data[c1_i +
      c1_pred_Data_dim0 * (c1_i1 + 4)];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel60(
  const int32_T c1_dv, int16_T c1_ii_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_dv);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_ii_data[c1_i] = static_cast<int16_T>(1);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel61(
  const int16_T c1_ii_data[6300], const int32_T c1_ii_size, int8_T
  c1_obj_Data_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_ii_size);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_obj_Data_data[c1_i] = static_cast<int8_T>(c1_ii_data[c1_i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel62(
  const real32_T c1_dh_data[6300], const int32_T c1_dh_size, real_T
  c1_score_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_dh_size);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_score_data[c1_i] = static_cast<real_T>(c1_dh_data[c1_i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel63(
  const real_T c1_score_data[6300], const int32_T c1_score_size, real_T
  c1_idx_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_score_size);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_idx_data[c1_i] = c1_score_data[c1_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel64(
  const int8_T c1_obj_Data_data[6300], const int32_T c1_obj_Data_size, real_T
  c1_b_out_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_obj_Data_size);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_b_out_data[c1_i] = static_cast<real_T>(c1_obj_Data_data[c1_i]);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel65(
  const real32_T c1_dh_data[6300], const int32_T c1_i, real32_T c1_fv3_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_fv3_data[c1_k] = fmaxf(c1_dh_data[c1_k], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel66(
  const real32_T c1_dh_data[6300], const int32_T c1_i, real32_T c1_fv4_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_fv4_data[c1_k] = fmaxf(c1_dh_data[c1_k], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel67(
  const real32_T c1_dh_data[6300], const int32_T c1_i, real32_T c1_fv5_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_fv5_data[c1_k] = fmaxf(c1_dh_data[c1_k], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel68(
  const real32_T c1_dh_data[6300], const int32_T c1_i, real32_T c1_fv6_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_k = static_cast<int32_T>(c1_idx);
    c1_fv6_data[c1_k] = fmaxf(c1_dh_data[c1_k], 0.1F);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel69(
  const real_T c1_score_data[6300], const int32_T c1_score_size, real_T
  c1_b_out_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_score_size);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_b_out_data[c1_i] = c1_score_data[c1_i];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel70(
  const int32_T c1_dv, real_T c1_idx_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_dv);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_idx_data[c1_i] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel71(
  const int8_T c1_obj_Data_data[6300], const real_T c1_idx_data[6300], const
  int32_T c1_loop_ub, real32_T c1_b_obj_Data_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_loop_ub);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_b_obj_Data_data[c1_i] = static_cast<real32_T>(c1_obj_Data_data[
      static_cast<int32_T>(c1_idx_data[c1_i]) - 1]);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel72(
  const real_T c1_score_data[6300], const int16_T c1_iv3_data[6300], const
  int32_T c1_loop_ub, real_T c1_idx_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_loop_ub);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_idx_data[c1_i] = c1_score_data[c1_iv3_data[c1_i]];
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel73(
  const int8_T c1_obj_Data_data[6300], const int16_T c1_iv3_data[6300], const
  int32_T c1_loop_ub, real_T c1_b_out_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_i;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_loop_ub);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_i = static_cast<int32_T>(c1_idx);
    c1_b_out_data[c1_i] = static_cast<real_T>(c1_obj_Data_data[c1_iv3_data[c1_i]]);
  }
}

static __global__ __launch_bounds__(1024, 1) void c1_c1_ex_DLModel_28_kernel74(
  const c1_emxArray_real32_T c1_b_x, const c1_emxArray_real32_T c1_c_x_Data,
  const int32_T c1_b, const int32_T c1_stride, const int32_T c1_i, int16_T
  c1_ii_data[6300], real32_T c1_dh_data[6300])
{
  uint64_T c1_gStride;
  uint64_T c1_gThreadId;
  uint64_T c1_idx;
  uint64_T c1_loopEnd;
  int32_T c1_c_i;
  int32_T c1_iv0;
  int32_T c1_ix;
  int32_T c1_v;
  boolean_T c1_p;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_gStride = mwGetTotalThreadsLaunched();
  c1_loopEnd = static_cast<uint64_T>(c1_i);
  for (c1_idx = c1_gThreadId; c1_idx <= c1_loopEnd; c1_idx += c1_gStride) {
    c1_v = static_cast<int32_T>(c1_idx);
    c1_iv0 = (static_cast<int32_T>(static_cast<uint32_T>(c1_v) / static_cast<
               uint32_T>(c1_stride)) * c1_b + c1_v) + 1;
    c1_dh_data[c1_v] = c1_c_x_Data.data[c1_iv0 - 1];
    for (c1_c_i = 0; c1_c_i < 79; c1_c_i++) {
      c1_ix = c1_iv0 + (c1_c_i + 1) * c1_stride;
      if (isnan(c1_c_x_Data.data[c1_ix - 1])) {
        c1_p = false;
      } else if (isnan(c1_dh_data[c1_v])) {
        c1_p = true;
      } else {
        c1_p = (c1_dh_data[c1_v] < c1_b_x.data[c1_ix - 1]);
      }

      if (c1_p) {
        c1_dh_data[c1_v] = c1_c_x_Data.data[c1_ix - 1];
        c1_ii_data[c1_v] = static_cast<int16_T>(c1_c_i + 2);
      }
    }
  }
}

static __global__ __launch_bounds__(512, 1) void c1_dlnetwork_predict_kernel75(
  const real32_T c1_varargin_1_Data[921600], real32_T c1_inputDataT_0_f1[921600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_p;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 640ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 640ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 480ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 480ULL;
  c1_p = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_p < 3)) &&
        (static_cast<int32_T>(c1_i1 < 480)))) && (static_cast<int32_T>(c1_i <
        640))) {
    c1_inputDataT_0_f1[(c1_i + 640 * c1_i1) + 307200 * c1_p] =
      c1_varargin_1_Data[(c1_i1 + 480 * c1_i) + 307200 * c1_p];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_dlnetwork_predict_kernel76(
  const real32_T c1_in[691200], real32_T c1_outputDataAfterTranspose_f1[691200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_p;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 60ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 60ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 80ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 80ULL;
  c1_p = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_p < 144)) &&
        (static_cast<int32_T>(c1_i1 < 80)))) && (static_cast<int32_T>(c1_i < 60)))
  {
    c1_outputDataAfterTranspose_f1[(c1_i + 60 * c1_i1) + 4800 * c1_p] = c1_in
      [(c1_i1 + 80 * c1_i) + 4800 * c1_p];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_dlnetwork_predict_kernel77(
  const real32_T c1_in[172800], real32_T c1_outputDataAfterTranspose_f2[172800])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_p;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 30ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 30ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 40ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 40ULL;
  c1_p = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_p < 144)) &&
        (static_cast<int32_T>(c1_i1 < 40)))) && (static_cast<int32_T>(c1_i < 30)))
  {
    c1_outputDataAfterTranspose_f2[(c1_i + 30 * c1_i1) + 1200 * c1_p] = c1_in
      [(c1_i1 + 40 * c1_i) + 1200 * c1_p];
  }
}

static __global__ __launch_bounds__(448, 1) void c1_dlnetwork_predict_kernel78(
  const real32_T c1_in[43200], real32_T c1_outputDataAfterTranspose_f3[43200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_p;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 15ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 15ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 20ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 20ULL;
  c1_p = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_p < 144)) && (static_cast<
         int32_T>(c1_i1 < 20)))) && (static_cast<int32_T>(c1_i < 15))) {
    c1_outputDataAfterTranspose_f3[(c1_i + 15 * c1_i1) + 300 * c1_p] = c1_in
      [(c1_i1 + 20 * c1_i) + 300 * c1_p];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_dlnetwork_predict_kernel79(
  const real32_T c1_outputDataAfterTranspose_f1[691200], real32_T
  c1_varargout_1_Data[691200])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 691200) {
    c1_varargout_1_Data[c1_i] = c1_outputDataAfterTranspose_f1[c1_i];
  }
}

static __global__ __launch_bounds__(512, 1) void c1_dlnetwork_predict_kernel80(
  const real32_T c1_outputDataAfterTranspose_f2[172800], real32_T
  c1_varargout_2_Data[172800])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 172800) {
    c1_varargout_2_Data[c1_i] = c1_outputDataAfterTranspose_f2[c1_i];
  }
}

static __global__ __launch_bounds__(448, 1) void c1_dlnetwork_predict_kernel81(
  const real32_T c1_outputDataAfterTranspose_f3[43200], real32_T
  c1_varargout_3_Data[43200])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 43200) {
    c1_varargout_3_Data[c1_i] = c1_outputDataAfterTranspose_f3[c1_i];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel82(const real32_T
  c1_varargin_1[1228800], real32_T c1_varargout_1[1228800])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 1228800) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel83(const real32_T
  c1_varargin_1[614400], real32_T c1_varargout_1[614400])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 614400) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel84(const real32_T
  c1_varargin_1[614400], real32_T c1_varargout_2[307200], real32_T
  c1_varargout_1[307200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 120ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 120ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 160ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 160ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 16)) &&
        (static_cast<int32_T>(c1_i1 < 160)))) && (static_cast<int32_T>(c1_i <
        120))) {
    c1_varargout_1[(c1_i + 120 * c1_i1) + 19200 * c1_i2] = c1_varargin_1[(c1_i +
      120 * c1_i1) + 19200 * (c1_i2 + 16)];
    c1_varargout_2[(c1_i + 120 * c1_i1) + 19200 * c1_i2] = c1_varargin_1[(c1_i +
      120 * c1_i1) + 19200 * c1_i2];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel85(const real32_T
  c1_varargin_1[307200], real32_T c1_varargout_1[307200])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 307200) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel86(const real32_T
  c1_varargin_1[307200], real32_T c1_varargout_1[307200])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 307200) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel87(const real32_T
  c1_varargin_1[307200], real32_T c1_varargout_2[153600], real32_T
  c1_varargout_1[153600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 60ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 60ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 80ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 80ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 32)) &&
        (static_cast<int32_T>(c1_i1 < 80)))) && (static_cast<int32_T>(c1_i < 60)))
  {
    c1_varargout_1[(c1_i + 60 * c1_i1) + 4800 * c1_i2] = c1_varargin_1[(c1_i +
      60 * c1_i1) + 4800 * (c1_i2 + 32)];
    c1_varargout_2[(c1_i + 60 * c1_i1) + 4800 * c1_i2] = c1_varargin_1[(c1_i +
      60 * c1_i1) + 4800 * c1_i2];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel88(const real32_T
  c1_varargin_1[76800], real32_T c1_varargout_1[76800])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 76800) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel89(const real32_T
  c1_varargin_1[153600], real32_T c1_varargout_1[153600])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 153600) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel90(const real32_T
  c1_varargin_1[115200], real32_T c1_varargout_1[115200])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 115200) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel91(const real32_T
  c1_varargin_1[115200], real32_T c1_varargout_2[57600], real32_T
  c1_varargout_1[57600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 30ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 30ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 40ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 40ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 48)) &&
        (static_cast<int32_T>(c1_i1 < 40)))) && (static_cast<int32_T>(c1_i < 30)))
  {
    c1_varargout_1[(c1_i + 30 * c1_i1) + 1200 * c1_i2] = c1_varargin_1[(c1_i +
      30 * c1_i1) + 1200 * (c1_i2 + 48)];
    c1_varargout_2[(c1_i + 30 * c1_i1) + 1200 * c1_i2] = c1_varargin_1[(c1_i +
      30 * c1_i1) + 1200 * c1_i2];
  }
}

static __global__ __launch_bounds__(288, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel92(const real32_T
  c1_varargin_1[28800], real32_T c1_varargout_1[28800])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 28800) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel93(const real32_T
  c1_varargin_1[57600], real32_T c1_varargout_1[57600])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 57600) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(384, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel94(const real32_T
  c1_varargin_1[38400], real32_T c1_varargout_1[38400])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 38400) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(192, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel95(const real32_T
  c1_varargin_1[38400], real32_T c1_varargout_2[19200], real32_T c1_varargout_1
  [19200])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_i;
  int32_T c1_i1;
  int32_T c1_i2;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_i = static_cast<int32_T>(c1_gThreadId % 15ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_i)) / 15ULL;
  c1_i1 = static_cast<int32_T>(c1_tmpIndex % 20ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_i1)) / 20ULL;
  c1_i2 = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_i2 < 64)) &&
        (static_cast<int32_T>(c1_i1 < 20)))) && (static_cast<int32_T>(c1_i < 15)))
  {
    c1_varargout_1[(c1_i + 15 * c1_i1) + 300 * c1_i2] = c1_varargin_1[(c1_i + 15
      * c1_i1) + 300 * (c1_i2 + 64)];
    c1_varargout_2[(c1_i + 15 * c1_i1) + 300 * c1_i2] = c1_varargin_1[(c1_i + 15
      * c1_i1) + 300 * c1_i2];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel96(const real32_T
  c1_varargin_1[9600], real32_T c1_varargout_1[9600])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 9600) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(192, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel97(const real32_T
  c1_varargin_1[19200], real32_T c1_varargout_1[19200])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 19200) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel98(const real32_T
  c1_varargin_1[38400], const int8_T c1_xq[30], real32_T c1_out[76800])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_j;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_j = static_cast<int32_T>(c1_gThreadId % 2560ULL);
  c1_i = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_j)) /
    2560ULL);
  if ((static_cast<int32_T>(c1_i < 30)) && (static_cast<int32_T>(c1_j < 2560)))
  {
    c1_out[c1_i + 30 * c1_j] = c1_varargin_1[(static_cast<int32_T>(c1_xq[c1_i])
      + 15 * c1_j) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel99(const real32_T c1_out[76800],
  real32_T c1_in[76800])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 30ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 30ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 20ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 20ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 128)) && (
         static_cast<int32_T>(c1_b_k < 20)))) && (static_cast<int32_T>(c1_k < 30)))
  {
    c1_in[(c1_b_k + 20 * c1_k) + 600 * c1_c_k] = c1_out[(c1_k + 30 * c1_b_k) +
      600 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel100(const real32_T c1_in[76800],
  const int8_T c1_xq[40], real32_T c1_out[153600])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_j;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_j = static_cast<int32_T>(c1_gThreadId % 3840ULL);
  c1_i = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_j)) /
    3840ULL);
  if ((static_cast<int32_T>(c1_i < 40)) && (static_cast<int32_T>(c1_j < 3840)))
  {
    c1_out[c1_i + 40 * c1_j] = c1_in[(static_cast<int32_T>(c1_xq[c1_i]) + 20 *
      c1_j) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel101(const real32_T c1_out
  [153600], real32_T c1_varargout_1[153600])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 40ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 40ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 30ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 30ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 128)) && (
         static_cast<int32_T>(c1_b_k < 30)))) && (static_cast<int32_T>(c1_k < 40)))
  {
    c1_varargout_1[(c1_b_k + 30 * c1_k) + 1200 * c1_c_k] = c1_out[(c1_k + 40 *
      c1_b_k) + 1200 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel102(const real32_T
  c1_varargin_1[115200], const int8_T c1_xq[60], real32_T c1_out[230400])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_j;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_j = static_cast<int32_T>(c1_gThreadId % 3840ULL);
  c1_i = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_j)) /
    3840ULL);
  if ((static_cast<int32_T>(c1_i < 60)) && (static_cast<int32_T>(c1_j < 3840)))
  {
    c1_out[c1_i + 60 * c1_j] = c1_varargin_1[(static_cast<int32_T>(c1_xq[c1_i])
      + 30 * c1_j) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel103(const real32_T c1_out
  [230400], real32_T c1_in[230400])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 60ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 60ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 40ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 40ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 96)) && (static_cast<
         int32_T>(c1_b_k < 40)))) && (static_cast<int32_T>(c1_k < 60))) {
    c1_in[(c1_b_k + 40 * c1_k) + 2400 * c1_c_k] = c1_out[(c1_k + 60 * c1_b_k) +
      2400 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel104(const real32_T c1_in[230400],
  const int8_T c1_xq[80], real32_T c1_out[460800])
{
  uint64_T c1_gThreadId;
  int32_T c1_i;
  int32_T c1_j;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_j = static_cast<int32_T>(c1_gThreadId % 5760ULL);
  c1_i = static_cast<int32_T>((c1_gThreadId - static_cast<uint64_T>(c1_j)) /
    5760ULL);
  if ((static_cast<int32_T>(c1_i < 80)) && (static_cast<int32_T>(c1_j < 5760)))
  {
    c1_out[c1_i + 80 * c1_j] = c1_in[(static_cast<int32_T>(c1_xq[c1_i]) + 40 *
      c1_j) - 1];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel105(const real32_T c1_out
  [460800], real32_T c1_varargout_1[460800])
{
  uint64_T c1_gThreadId;
  uint64_T c1_tmpIndex;
  int32_T c1_b_k;
  int32_T c1_c_k;
  int32_T c1_k;
  c1_gThreadId = mwGetGlobalThreadIndex();
  c1_k = static_cast<int32_T>(c1_gThreadId % 80ULL);
  c1_tmpIndex = (c1_gThreadId - static_cast<uint64_T>(c1_k)) / 80ULL;
  c1_b_k = static_cast<int32_T>(c1_tmpIndex % 60ULL);
  c1_tmpIndex = (c1_tmpIndex - static_cast<uint64_T>(c1_b_k)) / 60ULL;
  c1_c_k = static_cast<int32_T>(c1_tmpIndex);
  if ((static_cast<int32_T>((static_cast<int32_T>(c1_c_k < 96)) && (static_cast<
         int32_T>(c1_b_k < 60)))) && (static_cast<int32_T>(c1_k < 80))) {
    c1_varargout_1[(c1_b_k + 60 * c1_k) + 4800 * c1_c_k] = c1_out[(c1_k + 80 *
      c1_b_k) + 4800 * c1_c_k];
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel106(const real32_T
  c1_varargin_1[384000], real32_T c1_varargout_1[384000])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 384000) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel107(const real32_T
  c1_varargin_1[76800], real32_T c1_varargout_1[76800])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 76800) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(512, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel108(const real32_T
  c1_varargin_1[96000], real32_T c1_varargout_1[96000])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 96000) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(224, 1) void
  c1_dlnetwork_layerPredictWithColMajority_kernel109(const real32_T
  c1_varargin_1[24000], real32_T c1_varargout_1[24000])
{
  int32_T c1_k;
  c1_k = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_k < 24000) {
    c1_varargout_1[c1_k] = -c1_varargin_1[c1_k];
    c1_varargout_1[c1_k] = expf(c1_varargout_1[c1_k]);
    c1_varargout_1[c1_k] = c1_varargin_1[c1_k] * (1.0F / (c1_varargout_1[c1_k] +
      1.0F));
  }
}

static __global__ __launch_bounds__(32, 1) void
  c1_conv2dCudaImplicitGemmColMajor_kernel110(real32_T c1_formattedWeights[16])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 16) {
    c1_formattedWeights[c1_i] = static_cast<real32_T>(c1_i);
  }
}

static __global__ __launch_bounds__(32, 1) void
  c1_conv2dCudaImplicitGemmColMajor_kernel111(real32_T c1_formattedBias[4])
{
  int32_T c1_i;
  c1_i = static_cast<int32_T>(mwGetGlobalThreadIndex());
  if (c1_i < 4) {
    c1_formattedBias[c1_i] = 0.0F;
  }
}

static __device__ int32_T c1_div_nzp_s32_device(int32_T c1_numerator, int32_T
  c1_denominator, int32_T c1_EMLOvCount_src_loc, uint32_T c1_ssid_src_loc,
  int32_T c1_offset_src_loc, int32_T c1_length_src_loc)
{
  int32_T c1_quotient;
  uint32_T c1_tempAbsQuotient;
  uint32_T c1_u;
  uint32_T c1_u1;
  if (c1_numerator < 0) {
    c1_u = ~static_cast<uint32_T>(c1_numerator) + 1U;
  } else {
    c1_u = static_cast<uint32_T>(c1_numerator);
  }

  if (c1_denominator < 0) {
    c1_u1 = ~static_cast<uint32_T>(c1_denominator) + 1U;
  } else {
    c1_u1 = static_cast<uint32_T>(c1_denominator);
  }

  c1_tempAbsQuotient = c1_u / c1_u1;
  if (static_cast<int32_T>(c1_numerator < 0) != static_cast<int32_T>
      (c1_denominator < 0)) {
    c1_quotient = -static_cast<int32_T>(c1_tempAbsQuotient);
  } else {
    c1_quotient = static_cast<int32_T>(c1_tempAbsQuotient);
  }

  return c1_quotient;
}

static __device__ int64_T c1_computeEndIdx_device(int64_T c1_start, int64_T
  c1_end, int64_T c1_stride)
{
  int64_T c1_newEnd;
  c1_newEnd = -1LL;
  if ((static_cast<int32_T>(c1_stride > 0LL)) && (static_cast<int32_T>(c1_start <=
        c1_end))) {
    c1_newEnd = c1_div_nzp_s64_device(c1_end - c1_start, c1_stride, 0, 0U, 0, 0);
  } else if ((static_cast<int32_T>(c1_stride < 0LL)) && (static_cast<int32_T>
              (c1_end <= c1_start))) {
    c1_newEnd = c1_div_nzp_s64_device(c1_start - c1_end, -c1_stride, 0, 0U, 0, 0);
  }

  return c1_newEnd;
}

static __device__ int64_T c1_div_nzp_s64_device(int64_T c1_numerator, int64_T
  c1_denominator, int32_T c1_EMLOvCount_src_loc, uint32_T c1_ssid_src_loc,
  int32_T c1_offset_src_loc, int32_T c1_length_src_loc)
{
  int64_T c1_quotient;
  uint64_T c1_tempAbsQuotient;
  uint64_T c1_u;
  uint64_T c1_u1;
  if (c1_numerator < 0LL) {
    c1_u = ~static_cast<uint64_T>(c1_numerator) + 1ULL;
  } else {
    c1_u = static_cast<uint64_T>(c1_numerator);
  }

  if (c1_denominator < 0LL) {
    c1_u1 = ~static_cast<uint64_T>(c1_denominator) + 1ULL;
  } else {
    c1_u1 = static_cast<uint64_T>(c1_denominator);
  }

  c1_tempAbsQuotient = c1_u / c1_u1;
  if (static_cast<int32_T>(c1_numerator < 0LL) != static_cast<int32_T>
      (c1_denominator < 0LL)) {
    c1_quotient = -static_cast<int64_T>(c1_tempAbsQuotient);
  } else {
    c1_quotient = static_cast<int64_T>(c1_tempAbsQuotient);
  }

  return c1_quotient;
}

static void c1_gpuEmxReset_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_gpu)
{
  memset(c1_gpu, 0, sizeof(c1_emxArray_real_T));
}

static void c1_gpuEmxReset_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu)
{
  memset(c1_gpu, 0, sizeof(c1_emxArray_real32_T));
}

static void c1_gpuEmxEnsureCapacity_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const c1_emxArray_real_T *c1_cpu, c1_emxArray_real_T *c1_gpu,
  boolean_T c1_needsCopy)
{
  real_T *c1_newData;
  int32_T c1_allocatingSize;
  int32_T c1_i;
  int32_T c1_totalSizeCpu;
  int32_T c1_totalSizeGpu;
  if (c1_gpu->numDimensions == 0) {
    c1_gpu->numDimensions = c1_cpu->numDimensions;
    c1_gpu->size = static_cast<int32_T *>(emlrtCallocMex(static_cast<uint32_T>
      (c1_gpu->numDimensions), sizeof(int32_T)));
  }

  c1_totalSizeCpu = 1;
  c1_totalSizeGpu = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_totalSizeGpu *= c1_gpu->size[c1_i];
    c1_totalSizeCpu *= c1_cpu->size[c1_i];
    c1_gpu->size[c1_i] = c1_cpu->size[c1_i];
  }

  if (((c1_totalSizeCpu == 0) && (c1_cpu->allocatedSize > 0)) ||
      (c1_gpu->allocatedSize < c1_totalSizeCpu)) {
    c1_allocatingSize = c1_cpu->allocatedSize;
    if (c1_allocatingSize < c1_totalSizeCpu) {
      c1_allocatingSize = c1_totalSizeCpu;
    }

    c1_checkCudaError(chartInstance, cudaMalloc(&c1_newData, c1_allocatingSize *
      sizeof(real_T)), __FILE__, __LINE__);
    c1_needsCopy = (c1_needsCopy && (c1_totalSizeGpu > 0));
    if (c1_needsCopy) {
      c1_checkCudaError(chartInstance, cudaMemcpy(c1_newData, c1_gpu->data,
        c1_totalSizeGpu * sizeof(real_T), cudaMemcpyDeviceToDevice), __FILE__,
                        __LINE__);
    }

    if (c1_gpu->canFreeData) {
      c1_checkCudaError(chartInstance, cudaFree(c1_gpu->data), __FILE__,
                        __LINE__);
    }

    c1_gpu->data = c1_newData;
    c1_gpu->allocatedSize = c1_allocatingSize;
    c1_gpu->canFreeData = true;
  }
}

static void c1_gpuEmxMemcpyCpuToGpu_real_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real_T *c1_gpu, const c1_emxArray_real_T *c1_cpu)
{
  int32_T c1_actualSize;
  int32_T c1_i;
  c1_actualSize = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_actualSize *= c1_cpu->size[c1_i];
  }

  if (c1_cpu->data) {
    c1_checkCudaError(chartInstance, cudaMemcpy(c1_gpu->data, c1_cpu->data,
      c1_actualSize * sizeof(real_T), cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }
}

static void c1_gpuEmxEnsureCapacity_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, const c1_emxArray_real32_T *c1_cpu, c1_emxArray_real32_T
  *c1_gpu, boolean_T c1_needsCopy)
{
  int32_T c1_allocatingSize;
  int32_T c1_i;
  int32_T c1_totalSizeCpu;
  int32_T c1_totalSizeGpu;
  real32_T *c1_newData;
  if (c1_gpu->numDimensions == 0) {
    c1_gpu->numDimensions = c1_cpu->numDimensions;
    c1_gpu->size = static_cast<int32_T *>(emlrtCallocMex(static_cast<uint32_T>
      (c1_gpu->numDimensions), sizeof(int32_T)));
  }

  c1_totalSizeCpu = 1;
  c1_totalSizeGpu = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_totalSizeGpu *= c1_gpu->size[c1_i];
    c1_totalSizeCpu *= c1_cpu->size[c1_i];
    c1_gpu->size[c1_i] = c1_cpu->size[c1_i];
  }

  if (((c1_totalSizeCpu == 0) && (c1_cpu->allocatedSize > 0)) ||
      (c1_gpu->allocatedSize < c1_totalSizeCpu)) {
    c1_allocatingSize = c1_cpu->allocatedSize;
    if (c1_allocatingSize < c1_totalSizeCpu) {
      c1_allocatingSize = c1_totalSizeCpu;
    }

    c1_checkCudaError(chartInstance, cudaMalloc(&c1_newData, c1_allocatingSize *
      sizeof(real32_T)), __FILE__, __LINE__);
    c1_needsCopy = (c1_needsCopy && (c1_totalSizeGpu > 0));
    if (c1_needsCopy) {
      c1_checkCudaError(chartInstance, cudaMemcpy(c1_newData, c1_gpu->data,
        c1_totalSizeGpu * sizeof(real32_T), cudaMemcpyDeviceToDevice), __FILE__,
                        __LINE__);
    }

    if (c1_gpu->canFreeData) {
      c1_checkCudaError(chartInstance, cudaFree(c1_gpu->data), __FILE__,
                        __LINE__);
    }

    c1_gpu->data = c1_newData;
    c1_gpu->allocatedSize = c1_allocatingSize;
    c1_gpu->canFreeData = true;
  }
}

static void c1_gpuEmxMemcpyCpuToGpu_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu, const c1_emxArray_real32_T
  *c1_cpu)
{
  int32_T c1_actualSize;
  int32_T c1_i;
  c1_actualSize = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_actualSize *= c1_cpu->size[c1_i];
  }

  if (c1_cpu->data) {
    c1_checkCudaError(chartInstance, cudaMemcpy(c1_gpu->data, c1_cpu->data,
      c1_actualSize * sizeof(real32_T), cudaMemcpyHostToDevice), __FILE__,
                      __LINE__);
  }
}

static void c1_cpuEmxAllocateOrResize_real32_T(SFc1_ex_DLModel_28InstanceStruct *
  chartInstance, c1_emxArray_real32_T *c1_cpu, boolean_T c1_needsCopy)
{
  int32_T c1_i;
  int32_T c1_totalSizeCpu;
  void *c1_newData;
  c1_totalSizeCpu = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_totalSizeCpu *= c1_cpu->size[c1_i];
  }

  if (c1_cpu->allocatedSize < c1_totalSizeCpu) {
    c1_newData = emlrtCallocMex(static_cast<uint32_T>(c1_totalSizeCpu), sizeof
      (real32_T));
    c1_needsCopy = (c1_needsCopy && (c1_totalSizeCpu > 0));
    if (c1_needsCopy) {
      memcpy(c1_newData, c1_cpu->data, c1_totalSizeCpu * sizeof(real32_T));
    }

    if (c1_cpu->canFreeData) {
      emlrtFreeMex(c1_cpu->data);
    }

    c1_cpu->data = static_cast<real32_T *>(c1_newData);
    c1_cpu->allocatedSize = c1_totalSizeCpu;
    c1_cpu->canFreeData = true;
  }
}

static void c1_gpuEmxMemcpyGpuToCpu_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_cpu, c1_emxArray_real32_T *c1_gpu)
{
  int32_T c1_actualSize;
  int32_T c1_i;
  c1_actualSize = 1;
  for (c1_i = 0; c1_i < c1_cpu->numDimensions; c1_i++) {
    c1_actualSize *= c1_cpu->size[c1_i];
  }

  if (c1_gpu->data) {
    c1_checkCudaError(chartInstance, cudaMemcpy(c1_cpu->data, c1_gpu->data,
      c1_actualSize * sizeof(real32_T), cudaMemcpyDeviceToHost), __FILE__,
                      __LINE__);
  }
}

static void c1_gpuEmxFree_real32_T(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance, c1_emxArray_real32_T *c1_gpu)
{
  if (c1_gpu->data && c1_gpu->canFreeData && (c1_gpu->data != (void *)
       4207599121ULL)) {
    c1_checkCudaError(chartInstance, cudaFree(c1_gpu->data), __FILE__, __LINE__);
  }

  emlrtFreeMex(c1_gpu->size);
}

static void c1_gpuEmxFree_real_T(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  c1_emxArray_real_T *c1_gpu)
{
  if (c1_gpu->data && c1_gpu->canFreeData && (c1_gpu->data != (void *)
       4207599121ULL)) {
    c1_checkCudaError(chartInstance, cudaFree(c1_gpu->data), __FILE__, __LINE__);
  }

  emlrtFreeMex(c1_gpu->size);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(240, 320, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_dlnetwork_layerPredictWithColMajority(chartInstance, (static_cast<MWTensor<
    real32_T> *>(getInputTensor(0)))->getData(), (static_cast<MWTensor<real32_T>
    *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_b_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_b_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 16, c1_batchSize, 1, 0);
  resizeOutputTensor(120, 160, 16, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_c_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_d_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_d_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(120, 160, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_b_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_f_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_j_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_p_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::
  c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801()
{
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b,
   MWTensorBase *c1_c, boolean_T c1_EnableReferenceInput, const char_T
   *c1_Method, const char_T *c1_GeometricTransformMode, const char_T
   *c1_NearestRoundingMode, const char_T *c1_b_Name, const char_T *c1_Type,
   const char_T *c1_PrivateInputs[2], const char_T *c1_PrivateOutputs[1], const
   char_T *c1_d, int32_T c1_e)
{
  setupTensors(2, 1, c1_b, c1_c, c1_d, c1_e);
  setupLayer(c1_targetImpl);
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 128, c1_batchSize, 1, 0);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupInputDescriptors(getInputTensor(1), c1_c_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_d_layout);
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::cleanupLayer()
{
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  reorderInputData(getInputTensor(1), 1);
  c1_s_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_j_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::
  c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802()
{
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b,
   MWTensorBase *c1_c, boolean_T c1_EnableReferenceInput, const char_T
   *c1_Method, const char_T *c1_GeometricTransformMode, const char_T
   *c1_NearestRoundingMode, const char_T *c1_b_Name, const char_T *c1_Type,
   const char_T *c1_PrivateInputs[2], const char_T *c1_PrivateOutputs[1], const
   char_T *c1_d, int32_T c1_e)
{
  setupTensors(2, 1, c1_b, c1_c, c1_d, c1_e);
  setupLayer(c1_targetImpl);
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 96, c1_batchSize, 1, 0);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupInputDescriptors(getInputTensor(1), c1_c_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_d_layout);
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::cleanupLayer()
{
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  reorderInputData(getInputTensor(1), 1);
  c1_t_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_f_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 16, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_g_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_h_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_e_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_u_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(60, 80, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_u_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_j_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 24, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_k_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 48, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_m_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 96, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_i_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_v_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_v_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_w_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(30, 40, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_w_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::
  c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_PrivateInputs[1], const char_T
   *c1_PrivateOutputs[2], const char_T *c1_c, const char_T *c1_d, int32_T c1_e,
   int32_T c1_f)
{
  setupTensors(1, 2, c1_b, c1_c, c1_d, c1_e, c1_f);
  setupLayer(c1_targetImpl);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_b_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_c_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_d_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::W, MWTensorBase::H };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 1);
  setupInputDescriptors(getInputTensor(0), c1_b_layout, c1_layout);
  setupOutputDescriptors(getOutputTensor(0), c1_layout, c1_c_layout);
  setupOutputDescriptors(getOutputTensor(1), c1_layout, c1_d_layout);
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::cleanupLayer()
{
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  reorderInputData(getInputTensor(0), 0);
  c1_p_dlnetwork_layerPredictWithColMajority(chartInstance,
    m_ntwkImpl->getPermuteBuffer(0), m_ntwkImpl->getPermuteBuffer(1),
    m_ntwkImpl->getPermuteBuffer(2));
  reorderOutputData(getOutputTensor(0), 1);
  reorderOutputData(getOutputTensor(1), 2);
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 32, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_q_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 128, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_o_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 64, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_r_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_x_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::
  c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::c1_createCustomLayer
  (MWCudnnTarget::MWTargetNetworkImpl *c1_targetImpl, MWTensorBase *c1_b, const
   char_T *c1_b_Name, const char_T *c1_Description, const char_T *c1_Type, const
   char_T *c1_PrivateInputs[1], const char_T *c1_PrivateOutputs[1], const char_T
   *c1_c, int32_T c1_d)
{
  setupTensors(1, 1, c1_b, c1_c, c1_d);
  setupLayer(c1_targetImpl);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::propagateSize()
{
  int32_T c1_batchSize;
  MWTensorBase::DIMSLABEL c1_layout[5] = { MWTensorBase::S, MWTensorBase::N,
    MWTensorBase::C, MWTensorBase::H, MWTensorBase::W };

  c1_batchSize = getInputTensor(0)->getBatchSize();
  resizeOutputTensor(15, 20, 80, c1_batchSize, 1, 0);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::cleanupLayer()
{
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::predict()
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = this->chartInstance;
  c1_x_dlnetwork_layerPredictWithColMajority(chartInstance,
    (static_cast<MWTensor<real32_T> *>(getInputTensor(0)))->getData(), (
    static_cast<MWTensor<real32_T> *>(getOutputTensor(0)))->getData());
}

void c1_c1_Yolov9t0_ex_DLModel_280::allocate()
{
  int32_T c1_idx;
  targetImpl->allocatePermuteBuffers(614400, 3);
  targetImpl->allocate(1228800, 10);
  for (c1_idx = 0; c1_idx < 584; c1_idx++) {
    layers[c1_idx]->allocate();
  }

  (static_cast<MWTensor<real32_T> *>(inputTensors[0]))->setData(layers[0]
    ->getLayerOutput(0));
}

void c1_c1_Yolov9t0_ex_DLModel_280::postsetup()
{
  targetImpl->postSetup(layers, numLayers);
}

c1_c1_Yolov9t0_ex_DLModel_280::c1_c1_Yolov9t0_ex_DLModel_280()
{
  numLayers = 584;
  isInitialized = false;
  targetImpl = 0;
  layers[0] = new MWInputLayer;
  layers[0]->setName("images");
  layers[1] = new MWConvLayer;
  layers[1]->setName("Conv_0");
  layers[2] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801;
  layers[2]->setName("Mul_2");
  layers[3] = new MWConvLayer;
  layers[3]->setName("Conv_3");
  layers[4] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802;
  layers[4]->setName("Mul_5");
  layers[5] = new MWConvLayer;
  layers[5]->setName("Conv_6");
  layers[6] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803;
  layers[6]->setName("Mul_8");
  layers[7] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801;
  layers[7]->setName("SliceLayer1004");
  layers[8] = new MWConvLayer;
  layers[8]->setName("Conv_23");
  layers[9] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804;
  layers[9]->setName("Mul_25");
  layers[10] = new MWConvLayer;
  layers[10]->setName("Conv_26");
  layers[11] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805;
  layers[11]->setName("Mul_28");
  layers[12] = new MWConcatenationLayer;
  layers[12]->setName("Concat_29");
  layers[13] = new MWConvLayer;
  layers[13]->setName("Conv_30");
  layers[14] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806;
  layers[14]->setName("Mul_32");
  layers[15] = new MWAvgPoolingLayer;
  layers[15]->setName("AveragePool_35");
  layers[16] = new MWConvLayer;
  layers[16]->setName("Conv_36");
  layers[17] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807;
  layers[17]->setName("Mul_38");
  layers[18] = new MWConvLayer;
  layers[18]->setName("Conv_39");
  layers[19] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808;
  layers[19]->setName("Mul_41");
  layers[20] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802;
  layers[20]->setName("SliceLayer1013");
  layers[21] = new MWConvLayer;
  layers[21]->setName("Conv_56");
  layers[22] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809;
  layers[22]->setName("Mul_58");
  layers[23] = new MWConvLayer;
  layers[23]->setName("Conv_59");
  layers[24] = new MWConvLayer;
  layers[24]->setName("Conv_60");
  layers[25] = new MWAdditionLayer;
  layers[25]->setName("Add_61");
  layers[26] = new MWElementwiseAffineLayer;
  layers[26]->setName("Add_63");
  layers[26]->setInPlaceIndex(0, 0);
  layers[27] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010;
  layers[27]->setName("Mul_65");
  layers[28] = new MWConvLayer;
  layers[28]->setName("Conv_66");
  layers[29] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011;
  layers[29]->setName("Mul_68");
  layers[30] = new MWAdditionLayer;
  layers[30]->setName("Add_69");
  layers[31] = new MWConvLayer;
  layers[31]->setName("Conv_70");
  layers[32] = new MWConvLayer;
  layers[32]->setName("Conv_71");
  layers[33] = new MWAdditionLayer;
  layers[33]->setName("Add_72");
  layers[34] = new MWElementwiseAffineLayer;
  layers[34]->setName("Add_74");
  layers[34]->setInPlaceIndex(0, 0);
  layers[35] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012;
  layers[35]->setName("Mul_76");
  layers[36] = new MWConvLayer;
  layers[36]->setName("Conv_77");
  layers[37] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013;
  layers[37]->setName("Mul_79");
  layers[38] = new MWAdditionLayer;
  layers[38]->setName("Add_80");
  layers[39] = new MWConvLayer;
  layers[39]->setName("Conv_81");
  layers[40] = new MWConvLayer;
  layers[40]->setName("Conv_82");
  layers[41] = new MWAdditionLayer;
  layers[41]->setName("Add_83");
  layers[42] = new MWElementwiseAffineLayer;
  layers[42]->setName("Add_85");
  layers[42]->setInPlaceIndex(0, 0);
  layers[43] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014;
  layers[43]->setName("Mul_87");
  layers[44] = new MWConvLayer;
  layers[44]->setName("Conv_88");
  layers[45] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015;
  layers[45]->setName("Mul_90");
  layers[46] = new MWAdditionLayer;
  layers[46]->setName("Add_91");
  layers[47] = new MWConvLayer;
  layers[47]->setName("Conv_92");
  layers[48] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016;
  layers[48]->setName("Mul_94");
  layers[49] = new MWConcatenationLayer;
  layers[49]->setName("Concat_95");
  layers[50] = new MWConvLayer;
  layers[50]->setName("Conv_96");
  layers[51] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017;
  layers[51]->setName("Mul_98");
  layers[52] = new MWConvLayer;
  layers[52]->setName("Conv_99");
  layers[53] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018;
  layers[53]->setName("Mul_101");
  layers[54] = new MWConvLayer;
  layers[54]->setName("Conv_138_fused");
  layers[55] = new MWSplittingLayer;
  layers[55]->setName("Conv_138_fused_channelSplit");
  layers[55]->setInPlaceIndex(0, 0);
  layers[55]->setInPlaceIndex(1, 0);
  layers[56] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019;
  layers[56]->setName("Mul_104");
  layers[57] = new MWConvLayer;
  layers[57]->setName("Conv_105");
  layers[58] = new MWConvLayer;
  layers[58]->setName("Conv_106");
  layers[59] = new MWAdditionLayer;
  layers[59]->setName("Add_107");
  layers[60] = new MWElementwiseAffineLayer;
  layers[60]->setName("Add_109");
  layers[60]->setInPlaceIndex(0, 0);
  layers[61] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020;
  layers[61]->setName("Mul_111");
  layers[62] = new MWConvLayer;
  layers[62]->setName("Conv_112");
  layers[63] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021;
  layers[63]->setName("Mul_114");
  layers[64] = new MWAdditionLayer;
  layers[64]->setName("Add_115");
  layers[65] = new MWConvLayer;
  layers[65]->setName("Conv_116");
  layers[66] = new MWConvLayer;
  layers[66]->setName("Conv_117");
  layers[67] = new MWAdditionLayer;
  layers[67]->setName("Add_118");
  layers[68] = new MWElementwiseAffineLayer;
  layers[68]->setName("Add_120");
  layers[68]->setInPlaceIndex(0, 0);
  layers[69] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022;
  layers[69]->setName("Mul_122");
  layers[70] = new MWConvLayer;
  layers[70]->setName("Conv_123");
  layers[71] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023;
  layers[71]->setName("Mul_125");
  layers[72] = new MWAdditionLayer;
  layers[72]->setName("Add_126");
  layers[73] = new MWConvLayer;
  layers[73]->setName("Conv_127");
  layers[74] = new MWConvLayer;
  layers[74]->setName("Conv_128");
  layers[75] = new MWAdditionLayer;
  layers[75]->setName("Add_129");
  layers[76] = new MWElementwiseAffineLayer;
  layers[76]->setName("Add_131");
  layers[76]->setInPlaceIndex(0, 0);
  layers[77] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024;
  layers[77]->setName("Mul_133");
  layers[78] = new MWConvLayer;
  layers[78]->setName("Conv_134");
  layers[79] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025;
  layers[79]->setName("Mul_136");
  layers[80] = new MWAdditionLayer;
  layers[80]->setName("Add_137");
  layers[81] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026;
  layers[81]->setName("Mul_140");
  layers[82] = new MWConcatenationLayer;
  layers[82]->setName("Concat_141");
  layers[83] = new MWConvLayer;
  layers[83]->setName("Conv_142");
  layers[84] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027;
  layers[84]->setName("Mul_144");
  layers[85] = new MWConvLayer;
  layers[85]->setName("Conv_145");
  layers[86] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028;
  layers[86]->setName("Mul_147");
  layers[87] = new MWConcatenationLayer;
  layers[87]->setName("Concat_148");
  layers[88] = new MWConvLayer;
  layers[88]->setName("Conv_149");
  layers[89] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029;
  layers[89]->setName("Mul_151");
  layers[90] = new MWAvgPoolingLayer;
  layers[90]->setName("AveragePool_154");
  layers[91] = new MWConvLayer;
  layers[91]->setName("Conv_155");
  layers[92] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030;
  layers[92]->setName("Mul_157");
  layers[93] = new MWConvLayer;
  layers[93]->setName("Conv_158");
  layers[94] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031;
  layers[94]->setName("Mul_160");
  layers[95] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803;
  layers[95]->setName("SliceLayer1022");
  layers[96] = new MWConvLayer;
  layers[96]->setName("Conv_175");
  layers[97] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032;
  layers[97]->setName("Mul_177");
  layers[98] = new MWConvLayer;
  layers[98]->setName("Conv_178");
  layers[99] = new MWConvLayer;
  layers[99]->setName("Conv_179");
  layers[100] = new MWAdditionLayer;
  layers[100]->setName("Add_180");
  layers[101] = new MWElementwiseAffineLayer;
  layers[101]->setName("Add_182");
  layers[101]->setInPlaceIndex(0, 0);
  layers[102] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033;
  layers[102]->setName("Mul_184");
  layers[103] = new MWConvLayer;
  layers[103]->setName("Conv_185");
  layers[104] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034;
  layers[104]->setName("Mul_187");
  layers[105] = new MWAdditionLayer;
  layers[105]->setName("Add_188");
  layers[106] = new MWConvLayer;
  layers[106]->setName("Conv_189");
  layers[107] = new MWConvLayer;
  layers[107]->setName("Conv_190");
  layers[108] = new MWAdditionLayer;
  layers[108]->setName("Add_191");
  layers[109] = new MWElementwiseAffineLayer;
  layers[109]->setName("Add_193");
  layers[109]->setInPlaceIndex(0, 0);
  layers[110] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035;
  layers[110]->setName("Mul_195");
  layers[111] = new MWConvLayer;
  layers[111]->setName("Conv_196");
  layers[112] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036;
  layers[112]->setName("Mul_198");
  layers[113] = new MWAdditionLayer;
  layers[113]->setName("Add_199");
  layers[114] = new MWConvLayer;
  layers[114]->setName("Conv_200");
  layers[115] = new MWConvLayer;
  layers[115]->setName("Conv_201");
  layers[116] = new MWAdditionLayer;
  layers[116]->setName("Add_202");
  layers[117] = new MWElementwiseAffineLayer;
  layers[117]->setName("Add_204");
  layers[117]->setInPlaceIndex(0, 0);
  layers[118] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037;
  layers[118]->setName("Mul_206");
  layers[119] = new MWConvLayer;
  layers[119]->setName("Conv_207");
  layers[120] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038;
  layers[120]->setName("Mul_209");
  layers[121] = new MWAdditionLayer;
  layers[121]->setName("Add_210");
  layers[122] = new MWConvLayer;
  layers[122]->setName("Conv_211");
  layers[123] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039;
  layers[123]->setName("Mul_213");
  layers[124] = new MWConcatenationLayer;
  layers[124]->setName("Concat_214");
  layers[125] = new MWConvLayer;
  layers[125]->setName("Conv_215");
  layers[126] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040;
  layers[126]->setName("Mul_217");
  layers[127] = new MWConvLayer;
  layers[127]->setName("Conv_218");
  layers[128] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041;
  layers[128]->setName("Mul_220");
  layers[129] = new MWConvLayer;
  layers[129]->setName("Conv_257_fused");
  layers[130] = new MWSplittingLayer;
  layers[130]->setName("Conv_257_fused_channelSplit");
  layers[130]->setInPlaceIndex(0, 0);
  layers[130]->setInPlaceIndex(1, 0);
  layers[131] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042;
  layers[131]->setName("Mul_223");
  layers[132] = new MWConvLayer;
  layers[132]->setName("Conv_224");
  layers[133] = new MWConvLayer;
  layers[133]->setName("Conv_225");
  layers[134] = new MWAdditionLayer;
  layers[134]->setName("Add_226");
  layers[135] = new MWElementwiseAffineLayer;
  layers[135]->setName("Add_228");
  layers[135]->setInPlaceIndex(0, 0);
  layers[136] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043;
  layers[136]->setName("Mul_230");
  layers[137] = new MWConvLayer;
  layers[137]->setName("Conv_231");
  layers[138] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044;
  layers[138]->setName("Mul_233");
  layers[139] = new MWAdditionLayer;
  layers[139]->setName("Add_234");
  layers[140] = new MWConvLayer;
  layers[140]->setName("Conv_235");
  layers[141] = new MWConvLayer;
  layers[141]->setName("Conv_236");
  layers[142] = new MWAdditionLayer;
  layers[142]->setName("Add_237");
  layers[143] = new MWElementwiseAffineLayer;
  layers[143]->setName("Add_239");
  layers[143]->setInPlaceIndex(0, 0);
  layers[144] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045;
  layers[144]->setName("Mul_241");
  layers[145] = new MWConvLayer;
  layers[145]->setName("Conv_242");
  layers[146] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046;
  layers[146]->setName("Mul_244");
  layers[147] = new MWAdditionLayer;
  layers[147]->setName("Add_245");
  layers[148] = new MWConvLayer;
  layers[148]->setName("Conv_246");
  layers[149] = new MWConvLayer;
  layers[149]->setName("Conv_247");
  layers[150] = new MWAdditionLayer;
  layers[150]->setName("Add_248");
  layers[151] = new MWElementwiseAffineLayer;
  layers[151]->setName("Add_250");
  layers[151]->setInPlaceIndex(0, 0);
  layers[152] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047;
  layers[152]->setName("Mul_252");
  layers[153] = new MWConvLayer;
  layers[153]->setName("Conv_253");
  layers[154] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048;
  layers[154]->setName("Mul_255");
  layers[155] = new MWAdditionLayer;
  layers[155]->setName("Add_256");
  layers[156] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049;
  layers[156]->setName("Mul_259");
  layers[157] = new MWConcatenationLayer;
  layers[157]->setName("Concat_260");
  layers[158] = new MWConvLayer;
  layers[158]->setName("Conv_261");
  layers[159] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050;
  layers[159]->setName("Mul_263");
  layers[160] = new MWConvLayer;
  layers[160]->setName("Conv_264");
  layers[161] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051;
  layers[161]->setName("Mul_266");
  layers[162] = new MWConcatenationLayer;
  layers[162]->setName("Concat_267");
  layers[163] = new MWConvLayer;
  layers[163]->setName("Conv_268");
  layers[164] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052;
  layers[164]->setName("Mul_270");
  layers[165] = new MWAvgPoolingLayer;
  layers[165]->setName("AveragePool_273");
  layers[166] = new MWConvLayer;
  layers[166]->setName("Conv_274");
  layers[167] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053;
  layers[167]->setName("Mul_276");
  layers[168] = new MWConvLayer;
  layers[168]->setName("Conv_277");
  layers[169] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054;
  layers[169]->setName("Mul_279");
  layers[170] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804;
  layers[170]->setName("SliceLayer1031");
  layers[171] = new MWConvLayer;
  layers[171]->setName("Conv_294");
  layers[172] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055;
  layers[172]->setName("Mul_296");
  layers[173] = new MWConvLayer;
  layers[173]->setName("Conv_297");
  layers[174] = new MWConvLayer;
  layers[174]->setName("Conv_298");
  layers[175] = new MWAdditionLayer;
  layers[175]->setName("Add_299");
  layers[176] = new MWElementwiseAffineLayer;
  layers[176]->setName("Add_301");
  layers[176]->setInPlaceIndex(0, 0);
  layers[177] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056;
  layers[177]->setName("Mul_303");
  layers[178] = new MWConvLayer;
  layers[178]->setName("Conv_304");
  layers[179] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057;
  layers[179]->setName("Mul_306");
  layers[180] = new MWAdditionLayer;
  layers[180]->setName("Add_307");
  layers[181] = new MWConvLayer;
  layers[181]->setName("Conv_308");
  layers[182] = new MWConvLayer;
  layers[182]->setName("Conv_309");
  layers[183] = new MWAdditionLayer;
  layers[183]->setName("Add_310");
  layers[184] = new MWElementwiseAffineLayer;
  layers[184]->setName("Add_312");
  layers[184]->setInPlaceIndex(0, 0);
  layers[185] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058;
  layers[185]->setName("Mul_314");
  layers[186] = new MWConvLayer;
  layers[186]->setName("Conv_315");
  layers[187] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059;
  layers[187]->setName("Mul_317");
  layers[188] = new MWAdditionLayer;
  layers[188]->setName("Add_318");
  layers[189] = new MWConvLayer;
  layers[189]->setName("Conv_319");
  layers[190] = new MWConvLayer;
  layers[190]->setName("Conv_320");
  layers[191] = new MWAdditionLayer;
  layers[191]->setName("Add_321");
  layers[192] = new MWElementwiseAffineLayer;
  layers[192]->setName("Add_323");
  layers[192]->setInPlaceIndex(0, 0);
  layers[193] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060;
  layers[193]->setName("Mul_325");
  layers[194] = new MWConvLayer;
  layers[194]->setName("Conv_326");
  layers[195] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061;
  layers[195]->setName("Mul_328");
  layers[196] = new MWAdditionLayer;
  layers[196]->setName("Add_329");
  layers[197] = new MWConvLayer;
  layers[197]->setName("Conv_330");
  layers[198] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062;
  layers[198]->setName("Mul_332");
  layers[199] = new MWConcatenationLayer;
  layers[199]->setName("Concat_333");
  layers[200] = new MWConvLayer;
  layers[200]->setName("Conv_334");
  layers[201] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063;
  layers[201]->setName("Mul_336");
  layers[202] = new MWConvLayer;
  layers[202]->setName("Conv_337");
  layers[203] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064;
  layers[203]->setName("Mul_339");
  layers[204] = new MWConvLayer;
  layers[204]->setName("Conv_376_fused");
  layers[205] = new MWSplittingLayer;
  layers[205]->setName("Conv_376_fused_channelSplit");
  layers[205]->setInPlaceIndex(0, 0);
  layers[205]->setInPlaceIndex(1, 0);
  layers[206] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065;
  layers[206]->setName("Mul_342");
  layers[207] = new MWConvLayer;
  layers[207]->setName("Conv_343");
  layers[208] = new MWConvLayer;
  layers[208]->setName("Conv_344");
  layers[209] = new MWAdditionLayer;
  layers[209]->setName("Add_345");
  layers[210] = new MWElementwiseAffineLayer;
  layers[210]->setName("Add_347");
  layers[210]->setInPlaceIndex(0, 0);
  layers[211] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066;
  layers[211]->setName("Mul_349");
  layers[212] = new MWConvLayer;
  layers[212]->setName("Conv_350");
  layers[213] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067;
  layers[213]->setName("Mul_352");
  layers[214] = new MWAdditionLayer;
  layers[214]->setName("Add_353");
  layers[215] = new MWConvLayer;
  layers[215]->setName("Conv_354");
  layers[216] = new MWConvLayer;
  layers[216]->setName("Conv_355");
  layers[217] = new MWAdditionLayer;
  layers[217]->setName("Add_356");
  layers[218] = new MWElementwiseAffineLayer;
  layers[218]->setName("Add_358");
  layers[218]->setInPlaceIndex(0, 0);
  layers[219] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068;
  layers[219]->setName("Mul_360");
  layers[220] = new MWConvLayer;
  layers[220]->setName("Conv_361");
  layers[221] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069;
  layers[221]->setName("Mul_363");
  layers[222] = new MWAdditionLayer;
  layers[222]->setName("Add_364");
  layers[223] = new MWConvLayer;
  layers[223]->setName("Conv_365");
  layers[224] = new MWConvLayer;
  layers[224]->setName("Conv_366");
  layers[225] = new MWAdditionLayer;
  layers[225]->setName("Add_367");
  layers[226] = new MWElementwiseAffineLayer;
  layers[226]->setName("Add_369");
  layers[226]->setInPlaceIndex(0, 0);
  layers[227] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070;
  layers[227]->setName("Mul_371");
  layers[228] = new MWConvLayer;
  layers[228]->setName("Conv_372");
  layers[229] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071;
  layers[229]->setName("Mul_374");
  layers[230] = new MWAdditionLayer;
  layers[230]->setName("Add_375");
  layers[231] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072;
  layers[231]->setName("Mul_378");
  layers[232] = new MWConcatenationLayer;
  layers[232]->setName("Concat_379");
  layers[233] = new MWConvLayer;
  layers[233]->setName("Conv_380");
  layers[234] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073;
  layers[234]->setName("Mul_382");
  layers[235] = new MWConvLayer;
  layers[235]->setName("Conv_383");
  layers[236] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074;
  layers[236]->setName("Mul_385");
  layers[237] = new MWConcatenationLayer;
  layers[237]->setName("Concat_386");
  layers[238] = new MWConvLayer;
  layers[238]->setName("Conv_387");
  layers[239] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075;
  layers[239]->setName("Mul_389");
  layers[240] = new MWConvLayer;
  layers[240]->setName("Conv_390");
  layers[241] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076;
  layers[241]->setName("Mul_392");
  layers[242] = new MWMaxPoolingLayer;
  layers[242]->setName("MaxPool_393");
  layers[243] = new MWMaxPoolingLayer;
  layers[243]->setName("MaxPool_394");
  layers[244] = new MWMaxPoolingLayer;
  layers[244]->setName("MaxPool_395");
  layers[245] = new MWConcatenationLayer;
  layers[245]->setName("Concat_396");
  layers[246] = new MWConvLayer;
  layers[246]->setName("Conv_397");
  layers[247] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077;
  layers[247]->setName("Mul_399");
  layers[248] = new c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801;
  layers[248]->setName("ResizeLayer_1035");
  layers[249] = new MWConcatenationLayer;
  layers[249]->setName("Concat_401");
  layers[250] = new MWConvLayer;
  layers[250]->setName("Conv_402");
  layers[251] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078;
  layers[251]->setName("Mul_404");
  layers[252] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805;
  layers[252]->setName("SliceLayer1040");
  layers[253] = new MWConvLayer;
  layers[253]->setName("Conv_419");
  layers[254] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079;
  layers[254]->setName("Mul_421");
  layers[255] = new MWConvLayer;
  layers[255]->setName("Conv_422");
  layers[256] = new MWConvLayer;
  layers[256]->setName("Conv_423");
  layers[257] = new MWAdditionLayer;
  layers[257]->setName("Add_424");
  layers[258] = new MWElementwiseAffineLayer;
  layers[258]->setName("Add_426");
  layers[258]->setInPlaceIndex(0, 0);
  layers[259] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080;
  layers[259]->setName("Mul_428");
  layers[260] = new MWConvLayer;
  layers[260]->setName("Conv_429");
  layers[261] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081;
  layers[261]->setName("Mul_431");
  layers[262] = new MWAdditionLayer;
  layers[262]->setName("Add_432");
  layers[263] = new MWConvLayer;
  layers[263]->setName("Conv_433");
  layers[264] = new MWConvLayer;
  layers[264]->setName("Conv_434");
  layers[265] = new MWAdditionLayer;
  layers[265]->setName("Add_435");
  layers[266] = new MWElementwiseAffineLayer;
  layers[266]->setName("Add_437");
  layers[266]->setInPlaceIndex(0, 0);
  layers[267] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082;
  layers[267]->setName("Mul_439");
  layers[268] = new MWConvLayer;
  layers[268]->setName("Conv_440");
  layers[269] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083;
  layers[269]->setName("Mul_442");
  layers[270] = new MWAdditionLayer;
  layers[270]->setName("Add_443");
  layers[271] = new MWConvLayer;
  layers[271]->setName("Conv_444");
  layers[272] = new MWConvLayer;
  layers[272]->setName("Conv_445");
  layers[273] = new MWAdditionLayer;
  layers[273]->setName("Add_446");
  layers[274] = new MWElementwiseAffineLayer;
  layers[274]->setName("Add_448");
  layers[274]->setInPlaceIndex(0, 0);
  layers[275] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084;
  layers[275]->setName("Mul_450");
  layers[276] = new MWConvLayer;
  layers[276]->setName("Conv_451");
  layers[277] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085;
  layers[277]->setName("Mul_453");
  layers[278] = new MWAdditionLayer;
  layers[278]->setName("Add_454");
  layers[279] = new MWConvLayer;
  layers[279]->setName("Conv_455");
  layers[280] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086;
  layers[280]->setName("Mul_457");
  layers[281] = new MWConcatenationLayer;
  layers[281]->setName("Concat_458");
  layers[282] = new MWConvLayer;
  layers[282]->setName("Conv_459");
  layers[283] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087;
  layers[283]->setName("Mul_461");
  layers[284] = new MWConvLayer;
  layers[284]->setName("Conv_462");
  layers[285] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088;
  layers[285]->setName("Mul_464");
  layers[286] = new MWConvLayer;
  layers[286]->setName("Conv_501_fused");
  layers[287] = new MWSplittingLayer;
  layers[287]->setName("Conv_501_fused_channelSplit");
  layers[287]->setInPlaceIndex(0, 0);
  layers[287]->setInPlaceIndex(1, 0);
  layers[288] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089;
  layers[288]->setName("Mul_467");
  layers[289] = new MWConvLayer;
  layers[289]->setName("Conv_468");
  layers[290] = new MWConvLayer;
  layers[290]->setName("Conv_469");
  layers[291] = new MWAdditionLayer;
  layers[291]->setName("Add_470");
  layers[292] = new MWElementwiseAffineLayer;
  layers[292]->setName("Add_472");
  layers[292]->setInPlaceIndex(0, 0);
  layers[293] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090;
  layers[293]->setName("Mul_474");
  layers[294] = new MWConvLayer;
  layers[294]->setName("Conv_475");
  layers[295] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091;
  layers[295]->setName("Mul_477");
  layers[296] = new MWAdditionLayer;
  layers[296]->setName("Add_478");
  layers[297] = new MWConvLayer;
  layers[297]->setName("Conv_479");
  layers[298] = new MWConvLayer;
  layers[298]->setName("Conv_480");
  layers[299] = new MWAdditionLayer;
  layers[299]->setName("Add_481");
  layers[300] = new MWElementwiseAffineLayer;
  layers[300]->setName("Add_483");
  layers[300]->setInPlaceIndex(0, 0);
  layers[301] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092;
  layers[301]->setName("Mul_485");
  layers[302] = new MWConvLayer;
  layers[302]->setName("Conv_486");
  layers[303] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093;
  layers[303]->setName("Mul_488");
  layers[304] = new MWAdditionLayer;
  layers[304]->setName("Add_489");
  layers[305] = new MWConvLayer;
  layers[305]->setName("Conv_490");
  layers[306] = new MWConvLayer;
  layers[306]->setName("Conv_491");
  layers[307] = new MWAdditionLayer;
  layers[307]->setName("Add_492");
  layers[308] = new MWElementwiseAffineLayer;
  layers[308]->setName("Add_494");
  layers[308]->setInPlaceIndex(0, 0);
  layers[309] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094;
  layers[309]->setName("Mul_496");
  layers[310] = new MWConvLayer;
  layers[310]->setName("Conv_497");
  layers[311] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095;
  layers[311]->setName("Mul_499");
  layers[312] = new MWAdditionLayer;
  layers[312]->setName("Add_500");
  layers[313] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096;
  layers[313]->setName("Mul_503");
  layers[314] = new MWConcatenationLayer;
  layers[314]->setName("Concat_504");
  layers[315] = new MWConvLayer;
  layers[315]->setName("Conv_505");
  layers[316] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097;
  layers[316]->setName("Mul_507");
  layers[317] = new MWConvLayer;
  layers[317]->setName("Conv_508");
  layers[318] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098;
  layers[318]->setName("Mul_510");
  layers[319] = new MWConcatenationLayer;
  layers[319]->setName("Concat_511");
  layers[320] = new MWConvLayer;
  layers[320]->setName("Conv_512");
  layers[321] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099;
  layers[321]->setName("Mul_514");
  layers[322] = new c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802;
  layers[322]->setName("ResizeLayer_1044");
  layers[323] = new MWConcatenationLayer;
  layers[323]->setName("Concat_516");
  layers[324] = new MWConvLayer;
  layers[324]->setName("Conv_517");
  layers[325] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100;
  layers[325]->setName("Mul_519");
  layers[326] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806;
  layers[326]->setName("SliceLayer1049");
  layers[327] = new MWConvLayer;
  layers[327]->setName("Conv_534");
  layers[328] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101;
  layers[328]->setName("Mul_536");
  layers[329] = new MWConvLayer;
  layers[329]->setName("Conv_537");
  layers[330] = new MWConvLayer;
  layers[330]->setName("Conv_538");
  layers[331] = new MWAdditionLayer;
  layers[331]->setName("Add_539");
  layers[332] = new MWElementwiseAffineLayer;
  layers[332]->setName("Add_541");
  layers[332]->setInPlaceIndex(0, 0);
  layers[333] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102;
  layers[333]->setName("Mul_543");
  layers[334] = new MWConvLayer;
  layers[334]->setName("Conv_544");
  layers[335] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103;
  layers[335]->setName("Mul_546");
  layers[336] = new MWAdditionLayer;
  layers[336]->setName("Add_547");
  layers[337] = new MWConvLayer;
  layers[337]->setName("Conv_548");
  layers[338] = new MWConvLayer;
  layers[338]->setName("Conv_549");
  layers[339] = new MWAdditionLayer;
  layers[339]->setName("Add_550");
  layers[340] = new MWElementwiseAffineLayer;
  layers[340]->setName("Add_552");
  layers[340]->setInPlaceIndex(0, 0);
  layers[341] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104;
  layers[341]->setName("Mul_554");
  layers[342] = new MWConvLayer;
  layers[342]->setName("Conv_555");
  layers[343] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105;
  layers[343]->setName("Mul_557");
  layers[344] = new MWAdditionLayer;
  layers[344]->setName("Add_558");
  layers[345] = new MWConvLayer;
  layers[345]->setName("Conv_559");
  layers[346] = new MWConvLayer;
  layers[346]->setName("Conv_560");
  layers[347] = new MWAdditionLayer;
  layers[347]->setName("Add_561");
  layers[348] = new MWElementwiseAffineLayer;
  layers[348]->setName("Add_563");
  layers[348]->setInPlaceIndex(0, 0);
  layers[349] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106;
  layers[349]->setName("Mul_565");
  layers[350] = new MWConvLayer;
  layers[350]->setName("Conv_566");
  layers[351] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107;
  layers[351]->setName("Mul_568");
  layers[352] = new MWAdditionLayer;
  layers[352]->setName("Add_569");
  layers[353] = new MWConvLayer;
  layers[353]->setName("Conv_570");
  layers[354] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108;
  layers[354]->setName("Mul_572");
  layers[355] = new MWConcatenationLayer;
  layers[355]->setName("Concat_573");
  layers[356] = new MWConvLayer;
  layers[356]->setName("Conv_574");
  layers[357] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109;
  layers[357]->setName("Mul_576");
  layers[358] = new MWConvLayer;
  layers[358]->setName("Conv_577");
  layers[359] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110;
  layers[359]->setName("Mul_579");
  layers[360] = new MWConvLayer;
  layers[360]->setName("Conv_616_fused");
  layers[361] = new MWSplittingLayer;
  layers[361]->setName("Conv_616_fused_channelSplit");
  layers[361]->setInPlaceIndex(0, 0);
  layers[361]->setInPlaceIndex(1, 0);
  layers[362] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111;
  layers[362]->setName("Mul_582");
  layers[363] = new MWConvLayer;
  layers[363]->setName("Conv_583");
  layers[364] = new MWConvLayer;
  layers[364]->setName("Conv_584");
  layers[365] = new MWAdditionLayer;
  layers[365]->setName("Add_585");
  layers[366] = new MWElementwiseAffineLayer;
  layers[366]->setName("Add_587");
  layers[366]->setInPlaceIndex(0, 0);
  layers[367] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112;
  layers[367]->setName("Mul_589");
  layers[368] = new MWConvLayer;
  layers[368]->setName("Conv_590");
  layers[369] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113;
  layers[369]->setName("Mul_592");
  layers[370] = new MWAdditionLayer;
  layers[370]->setName("Add_593");
  layers[371] = new MWConvLayer;
  layers[371]->setName("Conv_594");
  layers[372] = new MWConvLayer;
  layers[372]->setName("Conv_595");
  layers[373] = new MWAdditionLayer;
  layers[373]->setName("Add_596");
  layers[374] = new MWElementwiseAffineLayer;
  layers[374]->setName("Add_598");
  layers[374]->setInPlaceIndex(0, 0);
  layers[375] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114;
  layers[375]->setName("Mul_600");
  layers[376] = new MWConvLayer;
  layers[376]->setName("Conv_601");
  layers[377] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115;
  layers[377]->setName("Mul_603");
  layers[378] = new MWAdditionLayer;
  layers[378]->setName("Add_604");
  layers[379] = new MWConvLayer;
  layers[379]->setName("Conv_605");
  layers[380] = new MWConvLayer;
  layers[380]->setName("Conv_606");
  layers[381] = new MWAdditionLayer;
  layers[381]->setName("Add_607");
  layers[382] = new MWElementwiseAffineLayer;
  layers[382]->setName("Add_609");
  layers[382]->setInPlaceIndex(0, 0);
  layers[383] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116;
  layers[383]->setName("Mul_611");
  layers[384] = new MWConvLayer;
  layers[384]->setName("Conv_612");
  layers[385] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117;
  layers[385]->setName("Mul_614");
  layers[386] = new MWAdditionLayer;
  layers[386]->setName("Add_615");
  layers[387] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118;
  layers[387]->setName("Mul_618");
  layers[388] = new MWConcatenationLayer;
  layers[388]->setName("Concat_619");
  layers[389] = new MWConvLayer;
  layers[389]->setName("Conv_620");
  layers[390] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119;
  layers[390]->setName("Mul_622");
  layers[391] = new MWConvLayer;
  layers[391]->setName("Conv_623");
  layers[392] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120;
  layers[392]->setName("Mul_625");
  layers[393] = new MWConcatenationLayer;
  layers[393]->setName("Concat_626");
  layers[394] = new MWConvLayer;
  layers[394]->setName("Conv_627");
  layers[395] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121;
  layers[395]->setName("Mul_629");
  layers[396] = new MWConvLayer;
  layers[396]->setName("Conv_877_fused");
  layers[397] = new MWSplittingLayer;
  layers[397]->setName("Conv_877_fused_channelSplit");
  layers[397]->setInPlaceIndex(0, 0);
  layers[397]->setInPlaceIndex(1, 0);
  layers[398] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168;
  layers[398]->setName("Mul_872");
  layers[399] = new MWConvLayer;
  layers[399]->setName("Conv_873");
  layers[400] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169;
  layers[400]->setName("Mul_875");
  layers[401] = new MWConvLayer;
  layers[401]->setName("Conv_876");
  layers[402] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170;
  layers[402]->setName("Mul_879");
  layers[403] = new MWConvLayer;
  layers[403]->setName("Conv_880");
  layers[404] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171;
  layers[404]->setName("Mul_882");
  layers[405] = new MWConvLayer;
  layers[405]->setName("Conv_883");
  layers[406] = new MWConcatenationLayer;
  layers[406]->setName("Concat_884");
  layers[407] = new MWOutputLayer;
  layers[407]->setName("output_Concat_884");
  layers[407]->setInPlaceIndex(0, 0);
  layers[408] = new MWAvgPoolingLayer;
  layers[408]->setName("AveragePool_632");
  layers[409] = new MWConvLayer;
  layers[409]->setName("Conv_633");
  layers[410] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122;
  layers[410]->setName("Mul_635");
  layers[411] = new MWConcatenationLayer;
  layers[411]->setName("Concat_636");
  layers[412] = new MWConvLayer;
  layers[412]->setName("Conv_637");
  layers[413] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123;
  layers[413]->setName("Mul_639");
  layers[414] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807;
  layers[414]->setName("SliceLayer1058");
  layers[415] = new MWConvLayer;
  layers[415]->setName("Conv_654");
  layers[416] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124;
  layers[416]->setName("Mul_656");
  layers[417] = new MWConvLayer;
  layers[417]->setName("Conv_657");
  layers[418] = new MWConvLayer;
  layers[418]->setName("Conv_658");
  layers[419] = new MWAdditionLayer;
  layers[419]->setName("Add_659");
  layers[420] = new MWElementwiseAffineLayer;
  layers[420]->setName("Add_661");
  layers[420]->setInPlaceIndex(0, 0);
  layers[421] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125;
  layers[421]->setName("Mul_663");
  layers[422] = new MWConvLayer;
  layers[422]->setName("Conv_664");
  layers[423] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126;
  layers[423]->setName("Mul_666");
  layers[424] = new MWAdditionLayer;
  layers[424]->setName("Add_667");
  layers[425] = new MWConvLayer;
  layers[425]->setName("Conv_668");
  layers[426] = new MWConvLayer;
  layers[426]->setName("Conv_669");
  layers[427] = new MWAdditionLayer;
  layers[427]->setName("Add_670");
  layers[428] = new MWElementwiseAffineLayer;
  layers[428]->setName("Add_672");
  layers[428]->setInPlaceIndex(0, 0);
  layers[429] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127;
  layers[429]->setName("Mul_674");
  layers[430] = new MWConvLayer;
  layers[430]->setName("Conv_675");
  layers[431] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128;
  layers[431]->setName("Mul_677");
  layers[432] = new MWAdditionLayer;
  layers[432]->setName("Add_678");
  layers[433] = new MWConvLayer;
  layers[433]->setName("Conv_679");
  layers[434] = new MWConvLayer;
  layers[434]->setName("Conv_680");
  layers[435] = new MWAdditionLayer;
  layers[435]->setName("Add_681");
  layers[436] = new MWElementwiseAffineLayer;
  layers[436]->setName("Add_683");
  layers[436]->setInPlaceIndex(0, 0);
  layers[437] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129;
  layers[437]->setName("Mul_685");
  layers[438] = new MWConvLayer;
  layers[438]->setName("Conv_686");
  layers[439] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130;
  layers[439]->setName("Mul_688");
  layers[440] = new MWAdditionLayer;
  layers[440]->setName("Add_689");
  layers[441] = new MWConvLayer;
  layers[441]->setName("Conv_690");
  layers[442] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131;
  layers[442]->setName("Mul_692");
  layers[443] = new MWConcatenationLayer;
  layers[443]->setName("Concat_693");
  layers[444] = new MWConvLayer;
  layers[444]->setName("Conv_694");
  layers[445] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132;
  layers[445]->setName("Mul_696");
  layers[446] = new MWConvLayer;
  layers[446]->setName("Conv_697");
  layers[447] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133;
  layers[447]->setName("Mul_699");
  layers[448] = new MWConvLayer;
  layers[448]->setName("Conv_736_fused");
  layers[449] = new MWSplittingLayer;
  layers[449]->setName("Conv_736_fused_channelSplit");
  layers[449]->setInPlaceIndex(0, 0);
  layers[449]->setInPlaceIndex(1, 0);
  layers[450] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134;
  layers[450]->setName("Mul_702");
  layers[451] = new MWConvLayer;
  layers[451]->setName("Conv_703");
  layers[452] = new MWConvLayer;
  layers[452]->setName("Conv_704");
  layers[453] = new MWAdditionLayer;
  layers[453]->setName("Add_705");
  layers[454] = new MWElementwiseAffineLayer;
  layers[454]->setName("Add_707");
  layers[454]->setInPlaceIndex(0, 0);
  layers[455] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135;
  layers[455]->setName("Mul_709");
  layers[456] = new MWConvLayer;
  layers[456]->setName("Conv_710");
  layers[457] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136;
  layers[457]->setName("Mul_712");
  layers[458] = new MWAdditionLayer;
  layers[458]->setName("Add_713");
  layers[459] = new MWConvLayer;
  layers[459]->setName("Conv_714");
  layers[460] = new MWConvLayer;
  layers[460]->setName("Conv_715");
  layers[461] = new MWAdditionLayer;
  layers[461]->setName("Add_716");
  layers[462] = new MWElementwiseAffineLayer;
  layers[462]->setName("Add_718");
  layers[462]->setInPlaceIndex(0, 0);
  layers[463] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137;
  layers[463]->setName("Mul_720");
  layers[464] = new MWConvLayer;
  layers[464]->setName("Conv_721");
  layers[465] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138;
  layers[465]->setName("Mul_723");
  layers[466] = new MWAdditionLayer;
  layers[466]->setName("Add_724");
  layers[467] = new MWConvLayer;
  layers[467]->setName("Conv_725");
  layers[468] = new MWConvLayer;
  layers[468]->setName("Conv_726");
  layers[469] = new MWAdditionLayer;
  layers[469]->setName("Add_727");
  layers[470] = new MWElementwiseAffineLayer;
  layers[470]->setName("Add_729");
  layers[470]->setInPlaceIndex(0, 0);
  layers[471] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139;
  layers[471]->setName("Mul_731");
  layers[472] = new MWConvLayer;
  layers[472]->setName("Conv_732");
  layers[473] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140;
  layers[473]->setName("Mul_734");
  layers[474] = new MWAdditionLayer;
  layers[474]->setName("Add_735");
  layers[475] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141;
  layers[475]->setName("Mul_738");
  layers[476] = new MWConcatenationLayer;
  layers[476]->setName("Concat_739");
  layers[477] = new MWConvLayer;
  layers[477]->setName("Conv_740");
  layers[478] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142;
  layers[478]->setName("Mul_742");
  layers[479] = new MWConvLayer;
  layers[479]->setName("Conv_743");
  layers[480] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143;
  layers[480]->setName("Mul_745");
  layers[481] = new MWConcatenationLayer;
  layers[481]->setName("Concat_746");
  layers[482] = new MWConvLayer;
  layers[482]->setName("Conv_747");
  layers[483] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144;
  layers[483]->setName("Mul_749");
  layers[484] = new MWConvLayer;
  layers[484]->setName("Conv_892_fused");
  layers[485] = new MWSplittingLayer;
  layers[485]->setName("Conv_892_fused_channelSplit");
  layers[485]->setInPlaceIndex(0, 0);
  layers[485]->setInPlaceIndex(1, 0);
  layers[486] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172;
  layers[486]->setName("Mul_887");
  layers[487] = new MWConvLayer;
  layers[487]->setName("Conv_888");
  layers[488] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173;
  layers[488]->setName("Mul_890");
  layers[489] = new MWConvLayer;
  layers[489]->setName("Conv_891");
  layers[490] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174;
  layers[490]->setName("Mul_894");
  layers[491] = new MWConvLayer;
  layers[491]->setName("Conv_895");
  layers[492] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175;
  layers[492]->setName("Mul_897");
  layers[493] = new MWConvLayer;
  layers[493]->setName("Conv_898");
  layers[494] = new MWConcatenationLayer;
  layers[494]->setName("Concat_899");
  layers[495] = new MWOutputLayer;
  layers[495]->setName("output_Concat_899");
  layers[495]->setInPlaceIndex(0, 0);
  layers[496] = new MWAvgPoolingLayer;
  layers[496]->setName("AveragePool_752");
  layers[497] = new MWConvLayer;
  layers[497]->setName("Conv_753");
  layers[498] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145;
  layers[498]->setName("Mul_755");
  layers[499] = new MWConcatenationLayer;
  layers[499]->setName("Concat_756");
  layers[500] = new MWConvLayer;
  layers[500]->setName("Conv_757");
  layers[501] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146;
  layers[501]->setName("Mul_759");
  layers[502] = new c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808;
  layers[502]->setName("SliceLayer1067");
  layers[503] = new MWConvLayer;
  layers[503]->setName("Conv_774");
  layers[504] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147;
  layers[504]->setName("Mul_776");
  layers[505] = new MWConvLayer;
  layers[505]->setName("Conv_777");
  layers[506] = new MWConvLayer;
  layers[506]->setName("Conv_778");
  layers[507] = new MWAdditionLayer;
  layers[507]->setName("Add_779");
  layers[508] = new MWElementwiseAffineLayer;
  layers[508]->setName("Add_781");
  layers[508]->setInPlaceIndex(0, 0);
  layers[509] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148;
  layers[509]->setName("Mul_783");
  layers[510] = new MWConvLayer;
  layers[510]->setName("Conv_784");
  layers[511] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149;
  layers[511]->setName("Mul_786");
  layers[512] = new MWAdditionLayer;
  layers[512]->setName("Add_787");
  layers[513] = new MWConvLayer;
  layers[513]->setName("Conv_788");
  layers[514] = new MWConvLayer;
  layers[514]->setName("Conv_789");
  layers[515] = new MWAdditionLayer;
  layers[515]->setName("Add_790");
  layers[516] = new MWElementwiseAffineLayer;
  layers[516]->setName("Add_792");
  layers[516]->setInPlaceIndex(0, 0);
  layers[517] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150;
  layers[517]->setName("Mul_794");
  layers[518] = new MWConvLayer;
  layers[518]->setName("Conv_795");
  layers[519] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151;
  layers[519]->setName("Mul_797");
  layers[520] = new MWAdditionLayer;
  layers[520]->setName("Add_798");
  layers[521] = new MWConvLayer;
  layers[521]->setName("Conv_799");
  layers[522] = new MWConvLayer;
  layers[522]->setName("Conv_800");
  layers[523] = new MWAdditionLayer;
  layers[523]->setName("Add_801");
  layers[524] = new MWElementwiseAffineLayer;
  layers[524]->setName("Add_803");
  layers[524]->setInPlaceIndex(0, 0);
  layers[525] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152;
  layers[525]->setName("Mul_805");
  layers[526] = new MWConvLayer;
  layers[526]->setName("Conv_806");
  layers[527] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153;
  layers[527]->setName("Mul_808");
  layers[528] = new MWAdditionLayer;
  layers[528]->setName("Add_809");
  layers[529] = new MWConvLayer;
  layers[529]->setName("Conv_810");
  layers[530] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154;
  layers[530]->setName("Mul_812");
  layers[531] = new MWConcatenationLayer;
  layers[531]->setName("Concat_813");
  layers[532] = new MWConvLayer;
  layers[532]->setName("Conv_814");
  layers[533] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155;
  layers[533]->setName("Mul_816");
  layers[534] = new MWConvLayer;
  layers[534]->setName("Conv_817");
  layers[535] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156;
  layers[535]->setName("Mul_819");
  layers[536] = new MWConvLayer;
  layers[536]->setName("Conv_856_fused");
  layers[537] = new MWSplittingLayer;
  layers[537]->setName("Conv_856_fused_channelSplit");
  layers[537]->setInPlaceIndex(0, 0);
  layers[537]->setInPlaceIndex(1, 0);
  layers[538] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157;
  layers[538]->setName("Mul_822");
  layers[539] = new MWConvLayer;
  layers[539]->setName("Conv_823");
  layers[540] = new MWConvLayer;
  layers[540]->setName("Conv_824");
  layers[541] = new MWAdditionLayer;
  layers[541]->setName("Add_825");
  layers[542] = new MWElementwiseAffineLayer;
  layers[542]->setName("Add_827");
  layers[542]->setInPlaceIndex(0, 0);
  layers[543] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158;
  layers[543]->setName("Mul_829");
  layers[544] = new MWConvLayer;
  layers[544]->setName("Conv_830");
  layers[545] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159;
  layers[545]->setName("Mul_832");
  layers[546] = new MWAdditionLayer;
  layers[546]->setName("Add_833");
  layers[547] = new MWConvLayer;
  layers[547]->setName("Conv_834");
  layers[548] = new MWConvLayer;
  layers[548]->setName("Conv_835");
  layers[549] = new MWAdditionLayer;
  layers[549]->setName("Add_836");
  layers[550] = new MWElementwiseAffineLayer;
  layers[550]->setName("Add_838");
  layers[550]->setInPlaceIndex(0, 0);
  layers[551] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160;
  layers[551]->setName("Mul_840");
  layers[552] = new MWConvLayer;
  layers[552]->setName("Conv_841");
  layers[553] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161;
  layers[553]->setName("Mul_843");
  layers[554] = new MWAdditionLayer;
  layers[554]->setName("Add_844");
  layers[555] = new MWConvLayer;
  layers[555]->setName("Conv_845");
  layers[556] = new MWConvLayer;
  layers[556]->setName("Conv_846");
  layers[557] = new MWAdditionLayer;
  layers[557]->setName("Add_847");
  layers[558] = new MWElementwiseAffineLayer;
  layers[558]->setName("Add_849");
  layers[558]->setInPlaceIndex(0, 0);
  layers[559] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162;
  layers[559]->setName("Mul_851");
  layers[560] = new MWConvLayer;
  layers[560]->setName("Conv_852");
  layers[561] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163;
  layers[561]->setName("Mul_854");
  layers[562] = new MWAdditionLayer;
  layers[562]->setName("Add_855");
  layers[563] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164;
  layers[563]->setName("Mul_858");
  layers[564] = new MWConcatenationLayer;
  layers[564]->setName("Concat_859");
  layers[565] = new MWConvLayer;
  layers[565]->setName("Conv_860");
  layers[566] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165;
  layers[566]->setName("Mul_862");
  layers[567] = new MWConvLayer;
  layers[567]->setName("Conv_863");
  layers[568] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166;
  layers[568]->setName("Mul_865");
  layers[569] = new MWConcatenationLayer;
  layers[569]->setName("Concat_866");
  layers[570] = new MWConvLayer;
  layers[570]->setName("Conv_867");
  layers[571] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167;
  layers[571]->setName("Mul_869");
  layers[572] = new MWConvLayer;
  layers[572]->setName("Conv_907_fused");
  layers[573] = new MWSplittingLayer;
  layers[573]->setName("Conv_907_fused_channelSplit");
  layers[573]->setInPlaceIndex(0, 0);
  layers[573]->setInPlaceIndex(1, 0);
  layers[574] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176;
  layers[574]->setName("Mul_902");
  layers[575] = new MWConvLayer;
  layers[575]->setName("Conv_903");
  layers[576] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177;
  layers[576]->setName("Mul_905");
  layers[577] = new MWConvLayer;
  layers[577]->setName("Conv_906");
  layers[578] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178;
  layers[578]->setName("Mul_909");
  layers[579] = new MWConvLayer;
  layers[579]->setName("Conv_910");
  layers[580] = new c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179;
  layers[580]->setName("Mul_912");
  layers[581] = new MWConvLayer;
  layers[581]->setName("Conv_913");
  layers[582] = new MWConcatenationLayer;
  layers[582]->setName("Concat_914");
  layers[583] = new MWOutputLayer;
  layers[583]->setName("output_Concat_914");
  layers[583]->setInPlaceIndex(0, 0);
  targetImpl = new MWCudnnTarget::MWTargetNetworkImpl;
  inputTensors[0] = new MWTensor<real32_T>;
  inputTensors[0]->setHeight(480);
  inputTensors[0]->setWidth(640);
  inputTensors[0]->setChannels(3);
  inputTensors[0]->setBatchSize(1);
  inputTensors[0]->setSequenceLength(1);
}

void c1_c1_Yolov9t0_ex_DLModel_280::deallocate()
{
  int32_T c1_idx;
  targetImpl->deallocate();
  for (c1_idx = 0; c1_idx < 584; c1_idx++) {
    layers[c1_idx]->deallocate();
  }
}

void c1_c1_Yolov9t0_ex_DLModel_280::setSize()
{
  int32_T c1_idx;
  for (c1_idx = 0; c1_idx < 584; c1_idx++) {
    layers[c1_idx]->propagateSize();
  }

  allocate();
  postsetup();
}

void c1_c1_Yolov9t0_ex_DLModel_280::resetState()
{
}

void c1_c1_Yolov9t0_ex_DLModel_280::setup(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  const char_T *c1_b_layerParamsString[2];
  const char_T *c1_c_layerParamsString[2];
  const char_T *c1_d_layerParamsString[2];
  const char_T *c1_e_layerParamsString[2];
  const char_T *c1_f_layerParamsString[2];
  const char_T *c1_g_layerParamsString[2];
  const char_T *c1_h_layerParamsString[2];
  const char_T *c1_i_layerParamsString[2];
  const char_T *c1_j_layerParamsString[2];
  const char_T *c1_layerParamsString[2];
  const char_T *c1_ab_layerParamString;
  const char_T *c1_ac_layerParamString;
  const char_T *c1_ad_layerParamString;
  const char_T *c1_ae_layerParamString;
  const char_T *c1_af_layerParamString;
  const char_T *c1_ag_layerParamString;
  const char_T *c1_ah_layerParamString;
  const char_T *c1_ai_layerParamString;
  const char_T *c1_aj_layerParamString;
  const char_T *c1_ak_layerParamString;
  const char_T *c1_am_layerParamString;
  const char_T *c1_ao_layerParamString;
  const char_T *c1_ap_layerParamString;
  const char_T *c1_aq_layerParamString;
  const char_T *c1_ar_layerParamString;
  const char_T *c1_as_layerParamString;
  const char_T *c1_b_layerParamString;
  const char_T *c1_bb_layerParamString;
  const char_T *c1_bc_layerParamString;
  const char_T *c1_bd_layerParamString;
  const char_T *c1_be_layerParamString;
  const char_T *c1_bf_layerParamString;
  const char_T *c1_bg_layerParamString;
  const char_T *c1_bh_layerParamString;
  const char_T *c1_bi_layerParamString;
  const char_T *c1_bj_layerParamString;
  const char_T *c1_bk_layerParamString;
  const char_T *c1_bm_layerParamString;
  const char_T *c1_bo_layerParamString;
  const char_T *c1_bp_layerParamString;
  const char_T *c1_bq_layerParamString;
  const char_T *c1_br_layerParamString;
  const char_T *c1_c_layerParamString;
  const char_T *c1_cb_layerParamString;
  const char_T *c1_cc_layerParamString;
  const char_T *c1_cd_layerParamString;
  const char_T *c1_ce_layerParamString;
  const char_T *c1_cf_layerParamString;
  const char_T *c1_cg_layerParamString;
  const char_T *c1_ch_layerParamString;
  const char_T *c1_ci_layerParamString;
  const char_T *c1_cj_layerParamString;
  const char_T *c1_ck_layerParamString;
  const char_T *c1_cm_layerParamString;
  const char_T *c1_co_layerParamString;
  const char_T *c1_cp_layerParamString;
  const char_T *c1_cq_layerParamString;
  const char_T *c1_cr_layerParamString;
  const char_T *c1_d_layerParamString;
  const char_T *c1_db_layerParamString;
  const char_T *c1_dc_layerParamString;
  const char_T *c1_dd_layerParamString;
  const char_T *c1_de_layerParamString;
  const char_T *c1_df_layerParamString;
  const char_T *c1_dg_layerParamString;
  const char_T *c1_dh_layerParamString;
  const char_T *c1_di_layerParamString;
  const char_T *c1_dj_layerParamString;
  const char_T *c1_dk_layerParamString;
  const char_T *c1_dm_layerParamString;
  const char_T *c1_do_layerParamString;
  const char_T *c1_dp_layerParamString;
  const char_T *c1_dq_layerParamString;
  const char_T *c1_dr_layerParamString;
  const char_T *c1_e_layerParamString;
  const char_T *c1_eb_layerParamString;
  const char_T *c1_ec_layerParamString;
  const char_T *c1_ed_layerParamString;
  const char_T *c1_ee_layerParamString;
  const char_T *c1_ef_layerParamString;
  const char_T *c1_eg_layerParamString;
  const char_T *c1_eh_layerParamString;
  const char_T *c1_ei_layerParamString;
  const char_T *c1_ej_layerParamString;
  const char_T *c1_ek_layerParamString;
  const char_T *c1_em_layerParamString;
  const char_T *c1_eo_layerParamString;
  const char_T *c1_ep_layerParamString;
  const char_T *c1_eq_layerParamString;
  const char_T *c1_er_layerParamString;
  const char_T *c1_f_layerParamString;
  const char_T *c1_fb_layerParamString;
  const char_T *c1_fc_layerParamString;
  const char_T *c1_fd_layerParamString;
  const char_T *c1_fe_layerParamString;
  const char_T *c1_ff_layerParamString;
  const char_T *c1_fg_layerParamString;
  const char_T *c1_fh_layerParamString;
  const char_T *c1_fi_layerParamString;
  const char_T *c1_fj_layerParamString;
  const char_T *c1_fk_layerParamString;
  const char_T *c1_fm_layerParamString;
  const char_T *c1_fo_layerParamString;
  const char_T *c1_fp_layerParamString;
  const char_T *c1_fq_layerParamString;
  const char_T *c1_fr_layerParamString;
  const char_T *c1_g_layerParamString;
  const char_T *c1_gb_layerParamString;
  const char_T *c1_gc_layerParamString;
  const char_T *c1_gd_layerParamString;
  const char_T *c1_ge_layerParamString;
  const char_T *c1_gf_layerParamString;
  const char_T *c1_gg_layerParamString;
  const char_T *c1_gh_layerParamString;
  const char_T *c1_gi_layerParamString;
  const char_T *c1_gj_layerParamString;
  const char_T *c1_gk_layerParamString;
  const char_T *c1_gm_layerParamString;
  const char_T *c1_go_layerParamString;
  const char_T *c1_gp_layerParamString;
  const char_T *c1_gq_layerParamString;
  const char_T *c1_gr_layerParamString;
  const char_T *c1_h_layerParamString;
  const char_T *c1_hb_layerParamString;
  const char_T *c1_hc_layerParamString;
  const char_T *c1_hd_layerParamString;
  const char_T *c1_he_layerParamString;
  const char_T *c1_hf_layerParamString;
  const char_T *c1_hg_layerParamString;
  const char_T *c1_hh_layerParamString;
  const char_T *c1_hi_layerParamString;
  const char_T *c1_hj_layerParamString;
  const char_T *c1_hk_layerParamString;
  const char_T *c1_hm_layerParamString;
  const char_T *c1_ho_layerParamString;
  const char_T *c1_hp_layerParamString;
  const char_T *c1_hq_layerParamString;
  const char_T *c1_hr_layerParamString;
  const char_T *c1_i_layerParamString;
  const char_T *c1_ib_layerParamString;
  const char_T *c1_ic_layerParamString;
  const char_T *c1_id_layerParamString;
  const char_T *c1_ie_layerParamString;
  const char_T *c1_if_layerParamString;
  const char_T *c1_ig_layerParamString;
  const char_T *c1_ih_layerParamString;
  const char_T *c1_ii_layerParamString;
  const char_T *c1_ij_layerParamString;
  const char_T *c1_ik_layerParamString;
  const char_T *c1_im_layerParamString;
  const char_T *c1_io_layerParamString;
  const char_T *c1_ip_layerParamString;
  const char_T *c1_iq_layerParamString;
  const char_T *c1_ir_layerParamString;
  const char_T *c1_j_layerParamString;
  const char_T *c1_jb_layerParamString;
  const char_T *c1_jc_layerParamString;
  const char_T *c1_jd_layerParamString;
  const char_T *c1_je_layerParamString;
  const char_T *c1_jf_layerParamString;
  const char_T *c1_jg_layerParamString;
  const char_T *c1_jh_layerParamString;
  const char_T *c1_ji_layerParamString;
  const char_T *c1_jj_layerParamString;
  const char_T *c1_jk_layerParamString;
  const char_T *c1_jm_layerParamString;
  const char_T *c1_jo_layerParamString;
  const char_T *c1_jp_layerParamString;
  const char_T *c1_jq_layerParamString;
  const char_T *c1_jr_layerParamString;
  const char_T *c1_k_layerParamString;
  const char_T *c1_kb_layerParamString;
  const char_T *c1_kc_layerParamString;
  const char_T *c1_kd_layerParamString;
  const char_T *c1_ke_layerParamString;
  const char_T *c1_kf_layerParamString;
  const char_T *c1_kg_layerParamString;
  const char_T *c1_kh_layerParamString;
  const char_T *c1_ki_layerParamString;
  const char_T *c1_kj_layerParamString;
  const char_T *c1_kk_layerParamString;
  const char_T *c1_km_layerParamString;
  const char_T *c1_ko_layerParamString;
  const char_T *c1_kp_layerParamString;
  const char_T *c1_kq_layerParamString;
  const char_T *c1_kr_layerParamString;
  const char_T *c1_layerParamString;
  const char_T *c1_m_layerParamString;
  const char_T *c1_mb_layerParamString;
  const char_T *c1_mc_layerParamString;
  const char_T *c1_md_layerParamString;
  const char_T *c1_me_layerParamString;
  const char_T *c1_mf_layerParamString;
  const char_T *c1_mg_layerParamString;
  const char_T *c1_mh_layerParamString;
  const char_T *c1_mi_layerParamString;
  const char_T *c1_mj_layerParamString;
  const char_T *c1_mk_layerParamString;
  const char_T *c1_mm_layerParamString;
  const char_T *c1_mo_layerParamString;
  const char_T *c1_mp_layerParamString;
  const char_T *c1_mq_layerParamString;
  const char_T *c1_mr_layerParamString;
  const char_T *c1_o_layerParamString;
  const char_T *c1_ob_layerParamString;
  const char_T *c1_oc_layerParamString;
  const char_T *c1_od_layerParamString;
  const char_T *c1_oe_layerParamString;
  const char_T *c1_of_layerParamString;
  const char_T *c1_og_layerParamString;
  const char_T *c1_oh_layerParamString;
  const char_T *c1_oi_layerParamString;
  const char_T *c1_oj_layerParamString;
  const char_T *c1_ok_layerParamString;
  const char_T *c1_om_layerParamString;
  const char_T *c1_oo_layerParamString;
  const char_T *c1_op_layerParamString;
  const char_T *c1_oq_layerParamString;
  const char_T *c1_or_layerParamString;
  const char_T *c1_p_layerParamString;
  const char_T *c1_pb_layerParamString;
  const char_T *c1_pc_layerParamString;
  const char_T *c1_pd_layerParamString;
  const char_T *c1_pe_layerParamString;
  const char_T *c1_pf_layerParamString;
  const char_T *c1_pg_layerParamString;
  const char_T *c1_ph_layerParamString;
  const char_T *c1_pi_layerParamString;
  const char_T *c1_pj_layerParamString;
  const char_T *c1_pk_layerParamString;
  const char_T *c1_pm_layerParamString;
  const char_T *c1_po_layerParamString;
  const char_T *c1_pp_layerParamString;
  const char_T *c1_pq_layerParamString;
  const char_T *c1_pr_layerParamString;
  const char_T *c1_q_layerParamString;
  const char_T *c1_qb_layerParamString;
  const char_T *c1_qc_layerParamString;
  const char_T *c1_qd_layerParamString;
  const char_T *c1_qe_layerParamString;
  const char_T *c1_qf_layerParamString;
  const char_T *c1_qg_layerParamString;
  const char_T *c1_qh_layerParamString;
  const char_T *c1_qi_layerParamString;
  const char_T *c1_qj_layerParamString;
  const char_T *c1_qk_layerParamString;
  const char_T *c1_qm_layerParamString;
  const char_T *c1_qo_layerParamString;
  const char_T *c1_qp_layerParamString;
  const char_T *c1_qq_layerParamString;
  const char_T *c1_qr_layerParamString;
  const char_T *c1_r_layerParamString;
  const char_T *c1_rb_layerParamString;
  const char_T *c1_rc_layerParamString;
  const char_T *c1_rd_layerParamString;
  const char_T *c1_re_layerParamString;
  const char_T *c1_rf_layerParamString;
  const char_T *c1_rg_layerParamString;
  const char_T *c1_ri_layerParamString;
  const char_T *c1_rj_layerParamString;
  const char_T *c1_rk_layerParamString;
  const char_T *c1_rm_layerParamString;
  const char_T *c1_ro_layerParamString;
  const char_T *c1_rp_layerParamString;
  const char_T *c1_rq_layerParamString;
  const char_T *c1_rr_layerParamString;
  const char_T *c1_s_layerParamString;
  const char_T *c1_sb_layerParamString;
  const char_T *c1_sc_layerParamString;
  const char_T *c1_sd_layerParamString;
  const char_T *c1_se_layerParamString;
  const char_T *c1_sf_layerParamString;
  const char_T *c1_sg_layerParamString;
  const char_T *c1_sh_layerParamString;
  const char_T *c1_si_layerParamString;
  const char_T *c1_sj_layerParamString;
  const char_T *c1_sk_layerParamString;
  const char_T *c1_sm_layerParamString;
  const char_T *c1_so_layerParamString;
  const char_T *c1_sp_layerParamString;
  const char_T *c1_sq_layerParamString;
  const char_T *c1_sr_layerParamString;
  const char_T *c1_t_layerParamString;
  const char_T *c1_tb_layerParamString;
  const char_T *c1_tc_layerParamString;
  const char_T *c1_td_layerParamString;
  const char_T *c1_te_layerParamString;
  const char_T *c1_tf_layerParamString;
  const char_T *c1_tg_layerParamString;
  const char_T *c1_th_layerParamString;
  const char_T *c1_ti_layerParamString;
  const char_T *c1_tj_layerParamString;
  const char_T *c1_tk_layerParamString;
  const char_T *c1_tm_layerParamString;
  const char_T *c1_to_layerParamString;
  const char_T *c1_tp_layerParamString;
  const char_T *c1_tq_layerParamString;
  const char_T *c1_tr_layerParamString;
  const char_T *c1_u_layerParamString;
  const char_T *c1_ub_layerParamString;
  const char_T *c1_uc_layerParamString;
  const char_T *c1_ud_layerParamString;
  const char_T *c1_ue_layerParamString;
  const char_T *c1_uf_layerParamString;
  const char_T *c1_ug_layerParamString;
  const char_T *c1_uh_layerParamString;
  const char_T *c1_ui_layerParamString;
  const char_T *c1_uj_layerParamString;
  const char_T *c1_uk_layerParamString;
  const char_T *c1_um_layerParamString;
  const char_T *c1_uo_layerParamString;
  const char_T *c1_up_layerParamString;
  const char_T *c1_uq_layerParamString;
  const char_T *c1_ur_layerParamString;
  const char_T *c1_v_layerParamString;
  const char_T *c1_vb_layerParamString;
  const char_T *c1_vc_layerParamString;
  const char_T *c1_vd_layerParamString;
  const char_T *c1_ve_layerParamString;
  const char_T *c1_vf_layerParamString;
  const char_T *c1_vg_layerParamString;
  const char_T *c1_vh_layerParamString;
  const char_T *c1_vi_layerParamString;
  const char_T *c1_vj_layerParamString;
  const char_T *c1_vk_layerParamString;
  const char_T *c1_vm_layerParamString;
  const char_T *c1_vo_layerParamString;
  const char_T *c1_vp_layerParamString;
  const char_T *c1_vq_layerParamString;
  const char_T *c1_vr_layerParamString;
  const char_T *c1_w_layerParamString;
  const char_T *c1_wb_layerParamString;
  const char_T *c1_wc_layerParamString;
  const char_T *c1_wd_layerParamString;
  const char_T *c1_we_layerParamString;
  const char_T *c1_wf_layerParamString;
  const char_T *c1_wg_layerParamString;
  const char_T *c1_wh_layerParamString;
  const char_T *c1_wi_layerParamString;
  const char_T *c1_wj_layerParamString;
  const char_T *c1_wk_layerParamString;
  const char_T *c1_wm_layerParamString;
  const char_T *c1_wo_layerParamString;
  const char_T *c1_wp_layerParamString;
  const char_T *c1_wq_layerParamString;
  const char_T *c1_wr_layerParamString;
  const char_T *c1_x_layerParamString;
  const char_T *c1_xb_layerParamString;
  const char_T *c1_xc_layerParamString;
  const char_T *c1_xd_layerParamString;
  const char_T *c1_xe_layerParamString;
  const char_T *c1_xf_layerParamString;
  const char_T *c1_xg_layerParamString;
  const char_T *c1_xh_layerParamString;
  const char_T *c1_xi_layerParamString;
  const char_T *c1_xj_layerParamString;
  const char_T *c1_xk_layerParamString;
  const char_T *c1_xm_layerParamString;
  const char_T *c1_xo_layerParamString;
  const char_T *c1_xp_layerParamString;
  const char_T *c1_xq_layerParamString;
  const char_T *c1_xr_layerParamString;
  const char_T *c1_y_layerParamString;
  const char_T *c1_yb_layerParamString;
  const char_T *c1_yc_layerParamString;
  const char_T *c1_yd_layerParamString;
  const char_T *c1_ye_layerParamString;
  const char_T *c1_yf_layerParamString;
  const char_T *c1_yg_layerParamString;
  const char_T *c1_yh_layerParamString;
  const char_T *c1_yi_layerParamString;
  const char_T *c1_yj_layerParamString;
  const char_T *c1_yk_layerParamString;
  const char_T *c1_ym_layerParamString;
  const char_T *c1_yo_layerParamString;
  const char_T *c1_yp_layerParamString;
  const char_T *c1_yq_layerParamString;
  const char_T *c1_yr_layerParamString;
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179 *>(layers[580]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178 *>(layers[578]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177 *>(layers[576]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176 *>(layers[574]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167 *>(layers[571]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166 *>(layers[568]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165 *>(layers[566]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164 *>(layers[563]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163 *>(layers[561]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162 *>(layers[559]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161 *>(layers[553]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160 *>(layers[551]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159 *>(layers[545]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158 *>(layers[543]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157 *>(layers[538]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156 *>(layers[535]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155 *>(layers[533]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154 *>(layers[530]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153 *>(layers[527]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152 *>(layers[525]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151 *>(layers[519]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150 *>(layers[517]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149 *>(layers[511]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148 *>(layers[509]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147 *>(layers[504]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808 *>(layers[502]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146 *>(layers[501]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145 *>(layers[498]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175 *>(layers[492]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174 *>(layers[490]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173 *>(layers[488]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172 *>(layers[486]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144 *>(layers[483]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143 *>(layers[480]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142 *>(layers[478]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141 *>(layers[475]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140 *>(layers[473]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139 *>(layers[471]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138 *>(layers[465]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137 *>(layers[463]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136 *>(layers[457]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135 *>(layers[455]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134 *>(layers[450]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133 *>(layers[447]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132 *>(layers[445]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131 *>(layers[442]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130 *>(layers[439]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129 *>(layers[437]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128 *>(layers[431]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127 *>(layers[429]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126 *>(layers[423]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125 *>(layers[421]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124 *>(layers[416]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807 *>(layers[414]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123 *>(layers[413]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122 *>(layers[410]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171 *>(layers[404]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170 *>(layers[402]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169 *>(layers[400]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168 *>(layers[398]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121 *>(layers[395]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120 *>(layers[392]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119 *>(layers[390]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118 *>(layers[387]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117 *>(layers[385]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116 *>(layers[383]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115 *>(layers[377]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114 *>(layers[375]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113 *>(layers[369]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112 *>(layers[367]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111 *>(layers[362]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110 *>(layers[359]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109 *>(layers[357]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108 *>(layers[354]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107 *>(layers[351]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106 *>(layers[349]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105 *>(layers[343]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104 *>(layers[341]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103 *>(layers[335]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102 *>(layers[333]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101 *>(layers[328]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806 *>(layers[326]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100 *>(layers[325]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[322]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099 *>(layers[321]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098 *>(layers[318]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097 *>(layers[316]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096 *>(layers[313]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095 *>(layers[311]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094 *>(layers[309]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093 *>(layers[303]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092 *>(layers[301]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091 *>(layers[295]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090 *>(layers[293]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089 *>(layers[288]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088 *>(layers[285]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087 *>(layers[283]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086 *>(layers[280]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085 *>(layers[277]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084 *>(layers[275]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083 *>(layers[269]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082 *>(layers[267]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081 *>(layers[261]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080 *>(layers[259]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079 *>(layers[254]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805 *>(layers[252]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078 *>(layers[251]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[248]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077 *>(layers[247]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076 *>(layers[241]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075 *>(layers[239]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074 *>(layers[236]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073 *>(layers[234]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072 *>(layers[231]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071 *>(layers[229]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070 *>(layers[227]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069 *>(layers[221]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068 *>(layers[219]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067 *>(layers[213]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066 *>(layers[211]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065 *>(layers[206]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064 *>(layers[203]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063 *>(layers[201]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062 *>(layers[198]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061 *>(layers[195]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060 *>(layers[193]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059 *>(layers[187]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058 *>(layers[185]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057 *>(layers[179]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056 *>(layers[177]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055 *>(layers[172]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804 *>(layers[170]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054 *>(layers[169]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053 *>(layers[167]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052 *>(layers[164]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051 *>(layers[161]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050 *>(layers[159]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049 *>(layers[156]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048 *>(layers[154]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047 *>(layers[152]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046 *>(layers[146]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045 *>(layers[144]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044 *>(layers[138]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043 *>(layers[136]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042 *>(layers[131]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041 *>(layers[128]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040 *>(layers[126]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039 *>(layers[123]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038 *>(layers[120]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037 *>(layers[118]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036 *>(layers[112]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035 *>(layers[110]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034 *>(layers[104]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033 *>(layers[102]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032 *>(layers[97]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803 *>(layers[95])
    )->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031 *>(layers[94]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030 *>(layers[92]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029 *>(layers[89]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028 *>(layers[86]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027 *>(layers[84]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026 *>(layers[81]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025 *>(layers[79]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024 *>(layers[77]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023 *>(layers[71]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022 *>(layers[69]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021 *>(layers[63]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020 *>(layers[61]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019 *>(layers[56]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018 *>(layers[53]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017 *>(layers[51]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016 *>(layers[48]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015 *>(layers[45]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014 *>(layers[43]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013 *>(layers[37]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012 *>(layers[35]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011 *>(layers[29]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010 *>(layers[27]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809 *>(layers[22]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[20])
    )->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808 *>(layers[19]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807 *>(layers[17]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806 *>(layers[14]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805 *>(layers[11]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804 *>(layers[9]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[7])
    )->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803 *>(layers[6]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[4]))
    ->setChartInstancePtr(chartInstance);
  (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[2]))
    ->setChartInstancePtr(chartInstance);
  if (isInitialized) {
    resetState();
  } else {
    targetImpl->preSetup();
    targetImpl->setAutoTune(true);
    (static_cast<MWInputLayer *>(layers[0]))->createInputLayer(targetImpl,
      inputTensors[0], "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[1]))->createConvLayer(targetImpl, layers
      [0]->getOutputTensor(0), 3, 3, 3, 16, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_0_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_0_b.bin",
      "SSCB", 1);
    c1_layerParamString = "in";
    c1_b_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[2]))
      ->c1_createCustomLayer(targetImpl, layers[1]->getOutputTensor(0), "Mul_2",
      "Swish", "Swish", &c1_layerParamString, &c1_b_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[3]))->createConvLayer(targetImpl, layers
      [2]->getOutputTensor(0), 3, 3, 16, 32, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_3_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_3_b.bin",
      "SSCB", 1);
    c1_c_layerParamString = "in";
    c1_d_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[4]))
      ->c1_createCustomLayer(targetImpl, layers[3]->getOutputTensor(0), "Mul_5",
      "Swish", "Swish", &c1_c_layerParamString, &c1_d_layerParamString, "SSCB",
      0);
    (static_cast<MWConvLayer *>(layers[5]))->createConvLayer(targetImpl, layers
      [4]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_6_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_6_b.bin",
      "SSCB", 1);
    c1_e_layerParamString = "in";
    c1_f_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803 *>(layers[6]))
      ->c1_createCustomLayer(targetImpl, layers[5]->getOutputTensor(0), "Mul_8",
      "Swish", "Swish", &c1_e_layerParamString, &c1_f_layerParamString, "SSCB",
      0);
    c1_g_layerParamString = "in";
    c1_layerParamsString[0] = "out1";
    c1_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[7]))
      ->c1_createCustomLayer(targetImpl, layers[6]->getOutputTensor(0),
      "SliceLayer1004", &c1_g_layerParamString, c1_layerParamsString, "SSCB",
      "SSCB", 1, 2);
    (static_cast<MWConvLayer *>(layers[8]))->createConvLayer(targetImpl, layers
      [7]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_23_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_23_b.bin",
      "SSCB", 0);
    c1_h_layerParamString = "in";
    c1_i_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804 *>(layers[9]))
      ->c1_createCustomLayer(targetImpl, layers[8]->getOutputTensor(0), "Mul_25",
      "Swish", "Swish", &c1_h_layerParamString, &c1_i_layerParamString, "SSCB",
      3);
    (static_cast<MWConvLayer *>(layers[10]))->createConvLayer(targetImpl,
      layers[9]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_26_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_26_b.bin",
      "SSCB", 0);
    c1_j_layerParamString = "in";
    c1_k_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805 *>(layers[11]))
      ->c1_createCustomLayer(targetImpl, layers[10]->getOutputTensor(0),
      "Mul_28", "Swish", "Swish", &c1_j_layerParamString, &c1_k_layerParamString,
      "SSCB", 4);
    (static_cast<MWConcatenationLayer *>(layers[12]))->createConcatenationLayer
      (targetImpl, 4, layers[7]->getOutputTensor(1), layers[7]->getOutputTensor
       (0), layers[9]->getOutputTensor(0), layers[11]->getOutputTensor(0), 3,
       "C", "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[13]))->createConvLayer(targetImpl,
      layers[12]->getOutputTensor(0), 1, 1, 64, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_30_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_30_b.bin",
      "SSCB", 1);
    c1_m_layerParamString = "in";
    c1_o_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806 *>(layers[14]))
      ->c1_createCustomLayer(targetImpl, layers[13]->getOutputTensor(0),
      "Mul_32", "Swish", "Swish", &c1_m_layerParamString, &c1_o_layerParamString,
      "SSCB", 0);
    (static_cast<MWAvgPoolingLayer *>(layers[15]))->createAvgPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[14]->getOutputTensor(0), 2, 2, 1, 1,
                          0, 0, 0, 0, 0, 0, "FLOAT", 1, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[16]))->createConvLayer(targetImpl,
      layers[15]->getOutputTensor(0), 3, 3, 32, 64, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_36_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_36_b.bin",
      "SSCB", 0);
    c1_p_layerParamString = "in";
    c1_q_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807 *>(layers[17]))
      ->c1_createCustomLayer(targetImpl, layers[16]->getOutputTensor(0),
      "Mul_38", "Swish", "Swish", &c1_p_layerParamString, &c1_q_layerParamString,
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[18]))->createConvLayer(targetImpl,
      layers[17]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_39_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_39_b.bin",
      "SSCB", 0);
    c1_r_layerParamString = "in";
    c1_s_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808 *>(layers[19]))
      ->c1_createCustomLayer(targetImpl, layers[18]->getOutputTensor(0),
      "Mul_41", "Swish", "Swish", &c1_r_layerParamString, &c1_s_layerParamString,
      "SSCB", 1);
    c1_t_layerParamString = "in";
    c1_b_layerParamsString[0] = "out1";
    c1_b_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[20]))
      ->c1_createCustomLayer(targetImpl, layers[19]->getOutputTensor(0),
      "SliceLayer1013", &c1_t_layerParamString, c1_b_layerParamsString, "SSCB",
      "SSCB", 0, 2);
    (static_cast<MWConvLayer *>(layers[21]))->createConvLayer(targetImpl,
      layers[20]->getOutputTensor(0), 1, 1, 32, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_56_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_56_b.bin",
      "SSCB", 1);
    c1_u_layerParamString = "in";
    c1_v_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809 *>(layers[22]))
      ->c1_createCustomLayer(targetImpl, layers[21]->getOutputTensor(0),
      "Mul_58", "Swish", "Swish", &c1_u_layerParamString, &c1_v_layerParamString,
      "SSCB", 3);
    (static_cast<MWConvLayer *>(layers[23]))->createConvLayer(targetImpl,
      layers[22]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_59_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_59_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[24]))->createConvLayer(targetImpl,
      layers[22]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_60_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_60_b.bin",
      "SSCB", 4);
    (static_cast<MWAdditionLayer *>(layers[25]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[23]->getOutputTensor(0), layers[24]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWElementwiseAffineLayer *>(layers[26]))
      ->createElementwiseAffineLayer(targetImpl, layers[25]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_63_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_63_offset.bin",
      "SSCB", 5);
    c1_w_layerParamString = "in";
    c1_x_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010 *>(layers[27]))
      ->c1_createCustomLayer(targetImpl, layers[26]->getOutputTensor(0),
      "Mul_65", "Swish", "Swish", &c1_w_layerParamString, &c1_x_layerParamString,
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[28]))->createConvLayer(targetImpl,
      layers[27]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_66_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_66_b.bin",
      "SSCB", 4);
    c1_y_layerParamString = "in";
    c1_ab_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011 *>(layers[29]))
      ->c1_createCustomLayer(targetImpl, layers[28]->getOutputTensor(0),
      "Mul_68", "Swish", "Swish", &c1_y_layerParamString,
      &c1_ab_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[30]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[22]->getOutputTensor(0), layers[29]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[31]))->createConvLayer(targetImpl,
      layers[30]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_70_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_70_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[32]))->createConvLayer(targetImpl,
      layers[30]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_71_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_71_b.bin",
      "SSCB", 3);
    (static_cast<MWAdditionLayer *>(layers[33]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[31]->getOutputTensor(0), layers[32]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWElementwiseAffineLayer *>(layers[34]))
      ->createElementwiseAffineLayer(targetImpl, layers[33]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_74_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_74_offset.bin",
      "SSCB", 5);
    c1_bb_layerParamString = "in";
    c1_cb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012 *>(layers[35]))
      ->c1_createCustomLayer(targetImpl, layers[34]->getOutputTensor(0),
      "Mul_76", "Swish", "Swish", &c1_bb_layerParamString,
      &c1_cb_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[36]))->createConvLayer(targetImpl,
      layers[35]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_77_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_77_b.bin",
      "SSCB", 3);
    c1_db_layerParamString = "in";
    c1_eb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013 *>(layers[37]))
      ->c1_createCustomLayer(targetImpl, layers[36]->getOutputTensor(0),
      "Mul_79", "Swish", "Swish", &c1_db_layerParamString,
      &c1_eb_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[38]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[30]->getOutputTensor(0), layers[37]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 3);
    (static_cast<MWConvLayer *>(layers[39]))->createConvLayer(targetImpl,
      layers[38]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_81_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_81_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[40]))->createConvLayer(targetImpl,
      layers[38]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_82_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_82_b.bin",
      "SSCB", 4);
    (static_cast<MWAdditionLayer *>(layers[41]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[39]->getOutputTensor(0), layers[40]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWElementwiseAffineLayer *>(layers[42]))
      ->createElementwiseAffineLayer(targetImpl, layers[41]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_85_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_85_offset.bin",
      "SSCB", 5);
    c1_fb_layerParamString = "in";
    c1_gb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014 *>(layers[43]))
      ->c1_createCustomLayer(targetImpl, layers[42]->getOutputTensor(0),
      "Mul_87", "Swish", "Swish", &c1_fb_layerParamString,
      &c1_gb_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[44]))->createConvLayer(targetImpl,
      layers[43]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_88_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_88_b.bin",
      "SSCB", 4);
    c1_hb_layerParamString = "in";
    c1_ib_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015 *>(layers[45]))
      ->c1_createCustomLayer(targetImpl, layers[44]->getOutputTensor(0),
      "Mul_90", "Swish", "Swish", &c1_hb_layerParamString,
      &c1_ib_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[46]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[38]->getOutputTensor(0), layers[45]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[47]))->createConvLayer(targetImpl,
      layers[20]->getOutputTensor(0), 1, 1, 32, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_92_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_92_b.bin",
      "SSCB", 1);
    c1_jb_layerParamString = "in";
    c1_kb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016 *>(layers[48]))
      ->c1_createCustomLayer(targetImpl, layers[47]->getOutputTensor(0),
      "Mul_94", "Swish", "Swish", &c1_jb_layerParamString,
      &c1_kb_layerParamString, "SSCB", 3);
    (static_cast<MWConcatenationLayer *>(layers[49]))->createConcatenationLayer
      (targetImpl, 2, layers[46]->getOutputTensor(0), layers[48]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[50]))->createConvLayer(targetImpl,
      layers[49]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_96_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_96_b.bin",
      "SSCB", 3);
    c1_mb_layerParamString = "in";
    c1_ob_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017 *>(layers[51]))
      ->c1_createCustomLayer(targetImpl, layers[50]->getOutputTensor(0),
      "Mul_98", "Swish", "Swish", &c1_mb_layerParamString,
      &c1_ob_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[52]))->createConvLayer(targetImpl,
      layers[51]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_99_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_99_b.bin",
      "SSCB", 3);
    c1_pb_layerParamString = "in";
    c1_qb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018 *>(layers[53]))
      ->c1_createCustomLayer(targetImpl, layers[52]->getOutputTensor(0),
      "Mul_101", "Swish", "Swish", &c1_pb_layerParamString,
      &c1_qb_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[54]))->createConvLayer(targetImpl,
      layers[53]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_138_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_138_b_fused.bin",
      "SSCB", 3);
    (static_cast<MWSplittingLayer *>(layers[55]))->createSplittingLayer
      (targetImpl, layers[54]->getOutputTensor(0), 2, 16, 16, 2, "SSCB", "SSCB",
       3, 3);
    c1_rb_layerParamString = "in";
    c1_sb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019 *>(layers[56]))
      ->c1_createCustomLayer(targetImpl, layers[55]->getOutputTensor(1),
      "Mul_104", "Swish", "Swish", &c1_rb_layerParamString,
      &c1_sb_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[57]))->createConvLayer(targetImpl,
      layers[56]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_105_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_105_b.bin",
      "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[58]))->createConvLayer(targetImpl,
      layers[56]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_106_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_106_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[59]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[57]->getOutputTensor(0), layers[58]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[60]))
      ->createElementwiseAffineLayer(targetImpl, layers[59]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_109_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_109_offset.bin",
      "SSCB", 7);
    c1_tb_layerParamString = "in";
    c1_ub_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020 *>(layers[61]))
      ->c1_createCustomLayer(targetImpl, layers[60]->getOutputTensor(0),
      "Mul_111", "Swish", "Swish", &c1_tb_layerParamString,
      &c1_ub_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[62]))->createConvLayer(targetImpl,
      layers[61]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_112_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_112_b.bin",
      "SSCB", 6);
    c1_vb_layerParamString = "in";
    c1_wb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021 *>(layers[63]))
      ->c1_createCustomLayer(targetImpl, layers[62]->getOutputTensor(0),
      "Mul_114", "Swish", "Swish", &c1_vb_layerParamString,
      &c1_wb_layerParamString, "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[64]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[56]->getOutputTensor(0), layers[63]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[65]))->createConvLayer(targetImpl,
      layers[64]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_116_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_116_b.bin",
      "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[66]))->createConvLayer(targetImpl,
      layers[64]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_117_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_117_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[67]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[65]->getOutputTensor(0), layers[66]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[68]))
      ->createElementwiseAffineLayer(targetImpl, layers[67]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_120_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_120_offset.bin",
      "SSCB", 7);
    c1_xb_layerParamString = "in";
    c1_yb_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022 *>(layers[69]))
      ->c1_createCustomLayer(targetImpl, layers[68]->getOutputTensor(0),
      "Mul_122", "Swish", "Swish", &c1_xb_layerParamString,
      &c1_yb_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[70]))->createConvLayer(targetImpl,
      layers[69]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_123_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_123_b.bin",
      "SSCB", 5);
    c1_ac_layerParamString = "in";
    c1_bc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023 *>(layers[71]))
      ->c1_createCustomLayer(targetImpl, layers[70]->getOutputTensor(0),
      "Mul_125", "Swish", "Swish", &c1_ac_layerParamString,
      &c1_bc_layerParamString, "SSCB", 4);
    (static_cast<MWAdditionLayer *>(layers[72]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[64]->getOutputTensor(0), layers[71]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[73]))->createConvLayer(targetImpl,
      layers[72]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_127_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_127_b.bin",
      "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[74]))->createConvLayer(targetImpl,
      layers[72]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_128_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_128_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[75]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[73]->getOutputTensor(0), layers[74]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[76]))
      ->createElementwiseAffineLayer(targetImpl, layers[75]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_131_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_131_offset.bin",
      "SSCB", 7);
    c1_cc_layerParamString = "in";
    c1_dc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024 *>(layers[77]))
      ->c1_createCustomLayer(targetImpl, layers[76]->getOutputTensor(0),
      "Mul_133", "Swish", "Swish", &c1_cc_layerParamString,
      &c1_dc_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[78]))->createConvLayer(targetImpl,
      layers[77]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_134_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_134_b.bin",
      "SSCB", 6);
    c1_ec_layerParamString = "in";
    c1_fc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025 *>(layers[79]))
      ->c1_createCustomLayer(targetImpl, layers[78]->getOutputTensor(0),
      "Mul_136", "Swish", "Swish", &c1_ec_layerParamString,
      &c1_fc_layerParamString, "SSCB", 4);
    (static_cast<MWAdditionLayer *>(layers[80]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[72]->getOutputTensor(0), layers[79]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    c1_gc_layerParamString = "in";
    c1_hc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026 *>(layers[81]))
      ->c1_createCustomLayer(targetImpl, layers[55]->getOutputTensor(0),
      "Mul_140", "Swish", "Swish", &c1_gc_layerParamString,
      &c1_hc_layerParamString, "SSCB", 4);
    (static_cast<MWConcatenationLayer *>(layers[82]))->createConcatenationLayer
      (targetImpl, 2, layers[80]->getOutputTensor(0), layers[81]
       ->getOutputTensor(0), 3, "C", "SSCB", 3);
    (static_cast<MWConvLayer *>(layers[83]))->createConvLayer(targetImpl,
      layers[82]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_142_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_142_b.bin",
      "SSCB", 4);
    c1_ic_layerParamString = "in";
    c1_jc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027 *>(layers[84]))
      ->c1_createCustomLayer(targetImpl, layers[83]->getOutputTensor(0),
      "Mul_144", "Swish", "Swish", &c1_ic_layerParamString,
      &c1_jc_layerParamString, "SSCB", 3);
    (static_cast<MWConvLayer *>(layers[85]))->createConvLayer(targetImpl,
      layers[84]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_145_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_145_b.bin",
      "SSCB", 4);
    c1_kc_layerParamString = "in";
    c1_mc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028 *>(layers[86]))
      ->c1_createCustomLayer(targetImpl, layers[85]->getOutputTensor(0),
      "Mul_147", "Swish", "Swish", &c1_kc_layerParamString,
      &c1_mc_layerParamString, "SSCB", 3);
    (static_cast<MWConcatenationLayer *>(layers[87]))->createConcatenationLayer
      (targetImpl, 4, layers[20]->getOutputTensor(1), layers[20]
       ->getOutputTensor(0), layers[53]->getOutputTensor(0), layers[86]
       ->getOutputTensor(0), 3, "C", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[88]))->createConvLayer(targetImpl,
      layers[87]->getOutputTensor(0), 1, 1, 128, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_149_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_149_b.bin",
      "SSCB", 0);
    c1_oc_layerParamString = "in";
    c1_pc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029 *>(layers[89]))
      ->c1_createCustomLayer(targetImpl, layers[88]->getOutputTensor(0),
      "Mul_151", "Swish", "Swish", &c1_oc_layerParamString,
      &c1_pc_layerParamString, "SSCB", 1);
    (static_cast<MWAvgPoolingLayer *>(layers[90]))->createAvgPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[89]->getOutputTensor(0), 2, 2, 1, 1,
                          0, 0, 0, 0, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[91]))->createConvLayer(targetImpl,
      layers[90]->getOutputTensor(0), 3, 3, 64, 96, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_155_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_155_b.bin",
      "SSCB", 2);
    c1_qc_layerParamString = "in";
    c1_rc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030 *>(layers[92]))
      ->c1_createCustomLayer(targetImpl, layers[91]->getOutputTensor(0),
      "Mul_157", "Swish", "Swish", &c1_qc_layerParamString,
      &c1_rc_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[93]))->createConvLayer(targetImpl,
      layers[92]->getOutputTensor(0), 1, 1, 96, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_158_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_158_b.bin",
      "SSCB", 2);
    c1_sc_layerParamString = "in";
    c1_tc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031 *>(layers[94]))
      ->c1_createCustomLayer(targetImpl, layers[93]->getOutputTensor(0),
      "Mul_160", "Swish", "Swish", &c1_sc_layerParamString,
      &c1_tc_layerParamString, "SSCB", 0);
    c1_uc_layerParamString = "in";
    c1_c_layerParamsString[0] = "out1";
    c1_c_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803 *>(layers[95]))
      ->c1_createCustomLayer(targetImpl, layers[94]->getOutputTensor(0),
      "SliceLayer1022", &c1_uc_layerParamString, c1_c_layerParamsString, "SSCB",
      "SSCB", 2, 3);
    (static_cast<MWConvLayer *>(layers[96]))->createConvLayer(targetImpl,
      layers[95]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_175_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_175_b.bin",
      "SSCB", 0);
    c1_vc_layerParamString = "in";
    c1_wc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032 *>(layers[97]))
      ->c1_createCustomLayer(targetImpl, layers[96]->getOutputTensor(0),
      "Mul_177", "Swish", "Swish", &c1_vc_layerParamString,
      &c1_wc_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[98]))->createConvLayer(targetImpl,
      layers[97]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_178_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_178_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[99]))->createConvLayer(targetImpl,
      layers[97]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_179_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_179_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[100]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[98]->getOutputTensor(0), layers[99]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWElementwiseAffineLayer *>(layers[101]))
      ->createElementwiseAffineLayer(targetImpl, layers[100]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_182_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_182_offset.bin",
      "SSCB", 6);
    c1_xc_layerParamString = "in";
    c1_yc_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033 *>(layers[102]))
      ->c1_createCustomLayer(targetImpl, layers[101]->getOutputTensor(0),
      "Mul_184", "Swish", "Swish", &c1_xc_layerParamString,
      &c1_yc_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[103]))->createConvLayer(targetImpl,
      layers[102]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_185_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_185_b.bin",
      "SSCB", 5);
    c1_ad_layerParamString = "in";
    c1_bd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034 *>(layers[104]))
      ->c1_createCustomLayer(targetImpl, layers[103]->getOutputTensor(0),
      "Mul_187", "Swish", "Swish", &c1_ad_layerParamString,
      &c1_bd_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[105]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[97]->getOutputTensor(0), layers[104]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[106]))->createConvLayer(targetImpl,
      layers[105]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_189_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_189_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[107]))->createConvLayer(targetImpl,
      layers[105]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_190_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_190_b.bin",
      "SSCB", 4);
    (static_cast<MWAdditionLayer *>(layers[108]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[106]->getOutputTensor(0), layers[107]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWElementwiseAffineLayer *>(layers[109]))
      ->createElementwiseAffineLayer(targetImpl, layers[108]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_193_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_193_offset.bin",
      "SSCB", 6);
    c1_cd_layerParamString = "in";
    c1_dd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035 *>(layers[110]))
      ->c1_createCustomLayer(targetImpl, layers[109]->getOutputTensor(0),
      "Mul_195", "Swish", "Swish", &c1_cd_layerParamString,
      &c1_dd_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[111]))->createConvLayer(targetImpl,
      layers[110]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_196_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_196_b.bin",
      "SSCB", 4);
    c1_ed_layerParamString = "in";
    c1_fd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036 *>(layers[112]))
      ->c1_createCustomLayer(targetImpl, layers[111]->getOutputTensor(0),
      "Mul_198", "Swish", "Swish", &c1_ed_layerParamString,
      &c1_fd_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[113]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[105]->getOutputTensor(0), layers[112]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[114]))->createConvLayer(targetImpl,
      layers[113]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_200_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_200_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[115]))->createConvLayer(targetImpl,
      layers[113]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_201_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_201_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[116]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[114]->getOutputTensor(0), layers[115]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWElementwiseAffineLayer *>(layers[117]))
      ->createElementwiseAffineLayer(targetImpl, layers[116]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_204_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_204_offset.bin",
      "SSCB", 6);
    c1_gd_layerParamString = "in";
    c1_hd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037 *>(layers[118]))
      ->c1_createCustomLayer(targetImpl, layers[117]->getOutputTensor(0),
      "Mul_206", "Swish", "Swish", &c1_gd_layerParamString,
      &c1_hd_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[119]))->createConvLayer(targetImpl,
      layers[118]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_207_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_207_b.bin",
      "SSCB", 5);
    c1_id_layerParamString = "in";
    c1_jd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038 *>(layers[120]))
      ->c1_createCustomLayer(targetImpl, layers[119]->getOutputTensor(0),
      "Mul_209", "Swish", "Swish", &c1_id_layerParamString,
      &c1_jd_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[121]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[113]->getOutputTensor(0), layers[120]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[122]))->createConvLayer(targetImpl,
      layers[95]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_211_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_211_b.bin",
      "SSCB", 0);
    c1_kd_layerParamString = "in";
    c1_md_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039 *>(layers[123]))
      ->c1_createCustomLayer(targetImpl, layers[122]->getOutputTensor(0),
      "Mul_213", "Swish", "Swish", &c1_kd_layerParamString,
      &c1_md_layerParamString, "SSCB", 4);
    (static_cast<MWConcatenationLayer *>(layers[124]))->createConcatenationLayer
      (targetImpl, 2, layers[121]->getOutputTensor(0), layers[123]
       ->getOutputTensor(0), 3, "C", "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[125]))->createConvLayer(targetImpl,
      layers[124]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_215_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_215_b.bin",
      "SSCB", 4);
    c1_od_layerParamString = "in";
    c1_pd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040 *>(layers[126]))
      ->c1_createCustomLayer(targetImpl, layers[125]->getOutputTensor(0),
      "Mul_217", "Swish", "Swish", &c1_od_layerParamString,
      &c1_pd_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[127]))->createConvLayer(targetImpl,
      layers[126]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_218_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_218_b.bin",
      "SSCB", 4);
    c1_qd_layerParamString = "in";
    c1_rd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041 *>(layers[128]))
      ->c1_createCustomLayer(targetImpl, layers[127]->getOutputTensor(0),
      "Mul_220", "Swish", "Swish", &c1_qd_layerParamString,
      &c1_rd_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[129]))->createConvLayer(targetImpl,
      layers[128]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_257_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_257_b_fused.bin",
      "SSCB", 4);
    (static_cast<MWSplittingLayer *>(layers[130]))->createSplittingLayer
      (targetImpl, layers[129]->getOutputTensor(0), 2, 24, 24, 2, "SSCB", "SSCB",
       4, 4);
    c1_sd_layerParamString = "in";
    c1_td_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042 *>(layers[131]))
      ->c1_createCustomLayer(targetImpl, layers[130]->getOutputTensor(1),
      "Mul_223", "Swish", "Swish", &c1_sd_layerParamString,
      &c1_td_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[132]))->createConvLayer(targetImpl,
      layers[131]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_224_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_224_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[133]))->createConvLayer(targetImpl,
      layers[131]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_225_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_225_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[134]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[132]->getOutputTensor(0), layers[133]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWElementwiseAffineLayer *>(layers[135]))
      ->createElementwiseAffineLayer(targetImpl, layers[134]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_228_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_228_offset.bin",
      "SSCB", 8);
    c1_ud_layerParamString = "in";
    c1_vd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043 *>(layers[136]))
      ->c1_createCustomLayer(targetImpl, layers[135]->getOutputTensor(0),
      "Mul_230", "Swish", "Swish", &c1_ud_layerParamString,
      &c1_vd_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[137]))->createConvLayer(targetImpl,
      layers[136]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_231_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_231_b.bin",
      "SSCB", 7);
    c1_wd_layerParamString = "in";
    c1_xd_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044 *>(layers[138]))
      ->c1_createCustomLayer(targetImpl, layers[137]->getOutputTensor(0),
      "Mul_233", "Swish", "Swish", &c1_wd_layerParamString,
      &c1_xd_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[139]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[131]->getOutputTensor(0), layers[138]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[140]))->createConvLayer(targetImpl,
      layers[139]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_235_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_235_b.bin",
      "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[141]))->createConvLayer(targetImpl,
      layers[139]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_236_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_236_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[142]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[140]->getOutputTensor(0), layers[141]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWElementwiseAffineLayer *>(layers[143]))
      ->createElementwiseAffineLayer(targetImpl, layers[142]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_239_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_239_offset.bin",
      "SSCB", 8);
    c1_yd_layerParamString = "in";
    c1_ae_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045 *>(layers[144]))
      ->c1_createCustomLayer(targetImpl, layers[143]->getOutputTensor(0),
      "Mul_241", "Swish", "Swish", &c1_yd_layerParamString,
      &c1_ae_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[145]))->createConvLayer(targetImpl,
      layers[144]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_242_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_242_b.bin",
      "SSCB", 6);
    c1_be_layerParamString = "in";
    c1_ce_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046 *>(layers[146]))
      ->c1_createCustomLayer(targetImpl, layers[145]->getOutputTensor(0),
      "Mul_244", "Swish", "Swish", &c1_be_layerParamString,
      &c1_ce_layerParamString, "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[147]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[139]->getOutputTensor(0), layers[146]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[148]))->createConvLayer(targetImpl,
      layers[147]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_246_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_246_b.bin",
      "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[149]))->createConvLayer(targetImpl,
      layers[147]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_247_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_247_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[150]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[148]->getOutputTensor(0), layers[149]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWElementwiseAffineLayer *>(layers[151]))
      ->createElementwiseAffineLayer(targetImpl, layers[150]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_250_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_250_offset.bin",
      "SSCB", 8);
    c1_de_layerParamString = "in";
    c1_ee_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047 *>(layers[152]))
      ->c1_createCustomLayer(targetImpl, layers[151]->getOutputTensor(0),
      "Mul_252", "Swish", "Swish", &c1_de_layerParamString,
      &c1_ee_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[153]))->createConvLayer(targetImpl,
      layers[152]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_253_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_253_b.bin",
      "SSCB", 7);
    c1_fe_layerParamString = "in";
    c1_ge_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048 *>(layers[154]))
      ->c1_createCustomLayer(targetImpl, layers[153]->getOutputTensor(0),
      "Mul_255", "Swish", "Swish", &c1_fe_layerParamString,
      &c1_ge_layerParamString, "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[155]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[147]->getOutputTensor(0), layers[154]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    c1_he_layerParamString = "in";
    c1_ie_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049 *>(layers[156]))
      ->c1_createCustomLayer(targetImpl, layers[130]->getOutputTensor(0),
      "Mul_259", "Swish", "Swish", &c1_he_layerParamString,
      &c1_ie_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[157]))->createConcatenationLayer
      (targetImpl, 2, layers[155]->getOutputTensor(0), layers[156]
       ->getOutputTensor(0), 3, "C", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[158]))->createConvLayer(targetImpl,
      layers[157]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_261_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_261_b.bin",
      "SSCB", 5);
    c1_je_layerParamString = "in";
    c1_ke_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050 *>(layers[159]))
      ->c1_createCustomLayer(targetImpl, layers[158]->getOutputTensor(0),
      "Mul_263", "Swish", "Swish", &c1_je_layerParamString,
      &c1_ke_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[160]))->createConvLayer(targetImpl,
      layers[159]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_264_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_264_b.bin",
      "SSCB", 5);
    c1_me_layerParamString = "in";
    c1_oe_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051 *>(layers[161]))
      ->c1_createCustomLayer(targetImpl, layers[160]->getOutputTensor(0),
      "Mul_266", "Swish", "Swish", &c1_me_layerParamString,
      &c1_oe_layerParamString, "SSCB", 4);
    (static_cast<MWConcatenationLayer *>(layers[162]))->createConcatenationLayer
      (targetImpl, 4, layers[95]->getOutputTensor(1), layers[95]
       ->getOutputTensor(0), layers[128]->getOutputTensor(0), layers[161]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[163]))->createConvLayer(targetImpl,
      layers[162]->getOutputTensor(0), 1, 1, 192, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_268_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_268_b.bin",
      "SSCB", 0);
    c1_pe_layerParamString = "in";
    c1_qe_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052 *>(layers[164]))
      ->c1_createCustomLayer(targetImpl, layers[163]->getOutputTensor(0),
      "Mul_270", "Swish", "Swish", &c1_pe_layerParamString,
      &c1_qe_layerParamString, "SSCB", 2);
    (static_cast<MWAvgPoolingLayer *>(layers[165]))->createAvgPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[164]->getOutputTensor(0), 2, 2, 1,
                          1, 0, 0, 0, 0, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[166]))->createConvLayer(targetImpl,
      layers[165]->getOutputTensor(0), 3, 3, 96, 128, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_274_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_274_b.bin",
      "SSCB", 3);
    c1_re_layerParamString = "in";
    c1_se_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053 *>(layers[167]))
      ->c1_createCustomLayer(targetImpl, layers[166]->getOutputTensor(0),
      "Mul_276", "Swish", "Swish", &c1_re_layerParamString,
      &c1_se_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[168]))->createConvLayer(targetImpl,
      layers[167]->getOutputTensor(0), 1, 1, 128, 128, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_277_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_277_b.bin",
      "SSCB", 3);
    c1_te_layerParamString = "in";
    c1_ue_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054 *>(layers[169]))
      ->c1_createCustomLayer(targetImpl, layers[168]->getOutputTensor(0),
      "Mul_279", "Swish", "Swish", &c1_te_layerParamString,
      &c1_ue_layerParamString, "SSCB", 0);
    c1_ve_layerParamString = "in";
    c1_d_layerParamsString[0] = "out1";
    c1_d_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804 *>(layers[170]))
      ->c1_createCustomLayer(targetImpl, layers[169]->getOutputTensor(0),
      "SliceLayer1031", &c1_ve_layerParamString, c1_d_layerParamsString, "SSCB",
      "SSCB", 3, 4);
    (static_cast<MWConvLayer *>(layers[171]))->createConvLayer(targetImpl,
      layers[170]->getOutputTensor(0), 1, 1, 64, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_294_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_294_b.bin",
      "SSCB", 0);
    c1_we_layerParamString = "in";
    c1_xe_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055 *>(layers[172]))
      ->c1_createCustomLayer(targetImpl, layers[171]->getOutputTensor(0),
      "Mul_296", "Swish", "Swish", &c1_we_layerParamString,
      &c1_xe_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[173]))->createConvLayer(targetImpl,
      layers[172]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_297_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_297_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[174]))->createConvLayer(targetImpl,
      layers[172]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_298_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_298_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[175]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[173]->getOutputTensor(0), layers[174]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[176]))
      ->createElementwiseAffineLayer(targetImpl, layers[175]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_301_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_301_offset.bin",
      "SSCB", 7);
    c1_ye_layerParamString = "in";
    c1_af_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056 *>(layers[177]))
      ->c1_createCustomLayer(targetImpl, layers[176]->getOutputTensor(0),
      "Mul_303", "Swish", "Swish", &c1_ye_layerParamString,
      &c1_af_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[178]))->createConvLayer(targetImpl,
      layers[177]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_304_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_304_b.bin",
      "SSCB", 6);
    c1_bf_layerParamString = "in";
    c1_cf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057 *>(layers[179]))
      ->c1_createCustomLayer(targetImpl, layers[178]->getOutputTensor(0),
      "Mul_306", "Swish", "Swish", &c1_bf_layerParamString,
      &c1_cf_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[180]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[172]->getOutputTensor(0), layers[179]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[181]))->createConvLayer(targetImpl,
      layers[180]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_308_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_308_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[182]))->createConvLayer(targetImpl,
      layers[180]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_309_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_309_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[183]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[181]->getOutputTensor(0), layers[182]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[184]))
      ->createElementwiseAffineLayer(targetImpl, layers[183]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_312_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_312_offset.bin",
      "SSCB", 7);
    c1_df_layerParamString = "in";
    c1_ef_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058 *>(layers[185]))
      ->c1_createCustomLayer(targetImpl, layers[184]->getOutputTensor(0),
      "Mul_314", "Swish", "Swish", &c1_df_layerParamString,
      &c1_ef_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[186]))->createConvLayer(targetImpl,
      layers[185]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_315_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_315_b.bin",
      "SSCB", 5);
    c1_ff_layerParamString = "in";
    c1_gf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059 *>(layers[187]))
      ->c1_createCustomLayer(targetImpl, layers[186]->getOutputTensor(0),
      "Mul_317", "Swish", "Swish", &c1_ff_layerParamString,
      &c1_gf_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[188]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[180]->getOutputTensor(0), layers[187]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[189]))->createConvLayer(targetImpl,
      layers[188]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_319_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_319_b.bin",
      "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[190]))->createConvLayer(targetImpl,
      layers[188]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_320_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_320_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[191]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[189]->getOutputTensor(0), layers[190]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[192]))
      ->createElementwiseAffineLayer(targetImpl, layers[191]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_323_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_323_offset.bin",
      "SSCB", 7);
    c1_hf_layerParamString = "in";
    c1_if_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060 *>(layers[193]))
      ->c1_createCustomLayer(targetImpl, layers[192]->getOutputTensor(0),
      "Mul_325", "Swish", "Swish", &c1_hf_layerParamString,
      &c1_if_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[194]))->createConvLayer(targetImpl,
      layers[193]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_326_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_326_b.bin",
      "SSCB", 6);
    c1_jf_layerParamString = "in";
    c1_kf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061 *>(layers[195]))
      ->c1_createCustomLayer(targetImpl, layers[194]->getOutputTensor(0),
      "Mul_328", "Swish", "Swish", &c1_jf_layerParamString,
      &c1_kf_layerParamString, "SSCB", 0);
    (static_cast<MWAdditionLayer *>(layers[196]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[188]->getOutputTensor(0), layers[195]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[197]))->createConvLayer(targetImpl,
      layers[170]->getOutputTensor(0), 1, 1, 64, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_330_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_330_b.bin",
      "SSCB", 0);
    c1_mf_layerParamString = "in";
    c1_of_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062 *>(layers[198]))
      ->c1_createCustomLayer(targetImpl, layers[197]->getOutputTensor(0),
      "Mul_332", "Swish", "Swish", &c1_mf_layerParamString,
      &c1_of_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[199]))->createConcatenationLayer
      (targetImpl, 2, layers[196]->getOutputTensor(0), layers[198]
       ->getOutputTensor(0), 3, "C", "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[200]))->createConvLayer(targetImpl,
      layers[199]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_334_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_334_b.bin",
      "SSCB", 5);
    c1_pf_layerParamString = "in";
    c1_qf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063 *>(layers[201]))
      ->c1_createCustomLayer(targetImpl, layers[200]->getOutputTensor(0),
      "Mul_336", "Swish", "Swish", &c1_pf_layerParamString,
      &c1_qf_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[202]))->createConvLayer(targetImpl,
      layers[201]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_337_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_337_b.bin",
      "SSCB", 5);
    c1_rf_layerParamString = "in";
    c1_sf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064 *>(layers[203]))
      ->c1_createCustomLayer(targetImpl, layers[202]->getOutputTensor(0),
      "Mul_339", "Swish", "Swish", &c1_rf_layerParamString,
      &c1_sf_layerParamString, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[204]))->createConvLayer(targetImpl,
      layers[203]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_376_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_376_b_fused.bin",
      "SSCB", 5);
    (static_cast<MWSplittingLayer *>(layers[205]))->createSplittingLayer
      (targetImpl, layers[204]->getOutputTensor(0), 2, 32, 32, 2, "SSCB", "SSCB",
       5, 5);
    c1_tf_layerParamString = "in";
    c1_uf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065 *>(layers[206]))
      ->c1_createCustomLayer(targetImpl, layers[205]->getOutputTensor(1),
      "Mul_342", "Swish", "Swish", &c1_tf_layerParamString,
      &c1_uf_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[207]))->createConvLayer(targetImpl,
      layers[206]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_343_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_343_b.bin",
      "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[208]))->createConvLayer(targetImpl,
      layers[206]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_344_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_344_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[209]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[207]->getOutputTensor(0), layers[208]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[210]))
      ->createElementwiseAffineLayer(targetImpl, layers[209]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_347_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_347_offset.bin",
      "SSCB", 9);
    c1_vf_layerParamString = "in";
    c1_wf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066 *>(layers[211]))
      ->c1_createCustomLayer(targetImpl, layers[210]->getOutputTensor(0),
      "Mul_349", "Swish", "Swish", &c1_vf_layerParamString,
      &c1_wf_layerParamString, "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[212]))->createConvLayer(targetImpl,
      layers[211]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_350_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_350_b.bin",
      "SSCB", 8);
    c1_xf_layerParamString = "in";
    c1_yf_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067 *>(layers[213]))
      ->c1_createCustomLayer(targetImpl, layers[212]->getOutputTensor(0),
      "Mul_352", "Swish", "Swish", &c1_xf_layerParamString,
      &c1_yf_layerParamString, "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[214]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[206]->getOutputTensor(0), layers[213]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWConvLayer *>(layers[215]))->createConvLayer(targetImpl,
      layers[214]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_354_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_354_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[216]))->createConvLayer(targetImpl,
      layers[214]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_355_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_355_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[217]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[215]->getOutputTensor(0), layers[216]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[218]))
      ->createElementwiseAffineLayer(targetImpl, layers[217]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_358_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_358_offset.bin",
      "SSCB", 9);
    c1_ag_layerParamString = "in";
    c1_bg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068 *>(layers[219]))
      ->c1_createCustomLayer(targetImpl, layers[218]->getOutputTensor(0),
      "Mul_360", "Swish", "Swish", &c1_ag_layerParamString,
      &c1_bg_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[220]))->createConvLayer(targetImpl,
      layers[219]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_361_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_361_b.bin",
      "SSCB", 7);
    c1_cg_layerParamString = "in";
    c1_dg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069 *>(layers[221]))
      ->c1_createCustomLayer(targetImpl, layers[220]->getOutputTensor(0),
      "Mul_363", "Swish", "Swish", &c1_cg_layerParamString,
      &c1_dg_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[222]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[214]->getOutputTensor(0), layers[221]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[223]))->createConvLayer(targetImpl,
      layers[222]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_365_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_365_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[224]))->createConvLayer(targetImpl,
      layers[222]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_366_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_366_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[225]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[223]->getOutputTensor(0), layers[224]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[226]))
      ->createElementwiseAffineLayer(targetImpl, layers[225]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_369_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_369_offset.bin",
      "SSCB", 9);
    c1_eg_layerParamString = "in";
    c1_fg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070 *>(layers[227]))
      ->c1_createCustomLayer(targetImpl, layers[226]->getOutputTensor(0),
      "Mul_371", "Swish", "Swish", &c1_eg_layerParamString,
      &c1_fg_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[228]))->createConvLayer(targetImpl,
      layers[227]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_372_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_372_b.bin",
      "SSCB", 8);
    c1_gg_layerParamString = "in";
    c1_hg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071 *>(layers[229]))
      ->c1_createCustomLayer(targetImpl, layers[228]->getOutputTensor(0),
      "Mul_374", "Swish", "Swish", &c1_gg_layerParamString,
      &c1_hg_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[230]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[222]->getOutputTensor(0), layers[229]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    c1_ig_layerParamString = "in";
    c1_jg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072 *>(layers[231]))
      ->c1_createCustomLayer(targetImpl, layers[205]->getOutputTensor(0),
      "Mul_378", "Swish", "Swish", &c1_ig_layerParamString,
      &c1_jg_layerParamString, "SSCB", 6);
    (static_cast<MWConcatenationLayer *>(layers[232]))->createConcatenationLayer
      (targetImpl, 2, layers[230]->getOutputTensor(0), layers[231]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[233]))->createConvLayer(targetImpl,
      layers[232]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_380_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_380_b.bin",
      "SSCB", 6);
    c1_kg_layerParamString = "in";
    c1_mg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073 *>(layers[234]))
      ->c1_createCustomLayer(targetImpl, layers[233]->getOutputTensor(0),
      "Mul_382", "Swish", "Swish", &c1_kg_layerParamString,
      &c1_mg_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[235]))->createConvLayer(targetImpl,
      layers[234]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_383_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_383_b.bin",
      "SSCB", 6);
    c1_og_layerParamString = "in";
    c1_pg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074 *>(layers[236]))
      ->c1_createCustomLayer(targetImpl, layers[235]->getOutputTensor(0),
      "Mul_385", "Swish", "Swish", &c1_og_layerParamString,
      &c1_pg_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[237]))->createConcatenationLayer
      (targetImpl, 4, layers[170]->getOutputTensor(1), layers[170]
       ->getOutputTensor(0), layers[203]->getOutputTensor(0), layers[236]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[238]))->createConvLayer(targetImpl,
      layers[237]->getOutputTensor(0), 1, 1, 256, 128, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_387_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_387_b.bin",
      "SSCB", 0);
    c1_qg_layerParamString = "in";
    c1_rg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075 *>(layers[239]))
      ->c1_createCustomLayer(targetImpl, layers[238]->getOutputTensor(0),
      "Mul_389", "Swish", "Swish", &c1_qg_layerParamString,
      &c1_rg_layerParamString, "SSCB", 3);
    (static_cast<MWConvLayer *>(layers[240]))->createConvLayer(targetImpl,
      layers[239]->getOutputTensor(0), 1, 1, 128, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_390_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_390_b.bin",
      "SSCB", 0);
    c1_sg_layerParamString = "in";
    c1_tg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076 *>(layers[241]))
      ->c1_createCustomLayer(targetImpl, layers[240]->getOutputTensor(0),
      "Mul_392", "Swish", "Swish", &c1_sg_layerParamString,
      &c1_tg_layerParamString, "SSCB", 3);
    (static_cast<MWMaxPoolingLayer *>(layers[242]))->createMaxPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[241]->getOutputTensor(0), 5, 5, 1,
                          1, 2, 2, 2, 2, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWMaxPoolingLayer *>(layers[243]))->createMaxPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[242]->getOutputTensor(0), 5, 5, 1,
                          1, 2, 2, 2, 2, 0, 0, "FLOAT", 1, "SSCB", 4);
    (static_cast<MWMaxPoolingLayer *>(layers[244]))->createMaxPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[243]->getOutputTensor(0), 5, 5, 1,
                          1, 2, 2, 2, 2, 0, 0, "FLOAT", 1, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[245]))->createConcatenationLayer
      (targetImpl, 4, layers[241]->getOutputTensor(0), layers[242]
       ->getOutputTensor(0), layers[243]->getOutputTensor(0), layers[244]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[246]))->createConvLayer(targetImpl,
      layers[245]->getOutputTensor(0), 1, 1, 256, 128, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_397_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_397_b.bin",
      "SSCB", 0);
    c1_ug_layerParamString = "in";
    c1_vg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077 *>(layers[247]))
      ->c1_createCustomLayer(targetImpl, layers[246]->getOutputTensor(0),
      "Mul_399", "Swish", "Swish", &c1_ug_layerParamString,
      &c1_vg_layerParamString, "SSCB", 3);
    c1_e_layerParamsString[0] = "in";
    c1_e_layerParamsString[1] = "ref";
    c1_wg_layerParamString = "out";
    (static_cast<c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801 *>(layers[248])
      )->c1_createCustomLayer(targetImpl, layers[247]->getOutputTensor(0),
      layers[164]->getOutputTensor(0), true, "nearest", "asymmetric", "floor",
      "ResizeLayer_1035", "Resize", c1_e_layerParamsString,
      &c1_wg_layerParamString, "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[249]))->createConcatenationLayer
      (targetImpl, 2, layers[248]->getOutputTensor(0), layers[164]
       ->getOutputTensor(0), 3, "C", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[250]))->createConvLayer(targetImpl,
      layers[249]->getOutputTensor(0), 1, 1, 224, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_402_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_402_b.bin",
      "SSCB", 0);
    c1_xg_layerParamString = "in";
    c1_yg_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078 *>(layers[251]))
      ->c1_createCustomLayer(targetImpl, layers[250]->getOutputTensor(0),
      "Mul_404", "Swish", "Swish", &c1_xg_layerParamString,
      &c1_yg_layerParamString, "SSCB", 2);
    c1_ah_layerParamString = "in";
    c1_f_layerParamsString[0] = "out1";
    c1_f_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805 *>(layers[252]))
      ->c1_createCustomLayer(targetImpl, layers[251]->getOutputTensor(0),
      "SliceLayer1040", &c1_ah_layerParamString, c1_f_layerParamsString, "SSCB",
      "SSCB", 0, 4);
    (static_cast<MWConvLayer *>(layers[253]))->createConvLayer(targetImpl,
      layers[252]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_419_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_419_b.bin",
      "SSCB", 2);
    c1_bh_layerParamString = "in";
    c1_ch_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079 *>(layers[254]))
      ->c1_createCustomLayer(targetImpl, layers[253]->getOutputTensor(0),
      "Mul_421", "Swish", "Swish", &c1_bh_layerParamString,
      &c1_ch_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[255]))->createConvLayer(targetImpl,
      layers[254]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_422_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_422_b.bin",
      "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[256]))->createConvLayer(targetImpl,
      layers[254]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_423_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_423_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[257]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[255]->getOutputTensor(0), layers[256]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[258]))
      ->createElementwiseAffineLayer(targetImpl, layers[257]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_426_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_426_offset.bin",
      "SSCB", 7);
    c1_dh_layerParamString = "in";
    c1_eh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080 *>(layers[259]))
      ->c1_createCustomLayer(targetImpl, layers[258]->getOutputTensor(0),
      "Mul_428", "Swish", "Swish", &c1_dh_layerParamString,
      &c1_eh_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[260]))->createConvLayer(targetImpl,
      layers[259]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_429_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_429_b.bin",
      "SSCB", 6);
    c1_fh_layerParamString = "in";
    c1_gh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081 *>(layers[261]))
      ->c1_createCustomLayer(targetImpl, layers[260]->getOutputTensor(0),
      "Mul_431", "Swish", "Swish", &c1_fh_layerParamString,
      &c1_gh_layerParamString, "SSCB", 2);
    (static_cast<MWAdditionLayer *>(layers[262]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[254]->getOutputTensor(0), layers[261]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[263]))->createConvLayer(targetImpl,
      layers[262]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_433_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_433_b.bin",
      "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[264]))->createConvLayer(targetImpl,
      layers[262]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_434_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_434_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[265]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[263]->getOutputTensor(0), layers[264]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[266]))
      ->createElementwiseAffineLayer(targetImpl, layers[265]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_437_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_437_offset.bin",
      "SSCB", 7);
    c1_hh_layerParamString = "in";
    c1_ih_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082 *>(layers[267]))
      ->c1_createCustomLayer(targetImpl, layers[266]->getOutputTensor(0),
      "Mul_439", "Swish", "Swish", &c1_hh_layerParamString,
      &c1_ih_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[268]))->createConvLayer(targetImpl,
      layers[267]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_440_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_440_b.bin",
      "SSCB", 5);
    c1_jh_layerParamString = "in";
    c1_kh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083 *>(layers[269]))
      ->c1_createCustomLayer(targetImpl, layers[268]->getOutputTensor(0),
      "Mul_442", "Swish", "Swish", &c1_jh_layerParamString,
      &c1_kh_layerParamString, "SSCB", 2);
    (static_cast<MWAdditionLayer *>(layers[270]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[262]->getOutputTensor(0), layers[269]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[271]))->createConvLayer(targetImpl,
      layers[270]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_444_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_444_b.bin",
      "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[272]))->createConvLayer(targetImpl,
      layers[270]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_445_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_445_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[273]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[271]->getOutputTensor(0), layers[272]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[274]))
      ->createElementwiseAffineLayer(targetImpl, layers[273]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_448_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_448_offset.bin",
      "SSCB", 7);
    c1_mh_layerParamString = "in";
    c1_oh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084 *>(layers[275]))
      ->c1_createCustomLayer(targetImpl, layers[274]->getOutputTensor(0),
      "Mul_450", "Swish", "Swish", &c1_mh_layerParamString,
      &c1_oh_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[276]))->createConvLayer(targetImpl,
      layers[275]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_451_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_451_b.bin",
      "SSCB", 6);
    c1_ph_layerParamString = "in";
    c1_qh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085 *>(layers[277]))
      ->c1_createCustomLayer(targetImpl, layers[276]->getOutputTensor(0),
      "Mul_453", "Swish", "Swish", &c1_ph_layerParamString,
      &c1_qh_layerParamString, "SSCB", 2);
    (static_cast<MWAdditionLayer *>(layers[278]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[270]->getOutputTensor(0), layers[277]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[279]))->createConvLayer(targetImpl,
      layers[252]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_455_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_455_b.bin",
      "SSCB", 2);
    c1_sh_layerParamString = "in";
    c1_th_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086 *>(layers[280]))
      ->c1_createCustomLayer(targetImpl, layers[279]->getOutputTensor(0),
      "Mul_457", "Swish", "Swish", &c1_sh_layerParamString,
      &c1_th_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[281]))->createConcatenationLayer
      (targetImpl, 2, layers[278]->getOutputTensor(0), layers[280]
       ->getOutputTensor(0), 3, "C", "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[282]))->createConvLayer(targetImpl,
      layers[281]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_459_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_459_b.bin",
      "SSCB", 5);
    c1_uh_layerParamString = "in";
    c1_vh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087 *>(layers[283]))
      ->c1_createCustomLayer(targetImpl, layers[282]->getOutputTensor(0),
      "Mul_461", "Swish", "Swish", &c1_uh_layerParamString,
      &c1_vh_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[284]))->createConvLayer(targetImpl,
      layers[283]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_462_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_462_b.bin",
      "SSCB", 5);
    c1_wh_layerParamString = "in";
    c1_xh_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088 *>(layers[285]))
      ->c1_createCustomLayer(targetImpl, layers[284]->getOutputTensor(0),
      "Mul_464", "Swish", "Swish", &c1_wh_layerParamString,
      &c1_xh_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[286]))->createConvLayer(targetImpl,
      layers[285]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_501_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_501_b_fused.bin",
      "SSCB", 5);
    (static_cast<MWSplittingLayer *>(layers[287]))->createSplittingLayer
      (targetImpl, layers[286]->getOutputTensor(0), 2, 24, 24, 2, "SSCB", "SSCB",
       5, 5);
    c1_yh_layerParamString = "in";
    c1_ai_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089 *>(layers[288]))
      ->c1_createCustomLayer(targetImpl, layers[287]->getOutputTensor(1),
      "Mul_467", "Swish", "Swish", &c1_yh_layerParamString,
      &c1_ai_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[289]))->createConvLayer(targetImpl,
      layers[288]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_468_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_468_b.bin",
      "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[290]))->createConvLayer(targetImpl,
      layers[288]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_469_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_469_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[291]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[289]->getOutputTensor(0), layers[290]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[292]))
      ->createElementwiseAffineLayer(targetImpl, layers[291]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_472_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_472_offset.bin",
      "SSCB", 9);
    c1_bi_layerParamString = "in";
    c1_ci_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090 *>(layers[293]))
      ->c1_createCustomLayer(targetImpl, layers[292]->getOutputTensor(0),
      "Mul_474", "Swish", "Swish", &c1_bi_layerParamString,
      &c1_ci_layerParamString, "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[294]))->createConvLayer(targetImpl,
      layers[293]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_475_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_475_b.bin",
      "SSCB", 8);
    c1_di_layerParamString = "in";
    c1_ei_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091 *>(layers[295]))
      ->c1_createCustomLayer(targetImpl, layers[294]->getOutputTensor(0),
      "Mul_477", "Swish", "Swish", &c1_di_layerParamString,
      &c1_ei_layerParamString, "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[296]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[288]->getOutputTensor(0), layers[295]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWConvLayer *>(layers[297]))->createConvLayer(targetImpl,
      layers[296]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_479_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_479_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[298]))->createConvLayer(targetImpl,
      layers[296]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_480_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_480_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[299]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[297]->getOutputTensor(0), layers[298]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[300]))
      ->createElementwiseAffineLayer(targetImpl, layers[299]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_483_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_483_offset.bin",
      "SSCB", 9);
    c1_fi_layerParamString = "in";
    c1_gi_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092 *>(layers[301]))
      ->c1_createCustomLayer(targetImpl, layers[300]->getOutputTensor(0),
      "Mul_485", "Swish", "Swish", &c1_fi_layerParamString,
      &c1_gi_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[302]))->createConvLayer(targetImpl,
      layers[301]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_486_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_486_b.bin",
      "SSCB", 7);
    c1_hi_layerParamString = "in";
    c1_ii_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093 *>(layers[303]))
      ->c1_createCustomLayer(targetImpl, layers[302]->getOutputTensor(0),
      "Mul_488", "Swish", "Swish", &c1_hi_layerParamString,
      &c1_ii_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[304]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[296]->getOutputTensor(0), layers[303]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[305]))->createConvLayer(targetImpl,
      layers[304]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_490_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_490_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[306]))->createConvLayer(targetImpl,
      layers[304]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_491_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_491_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[307]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[305]->getOutputTensor(0), layers[306]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[308]))
      ->createElementwiseAffineLayer(targetImpl, layers[307]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_494_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_494_offset.bin",
      "SSCB", 9);
    c1_ji_layerParamString = "in";
    c1_ki_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094 *>(layers[309]))
      ->c1_createCustomLayer(targetImpl, layers[308]->getOutputTensor(0),
      "Mul_496", "Swish", "Swish", &c1_ji_layerParamString,
      &c1_ki_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[310]))->createConvLayer(targetImpl,
      layers[309]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_497_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_497_b.bin",
      "SSCB", 8);
    c1_mi_layerParamString = "in";
    c1_oi_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095 *>(layers[311]))
      ->c1_createCustomLayer(targetImpl, layers[310]->getOutputTensor(0),
      "Mul_499", "Swish", "Swish", &c1_mi_layerParamString,
      &c1_oi_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[312]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[304]->getOutputTensor(0), layers[311]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    c1_pi_layerParamString = "in";
    c1_qi_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096 *>(layers[313]))
      ->c1_createCustomLayer(targetImpl, layers[287]->getOutputTensor(0),
      "Mul_503", "Swish", "Swish", &c1_pi_layerParamString,
      &c1_qi_layerParamString, "SSCB", 6);
    (static_cast<MWConcatenationLayer *>(layers[314]))->createConcatenationLayer
      (targetImpl, 2, layers[312]->getOutputTensor(0), layers[313]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[315]))->createConvLayer(targetImpl,
      layers[314]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_505_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_505_b.bin",
      "SSCB", 6);
    c1_ri_layerParamString = "in";
    c1_si_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097 *>(layers[316]))
      ->c1_createCustomLayer(targetImpl, layers[315]->getOutputTensor(0),
      "Mul_507", "Swish", "Swish", &c1_ri_layerParamString,
      &c1_si_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[317]))->createConvLayer(targetImpl,
      layers[316]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_508_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_508_b.bin",
      "SSCB", 6);
    c1_ti_layerParamString = "in";
    c1_ui_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098 *>(layers[318]))
      ->c1_createCustomLayer(targetImpl, layers[317]->getOutputTensor(0),
      "Mul_510", "Swish", "Swish", &c1_ti_layerParamString,
      &c1_ui_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[319]))->createConcatenationLayer
      (targetImpl, 4, layers[252]->getOutputTensor(1), layers[252]
       ->getOutputTensor(0), layers[285]->getOutputTensor(0), layers[318]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[320]))->createConvLayer(targetImpl,
      layers[319]->getOutputTensor(0), 1, 1, 192, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_512_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_512_b.bin",
      "SSCB", 0);
    c1_vi_layerParamString = "in";
    c1_wi_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099 *>(layers[321]))
      ->c1_createCustomLayer(targetImpl, layers[320]->getOutputTensor(0),
      "Mul_514", "Swish", "Swish", &c1_vi_layerParamString,
      &c1_wi_layerParamString, "SSCB", 2);
    c1_g_layerParamsString[0] = "in";
    c1_g_layerParamsString[1] = "ref";
    c1_xi_layerParamString = "out";
    (static_cast<c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802 *>(layers[322])
      )->c1_createCustomLayer(targetImpl, layers[321]->getOutputTensor(0),
      layers[89]->getOutputTensor(0), true, "nearest", "asymmetric", "floor",
      "ResizeLayer_1044", "Resize", c1_g_layerParamsString,
      &c1_xi_layerParamString, "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[323]))->createConcatenationLayer
      (targetImpl, 2, layers[322]->getOutputTensor(0), layers[89]
       ->getOutputTensor(0), 3, "C", "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[324]))->createConvLayer(targetImpl,
      layers[323]->getOutputTensor(0), 1, 1, 160, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_517_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_517_b.bin",
      "SSCB", 0);
    c1_yi_layerParamString = "in";
    c1_aj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100 *>(layers[325])
      )->c1_createCustomLayer(targetImpl, layers[324]->getOutputTensor(0),
      "Mul_519", "Swish", "Swish", &c1_yi_layerParamString,
      &c1_aj_layerParamString, "SSCB", 1);
    c1_bj_layerParamString = "in";
    c1_h_layerParamsString[0] = "out1";
    c1_h_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806 *>(layers[326]))
      ->c1_createCustomLayer(targetImpl, layers[325]->getOutputTensor(0),
      "SliceLayer1049", &c1_bj_layerParamString, c1_h_layerParamsString, "SSCB",
      "SSCB", 0, 4);
    (static_cast<MWConvLayer *>(layers[327]))->createConvLayer(targetImpl,
      layers[326]->getOutputTensor(0), 1, 1, 32, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_534_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_534_b.bin",
      "SSCB", 1);
    c1_cj_layerParamString = "in";
    c1_dj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101 *>(layers[328])
      )->c1_createCustomLayer(targetImpl, layers[327]->getOutputTensor(0),
      "Mul_536", "Swish", "Swish", &c1_cj_layerParamString,
      &c1_dj_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[329]))->createConvLayer(targetImpl,
      layers[328]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_537_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_537_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[330]))->createConvLayer(targetImpl,
      layers[328]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_538_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_538_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[331]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[329]->getOutputTensor(0), layers[330]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[332]))
      ->createElementwiseAffineLayer(targetImpl, layers[331]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_541_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_541_offset.bin",
      "SSCB", 7);
    c1_ej_layerParamString = "in";
    c1_fj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102 *>(layers[333])
      )->c1_createCustomLayer(targetImpl, layers[332]->getOutputTensor(0),
      "Mul_543", "Swish", "Swish", &c1_ej_layerParamString,
      &c1_fj_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[334]))->createConvLayer(targetImpl,
      layers[333]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_544_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_544_b.bin",
      "SSCB", 6);
    c1_gj_layerParamString = "in";
    c1_hj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103 *>(layers[335])
      )->c1_createCustomLayer(targetImpl, layers[334]->getOutputTensor(0),
      "Mul_546", "Swish", "Swish", &c1_gj_layerParamString,
      &c1_hj_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[336]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[328]->getOutputTensor(0), layers[335]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[337]))->createConvLayer(targetImpl,
      layers[336]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_548_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_548_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[338]))->createConvLayer(targetImpl,
      layers[336]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_549_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_549_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[339]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[337]->getOutputTensor(0), layers[338]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[340]))
      ->createElementwiseAffineLayer(targetImpl, layers[339]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_552_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_552_offset.bin",
      "SSCB", 7);
    c1_ij_layerParamString = "in";
    c1_jj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104 *>(layers[341])
      )->c1_createCustomLayer(targetImpl, layers[340]->getOutputTensor(0),
      "Mul_554", "Swish", "Swish", &c1_ij_layerParamString,
      &c1_jj_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[342]))->createConvLayer(targetImpl,
      layers[341]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_555_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_555_b.bin",
      "SSCB", 5);
    c1_kj_layerParamString = "in";
    c1_mj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105 *>(layers[343])
      )->c1_createCustomLayer(targetImpl, layers[342]->getOutputTensor(0),
      "Mul_557", "Swish", "Swish", &c1_kj_layerParamString,
      &c1_mj_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[344]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[336]->getOutputTensor(0), layers[343]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[345]))->createConvLayer(targetImpl,
      layers[344]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_559_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_559_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[346]))->createConvLayer(targetImpl,
      layers[344]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_560_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_560_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[347]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[345]->getOutputTensor(0), layers[346]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[348]))
      ->createElementwiseAffineLayer(targetImpl, layers[347]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_563_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_563_offset.bin",
      "SSCB", 7);
    c1_oj_layerParamString = "in";
    c1_pj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106 *>(layers[349])
      )->c1_createCustomLayer(targetImpl, layers[348]->getOutputTensor(0),
      "Mul_565", "Swish", "Swish", &c1_oj_layerParamString,
      &c1_pj_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[350]))->createConvLayer(targetImpl,
      layers[349]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_566_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_566_b.bin",
      "SSCB", 6);
    c1_qj_layerParamString = "in";
    c1_rj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107 *>(layers[351])
      )->c1_createCustomLayer(targetImpl, layers[350]->getOutputTensor(0),
      "Mul_568", "Swish", "Swish", &c1_qj_layerParamString,
      &c1_rj_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[352]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[344]->getOutputTensor(0), layers[351]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[353]))->createConvLayer(targetImpl,
      layers[326]->getOutputTensor(0), 1, 1, 32, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_570_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_570_b.bin",
      "SSCB", 1);
    c1_sj_layerParamString = "in";
    c1_tj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108 *>(layers[354])
      )->c1_createCustomLayer(targetImpl, layers[353]->getOutputTensor(0),
      "Mul_572", "Swish", "Swish", &c1_sj_layerParamString,
      &c1_tj_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[355]))->createConcatenationLayer
      (targetImpl, 2, layers[352]->getOutputTensor(0), layers[354]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[356]))->createConvLayer(targetImpl,
      layers[355]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_574_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_574_b.bin",
      "SSCB", 5);
    c1_uj_layerParamString = "in";
    c1_vj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109 *>(layers[357])
      )->c1_createCustomLayer(targetImpl, layers[356]->getOutputTensor(0),
      "Mul_576", "Swish", "Swish", &c1_uj_layerParamString,
      &c1_vj_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[358]))->createConvLayer(targetImpl,
      layers[357]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_577_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_577_b.bin",
      "SSCB", 5);
    c1_wj_layerParamString = "in";
    c1_xj_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110 *>(layers[359])
      )->c1_createCustomLayer(targetImpl, layers[358]->getOutputTensor(0),
      "Mul_579", "Swish", "Swish", &c1_wj_layerParamString,
      &c1_xj_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[360]))->createConvLayer(targetImpl,
      layers[359]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_616_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_616_b_fused.bin",
      "SSCB", 5);
    (static_cast<MWSplittingLayer *>(layers[361]))->createSplittingLayer
      (targetImpl, layers[360]->getOutputTensor(0), 2, 16, 16, 2, "SSCB", "SSCB",
       5, 5);
    c1_yj_layerParamString = "in";
    c1_ak_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111 *>(layers[362])
      )->c1_createCustomLayer(targetImpl, layers[361]->getOutputTensor(1),
      "Mul_582", "Swish", "Swish", &c1_yj_layerParamString,
      &c1_ak_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[363]))->createConvLayer(targetImpl,
      layers[362]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_583_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_583_b.bin",
      "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[364]))->createConvLayer(targetImpl,
      layers[362]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_584_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_584_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[365]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[363]->getOutputTensor(0), layers[364]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[366]))
      ->createElementwiseAffineLayer(targetImpl, layers[365]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_587_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_587_offset.bin",
      "SSCB", 9);
    c1_bk_layerParamString = "in";
    c1_ck_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112 *>(layers[367])
      )->c1_createCustomLayer(targetImpl, layers[366]->getOutputTensor(0),
      "Mul_589", "Swish", "Swish", &c1_bk_layerParamString,
      &c1_ck_layerParamString, "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[368]))->createConvLayer(targetImpl,
      layers[367]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_590_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_590_b.bin",
      "SSCB", 8);
    c1_dk_layerParamString = "in";
    c1_ek_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113 *>(layers[369])
      )->c1_createCustomLayer(targetImpl, layers[368]->getOutputTensor(0),
      "Mul_592", "Swish", "Swish", &c1_dk_layerParamString,
      &c1_ek_layerParamString, "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[370]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[362]->getOutputTensor(0), layers[369]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWConvLayer *>(layers[371]))->createConvLayer(targetImpl,
      layers[370]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_594_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_594_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[372]))->createConvLayer(targetImpl,
      layers[370]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_595_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_595_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[373]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[371]->getOutputTensor(0), layers[372]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[374]))
      ->createElementwiseAffineLayer(targetImpl, layers[373]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_598_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_598_offset.bin",
      "SSCB", 9);
    c1_fk_layerParamString = "in";
    c1_gk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114 *>(layers[375])
      )->c1_createCustomLayer(targetImpl, layers[374]->getOutputTensor(0),
      "Mul_600", "Swish", "Swish", &c1_fk_layerParamString,
      &c1_gk_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[376]))->createConvLayer(targetImpl,
      layers[375]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_601_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_601_b.bin",
      "SSCB", 7);
    c1_hk_layerParamString = "in";
    c1_ik_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115 *>(layers[377])
      )->c1_createCustomLayer(targetImpl, layers[376]->getOutputTensor(0),
      "Mul_603", "Swish", "Swish", &c1_hk_layerParamString,
      &c1_ik_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[378]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[370]->getOutputTensor(0), layers[377]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[379]))->createConvLayer(targetImpl,
      layers[378]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_605_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_605_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[380]))->createConvLayer(targetImpl,
      layers[378]->getOutputTensor(0), 1, 1, 16, 16, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_606_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_606_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[381]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[379]->getOutputTensor(0), layers[380]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[382]))
      ->createElementwiseAffineLayer(targetImpl, layers[381]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_609_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_609_offset.bin",
      "SSCB", 9);
    c1_jk_layerParamString = "in";
    c1_kk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116 *>(layers[383])
      )->c1_createCustomLayer(targetImpl, layers[382]->getOutputTensor(0),
      "Mul_611", "Swish", "Swish", &c1_jk_layerParamString,
      &c1_kk_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[384]))->createConvLayer(targetImpl,
      layers[383]->getOutputTensor(0), 3, 3, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_612_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_612_b.bin",
      "SSCB", 8);
    c1_mk_layerParamString = "in";
    c1_ok_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117 *>(layers[385])
      )->c1_createCustomLayer(targetImpl, layers[384]->getOutputTensor(0),
      "Mul_614", "Swish", "Swish", &c1_mk_layerParamString,
      &c1_ok_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[386]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[378]->getOutputTensor(0), layers[385]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    c1_pk_layerParamString = "in";
    c1_qk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118 *>(layers[387])
      )->c1_createCustomLayer(targetImpl, layers[361]->getOutputTensor(0),
      "Mul_618", "Swish", "Swish", &c1_pk_layerParamString,
      &c1_qk_layerParamString, "SSCB", 6);
    (static_cast<MWConcatenationLayer *>(layers[388]))->createConcatenationLayer
      (targetImpl, 2, layers[386]->getOutputTensor(0), layers[387]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[389]))->createConvLayer(targetImpl,
      layers[388]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_620_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_620_b.bin",
      "SSCB", 6);
    c1_rk_layerParamString = "in";
    c1_sk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119 *>(layers[390])
      )->c1_createCustomLayer(targetImpl, layers[389]->getOutputTensor(0),
      "Mul_622", "Swish", "Swish", &c1_rk_layerParamString,
      &c1_sk_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[391]))->createConvLayer(targetImpl,
      layers[390]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_623_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_623_b.bin",
      "SSCB", 6);
    c1_tk_layerParamString = "in";
    c1_uk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120 *>(layers[392])
      )->c1_createCustomLayer(targetImpl, layers[391]->getOutputTensor(0),
      "Mul_625", "Swish", "Swish", &c1_tk_layerParamString,
      &c1_uk_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[393]))->createConcatenationLayer
      (targetImpl, 4, layers[326]->getOutputTensor(1), layers[326]
       ->getOutputTensor(0), layers[359]->getOutputTensor(0), layers[392]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[394]))->createConvLayer(targetImpl,
      layers[393]->getOutputTensor(0), 1, 1, 128, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_627_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_627_b.bin",
      "SSCB", 0);
    c1_vk_layerParamString = "in";
    c1_wk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121 *>(layers[395])
      )->c1_createCustomLayer(targetImpl, layers[394]->getOutputTensor(0),
      "Mul_629", "Swish", "Swish", &c1_vk_layerParamString,
      &c1_wk_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[396]))->createConvLayer(targetImpl,
      layers[395]->getOutputTensor(0), 3, 3, 64, 144, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_877_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_877_b_fused.bin",
      "SSCB", 0);
    (static_cast<MWSplittingLayer *>(layers[397]))->createSplittingLayer
      (targetImpl, layers[396]->getOutputTensor(0), 2, 80, 64, 2, "SSCB", "SSCB",
       0, 0);
    c1_xk_layerParamString = "in";
    c1_yk_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168 *>(layers[398])
      )->c1_createCustomLayer(targetImpl, layers[397]->getOutputTensor(1),
      "Mul_872", "Swish", "Swish", &c1_xk_layerParamString,
      &c1_yk_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[399]))->createConvLayer(targetImpl,
      layers[398]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_873_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_873_b.bin",
      "SSCB", 5);
    c1_am_layerParamString = "in";
    c1_bm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169 *>(layers[400])
      )->c1_createCustomLayer(targetImpl, layers[399]->getOutputTensor(0),
      "Mul_875", "Swish", "Swish", &c1_am_layerParamString,
      &c1_bm_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[401]))->createConvLayer(targetImpl,
      layers[400]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_876_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_876_b.bin",
      "SSCB", 5);
    c1_cm_layerParamString = "in";
    c1_dm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170 *>(layers[402])
      )->c1_createCustomLayer(targetImpl, layers[397]->getOutputTensor(0),
      "Mul_879", "Swish", "Swish", &c1_cm_layerParamString,
      &c1_dm_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[403]))->createConvLayer(targetImpl,
      layers[402]->getOutputTensor(0), 3, 3, 80, 80, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_880_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_880_b.bin",
      "SSCB", 0);
    c1_em_layerParamString = "in";
    c1_fm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171 *>(layers[404])
      )->c1_createCustomLayer(targetImpl, layers[403]->getOutputTensor(0),
      "Mul_882", "Swish", "Swish", &c1_em_layerParamString,
      &c1_fm_layerParamString, "SSCB", 4);
    (static_cast<MWConvLayer *>(layers[405]))->createConvLayer(targetImpl,
      layers[404]->getOutputTensor(0), 1, 1, 80, 80, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_883_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_883_b.bin",
      "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[406]))->createConcatenationLayer
      (targetImpl, 2, layers[401]->getOutputTensor(0), layers[405]
       ->getOutputTensor(0), 3, "C", "SSCB", 4);
    (static_cast<MWOutputLayer *>(layers[407]))->createOutputLayer(targetImpl,
      layers[406]->getOutputTensor(0), "SSCB", 4);
    (static_cast<MWAvgPoolingLayer *>(layers[408]))->createAvgPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[395]->getOutputTensor(0), 2, 2, 1,
                          1, 0, 0, 0, 0, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[409]))->createConvLayer(targetImpl,
      layers[408]->getOutputTensor(0), 3, 3, 64, 48, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_633_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_633_b.bin",
      "SSCB", 1);
    c1_gm_layerParamString = "in";
    c1_hm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122 *>(layers[410])
      )->c1_createCustomLayer(targetImpl, layers[409]->getOutputTensor(0),
      "Mul_635", "Swish", "Swish", &c1_gm_layerParamString,
      &c1_hm_layerParamString, "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[411]))->createConcatenationLayer
      (targetImpl, 2, layers[410]->getOutputTensor(0), layers[321]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[412]))->createConvLayer(targetImpl,
      layers[411]->getOutputTensor(0), 1, 1, 144, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_637_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_637_b.bin",
      "SSCB", 0);
    c1_im_layerParamString = "in";
    c1_jm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123 *>(layers[413])
      )->c1_createCustomLayer(targetImpl, layers[412]->getOutputTensor(0),
      "Mul_639", "Swish", "Swish", &c1_im_layerParamString,
      &c1_jm_layerParamString, "SSCB", 1);
    c1_km_layerParamString = "in";
    c1_i_layerParamsString[0] = "out1";
    c1_i_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807 *>(layers[414]))
      ->c1_createCustomLayer(targetImpl, layers[413]->getOutputTensor(0),
      "SliceLayer1058", &c1_km_layerParamString, c1_i_layerParamsString, "SSCB",
      "SSCB", 0, 2);
    (static_cast<MWConvLayer *>(layers[415]))->createConvLayer(targetImpl,
      layers[414]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_654_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_654_b.bin",
      "SSCB", 1);
    c1_mm_layerParamString = "in";
    c1_om_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124 *>(layers[416])
      )->c1_createCustomLayer(targetImpl, layers[415]->getOutputTensor(0),
      "Mul_656", "Swish", "Swish", &c1_mm_layerParamString,
      &c1_om_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[417]))->createConvLayer(targetImpl,
      layers[416]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_657_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_657_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[418]))->createConvLayer(targetImpl,
      layers[416]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_658_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_658_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[419]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[417]->getOutputTensor(0), layers[418]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[420]))
      ->createElementwiseAffineLayer(targetImpl, layers[419]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_661_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_661_offset.bin",
      "SSCB", 7);
    c1_pm_layerParamString = "in";
    c1_qm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125 *>(layers[421])
      )->c1_createCustomLayer(targetImpl, layers[420]->getOutputTensor(0),
      "Mul_663", "Swish", "Swish", &c1_pm_layerParamString,
      &c1_qm_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[422]))->createConvLayer(targetImpl,
      layers[421]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_664_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_664_b.bin",
      "SSCB", 6);
    c1_rm_layerParamString = "in";
    c1_sm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126 *>(layers[423])
      )->c1_createCustomLayer(targetImpl, layers[422]->getOutputTensor(0),
      "Mul_666", "Swish", "Swish", &c1_rm_layerParamString,
      &c1_sm_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[424]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[416]->getOutputTensor(0), layers[423]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[425]))->createConvLayer(targetImpl,
      layers[424]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_668_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_668_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[426]))->createConvLayer(targetImpl,
      layers[424]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_669_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_669_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[427]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[425]->getOutputTensor(0), layers[426]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[428]))
      ->createElementwiseAffineLayer(targetImpl, layers[427]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_672_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_672_offset.bin",
      "SSCB", 7);
    c1_tm_layerParamString = "in";
    c1_um_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127 *>(layers[429])
      )->c1_createCustomLayer(targetImpl, layers[428]->getOutputTensor(0),
      "Mul_674", "Swish", "Swish", &c1_tm_layerParamString,
      &c1_um_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[430]))->createConvLayer(targetImpl,
      layers[429]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_675_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_675_b.bin",
      "SSCB", 5);
    c1_vm_layerParamString = "in";
    c1_wm_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128 *>(layers[431])
      )->c1_createCustomLayer(targetImpl, layers[430]->getOutputTensor(0),
      "Mul_677", "Swish", "Swish", &c1_vm_layerParamString,
      &c1_wm_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[432]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[424]->getOutputTensor(0), layers[431]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[433]))->createConvLayer(targetImpl,
      layers[432]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_679_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_679_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[434]))->createConvLayer(targetImpl,
      layers[432]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_680_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_680_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[435]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[433]->getOutputTensor(0), layers[434]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[436]))
      ->createElementwiseAffineLayer(targetImpl, layers[435]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_683_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_683_offset.bin",
      "SSCB", 7);
    c1_xm_layerParamString = "in";
    c1_ym_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129 *>(layers[437])
      )->c1_createCustomLayer(targetImpl, layers[436]->getOutputTensor(0),
      "Mul_685", "Swish", "Swish", &c1_xm_layerParamString,
      &c1_ym_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[438]))->createConvLayer(targetImpl,
      layers[437]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_686_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_686_b.bin",
      "SSCB", 6);
    c1_ao_layerParamString = "in";
    c1_bo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130 *>(layers[439])
      )->c1_createCustomLayer(targetImpl, layers[438]->getOutputTensor(0),
      "Mul_688", "Swish", "Swish", &c1_ao_layerParamString,
      &c1_bo_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[440]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[432]->getOutputTensor(0), layers[439]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[441]))->createConvLayer(targetImpl,
      layers[414]->getOutputTensor(0), 1, 1, 48, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_690_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_690_b.bin",
      "SSCB", 1);
    c1_co_layerParamString = "in";
    c1_do_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131 *>(layers[442])
      )->c1_createCustomLayer(targetImpl, layers[441]->getOutputTensor(0),
      "Mul_692", "Swish", "Swish", &c1_co_layerParamString,
      &c1_do_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[443]))->createConcatenationLayer
      (targetImpl, 2, layers[440]->getOutputTensor(0), layers[442]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[444]))->createConvLayer(targetImpl,
      layers[443]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_694_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_694_b.bin",
      "SSCB", 5);
    c1_eo_layerParamString = "in";
    c1_fo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132 *>(layers[445])
      )->c1_createCustomLayer(targetImpl, layers[444]->getOutputTensor(0),
      "Mul_696", "Swish", "Swish", &c1_eo_layerParamString,
      &c1_fo_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[446]))->createConvLayer(targetImpl,
      layers[445]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_697_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_697_b.bin",
      "SSCB", 5);
    c1_go_layerParamString = "in";
    c1_ho_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133 *>(layers[447])
      )->c1_createCustomLayer(targetImpl, layers[446]->getOutputTensor(0),
      "Mul_699", "Swish", "Swish", &c1_go_layerParamString,
      &c1_ho_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[448]))->createConvLayer(targetImpl,
      layers[447]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_736_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_736_b_fused.bin",
      "SSCB", 5);
    (static_cast<MWSplittingLayer *>(layers[449]))->createSplittingLayer
      (targetImpl, layers[448]->getOutputTensor(0), 2, 24, 24, 2, "SSCB", "SSCB",
       5, 5);
    c1_io_layerParamString = "in";
    c1_jo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134 *>(layers[450])
      )->c1_createCustomLayer(targetImpl, layers[449]->getOutputTensor(1),
      "Mul_702", "Swish", "Swish", &c1_io_layerParamString,
      &c1_jo_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[451]))->createConvLayer(targetImpl,
      layers[450]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_703_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_703_b.bin",
      "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[452]))->createConvLayer(targetImpl,
      layers[450]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_704_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_704_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[453]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[451]->getOutputTensor(0), layers[452]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[454]))
      ->createElementwiseAffineLayer(targetImpl, layers[453]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_707_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_707_offset.bin",
      "SSCB", 9);
    c1_ko_layerParamString = "in";
    c1_mo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135 *>(layers[455])
      )->c1_createCustomLayer(targetImpl, layers[454]->getOutputTensor(0),
      "Mul_709", "Swish", "Swish", &c1_ko_layerParamString,
      &c1_mo_layerParamString, "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[456]))->createConvLayer(targetImpl,
      layers[455]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_710_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_710_b.bin",
      "SSCB", 8);
    c1_oo_layerParamString = "in";
    c1_po_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136 *>(layers[457])
      )->c1_createCustomLayer(targetImpl, layers[456]->getOutputTensor(0),
      "Mul_712", "Swish", "Swish", &c1_oo_layerParamString,
      &c1_po_layerParamString, "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[458]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[450]->getOutputTensor(0), layers[457]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWConvLayer *>(layers[459]))->createConvLayer(targetImpl,
      layers[458]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_714_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_714_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[460]))->createConvLayer(targetImpl,
      layers[458]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_715_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_715_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[461]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[459]->getOutputTensor(0), layers[460]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[462]))
      ->createElementwiseAffineLayer(targetImpl, layers[461]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_718_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_718_offset.bin",
      "SSCB", 9);
    c1_qo_layerParamString = "in";
    c1_ro_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137 *>(layers[463])
      )->c1_createCustomLayer(targetImpl, layers[462]->getOutputTensor(0),
      "Mul_720", "Swish", "Swish", &c1_qo_layerParamString,
      &c1_ro_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[464]))->createConvLayer(targetImpl,
      layers[463]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_721_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_721_b.bin",
      "SSCB", 7);
    c1_so_layerParamString = "in";
    c1_to_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138 *>(layers[465])
      )->c1_createCustomLayer(targetImpl, layers[464]->getOutputTensor(0),
      "Mul_723", "Swish", "Swish", &c1_so_layerParamString,
      &c1_to_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[466]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[458]->getOutputTensor(0), layers[465]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[467]))->createConvLayer(targetImpl,
      layers[466]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_725_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_725_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[468]))->createConvLayer(targetImpl,
      layers[466]->getOutputTensor(0), 1, 1, 24, 24, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_726_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_726_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[469]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[467]->getOutputTensor(0), layers[468]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[470]))
      ->createElementwiseAffineLayer(targetImpl, layers[469]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_729_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_729_offset.bin",
      "SSCB", 9);
    c1_uo_layerParamString = "in";
    c1_vo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139 *>(layers[471])
      )->c1_createCustomLayer(targetImpl, layers[470]->getOutputTensor(0),
      "Mul_731", "Swish", "Swish", &c1_uo_layerParamString,
      &c1_vo_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[472]))->createConvLayer(targetImpl,
      layers[471]->getOutputTensor(0), 3, 3, 24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_732_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_732_b.bin",
      "SSCB", 8);
    c1_wo_layerParamString = "in";
    c1_xo_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140 *>(layers[473])
      )->c1_createCustomLayer(targetImpl, layers[472]->getOutputTensor(0),
      "Mul_734", "Swish", "Swish", &c1_wo_layerParamString,
      &c1_xo_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[474]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[466]->getOutputTensor(0), layers[473]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    c1_yo_layerParamString = "in";
    c1_ap_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141 *>(layers[475])
      )->c1_createCustomLayer(targetImpl, layers[449]->getOutputTensor(0),
      "Mul_738", "Swish", "Swish", &c1_yo_layerParamString,
      &c1_ap_layerParamString, "SSCB", 6);
    (static_cast<MWConcatenationLayer *>(layers[476]))->createConcatenationLayer
      (targetImpl, 2, layers[474]->getOutputTensor(0), layers[475]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[477]))->createConvLayer(targetImpl,
      layers[476]->getOutputTensor(0), 1, 1, 48, 48, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_740_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_740_b.bin",
      "SSCB", 6);
    c1_bp_layerParamString = "in";
    c1_cp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142 *>(layers[478])
      )->c1_createCustomLayer(targetImpl, layers[477]->getOutputTensor(0),
      "Mul_742", "Swish", "Swish", &c1_bp_layerParamString,
      &c1_cp_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[479]))->createConvLayer(targetImpl,
      layers[478]->getOutputTensor(0), 3, 3, 48, 48, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_743_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_743_b.bin",
      "SSCB", 6);
    c1_dp_layerParamString = "in";
    c1_ep_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143 *>(layers[480])
      )->c1_createCustomLayer(targetImpl, layers[479]->getOutputTensor(0),
      "Mul_745", "Swish", "Swish", &c1_dp_layerParamString,
      &c1_ep_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[481]))->createConcatenationLayer
      (targetImpl, 4, layers[414]->getOutputTensor(1), layers[414]
       ->getOutputTensor(0), layers[447]->getOutputTensor(0), layers[480]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[482]))->createConvLayer(targetImpl,
      layers[481]->getOutputTensor(0), 1, 1, 192, 96, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_747_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_747_b.bin",
      "SSCB", 0);
    c1_fp_layerParamString = "in";
    c1_gp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144 *>(layers[483])
      )->c1_createCustomLayer(targetImpl, layers[482]->getOutputTensor(0),
      "Mul_749", "Swish", "Swish", &c1_fp_layerParamString,
      &c1_gp_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[484]))->createConvLayer(targetImpl,
      layers[483]->getOutputTensor(0), 3, 3, 96, 144, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_892_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_892_b_fused.bin",
      "SSCB", 0);
    (static_cast<MWSplittingLayer *>(layers[485]))->createSplittingLayer
      (targetImpl, layers[484]->getOutputTensor(0), 2, 80, 64, 2, "SSCB", "SSCB",
       0, 0);
    c1_hp_layerParamString = "in";
    c1_ip_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172 *>(layers[486])
      )->c1_createCustomLayer(targetImpl, layers[485]->getOutputTensor(1),
      "Mul_887", "Swish", "Swish", &c1_hp_layerParamString,
      &c1_ip_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[487]))->createConvLayer(targetImpl,
      layers[486]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_888_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_888_b.bin",
      "SSCB", 5);
    c1_jp_layerParamString = "in";
    c1_kp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173 *>(layers[488])
      )->c1_createCustomLayer(targetImpl, layers[487]->getOutputTensor(0),
      "Mul_890", "Swish", "Swish", &c1_jp_layerParamString,
      &c1_kp_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[489]))->createConvLayer(targetImpl,
      layers[488]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_891_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_891_b.bin",
      "SSCB", 5);
    c1_mp_layerParamString = "in";
    c1_op_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174 *>(layers[490])
      )->c1_createCustomLayer(targetImpl, layers[485]->getOutputTensor(0),
      "Mul_894", "Swish", "Swish", &c1_mp_layerParamString,
      &c1_op_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[491]))->createConvLayer(targetImpl,
      layers[490]->getOutputTensor(0), 3, 3, 80, 80, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_895_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_895_b.bin",
      "SSCB", 0);
    c1_pp_layerParamString = "in";
    c1_qp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175 *>(layers[492])
      )->c1_createCustomLayer(targetImpl, layers[491]->getOutputTensor(0),
      "Mul_897", "Swish", "Swish", &c1_pp_layerParamString,
      &c1_qp_layerParamString, "SSCB", 2);
    (static_cast<MWConvLayer *>(layers[493]))->createConvLayer(targetImpl,
      layers[492]->getOutputTensor(0), 1, 1, 80, 80, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_898_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_898_b.bin",
      "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[494]))->createConcatenationLayer
      (targetImpl, 2, layers[489]->getOutputTensor(0), layers[493]
       ->getOutputTensor(0), 3, "C", "SSCB", 2);
    (static_cast<MWOutputLayer *>(layers[495]))->createOutputLayer(targetImpl,
      layers[494]->getOutputTensor(0), "SSCB", 2);
    (static_cast<MWAvgPoolingLayer *>(layers[496]))->createAvgPoolingLayer<
      real32_T, real32_T>(targetImpl, layers[483]->getOutputTensor(0), 2, 2, 1,
                          1, 0, 0, 0, 0, 0, 0, "FLOAT", 1, "SSCB", 0);
    (static_cast<MWConvLayer *>(layers[497]))->createConvLayer(targetImpl,
      layers[496]->getOutputTensor(0), 3, 3, 96, 64, 2, 2, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_753_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_753_b.bin",
      "SSCB", 1);
    c1_rp_layerParamString = "in";
    c1_sp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145 *>(layers[498])
      )->c1_createCustomLayer(targetImpl, layers[497]->getOutputTensor(0),
      "Mul_755", "Swish", "Swish", &c1_rp_layerParamString,
      &c1_sp_layerParamString, "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[499]))->createConcatenationLayer
      (targetImpl, 2, layers[498]->getOutputTensor(0), layers[247]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[500]))->createConvLayer(targetImpl,
      layers[499]->getOutputTensor(0), 1, 1, 192, 128, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_757_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_757_b.bin",
      "SSCB", 0);
    c1_tp_layerParamString = "in";
    c1_up_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146 *>(layers[501])
      )->c1_createCustomLayer(targetImpl, layers[500]->getOutputTensor(0),
      "Mul_759", "Swish", "Swish", &c1_tp_layerParamString,
      &c1_up_layerParamString, "SSCB", 1);
    c1_vp_layerParamString = "in";
    c1_j_layerParamsString[0] = "out1";
    c1_j_layerParamsString[1] = "out2";
    (static_cast<c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808 *>(layers[502]))
      ->c1_createCustomLayer(targetImpl, layers[501]->getOutputTensor(0),
      "SliceLayer1067", &c1_vp_layerParamString, c1_j_layerParamsString, "SSCB",
      "SSCB", 0, 3);
    (static_cast<MWConvLayer *>(layers[503]))->createConvLayer(targetImpl,
      layers[502]->getOutputTensor(0), 1, 1, 64, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_774_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_774_b.bin",
      "SSCB", 1);
    c1_wp_layerParamString = "in";
    c1_xp_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147 *>(layers[504])
      )->c1_createCustomLayer(targetImpl, layers[503]->getOutputTensor(0),
      "Mul_776", "Swish", "Swish", &c1_wp_layerParamString,
      &c1_xp_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[505]))->createConvLayer(targetImpl,
      layers[504]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_777_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_777_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[506]))->createConvLayer(targetImpl,
      layers[504]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_778_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_778_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[507]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[505]->getOutputTensor(0), layers[506]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[508]))
      ->createElementwiseAffineLayer(targetImpl, layers[507]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_781_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_781_offset.bin",
      "SSCB", 7);
    c1_yp_layerParamString = "in";
    c1_aq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148 *>(layers[509])
      )->c1_createCustomLayer(targetImpl, layers[508]->getOutputTensor(0),
      "Mul_783", "Swish", "Swish", &c1_yp_layerParamString,
      &c1_aq_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[510]))->createConvLayer(targetImpl,
      layers[509]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_784_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_784_b.bin",
      "SSCB", 6);
    c1_bq_layerParamString = "in";
    c1_cq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149 *>(layers[511])
      )->c1_createCustomLayer(targetImpl, layers[510]->getOutputTensor(0),
      "Mul_786", "Swish", "Swish", &c1_bq_layerParamString,
      &c1_cq_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[512]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[504]->getOutputTensor(0), layers[511]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[513]))->createConvLayer(targetImpl,
      layers[512]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_788_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_788_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[514]))->createConvLayer(targetImpl,
      layers[512]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_789_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_789_b.bin",
      "SSCB", 5);
    (static_cast<MWAdditionLayer *>(layers[515]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[513]->getOutputTensor(0), layers[514]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[516]))
      ->createElementwiseAffineLayer(targetImpl, layers[515]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_792_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_792_offset.bin",
      "SSCB", 7);
    c1_dq_layerParamString = "in";
    c1_eq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150 *>(layers[517])
      )->c1_createCustomLayer(targetImpl, layers[516]->getOutputTensor(0),
      "Mul_794", "Swish", "Swish", &c1_dq_layerParamString,
      &c1_eq_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[518]))->createConvLayer(targetImpl,
      layers[517]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_795_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_795_b.bin",
      "SSCB", 5);
    c1_fq_layerParamString = "in";
    c1_gq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151 *>(layers[519])
      )->c1_createCustomLayer(targetImpl, layers[518]->getOutputTensor(0),
      "Mul_797", "Swish", "Swish", &c1_fq_layerParamString,
      &c1_gq_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[520]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[512]->getOutputTensor(0), layers[519]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[521]))->createConvLayer(targetImpl,
      layers[520]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_799_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_799_b.bin",
      "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[522]))->createConvLayer(targetImpl,
      layers[520]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_800_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_800_b.bin",
      "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[523]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[521]->getOutputTensor(0), layers[522]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWElementwiseAffineLayer *>(layers[524]))
      ->createElementwiseAffineLayer(targetImpl, layers[523]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_803_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_803_offset.bin",
      "SSCB", 7);
    c1_hq_layerParamString = "in";
    c1_iq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152 *>(layers[525])
      )->c1_createCustomLayer(targetImpl, layers[524]->getOutputTensor(0),
      "Mul_805", "Swish", "Swish", &c1_hq_layerParamString,
      &c1_iq_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[526]))->createConvLayer(targetImpl,
      layers[525]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_806_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_806_b.bin",
      "SSCB", 6);
    c1_jq_layerParamString = "in";
    c1_kq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153 *>(layers[527])
      )->c1_createCustomLayer(targetImpl, layers[526]->getOutputTensor(0),
      "Mul_808", "Swish", "Swish", &c1_jq_layerParamString,
      &c1_kq_layerParamString, "SSCB", 1);
    (static_cast<MWAdditionLayer *>(layers[528]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[520]->getOutputTensor(0), layers[527]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[529]))->createConvLayer(targetImpl,
      layers[502]->getOutputTensor(0), 1, 1, 64, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_810_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_810_b.bin",
      "SSCB", 1);
    c1_mq_layerParamString = "in";
    c1_oq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154 *>(layers[530])
      )->c1_createCustomLayer(targetImpl, layers[529]->getOutputTensor(0),
      "Mul_812", "Swish", "Swish", &c1_mq_layerParamString,
      &c1_oq_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[531]))->createConcatenationLayer
      (targetImpl, 2, layers[528]->getOutputTensor(0), layers[530]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[532]))->createConvLayer(targetImpl,
      layers[531]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_814_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_814_b.bin",
      "SSCB", 5);
    c1_pq_layerParamString = "in";
    c1_qq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155 *>(layers[533])
      )->c1_createCustomLayer(targetImpl, layers[532]->getOutputTensor(0),
      "Mul_816", "Swish", "Swish", &c1_pq_layerParamString,
      &c1_qq_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[534]))->createConvLayer(targetImpl,
      layers[533]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_817_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_817_b.bin",
      "SSCB", 5);
    c1_rq_layerParamString = "in";
    c1_sq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156 *>(layers[535])
      )->c1_createCustomLayer(targetImpl, layers[534]->getOutputTensor(0),
      "Mul_819", "Swish", "Swish", &c1_rq_layerParamString,
      &c1_sq_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[536]))->createConvLayer(targetImpl,
      layers[535]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_856_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_856_b_fused.bin",
      "SSCB", 5);
    (static_cast<MWSplittingLayer *>(layers[537]))->createSplittingLayer
      (targetImpl, layers[536]->getOutputTensor(0), 2, 32, 32, 2, "SSCB", "SSCB",
       5, 5);
    c1_tq_layerParamString = "in";
    c1_uq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157 *>(layers[538])
      )->c1_createCustomLayer(targetImpl, layers[537]->getOutputTensor(1),
      "Mul_822", "Swish", "Swish", &c1_tq_layerParamString,
      &c1_uq_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[539]))->createConvLayer(targetImpl,
      layers[538]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_823_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_823_b.bin",
      "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[540]))->createConvLayer(targetImpl,
      layers[538]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_824_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_824_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[541]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[539]->getOutputTensor(0), layers[540]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[542]))
      ->createElementwiseAffineLayer(targetImpl, layers[541]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_827_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_827_offset.bin",
      "SSCB", 9);
    c1_vq_layerParamString = "in";
    c1_wq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158 *>(layers[543])
      )->c1_createCustomLayer(targetImpl, layers[542]->getOutputTensor(0),
      "Mul_829", "Swish", "Swish", &c1_vq_layerParamString,
      &c1_wq_layerParamString, "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[544]))->createConvLayer(targetImpl,
      layers[543]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_830_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_830_b.bin",
      "SSCB", 8);
    c1_xq_layerParamString = "in";
    c1_yq_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159 *>(layers[545])
      )->c1_createCustomLayer(targetImpl, layers[544]->getOutputTensor(0),
      "Mul_832", "Swish", "Swish", &c1_xq_layerParamString,
      &c1_yq_layerParamString, "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[546]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[538]->getOutputTensor(0), layers[545]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    (static_cast<MWConvLayer *>(layers[547]))->createConvLayer(targetImpl,
      layers[546]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_834_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_834_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[548]))->createConvLayer(targetImpl,
      layers[546]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_835_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_835_b.bin",
      "SSCB", 7);
    (static_cast<MWAdditionLayer *>(layers[549]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[547]->getOutputTensor(0), layers[548]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[550]))
      ->createElementwiseAffineLayer(targetImpl, layers[549]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_838_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_838_offset.bin",
      "SSCB", 9);
    c1_ar_layerParamString = "in";
    c1_br_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160 *>(layers[551])
      )->c1_createCustomLayer(targetImpl, layers[550]->getOutputTensor(0),
      "Mul_840", "Swish", "Swish", &c1_ar_layerParamString,
      &c1_br_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[552]))->createConvLayer(targetImpl,
      layers[551]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_841_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_841_b.bin",
      "SSCB", 7);
    c1_cr_layerParamString = "in";
    c1_dr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161 *>(layers[553])
      )->c1_createCustomLayer(targetImpl, layers[552]->getOutputTensor(0),
      "Mul_843", "Swish", "Swish", &c1_cr_layerParamString,
      &c1_dr_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[554]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[546]->getOutputTensor(0), layers[553]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 7);
    (static_cast<MWConvLayer *>(layers[555]))->createConvLayer(targetImpl,
      layers[554]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_845_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_845_b.bin",
      "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[556]))->createConvLayer(targetImpl,
      layers[554]->getOutputTensor(0), 1, 1, 32, 32, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_846_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_846_b.bin",
      "SSCB", 8);
    (static_cast<MWAdditionLayer *>(layers[557]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[555]->getOutputTensor(0), layers[556]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 9);
    (static_cast<MWElementwiseAffineLayer *>(layers[558]))
      ->createElementwiseAffineLayer(targetImpl, layers[557]->getOutputTensor(0),
      1, 1, 1, 1, 1, 1, false, -1, -1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_849_scale.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Add_849_offset.bin",
      "SSCB", 9);
    c1_er_layerParamString = "in";
    c1_fr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162 *>(layers[559])
      )->c1_createCustomLayer(targetImpl, layers[558]->getOutputTensor(0),
      "Mul_851", "Swish", "Swish", &c1_er_layerParamString,
      &c1_fr_layerParamString, "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[560]))->createConvLayer(targetImpl,
      layers[559]->getOutputTensor(0), 3, 3, 32, 32, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_852_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_852_b.bin",
      "SSCB", 8);
    c1_gr_layerParamString = "in";
    c1_hr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163 *>(layers[561])
      )->c1_createCustomLayer(targetImpl, layers[560]->getOutputTensor(0),
      "Mul_854", "Swish", "Swish", &c1_gr_layerParamString,
      &c1_hr_layerParamString, "SSCB", 6);
    (static_cast<MWAdditionLayer *>(layers[562]))->createAdditionLayer<real32_T,
      real32_T>(targetImpl, 2, layers[554]->getOutputTensor(0), layers[561]
                ->getOutputTensor(0), 0, "FLOAT", "SSCB", 8);
    c1_ir_layerParamString = "in";
    c1_jr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164 *>(layers[563])
      )->c1_createCustomLayer(targetImpl, layers[537]->getOutputTensor(0),
      "Mul_858", "Swish", "Swish", &c1_ir_layerParamString,
      &c1_jr_layerParamString, "SSCB", 6);
    (static_cast<MWConcatenationLayer *>(layers[564]))->createConcatenationLayer
      (targetImpl, 2, layers[562]->getOutputTensor(0), layers[563]
       ->getOutputTensor(0), 3, "C", "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[565]))->createConvLayer(targetImpl,
      layers[564]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_860_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_860_b.bin",
      "SSCB", 6);
    c1_kr_layerParamString = "in";
    c1_mr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165 *>(layers[566])
      )->c1_createCustomLayer(targetImpl, layers[565]->getOutputTensor(0),
      "Mul_862", "Swish", "Swish", &c1_kr_layerParamString,
      &c1_mr_layerParamString, "SSCB", 5);
    (static_cast<MWConvLayer *>(layers[567]))->createConvLayer(targetImpl,
      layers[566]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_863_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_863_b.bin",
      "SSCB", 6);
    c1_or_layerParamString = "in";
    c1_pr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166 *>(layers[568])
      )->c1_createCustomLayer(targetImpl, layers[567]->getOutputTensor(0),
      "Mul_865", "Swish", "Swish", &c1_or_layerParamString,
      &c1_pr_layerParamString, "SSCB", 5);
    (static_cast<MWConcatenationLayer *>(layers[569]))->createConcatenationLayer
      (targetImpl, 4, layers[502]->getOutputTensor(1), layers[502]
       ->getOutputTensor(0), layers[535]->getOutputTensor(0), layers[568]
       ->getOutputTensor(0), 3, "C", "SSCB", 6);
    (static_cast<MWConvLayer *>(layers[570]))->createConvLayer(targetImpl,
      layers[569]->getOutputTensor(0), 1, 1, 256, 128, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_867_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_867_b.bin",
      "SSCB", 0);
    c1_qr_layerParamString = "in";
    c1_rr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167 *>(layers[571])
      )->c1_createCustomLayer(targetImpl, layers[570]->getOutputTensor(0),
      "Mul_869", "Swish", "Swish", &c1_qr_layerParamString,
      &c1_rr_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[572]))->createConvLayer(targetImpl,
      layers[571]->getOutputTensor(0), 3, 3, 128, 144, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_907_w_fused.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_907_b_fused.bin",
      "SSCB", 0);
    (static_cast<MWSplittingLayer *>(layers[573]))->createSplittingLayer
      (targetImpl, layers[572]->getOutputTensor(0), 2, 80, 64, 2, "SSCB", "SSCB",
       0, 0);
    c1_sr_layerParamString = "in";
    c1_tr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176 *>(layers[574])
      )->c1_createCustomLayer(targetImpl, layers[573]->getOutputTensor(1),
      "Mul_902", "Swish", "Swish", &c1_sr_layerParamString,
      &c1_tr_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[575]))->createConvLayer(targetImpl,
      layers[574]->getOutputTensor(0), 3, 3, 64, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_903_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_903_b.bin",
      "SSCB", 3);
    c1_ur_layerParamString = "in";
    c1_vr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177 *>(layers[576])
      )->c1_createCustomLayer(targetImpl, layers[575]->getOutputTensor(0),
      "Mul_905", "Swish", "Swish", &c1_ur_layerParamString,
      &c1_vr_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[577]))->createConvLayer(targetImpl,
      layers[576]->getOutputTensor(0), 1, 1, 64, 64, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_906_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_906_b.bin",
      "SSCB", 3);
    c1_wr_layerParamString = "in";
    c1_xr_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178 *>(layers[578])
      )->c1_createCustomLayer(targetImpl, layers[573]->getOutputTensor(0),
      "Mul_909", "Swish", "Swish", &c1_wr_layerParamString,
      &c1_xr_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[579]))->createConvLayer(targetImpl,
      layers[578]->getOutputTensor(0), 3, 3, 80, 80, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_910_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_910_b.bin",
      "SSCB", 0);
    c1_yr_layerParamString = "in";
    c1_as_layerParamString = "out";
    (static_cast<c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179 *>(layers[580])
      )->c1_createCustomLayer(targetImpl, layers[579]->getOutputTensor(0),
      "Mul_912", "Swish", "Swish", &c1_yr_layerParamString,
      &c1_as_layerParamString, "SSCB", 1);
    (static_cast<MWConvLayer *>(layers[581]))->createConvLayer(targetImpl,
      layers[580]->getOutputTensor(0), 1, 1, 80, 80, 1, 1, 0, 0, 0, 0, 1, 1, 1,
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_913_w.bin",
      "C:\\Users\\Dogukan.kilinc\\OneDrive - figes.com.tr\\Documents\\MATLAB\\Examples\\R2025b\\nvidia\\ClassifyWebcamImagesOnNVIDIAJet"
      "sonFromSimulinkExample\\slprj\\_sfprj\\ex_DLModel_28\\_self\\sfun\\src\\cnn_c1_Yolov9t0_ex_DLModel_280_Conv_913_b.bin",
      "SSCB", 0);
    (static_cast<MWConcatenationLayer *>(layers[582]))->createConcatenationLayer
      (targetImpl, 2, layers[577]->getOutputTensor(0), layers[581]
       ->getOutputTensor(0), 3, "C", "SSCB", 1);
    (static_cast<MWOutputLayer *>(layers[583]))->createOutputLayer(targetImpl,
      layers[582]->getOutputTensor(0), "SSCB", 1);
    outputTensors[0] = layers[407]->getOutputTensor(0);
    outputTensors[1] = layers[495]->getOutputTensor(0);
    outputTensors[2] = layers[583]->getOutputTensor(0);
    setSize();
  }

  isInitialized = true;
}

void c1_c1_Yolov9t0_ex_DLModel_280::activations(int32_T c1_layerIdx)
{
  int32_T c1_idx;
  for (c1_idx = 0; c1_idx <= c1_layerIdx; c1_idx++) {
    layers[c1_idx]->predict();
  }
}

void c1_c1_Yolov9t0_ex_DLModel_280::cleanup()
{
  int32_T c1_idx;
  isInitialized = false;
  deallocate();
  for (c1_idx = 0; c1_idx < 584; c1_idx++) {
    layers[c1_idx]->cleanup();
  }

  if (targetImpl) {
    targetImpl->cleanup();
  }

  c1_checkCleanupCudaError(cudaGetLastError(), __FILE__, __LINE__);
}

static void c1_checkCleanupCudaError(cudaError_t c1_errCode, const char_T
  *c1_file, uint32_T c1_line)
{
  emlrtRTEInfo c1_rtInfo;
  if ((c1_errCode != cudaSuccess) && (c1_errCode != cudaErrorCudartUnloading)) {
    c1_rtInfo = c1_createEmlrtInfoStruct(c1_file, c1_line);
    emlrtCUDAWarning((uint32_T)c1_errCode, (char_T *)cudaGetErrorName(c1_errCode),
                     (char_T *)cudaGetErrorString(c1_errCode), &c1_rtInfo);
  }
}

static emlrtRTEInfo c1_createEmlrtInfoStruct(const char_T *c1_file, uint32_T
  c1_line)
{
  emlrtRTEInfo c1_b_rtInfo;
  uint32_T c1_len;
  char_T *c1_brk;
  char_T *c1_fn;
  char_T *c1_pn;
  c1_len = (uint32_T)strlen(c1_file);
  c1_pn = static_cast<char_T *>(calloc(c1_len + 1U, 1U));
  c1_fn = static_cast<char_T *>(calloc(c1_len + 1U, 1U));
  memcpy(c1_pn, c1_file, c1_len);
  memcpy(c1_fn, c1_file, c1_len);
  c1_brk = strrchr(c1_fn, '.');
  *c1_brk = '\x00';
  c1_brk = NULL;
  c1_brk = strrchr(c1_fn, '/');
  if (c1_brk == NULL) {
    c1_brk = strrchr(c1_fn, '\\');
  }

  if (c1_brk == NULL) {
    c1_brk = c1_fn;
  } else {
    c1_brk++;
  }

  c1_b_rtInfo.lineNo = c1_line;
  c1_b_rtInfo.colNo = 0;
  c1_b_rtInfo.fName = c1_brk;
  c1_b_rtInfo.pName = c1_pn;
  return c1_b_rtInfo;
}

real32_T *c1_c1_Yolov9t0_ex_DLModel_280::getLayerOutput(int32_T c1_layerIndex,
  int32_T c1_portIndex)
{
  return layers[c1_layerIndex]->getLayerOutput(c1_portIndex);
}

int32_T c1_c1_Yolov9t0_ex_DLModel_280::getLayerOutputSize(int32_T c1_layerIndex,
  int32_T c1_portIndex)
{
  return layers[c1_layerIndex]->getOutputTensor(c1_portIndex)->getNumElements() *
    sizeof(real32_T);
}

real32_T *c1_c1_Yolov9t0_ex_DLModel_280::getInputDataPointer(int32_T c1_index)
{
  return (static_cast<MWTensor<real32_T> *>(inputTensors[c1_index]))->getData();
}

real32_T *c1_c1_Yolov9t0_ex_DLModel_280::getInputDataPointer()
{
  return (static_cast<MWTensor<real32_T> *>(inputTensors[0]))->getData();
}

real32_T *c1_c1_Yolov9t0_ex_DLModel_280::getOutputDataPointer(int32_T c1_index)
{
  return (static_cast<MWTensor<real32_T> *>(outputTensors[c1_index]))->getData();
}

real32_T *c1_c1_Yolov9t0_ex_DLModel_280::getOutputDataPointer()
{
  return (static_cast<MWTensor<real32_T> *>(outputTensors[0]))->getData();
}

int32_T c1_c1_Yolov9t0_ex_DLModel_280::getBatchSize()
{
  return inputTensors[0]->getBatchSize();
}

int32_T c1_c1_Yolov9t0_ex_DLModel_280::getOutputSequenceLength(int32_T
  c1_layerIndex, int32_T c1_portIndex)
{
  return layers[c1_layerIndex]->getOutputTensor(c1_portIndex)->getSequenceLength
    ();
}

c1_c1_Yolov9t0_ex_DLModel_280::~c1_c1_Yolov9t0_ex_DLModel_280()
{
  int32_T c1_idx;
  if (isInitialized) {
    cleanup();
  }

  for (c1_idx = 0; c1_idx < 584; c1_idx++) {
    delete layers[c1_idx];
  }

  if (targetImpl) {
    delete targetImpl;
  }

  delete inputTensors[0];
}

static void c1_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c1_errorCode, const char_T *c1_errorName, const char_T
  *c1_errorString, const char_T *c1_file, int32_T c1_line)
{
  emlrtRTEInfo c1_rtInfo;
  c1_rtInfo.lineNo = c1_line;
  c1_rtInfo.colNo = 0;
  c1_rtInfo.fName = "";
  c1_rtInfo.pName = c1_file;
  emlrtCUDAError(c1_errorCode, (char_T *)c1_errorName, (char_T *)c1_errorString,
                 &c1_rtInfo, chartInstance->c1_fEmlrtCtx);
}

static void c1_checkCudaError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c1_errorCode, const char_T *c1_file, int32_T c1_line)
{
  if (c1_errorCode != cudaSuccess) {
    c1_gpuThrowError(chartInstance, c1_errorCode, cudaGetErrorName(c1_errorCode),
                     cudaGetErrorString(c1_errorCode), c1_file, c1_line);
  }
}

static void c1_b_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c1_errorCode, const char_T *c1_errorName, const char_T
  *c1_errorString, const char_T *c1_file, int32_T c1_line)
{
  emlrtRTEInfo c1_rtInfo;
  c1_rtInfo.lineNo = c1_line;
  c1_rtInfo.colNo = 0;
  c1_rtInfo.fName = "";
  c1_rtInfo.pName = c1_file;
  emlrtThinCUDAError(c1_errorCode, (char_T *)c1_errorName, (char_T *)
                     c1_errorString, (char_T *)"SimGPUErrorChecks",
                     chartInstance->c1_fEmlrtCtx);
}

static void c1_b_checkCudaError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c1_errorCode, const char_T *c1_file, int32_T c1_line)
{
  if (c1_errorCode != cudaSuccess) {
    c1_b_gpuThrowError(chartInstance, c1_errorCode, cudaGetErrorName
                       (c1_errorCode), cudaGetErrorString(c1_errorCode), c1_file,
                       c1_line);
  }
}

static void c1_c_gpuThrowError(SFc1_ex_DLModel_28InstanceStruct *chartInstance,
  const char_T *c1_file, int32_T c1_line)
{
  emlrtRTEInfo c1_rtInfo;
  c1_rtInfo.lineNo = c1_line;
  c1_rtInfo.colNo = 0;
  c1_rtInfo.fName = "";
  c1_rtInfo.pName = c1_file;
  emlrtCUDAError(0U, (char_T *)"_", (char_T *)
                 "Unable to launch kernel. Loop nest contains too many iterations.",
                 &c1_rtInfo, chartInstance->c1_fEmlrtCtx);
}

static void init_dsm_address_info(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc1_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  chartInstance->c1_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c1_image = (uint8_T (*)[921600])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c1_bboxes_data = (real32_T (*)[400])
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
  chartInstance->c1_bboxes_sizes = (int32_T (*)[2])
    ssGetCurrentOutputPortDimensions_wrapper(chartInstance->S, 1);
  chartInstance->c1_scores_data = (real32_T (*)[100])
    ssGetOutputPortSignal_wrapper(chartInstance->S, 2);
  chartInstance->c1_scores_sizes = (int32_T (*)[2])
    ssGetCurrentOutputPortDimensions_wrapper(chartInstance->S, 2);
  chartInstance->c1_labelIds_data = (real32_T (*)[100])
    ssGetOutputPortSignal_wrapper(chartInstance->S, 3);
  chartInstance->c1_labelIds_sizes = (int32_T (*)[2])
    ssGetCurrentOutputPortDimensions_wrapper(chartInstance->S, 3);
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2801::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2802::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2803::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2801::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2804::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2805::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2806::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2807::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2808::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2802::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_2809::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28010::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28011::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28012::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28013::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28014::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28015::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28016::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28017::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28018::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28019::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28020::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28021::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28022::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28023::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28024::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28025::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28026::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28027::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28028::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28029::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28030::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28031::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2803::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28032::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28033::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28034::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28035::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28036::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28037::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28038::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28039::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28040::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28041::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28042::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28043::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28044::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28045::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28046::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28047::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28048::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28049::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28050::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28051::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28052::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28053::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28054::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2804::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28055::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28056::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28057::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28058::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28059::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28060::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28061::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28062::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28063::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28064::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28065::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28066::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28067::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28068::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28069::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28070::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28071::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28072::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28073::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28074::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28075::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28076::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28077::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2801::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28078::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2805::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28079::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28080::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28081::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28082::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28083::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28084::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28085::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28086::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28087::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28088::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28089::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28090::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28091::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28092::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28093::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28094::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28095::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28096::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28097::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28098::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_28099::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWResize2DLayer_c1_Yolov9t0_ex_DLModel_2802::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280100::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2806::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280101::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280102::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280103::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280104::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280105::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280106::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280107::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280108::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280109::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280110::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280111::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280112::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280113::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280114::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280115::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280116::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280117::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280118::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280119::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280120::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280121::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280168::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280169::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280170::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280171::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280122::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280123::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2807::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280124::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280125::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280126::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280127::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280128::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280129::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280130::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280131::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280132::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280133::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280134::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280135::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280136::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280137::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280138::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280139::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280140::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280141::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280142::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280143::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280144::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280172::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280173::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280174::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280175::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280145::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280146::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWCustomSliceLayer_c1_Yolov9t0_ex_DLModel_2808::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280147::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280148::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280149::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280150::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280151::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280152::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280153::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280154::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280155::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280156::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280157::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280158::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280159::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280160::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280161::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280162::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280163::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280164::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280165::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280166::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280167::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280176::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280177::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280178::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

void c1_MWSwishLayer_c1_Yolov9t0_ex_DLModel_280179::setChartInstancePtr
  (SFc1_ex_DLModel_28InstanceStruct *chartInstance)
{
  this->chartInstance = chartInstance;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c1_ex_DLModel_28_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(611669087U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2094784431U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(879265815U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1392085840U);
}

mxArray *sf_c1_ex_DLModel_28_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,1);
  mxSetCell(mxcell3p, 0, mxCreateString("dltargets.cudnn.cudnnApi"));
  return(mxcell3p);
}

mxArray *sf_c1_ex_DLModel_28_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("GPUAcceleration");
  mxArray *hiddenFallbackType = mxCreateString("none");
  mxArray *hiddenFallbackReason = mxCreateString("");
  mxArray *incompatibleSymbol = mxCreateString("chartInfo");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c1_ex_DLModel_28_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const char* sf_get_instance_specialization(void)
{
  return "sV7rSvS1jrKcMF5QBXZRDr";
}

static void sf_opaque_initialize_c1_ex_DLModel_28(void *chartInstanceVar)
{
  initialize_params_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
  initialize_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c1_ex_DLModel_28(void *chartInstanceVar)
{
  enable_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c1_ex_DLModel_28(void *chartInstanceVar)
{
  disable_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c1_ex_DLModel_28(void *chartInstanceVar)
{
  sf_gateway_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c1_ex_DLModel_28(SimStruct* S)
{
  return get_sim_state_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c1_ex_DLModel_28(SimStruct* S, const mxArray
  *st)
{
  set_sim_state_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c1_ex_DLModel_28(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_ex_DLModel_28InstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_ex_DLModel_28_optimization_info();
    }

    mdl_cleanup_runtime_resources_c1_ex_DLModel_28
      ((SFc1_ex_DLModel_28InstanceStruct*) chartInstanceVar);
    ((SFc1_ex_DLModel_28InstanceStruct*) chartInstanceVar)->
      ~SFc1_ex_DLModel_28InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c1_ex_DLModel_28(void *chartInstanceVar)
{
  mdl_start_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
  if (chartInstanceVar) {
    sf_reset_warnings_ChartRunTimeInfo(((SFc1_ex_DLModel_28InstanceStruct*)
      chartInstanceVar)->S);
  }
}

static void sf_opaque_mdl_terminate_c1_ex_DLModel_28(void *chartInstanceVar)
{
  mdl_terminate_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_ex_DLModel_28(SimStruct *S)
{
  mdlProcessParamsCommon(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_ex_DLModel_28((SFc1_ex_DLModel_28InstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c1_ex_DLModel_28_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [92] = {
    "eNrtnU1s4+h9xmXv7iRb7G4+2rQLJEW3PQVoY0jUB6UgSNaW5Rnt+GtG9szsrAuXol5ZHFOkhqQ",
    "sKacAObZAbj01yCFpUAQF2kPRc4sCAXrLsYccAswGmSKX3tpT0ZeybEu0/LyktJ2xrceAZ4Yev6",
    "T44/P83//7ydRSdSslv96T33/3g+XUHfn35+X3cur0663R8dLY9+nP30x9a3T8V7+TSpktwwuqT",
    "tNNJf8y3YY4Ek6t22xa/YRlnW571/CMtj/DdR2jLR4K37W7geU6yT685TSFJxxTnqDjekGi6/pW",
    "u2tbzvFG1zHDK/uPW5bZqrXcrt1Ykyc0GjuOPbjqup1usCuvuG55wgw2hGgELc/tHrU2bOMIU/C",
    "CXrklzGO/207MyhdBrdsJb9Xf6tqB1bFFpS/MquMHhqTgK+63FhiBKAf9xAqx/NpZabfdsS3Dic",
    "+6Zfg10ZHqCMR+pyH/3OkGkl7M68rr1S3HCFzPMuxK2y6HCo9ZdteWn3NLytpOzDloB+ui3j06s",
    "pyjkK7XbQtH3r/USQxWzbJ7IjzjSOw4CT0Y3l2lP3zA57qM78FqKMuZPNhtnz4Vf6ayw+tWTiQh",
    "f8brbphO2bBtP1nZPbezKU6EPbz+uhEYM5Q9vX6Cwr5vNfbcR4YXuiChk7qO9bwrRmXLrtOw4j/",
    "hk0ipYcDdlsEzRnGrHUpKNCTm849+fiKVJrt+4LbL0kbrm5sxr3e5bNUJhNc0TBE79nmG5Qv5gY",
    "e6SnjdhuUbdTssLSkFw7uMfQbhzFw05Te7znrP9Y4l46RB9oJV6IRkpUXjSKyLQAwDRkWq+5Fhd",
    "2N+5rYvI1woj31fRqxk15VlQ//MVNg0zJZohPWJZYst4Ycn8GPHZ1mPrMq7PbGCwbrwTc/qxHVS",
    "1xcNWZGElPYGHbHvHDtuz9nw3HZtlBEAXQkho4bhObJaWJPVkjfYkB8+3qf2xPO9UFmzpGdtI7C",
    "NeqiNu8KRNUt4r2FNaJjSVRVHpm7yA81TtmZ9V1btjm/5gUynBpWhBxopEXrvoTC7nj/KzZIF+D",
    "CffV8mp0ny2S+NjrPnXqz6e5580oasxh2Zaa3Wh8mi2LPaYviDmiFzktPDseumUxfXfXsZX3dZ/",
    "mtpxnKpOct9OFbuzSl8vjhW7oujbzNzKPqH65vD5OZQK0av/04MzmfX/8Wf4efzTqTcu6PjHwzb",
    "DDKs94OLRP7CKW5b+sMJQotJ6csndiL1FH41rdNnVRs/2A6P2htj/3V+EP5X+O9hxVGTFYfXGhO",
    "hPX5w6TlEeZ59jfN8XeV+oXjufxMpFx5/sv/n5W8e7PvC8w/W3aPuseGsHFsyZpkHO45Yly4RH3",
    "zjg6YlI+mK6bZXAk/+mjnMXf2DrdW9zdW1g0p/aBf/4KGW1vL1A+fEaljGQdk2ZGbTHDwWddNoV",
    "9thNN5xth9V16urH4nAdydC5OgkBx+7tntSClZkkDm7r+LYfX1BocN3Rz//93/95dI85b/3v9X7",
    "85Qf18+85e8pnuvvR55reGxlq/d6ldbjQbmf7VsnhljXcrny6fm+Pna+pSnnG9fXLL8/q35V9/m",
    "lSLnwuCXsjvBWOp7oeK5sr/pXcJ92vrci5wuPu5YTFEfl/0NR/m8j5cPjTyrXzE9/ekro4ILQSn",
    "sOXR78fD5fpb7wo3+4yb56Uq32Gw+ON4+bew/6D++3nlWCemHt1fjqtutxlrxl5H9bBDL3XHP7c",
    "Z7rVyLn+cqor9JbscI2pWPYK37gnea/cbj/JHK+n1xn7uekhthn9tGDf5mzfv3j0DU3Nw5s1nP5",
    "1cLdQXp79dl6d6NjrfmD+sb1rl9n8Vd52IdQsy1TbBoD4c1zfZWPfhwpFx5/Ur5mPooCObXRa/N",
    "R6i9/uHpTfDQt7uZOvNXnZu9+pSPWunef9Z/Zwu2mrrePVHnl5yLlwmNZ3TUsM/hMffgrxXn+Pn",
    "Ke8PiTnetvqKUzWNdE1zexftp/uv2ocLe2/mz73vP9Z0eDXSO7a9692e2/afc5yv+OTjsiRVmEG",
    "Zwfz6d3Iue7M+xl6tZtcVpe5a+fRcr/7DrnfRFCo2rr9bUD/838p5vsr/JJZa38tLb58Y5rBUe7",
    "u5V+P7O/drP99eVIuS+P9a+4fjDRwRKeb1dxvq9GzvfV0XjHRTPrtNXVsA3PMwax88SfRs7702v",
    "dzr0gF3rutfntD3/+zzfZb12xo212cs2T+yV9UB08NU3P3qpcj36Xm67HOeLCE/Njs9fS+oNei3",
    "Eh0XMYIzdPXFikfphp7cfu8eZHW7ve9pMtz3N7H/s1o/K8mWJc+Cziwhz9saGspbb7g1nzcN9yj",
    "s7y8FvV/3pOhv2vc7Vvc+myK/KDVsF7/LC0v7pd3hP+Gn3/mvMB3zRscVh3+8KP3182r/9vFO8x",
    "Qqz3Z/f/kZ453tZ6/Y+qJzvWg87Tu1u+aJTp/89Cj3PMwzBtqzNu/1fi/xs17n1BaK55GIvu//r",
    "D7kazZJcrj3Vd5Lx7T/bF9vN1+v+15/39wbBNy7z/Ut4/IsO8fx7f6/fy/m6poqc9N9hu2kcfDe",
    "6tuq9oXOuz6K9PMm983IfvRq7zZqTcnRGjwZ8c/G725f7db/73Xx/98vutH85z/b94I9k8+/dGx",
    "19Ljdadna/MObm0eGXW5+8/0r3aSS3zzLtvbm3kH6w9efpw3Ts93z8u48/7RuTznv38A/kdhLPK",
    "w/N7ZrUxNvXc6J6ubYzq/Y6Cx9sTev+v78xX/vc+nDWe1kfJ2HtX+PbV3sfXYt3H5yP3ER7bRl3",
    "Y1YZ/Pe7j/Zmfh2+6XvR5vOr1ISynLhdnvcvSjOXemLFc6hWXm/f+/r/r4+v2+7OOy1+3+4j+jZ",
    "5/6tLzv773Nd6eiJPP/NHo+NupszXa5ZZlN6asEh3996YwmtP+95ry+FV1Gf7+55Ynf/+DJVzf/",
    "WdE3+Hx9WqM+XbHe3Zw6DfDvybWO8ofCrt5EC63PpA54IHpOIdm5nC0Gi09uTgyfbjaaBzmc5lD",
    "t9n0RbBSt5wxTu8rOP06wunXt5dT2XVODvVi7rA3YkQ+l/kUS5nD+hgf+mzCZ9mcPt1n5DTBKZM",
    "uzRaPXkY4vbz9cXs46hFiIp+pfkvEZ9HidSmdTVSfLZh+wjg0oR/G6Uk+Wpp5YxyfZbXCRF6k4v",
    "MiwufFLedTOI9CzIem+ayoMR+KGY9Y3yOf5dl+RXzy2VyiOL1o/pJxiPnQ1XwKxSzb93F0lM3Mx",
    "um3EU6/ve39jVmZGR02w20ZmR9draditsj8KGZ8Yn8R1hH54LjN+h/wKWVni0OfRjh9etv7Q0rn",
    "aTbj9HQd0WdX89HSOdb3MTmxPwTEoYymsz8E9YcU0hN8GIcm/aUVOf4Rq99R+oz9alBHjNNoXlG",
    "WcQjpJ1tiHIqjo5z8B+MQ1BHbHaD/rJBhuyMOp/FuEMahae2ObKL6bNHGPbI6xz3ixOs851/F81",
    "sxz3Y+aufnionyooVrvxZKzBtxXsT2KxrH13P0F+CjZfOJ+Pwmwuc3tz6fPrcXxxOnrWMYm0DM+",
    "Dw1T2R8Rvmhnmf/IlhHlWa/R1xOiXy2aOs8LnpfmQdNH+fIMQ4Bf2W4DiYuJ9b3qL7PldgeQ/2v",
    "ea6DAf7KlTivCo+z5nLcBwTEZy3LfvtYcTpTSKSjRRsny8sGx7RxMvYPRftf2T+kiEec9wHq+xz",
    "necZrv2bYfgU60tM6dRR3vjB1dHW8znO9a9y4zfWcOB6RD/YZ2/lw/7gC4zTQT4H7WMblRJ+h/t",
    "jIugX6bLKe1wr0WUxO9Bmah5bm/tVIP1m2X2OOn3GdmUJHjEMoDmUyzKvBfNir9ocnp0mfcT/Ce",
    "Jx0ziuK6zvGbTTvocR9LhTxiPpB49RanvPSYF6Up79wPcZxfDxvj+3XOPWYlmx+7KLNJyokXG+2",
    "cOvJS3zPAPRXWmM9BtoZOtcvKPzF8SD0Xry8xno+Vj91ocA4hHXEOITaYwn7OxauPZ/mfFjkr0K",
    "W/a4xObFdD/gUdeooJifqCPApcV51XE7Mi1D7TE+z/wPOs2LeCPuH9BLzRtw/xHkNMdZ3ZLhuMf",
    "Y6BvaDQB0xbwR8NK7ziMuJ680An1zCffMXbf+4i13zuU/sdP0k2yd2EdtlHDe7Wj/FDPPFuO3XH",
    "ufHXJ1Plzg/Bs4fiqybZh50KQ6xfxHFn5zGegzop8T5H7H3aWQcgjpiHFLsz8h+6iv1U0xzn894",
    "82SK3G9YoSP2vwI+Gud/xOXE+gy2y/geGKSfHMc54nLiOAfgk084zrFg/fiSz2Q/Pvc9j+wznC8",
    "c1mfY93zx3rfU4/uWFO9b4jw00L5Pcz8COB5dSpOPQj+cB4v1Qz5IPwX6C/ab8b3tKv3QX1g/5I",
    "PGNzT6C+XPuQz1A8dXmR+q/EX9YH9RP9hf1A/a34PxGeuH/Rs4PnOdpspf5IP9xfiD/dXj+22v9",
    "pc+2zjPwulIyzIOQT6sxzAf9iPi95HSX7Cez7OeV/mLfLC/yAf7i/EHrYfSqR8UfzjPRakf8sH6",
    "YTsV8SlObaeS02VOPbbn1fGI7wHC42Iltjegz3Kct6DSD/lg/dBfiA/1o+JD/SA+JfKB78/m+6O",
    "gftgfpORD/SA+HO9R8aF+AB+d8Qfzob/guoMS8x+VfsgH64f+QvohH9j/k+F4oUo/5IP1Q38B/R",
    "SZH8J9yHOs3/H71Rl/sL9Yv8PxU657wv4qcl8Flb+oH+wv6gf7i/oB/uK+STg/5PiFUj/kg/VDf",
    "yH9MP/B65qpH5V+GH+wfsgHvT+M+Y+KD/WD+LB/A/LJsH2K+TA+Yz6cv6HiQ/2A+QlcT6hY38T1",
    "qCr90F9YP+SD1w+SD+CTZX6o4kP9gPisM/5g/TD+YP0wP8T6SdY//2mEz6e3fXznYnoC9XOFvxh",
    "/sL969BfyVz2JvxaNz9h2iOQznQ/jM9xvi/tLYD6cn6DiQ/0APvks82dUvxcYn1X6YX4I9TOR/3",
    "Cfv6h+dO7bH2cdoc56DM+jn5wnRZ9d9hn304zTnud8Mryeh+PxKj7UD6jHuH+/Qj+cTwb5lDifT",
    "OUv6gf7i/rB/mJ/ENIPxzPwfjfsL8PzNdPsL8P+6tFf0F91+gv7i/kP8JfO9ruKD/NDxIfzEWE/",
    "NPeDVuqHfLB+6C9Qv2e43wRuv7N+V+mH8Qfrh3wQH9Zf0F/pHPsPYfxh/xjcD4j6UemH/T8K/TA",
    "+Iz5sX6j4UD+ID/cTV/Hh+A7iw/FTBR/mh4gP+3+UfFh/IT6sv1R8epxHD94Hr3G9ShwdaRyHV/",
    "FhnEZ8uN4J8snSXyo+1A/iw3FCFR/qB/ApchwM64fzpFT6IR+sH/rraj45TaN+kH5yXAem0g/9h",
    "fVDPogP82foryz1o9IP+WD90F9AP3n2b2A+HCdU8aF+0HsJue8x5sN5HAo+nMcB21/MD6F+dPZv",
    "qPRDPlg/9Bfqf2b+DP1VYPzB+mH8UemH/sL6IR/Ap8TxQRUftk8Rn2TtrxcRPi9uO5+L5jv9Na3",
    "+SrP+gvuUpPneT6gfrjNQ6od8sH7oL9T/w3Uq0F+Zwkzve1i0PLFQ4H4K+H0YnOeC5ymQj4oP6z",
    "Gwn0uReSLUT555IozPeeaJKn+RD/YX+WB/Mf4g/ZCPig/9hcYJuR+Zig/1g/gw/qj4UD+Aj8554",
    "io+1A/iw/gD90viPiVYP5yHqOBToH7g+8CoH5V+yAfrh/4C/T+cp4n9VaJ+VPohH6wf+gvx4fgX",
    "rL9yzA9V+qG/sH7IB+lH5zw7VL+H81i5H3QMTuxnVfFhHEJ8OE6o4kP9AD4ZrmdW8aF+QJ6Yp36",
    "wfrheV6Uf+gvrh3zQe+G5zgDqh+sMFHwYn1V8qB/0Xm+OY2D9sH2q0g/9hfVDPoAP91vH7Ys0x1",
    "FV+iEfrB/6C9RfnCel8BfnQeN9JpgfqvzF+Iz9RT7YX+QD9FNg/YX5cB6Zig/9BfjobJ+q+FA/i",
    "A/751V8qB+0zoDxR8WH+kH7/HF+pooP9YP2802mn0XbZ7RU4j6jWD9sf8H++QLf94D1Q3+p9MP4",
    "DPXD9zXC/cQ5/1nFh+vk8H70XCcXg5PGfnoVH7bDAJ8s52mq+FA/iA/7oVV8qB+0ToX6UfGhftA",
    "8Do5jqPhQP4AP9/NV8qF+EB/OY1XxoX5AP6vOcQyoH+53jPlwP00lH+oH8WH+rOJD/SA+bL/D+r",
    "3EdQYq/ZAP1k8Sf72I8Hlx2/VzMY2D8xSm7qOQbJ7LAvLhPA64zpL5oYoP6y/AR+N+9Co+1A/iw",
    "/5nzIf9hyo+1A/gk+U8TRUfztNEfGabp7lo7YyixvUGUEe5LNcbYP2wnarQD+t5wCfPeb4qPqzn",
    "wXrUtM71GLF0xPEwFR/GacBH575/Kj6M02g+mfQX22MxdMT2GOTD/V2UfFiPof2h2S+t4kP9AD4",
    "cd1b0B5GPig/9BfhkWb+r+FA/6D3o1I+KD9up6P2WhZnaqYu3DxfX96j4ME4jPhz3gXy4vlCpH/",
    "LB+qG/UH/0ZPxhHnS5v57jqvF0xDiE4hDreRUf6gfx4bizig/300Z8uM5QwYfzN+E65wz7yyAfj",
    "f1lseYpsr2hmsdJHcXgxPc3K/kwn0Z82B5T8WE+DfhozKcVfHrkA/gUkunnZYTPyxvMxxFBz/WO",
    "dw3PaPtVp+kCWiGjkM//pC74LE/hszTG5y1J8A9GxxX57Xc7HdcL/KfZVcewB77lD3/t7Me7nns",
    "ivPP/8oQh79BPXf4KP0d67HO8vYw/x/LoX/OUO/v7wxTWxzsRfYTHPctpuD3/Gxktr836OZZG5b",
    "4+Vm5pyvVTY3//H7AGFtI=",
    ""
  };

  static char newstr [6773] = "";
  newstr[0] = '\0';
  for (i = 0; i < 92; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c1_ex_DLModel_28(SimStruct *S)
{
  const char* newstr = sf_c1_ex_DLModel_28_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(324805241U));
  ssSetChecksum1(S,(1196812339U));
  ssSetChecksum2(S,(1737946938U));
  ssSetChecksum3(S,(2640872412U));
}

static void mdlRTW_c1_ex_DLModel_28(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c1_ex_DLModel_28(SimStruct *S)
{
  SFc1_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = (SFc1_ex_DLModel_28InstanceStruct *)utMalloc(sizeof
    (SFc1_ex_DLModel_28InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc1_ex_DLModel_28InstanceStruct));
  chartInstance = new (chartInstance) SFc1_ex_DLModel_28InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  if (ssGetSampleTime(S, 0) == CONTINUOUS_SAMPLE_TIME && ssGetOffsetTime(S, 0) ==
      0 && sfHasContStates(S)> 0 &&
      !supportsLegacyBehaviorForPersistentVarInContinuousTime(S)) {
    sf_error_out_about_continuous_sample_time_with_persistent_vars(S);
  }

  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c1_ex_DLModel_28;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_ex_DLModel_28;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c1_ex_DLModel_28;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c1_ex_DLModel_28;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c1_ex_DLModel_28;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_ex_DLModel_28;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c1_ex_DLModel_28;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_ex_DLModel_28;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_ex_DLModel_28;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_ex_DLModel_28;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c1_ex_DLModel_28;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartEventFcn = NULL;
  chartInstance->S = S;
  chartInstance->chartInfo.dispatchToExportedFcn = NULL;
  sf_init_ChartRunTimeInfo(S, &(chartInstance->chartInfo), false, 0);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c1_ex_DLModel_28(chartInstance);
}

void c1_ex_DLModel_28_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c1_ex_DLModel_28(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_ex_DLModel_28(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_ex_DLModel_28(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_ex_DLModel_28_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
