/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_OUTPUT_LAYER_IMPL
#define MW_TENSORRT_OUTPUT_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

class MWOutputLayerImpl final : public MWCNNLayerImpl {

  public:
    MWOutputLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWOutputLayerImpl() {
    }
    void allocate() override;
    void cleanup() override{};
};
} // namespace MWTensorrtTarget
#endif
