#ifndef __c5_ex_DLModel_28_h__
#define __c5_ex_DLModel_28_h__
#include "MWCudaDimUtility.hpp"

/* Forward Declarations */
struct SFc5_ex_DLModel_28InstanceStruct;

/* Type Definitions */
#ifndef c5_typedef_c5_ex_DLModel_28StackData
#define c5_typedef_c5_ex_DLModel_28StackData

typedef struct {
} c5_ex_DLModel_28StackData;

#endif                                 /* c5_typedef_c5_ex_DLModel_28StackData */

#ifndef struct_SFc5_ex_DLModel_28InstanceStruct
#define struct_SFc5_ex_DLModel_28InstanceStruct

struct SFc5_ex_DLModel_28InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c5_JITStateAnimation[1];
  uint8_T c5_JITTransitionAnimation[1];
  uint8_T c5_uv[921600];
  uint8_T c5_b_uv[921600];
  void *c5_fEmlrtCtx;
  uint8_T (*c5_R)[307200];
  uint8_T (*c5_RGB)[921600];
  uint8_T (*c5_G)[307200];
  uint8_T (*c5_B)[307200];
  uint8_T (*c5_gpu_RGB)[921600];
  uint8_T (*c5_gpu_B)[307200];
  uint8_T (*c5_gpu_G)[307200];
  uint8_T (*c5_gpu_R)[307200];
};

#endif                                 /* struct_SFc5_ex_DLModel_28InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c5_ex_DLModel_28_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c5_ex_DLModel_28_get_check_sum(mxArray *plhs[]);
extern void c5_ex_DLModel_28_method_dispatcher(SimStruct *S, int_T method, void *
  data);

#endif
