/* Include files */

#include "ex_DLModel_28_sfun.h"
#include "c5_ex_DLModel_28.h"
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

#include "MWCudaDimUtility.hpp"

/* Forward Declarations */

/* Type Definitions */

/* Named Constants */
const int32_T CALL_EVENT = -1;

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;

/* Function Declarations */
static void c5_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint8_T c5_cpu_R[307200], uint8_T c5_cpu_G[307200], uint8_T c5_cpu_B[307200],
  uint8_T c5_cpu_RGB[921600]);
static void initialize_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void initialize_params_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct *
  chartInstance);
static void mdl_start_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void mdl_terminate_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void mdl_setup_runtime_resources_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance);
static void enable_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void disable_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void sf_gateway_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void ext_mode_exec_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static const mxArray *get_sim_state_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance);
static void set_sim_state_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c5_st);
static void c5_emlrt_marshallIn(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  const mxArray *c5_nullptr, const char_T *c5_identifier, uint8_T c5_y[921600]);
static void c5_b_emlrt_marshallIn(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c5_u, const emlrtMsgIdentifier *c5_parentId,
  uint8_T c5_y[921600]);
static __global__ void c5_c5_ex_DLModel_28_kernel1(const uint8_T c5_b_B[307200],
  const uint8_T c5_b_G[307200], const uint8_T c5_b_R[307200], uint8_T c5_b_RGB
  [921600]);
static void c5_gpuThrowError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c5_errorCode, const char_T *c5_errorName, const char_T
  *c5_errorString, const char_T *c5_file, int32_T c5_line);
static void c5_checkCudaError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c5_errorCode, const char_T *c5_file, int32_T c5_line);
static void c5_b_gpuThrowError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c5_errorCode, const char_T *c5_errorName, const char_T
  *c5_errorString, const char_T *c5_file, int32_T c5_line);
static void c5_b_checkCudaError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c5_errorCode, const char_T *c5_file, int32_T c5_line);
static void init_dsm_address_info(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance);

/* Function Definitions */
static void c5_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint8_T c5_cpu_R[307200], uint8_T c5_cpu_G[307200], uint8_T c5_cpu_B[307200],
  uint8_T c5_cpu_RGB[921600])
{
  c5_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c5_gpu_B, c5_cpu_B,
    307200ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c5_gpu_G, c5_cpu_G,
    307200ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaMemcpy(*chartInstance->c5_gpu_R, c5_cpu_R,
    307200ULL, cudaMemcpyHostToDevice), __FILE__, __LINE__);
  c5_c5_ex_DLModel_28_kernel1<<<dim3(600U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*chartInstance->c5_gpu_B, *chartInstance->c5_gpu_G,
     *chartInstance->c5_gpu_R, *chartInstance->c5_gpu_RGB);
  c5_checkCudaError(chartInstance, cudaMemcpy(c5_cpu_RGB,
    *chartInstance->c5_gpu_RGB, 921600ULL, cudaMemcpyDeviceToHost), __FILE__,
                    __LINE__);
}

static void initialize_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  emlrtInitGPU(chartInstance->c5_fEmlrtCtx);
  cudaGetLastError();
  emlrtLicenseCheckR2022a(chartInstance->c5_fEmlrtCtx,
    "EMLRT:runTime:MexFunctionNeedsLicense", "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  c5_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c5_gpu_RGB,
    921600ULL), __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c5_gpu_B,
    307200ULL), __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c5_gpu_G,
    307200ULL), __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaMalloc(&chartInstance->c5_gpu_R,
    307200ULL), __FILE__, __LINE__);
}

static void initialize_params_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct *
  chartInstance)
{
}

static void mdl_start_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  sim_mode_is_external(chartInstance->S);
}

static void mdl_terminate_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  c5_checkCudaError(chartInstance, cudaFree(*chartInstance->c5_gpu_RGB),
                    __FILE__, __LINE__);
  c5_checkCudaError(chartInstance, cudaFree(*chartInstance->c5_gpu_B), __FILE__,
                    __LINE__);
  c5_checkCudaError(chartInstance, cudaFree(*chartInstance->c5_gpu_G), __FILE__,
                    __LINE__);
  c5_checkCudaError(chartInstance, cudaFree(*chartInstance->c5_gpu_R), __FILE__,
                    __LINE__);
  c5_b_checkCudaError(chartInstance, cudaGetLastError(), __FILE__, __LINE__);
}

