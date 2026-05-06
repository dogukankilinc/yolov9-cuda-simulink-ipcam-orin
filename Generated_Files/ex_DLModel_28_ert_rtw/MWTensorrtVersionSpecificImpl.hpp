/* Copyright 2022-2024 The MathWorks, Inc. */

/*Header file for version-specific implementations needed to workaround API removals or bypass
version-specific bugs.*/

#ifndef MW_TENSORRT_VERSION_SPECIFIC_IMPL
#define MW_TENSORRT_VERSION_SPECIFIC_IMPL

/* TensorRT related header files */
#ifndef NV_TENSORRT_MAJOR
#include "NvInferVersion.h"
#endif

#define MW_IPLUGIN IPluginV2IOExt
#define MW_IPLUGIN_LAYER IPluginV2Layer

#endif

