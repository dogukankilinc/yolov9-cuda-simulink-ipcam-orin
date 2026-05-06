/* Copyright 2019-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_CONCATENATION_LAYER_IMPL
#define MW_TENSORRT_CONCATENATION_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

class MWConcatenationLayerImpl final : public MWCNNLayerImpl {
  public:
    MWConcatenationLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int);
    ~MWConcatenationLayerImpl();
    void allocate() override;

  private:
    int getTensorRTAxis(int dimension);

  private:
    int NIYgTDgYRdovGVvKYwHU;
};
} // namespace MWTensorrtTarget
#endif