static void mdl_setup_runtime_resources_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance)
{
  sfSetAnimationVectors(chartInstance->S, &chartInstance->c5_JITStateAnimation[0],
                        &chartInstance->c5_JITTransitionAnimation[0]);
}

static void mdl_cleanup_runtime_resources_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance)
{
}

static void enable_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void sf_gateway_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c5_JITTransitionAnimation[0] = 0U;
  c5_c5_ex_DLModel_28(chartInstance, *chartInstance->c5_R, *chartInstance->c5_G,
                      *chartInstance->c5_B, *chartInstance->c5_RGB);
}

static void ext_mode_exec_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
}

static const mxArray *get_sim_state_c5_ex_DLModel_28
  (SFc5_ex_DLModel_28InstanceStruct *chartInstance)
{
  const mxArray *c5_b_y = NULL;
  const mxArray *c5_st = NULL;
  const mxArray *c5_y = NULL;
  c5_st = NULL;
  c5_y = NULL;
  sf_mex_assign(&c5_y, sf_mex_createcellmatrix(1, 1), false);
  c5_b_y = NULL;
  sf_mex_assign(&c5_b_y, sf_mex_create("y", *chartInstance->c5_RGB, 3, 0U, 1, 0U,
    3, 480, 640, 3), false);
  sf_mex_setcell(c5_y, 0, c5_b_y);
  sf_mex_assign(&c5_st, c5_y, false);
  return c5_st;
}

static void set_sim_state_c5_ex_DLModel_28(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c5_st)
{
  const mxArray *c5_u;
  int32_T c5_i;
  c5_u = sf_mex_dup(c5_st);
  c5_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c5_u, 0)), "RGB",
                      chartInstance->c5_uv);
  for (c5_i = 0; c5_i < 921600; c5_i++) {
    (*chartInstance->c5_RGB)[c5_i] = chartInstance->c5_uv[c5_i];
  }

  sf_mex_destroy(&c5_u);
  sf_mex_destroy(&c5_st);
}

const mxArray *sf_c5_ex_DLModel_28_get_eml_resolved_functions_info()
{
  const mxArray *c5_nameCaptureInfo = NULL;
  c5_nameCaptureInfo = NULL;
  sf_mex_assign(&c5_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1, 0U, 2, 0, 1), false);
  return c5_nameCaptureInfo;
}

static void c5_emlrt_marshallIn(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  const mxArray *c5_nullptr, const char_T *c5_identifier, uint8_T c5_y[921600])
{
  emlrtMsgIdentifier c5_thisId;
  c5_thisId.fIdentifier = const_cast<const char_T *>(c5_identifier);
  c5_thisId.fParent = NULL;
  c5_thisId.bParentIsCell = false;
  c5_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c5_nullptr), &c5_thisId, c5_y);
  sf_mex_destroy(&c5_nullptr);
}

static void c5_b_emlrt_marshallIn(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance, const mxArray *c5_u, const emlrtMsgIdentifier *c5_parentId,
  uint8_T c5_y[921600])
{
  int32_T c5_i;
  sf_mex_import(c5_parentId, sf_mex_dup(c5_u), chartInstance->c5_b_uv, 1, 3, 0U,
                1, 0U, 3, 480, 640, 3);
  for (c5_i = 0; c5_i < 921600; c5_i++) {
    c5_y[c5_i] = chartInstance->c5_b_uv[c5_i];
  }

  sf_mex_destroy(&c5_u);
}

