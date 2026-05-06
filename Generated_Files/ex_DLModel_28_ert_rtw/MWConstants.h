// Copyright 2024 The MathWorks, Inc.

#ifndef __MW_CONSTANTS_H__
#define __MW_CONSTANTS_H__
#include <cuda_runtime.h>
#ifndef CUDART_VERSION
#define MW_INCLUDE_CUB                 0
#else

// cub::DeviceMergeSort was added in CUB 1.14
// cub::DeviceSegmentedSort was added in CUB 1.15
#define MW_INCLUDE_CUB                 (CUDART_VERSION >= 11060)
#endif

namespace mw
{
  namespace detail
  {
    constexpr int BLOCK_SIZE = 512;
    constexpr int SEGMENT_THRESHOLD =
      8;       // Number of segments above which CUB segmented sort is favorable
  }
}                                      // namespace mw::detail

#endif
