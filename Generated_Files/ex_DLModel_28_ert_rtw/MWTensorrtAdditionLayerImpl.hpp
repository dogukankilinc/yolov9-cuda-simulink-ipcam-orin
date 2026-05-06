/* Copyright 2017-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_ADDITION_LAYER_IMPL
#define MW_TENSORRT_ADDITION_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;

namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

class MWAdditionLayerImpl final : public MWCNNLayerImpl {
  public:
    MWAdditionLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWAdditionLayerImpl();
    void allocate() override;
};
} // namespace MWTensorrtTarget
#endif
