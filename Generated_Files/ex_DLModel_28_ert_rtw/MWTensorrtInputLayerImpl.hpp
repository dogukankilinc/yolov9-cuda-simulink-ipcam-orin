/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_INPUT_LAYER_IMPL
#define MW_TENSORRT_INPUT_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

class MWInputLayerImpl final : public MWCNNLayerImpl {

  public:
    MWInputLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* ntwk_impl);
    ~MWInputLayerImpl() {
    }
    void allocate() override;
    void cleanup() override {
    }
};
} // namespace MWTensorrtTarget
#endif