static __global__ __launch_bounds__(512, 1) void c5_c5_ex_DLModel_28_kernel1(
  const uint8_T c5_b_B[307200], const uint8_T c5_b_G[307200], const uint8_T
  c5_b_R[307200], uint8_T c5_b_RGB[921600])
{
  uint64_T c5_gThreadId;
  int32_T c5_i;
  int32_T c5_i1;
  c5_gThreadId = mwGetGlobalThreadIndex();
  c5_i = static_cast<int32_T>(c5_gThreadId % 480ULL);
  c5_i1 = static_cast<int32_T>((c5_gThreadId - static_cast<uint64_T>(c5_i)) /
    480ULL);
  if ((static_cast<int32_T>(c5_i1 < 640)) && (static_cast<int32_T>(c5_i < 480)))
  {
    c5_b_RGB[c5_i + 480 * c5_i1] = c5_b_R[c5_i1 + 640 * c5_i];
    c5_b_RGB[(c5_i + 480 * c5_i1) + 307200] = c5_b_G[c5_i1 + 640 * c5_i];
    c5_b_RGB[(c5_i + 480 * c5_i1) + 614400] = c5_b_B[c5_i1 + 640 * c5_i];
  }
}

static void c5_gpuThrowError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c5_errorCode, const char_T *c5_errorName, const char_T
  *c5_errorString, const char_T *c5_file, int32_T c5_line)
{
  emlrtRTEInfo c5_rtInfo;
  c5_rtInfo.lineNo = c5_line;
  c5_rtInfo.colNo = 0;
  c5_rtInfo.fName = "";
  c5_rtInfo.pName = c5_file;
  emlrtCUDAError(c5_errorCode, (char_T *)c5_errorName, (char_T *)c5_errorString,
                 &c5_rtInfo, chartInstance->c5_fEmlrtCtx);
}

static void c5_checkCudaError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c5_errorCode, const char_T *c5_file, int32_T c5_line)
{
  if (c5_errorCode != cudaSuccess) {
    c5_gpuThrowError(chartInstance, c5_errorCode, cudaGetErrorName(c5_errorCode),
                     cudaGetErrorString(c5_errorCode), c5_file, c5_line);
  }
}

static void c5_b_gpuThrowError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  uint32_T c5_errorCode, const char_T *c5_errorName, const char_T
  *c5_errorString, const char_T *c5_file, int32_T c5_line)
{
  emlrtRTEInfo c5_rtInfo;
  c5_rtInfo.lineNo = c5_line;
  c5_rtInfo.colNo = 0;
  c5_rtInfo.fName = "";
  c5_rtInfo.pName = c5_file;
  emlrtThinCUDAError(c5_errorCode, (char_T *)c5_errorName, (char_T *)
                     c5_errorString, (char_T *)"SimGPUErrorChecks",
                     chartInstance->c5_fEmlrtCtx);
}

static void c5_b_checkCudaError(SFc5_ex_DLModel_28InstanceStruct *chartInstance,
  cudaError_t c5_errorCode, const char_T *c5_file, int32_T c5_line)
{
  if (c5_errorCode != cudaSuccess) {
    c5_b_gpuThrowError(chartInstance, c5_errorCode, cudaGetErrorName
                       (c5_errorCode), cudaGetErrorString(c5_errorCode), c5_file,
                       c5_line);
  }
}

static void init_dsm_address_info(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc5_ex_DLModel_28InstanceStruct
  *chartInstance)
{
  chartInstance->c5_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c5_R = (uint8_T (*)[307200])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c5_RGB = (uint8_T (*)[921600])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c5_G = (uint8_T (*)[307200])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c5_B = (uint8_T (*)[307200])ssGetInputPortSignal_wrapper
    (chartInstance->S, 2);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c5_ex_DLModel_28_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3618233409U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2617309442U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1715473656U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1233521615U);
}

mxArray *sf_c5_ex_DLModel_28_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c5_ex_DLModel_28_jit_fallback_info(void)
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

mxArray *sf_c5_ex_DLModel_28_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const char* sf_get_instance_specialization(void)
{
  return "szg7Y1zoNx90V11nPdUjIlE";
}

static void sf_opaque_initialize_c5_ex_DLModel_28(void *chartInstanceVar)
{
  initialize_params_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
  initialize_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c5_ex_DLModel_28(void *chartInstanceVar)
{
  enable_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c5_ex_DLModel_28(void *chartInstanceVar)
{
  disable_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c5_ex_DLModel_28(void *chartInstanceVar)
{
  sf_gateway_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c5_ex_DLModel_28(SimStruct* S)
{
  return get_sim_state_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c5_ex_DLModel_28(SimStruct* S, const mxArray
  *st)
{
  set_sim_state_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c5_ex_DLModel_28(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc5_ex_DLModel_28InstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_ex_DLModel_28_optimization_info();
    }

    mdl_cleanup_runtime_resources_c5_ex_DLModel_28
      ((SFc5_ex_DLModel_28InstanceStruct*) chartInstanceVar);
    ((SFc5_ex_DLModel_28InstanceStruct*) chartInstanceVar)->
      ~SFc5_ex_DLModel_28InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c5_ex_DLModel_28(void *chartInstanceVar)
{
  mdl_start_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
  if (chartInstanceVar) {
    sf_reset_warnings_ChartRunTimeInfo(((SFc5_ex_DLModel_28InstanceStruct*)
      chartInstanceVar)->S);
  }
}

static void sf_opaque_mdl_terminate_c5_ex_DLModel_28(void *chartInstanceVar)
{
  mdl_terminate_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c5_ex_DLModel_28(SimStruct *S)
{
  mdlProcessParamsCommon(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c5_ex_DLModel_28((SFc5_ex_DLModel_28InstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c5_ex_DLModel_28_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [74] = {
    "eNrtnc9uG9cVhyk5SZs2DdKiQFqgQA10k00Mcvg/KNrIkpyqsGPDsh2kECCMyKE0ETlUZoaSnXW",
    "XfYU+Q1+jj9BlATuIi2y6LLrqHZmWSIr6nRkaaBzxEyDLlHQ55KffOfecc8+9U1rZulNyH++6zy",
    "N/tfSW+/pD97laevHx5vjxysTni++/Ufrt+PFfflQqdQ78ON2KesNS8Y/OsBvsB9H2qNcLHxccG",
    "40G9/zYHyQLXDfyB8H9IBn2R2k4jIq9+DDqBXEQddwTHA3jtNB1k3Aw6ofR4a1R1MmunHx2EHYO",
    "tg+Go373pntCv3s36j+57LpHo/Seu+JGGAed9FYQdNODeDjaP7jV9/c1hTg9WT8IOofJaFCYVRK",
    "k26Oj7K0md0b9NDzqB5uPg85WlKS+o5AY73c79dNgPX1cWCFhsv1y9HBw1A/9KD/rAz/ZDo6cOt",
    "Lg4VHX/Xt3lDp6Oa/rrrcXRn46jEO/vznor2cKzzn2Xt+9zjtO1v3CnNNBuhHsjfb3w2g/oxuPB",
    "kHk3r/TSQ5WvfXhcRD7+8HdqKANZu9u8/HpH/hMl/ltcCuT5UI2OBq8+KskC409ve7msSOULHjd",
    "W51o3e/3k2JjHwyPbgfHQf/0+ht+6i8w9sX1CwxOkrD7YPjIjzMrKGhJoyj8chSMx64Po26Y/y9",
    "8PDPq1OF+6pxnjuHhIJNU0HWYz1762RNZmhwl6XCw7sxo4/btnNe7OHYrSoO453eC3L4v9sMkcC",
    "/4VFcFr9sNE3+vn412lNLTd5n7GYJo4aGlpDeKNk6G8aFjXNTJnrPKLKHY6KC7H2wEaXDqMDadu",
    "h/5/VHO1zxInIfL5PEwcR6r2HXd2Mx+Fhrc8TsHQTebT8J+cCdIsidIcvtnN4+suXd7HKZPNoKk",
    "E4dHeS1plARdN5FklB48OQoeRofR8CS6FQ8H2+OIQOgqCJzX8OPITQs33bQUP7nlXny+Vx0HXz7",
    "IlLVIeDbw076/l2njkyByM0v2XrOZ0O84q9qMXOjmXtCrjN0Ov3JTe5SESerCqSebpzbQLQWZ7d",
    "0POqM4GcdmxRx8Fs/+wgWnReLZn44fV89scSt5ELu/tO+m8chFWmt7p8Fi8CAcBKff2PZdTPLi4",
    "cR1y6Xz6769qq+76v63suC40iuO+3hi3Btz+Lw3Me698Wenvhs83t24fRrc7Hqt2eu/k4PzvNc9",
    "O650Ydw535dfP5gYvzLnuqWJrxanaxc4XSutrKxc4PSTmeu8MTPurTGnH/+3+rPD3b9uN34Z/K3",
    "1m4/+/Cq6+HtBHb87fvyrl3Hd2cx3fGFyyH73D4YO3p/RQfY4+Wq/+Xnlq+Gnj9vlR5VKdK/78I",
    "ut/uZCdvfy+9fdZ+oc46mfjTtb3XGOlj32Ry9yh+z5WxOv9y3j+d+e0FOp9O/fv9r4n388+3ecx",
    "+vaFK9rpfuf3JzS7evuH74rf/Rdjsvjt64tOG5lwXGl//O4V31/Rf3x9/33lR8ozfz+e6/x+5j9",
    "uui8/Lq9r3+Uis1Dvx4//t1Zrr1+EPa7c6L98Y9dQN6b99PXlMc/t1bl7/9gdfr3r6/oee5fM/r",
    "OHq9/tPMwCeJkZ2O4Pzr0oxuHoUtsOjt3o2DDhdLB9Q+v90KXbt3oDAc30tj9Wue0wJXs3Fl7cH",
    "vt5s7m49OYOtm575W9+t5OdBx2Q39nve875r0nnwV7HX+wNchStrvRp4+2NrbW/hikyXAqjxo/y",
    "U7SP4q/2NlNetmXqbjVfTPo93aytHnHxRo7nSja7VR2Px/2h8fttDwd5JZ317rd3Xqtsjvs9ZIg",
    "vbEXRpfkGfM4fT3D6eury8llcse7zVZt92TMCD4X+bTald29CT7Y2ZSdVWvN+XYGpylOlXJ7MX/",
    "0fIbT86vvt5OO3w8yTPCZa2+F+Cybv26Xq4XmsyXTT+aHpvSDn57m45WJG/PYWdVrTMVFFp+nM3",
    "yeXnE+jTMvRDw0z85aHvFQTn/EfK/srE7+qvjUq7VCfnrZ7Mv5IeKhy/k0WlXy+zw6qlYW4/TtD",
    "Kdvr3q9seoio91e1l5DfHS5nlrVFvFRTv9EvUjrCD7abzP/Cz7t6mJ+6NkMp2dXvR7SPguz8dPz",
    "dYSdXc7HK9eY73Nyoh4i/FDFa1IPUfWQRnmKD35o2r68FusfueqOzs6oq0kd4adVX1EVP6T0U23",
    "jh/LoqOb+gx+SOiLvEPWzRoW8Iw+nyTIIfmhe3lEtNJ8t27pHtcm6Rx5/Xaf/Kp+9terk+SrPr7",
    "UKxUVLl7822sSNOi4if1Xr+M0a9iX4eNV6IT7fzPD55srH02fmxXrivH0MEw3E+Oe5cSL+WcWHz",
    "Tr1RbGPqkzdIy+nQna2bPs8zquvxEHz1zlq+CFhXxX2weTlxHyv5vtam3xM1V/r7IMR9lVr01el",
    "11lrNc4BEf7Zq1K3z+WnK41COlq2dbK6SzjmrZNRH5qtv1IfMvwRfR9ivq/R55kvf62QvwodNct",
    "NdJS3XxgdXe6v6+x3zeu32c+p/RF8tJ2R58vz4xr4aaGfBudY5uWEnal67My+Bexsep73GthZTk",
    "7YmepDK3N+tdJPlfw15/oZ+8wMHeGHlB+qVIirRT/sZefDw2nazjiPMB+nJn1Fee0Ov636Htqcc",
    "2H4I/Sj1qm9On1pMi6qY196HmMdX/ftkb/mmce8Yv2xy9ZP1Ci432zp9pO3uc+AtK+yxzwm8owm",
    "+xcM+2I9SN0Xr+4xz+eqUzca+CGtI/yQyscK1juWLp8v0w+r7KtRpe6akxN5veDTaqKjnJzQkeD",
    "Tpq86LyfiIpWfNcvUP2SfFXGjrA8128SNuj5EX0OO/R0V9i3m3sdAHUTqiLhR8PHY55GXE/vNBJ",
    "9awXPzl+38uPNT8zkndr5+ip0Tu4x5Getml+unVSFezJu/ntAfc3k83aY/RvYPzeybJg664IeoL",
    "yr/U/OYx4R+2vR/5D6nET8kdYQfMs5npE59qX5aZc75zNcn0+K8YUNH1F8FH4/+j7ycmM9kXsZ9",
    "YJR+aqxz5OXEOofgUy+4zrFkdXzHZ7qOz7nnM+cM1xu7ewuce75891s64X5Lxv2W6EMT+X2Z8wj",
    "kenS7DB9DP/TBav3AR+mngX3Juhn3bbf0g31p/cBHrW942JeKn2sV9CPXV4kPLftCP9q+0I+2L/",
    "SjzvfAP2v9UN/Q/pl9mpZ9wUfbF/5H29cJ97e93L6ai63zLJ2OvCp+SPJhHtN8qCPq+5FiX3Ker",
    "zPPW/YFH21f8NH2hf9R+6Ga6Ef5H/pcTP3AR+uHPFXxac3NU+F0kdMJ+bztj7gPkF4Xa5NvSDur",
    "0bdg6Qc+Wj/Yl+KDfiw+6EfxacNH3j+b+0dJ/VAPMvmgH8WH9R6LD/oRfJr4H80H+5L7DtrEP5Z",
    "+4KP1g30p/cBH1n8qrBda+oGP1g/2JfTTIj6U55DXmN/1/dXxP9q+mN/l+in7nrR9tThXwbIv9K",
    "PtC/1o+0I/wr44N0nHh6xfmPqBj9YP9qX0Q/yj9zWjH0s/+B+tH/io+4cR/1h80I/iQ31D8qmQn",
    "2o++GfNh/4Niw/6Ef0J7Cc09jexH9XSD/al9QMfvX8QPoJPlfjQ4oN+hH9u4n+0fvA/Wj/Eh1o/",
    "xerzz2b4PLvq6zvn7Qno5xL7wv9o+zrBvpR97RWxr2XjM3EcInzm88E/y/O2OF9C86E/weKDfgS",
    "fepX4Wc3vDfyzpR/iQ6mfqfiHc/5m9dPk3P48+wibzGO6j366Two7u2hnnKeZJ5+nn0zv52E93u",
    "KDfsQ8xvn9hn7oJ5N82vSTWfaFfrR9oR9tX9SDlH5Yz9Dn3VAv0/2aZepl2r5OsC9pX3vYl7Yv4",
    "h9hX03yd4sP8aHiQz+irENzHrSpH/ho/WBfYn6vcN6Ezt+Z3y394H+0fuCj+DB/Sfsq16gfSv9D",
    "fUyeB4R+LP1Q/zH0g39WfMgvLD7oR/HhPHGLD+s7ig/rpwYf4kPFh/qPyYf5S/Fh/rL4nNBHL+4",
    "H77FfJY+OPNbhLT74acWH/U6STxX7svigH8WHdUKLD/oRfFqsg2n90Cdl6Qc+Wj/Y1+V8ap6Hfp",
    "R+auwDs/SDfWn9wEfxIX6W9lVFP5Z+4KP1g30J/dSpb2g+rBNafNCPui8h5x5rPvRxGHzo45D5F",
    "/Gh1E+T+oalH/ho/WBfqv5M/Cztq4H/0frB/1j6wb60fuAj+LRZH7T4kJ8qPsXyr6czfJ5edT7n",
    "6Tv2NW/+KjN/yXNKytz3U+qHfQamfuCj9YN9qfoP+1SkfVUaC93vYdnixEaD8xT0/TDoc9F9CvC",
    "x+DCPifNcWsSJUj914kTpn+vEiZZ9wUfbF3y0feF/lH7gY/HBvtQ6IeeRWXzQj+KD/7H4oB/Bp0",
    "mfuMUH/Sg++B95XhLnlGj90Ido8GmgH3k/MPRj6Qc+Wj/Yl6j/0Kep7auNfiz9wEfrB/tSfFj/k",
    "vNXjfjQ0g/2pfUDH6WfJn12an7P+lg5DzoHJ+qsFh/8kOLDOqHFB/0IPhX2M1t80I+IE+voR+uH",
    "/bqWfrAvrR/4qPvCs89A6od9BgYf/LPFB/2o+3qzjqH1Q35q6Qf70vqBj+DDees6vyizjmrpBz5",
    "aP9iXmL/okzLsiz5ofc4E8aFlX/hnbV/w0fYFH6GfBvOX5kMfmcUH+xJ8muSnFh/0o/hQn7f4oB",
    "+1zwD/Y/FBP+qcP/ozLT7oR53nW0w/y3bOaLvNOaNaP+Rfsj7f4H4PWj/Yl6Uf/LPUD/drlOeJ0",
    "/9s8WGfnD6Pnn1yOTh51OktPuRhgk+VPk2LD/pRfKhDW3zQj9qngn4sPuhH9XGwjmHxQT+CD+f5",
    "mnzQj+JDH6vFB/2IOmuTdQypH8471nw4T9Pkg34UH+Jniw/6UXzI3+X83mafgaUf+Gj9FLGvpzN",
    "8nl51/Zy3cdCnMPcchWJ9LkvIhz4Ouc+S+NDiw/wl+HicR2/xQT+KD/VnzYf6ocUH/Qg+Vfo0LT",
    "70aSo+i/VpLlue0fLYbyB1VKuy30DrhzzV0A/zvOBTp8/X4sM8L/ajlpvsx8ilI9bDLD74acGny",
    "bl/Fh/8tOonc/ZFPpZDR+Rjkg/nu5h8mMfU+dDUpS0+6EfwYd3ZqAfBx+KDfQk+VeZ3iw/6UfdB",
    "Rz8WH/JUdX/LxkJ56vKdw8X+HosPflrxYd1H8mF/oakf+Gj9YF+qHj3tf4iDLtbrWVfNpyP8kPJ",
    "DzPMWH/Sj+LDubPHhPG3Fh32GBh/6N+U+5wr1MsnHo16Wq0+RfMPq40RHOThx/2aTD/G04kM+Zv",
    "EhnhZ8POJpg88JfASfRjH9PJ/h8/x7zCcK0pNhfHjPj/1BshX1hoJWxijj85/SOZ/VOXxWJvi86",
    "Qi+P3686T6T0dHRME6TP1XXIr//JAmT0197+e178fA4iM9+FAe+e4dJ6eJH9jrKE6/j7VX9OlbH",
    "/3uVcS+/flzS+nhnRh/Z45Mw6g5Pkg8rXt1b9HWsjMd9MDFuZc71SxNf/wdukCu3",
    ""
  };

  static char newstr [5465] = "";
  newstr[0] = '\0';
  for (i = 0; i < 74; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c5_ex_DLModel_28(SimStruct *S)
{
  const char* newstr = sf_c5_ex_DLModel_28_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(305396235U));
  ssSetChecksum1(S,(1402822507U));
  ssSetChecksum2(S,(2942638390U));
  ssSetChecksum3(S,(2218402616U));
}

static void mdlRTW_c5_ex_DLModel_28(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c5_ex_DLModel_28(SimStruct *S)
{
  SFc5_ex_DLModel_28InstanceStruct *chartInstance;
  chartInstance = (SFc5_ex_DLModel_28InstanceStruct *)utMalloc(sizeof
    (SFc5_ex_DLModel_28InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc5_ex_DLModel_28InstanceStruct));
  chartInstance = new (chartInstance) SFc5_ex_DLModel_28InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c5_ex_DLModel_28;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c5_ex_DLModel_28;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c5_ex_DLModel_28;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c5_ex_DLModel_28;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c5_ex_DLModel_28;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c5_ex_DLModel_28;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c5_ex_DLModel_28;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c5_ex_DLModel_28;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c5_ex_DLModel_28;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c5_ex_DLModel_28;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c5_ex_DLModel_28;
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

  mdl_setup_runtime_resources_c5_ex_DLModel_28(chartInstance);
}

void c5_ex_DLModel_28_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c5_ex_DLModel_28(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c5_ex_DLModel_28(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c5_ex_DLModel_28(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c5_ex_DLModel_28_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
