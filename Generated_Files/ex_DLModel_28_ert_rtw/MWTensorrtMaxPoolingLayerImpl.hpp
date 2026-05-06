/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_MAX_POOLING_LAYER_IMPL
#define MW_TENSORRT_MAX_POOLING_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"


class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

// MaxPooling2DLayer
class MWMaxPoolingLayerImpl final : public MWCNNLayerImpl {

  public:
    MWMaxPoolingLayerImpl(MWCNNLayer*,
                          MWTargetNetworkImpl*,
                          int,  /* PoolH */
                          int,  /* PoolW */
                          int,  /* StrideH */
                          int,  /* StrideW */
                          int,  /* PaddingH_Top */
                          int,  /* PaddingH_Bottom */
                          int,  /* PaddingH_Left */
                          int,  /* PaddingH_Right */
                          bool, /* hasIndices */
                          int /* numOutputs */);

    ~MWMaxPoolingLayerImpl(){};
    void propagateSize() override;
    void allocate() override;
    void cleanup() override;

    // getter for max pool indices , used by unpooling
    float* getIndexData();

    int pluginEnqueueImpl(const void* const*, void**);

  private:
    // initial pool dimensions, which will be set to -1 in the case of global max pooling
    int mJHKRLbEVeCWkBgMqjYL;
    int mMiQeYHoTbNUGLyNakei;
    
    int lxBZLYcHXoXUkMjfqsuo;
    int mJnXzwDFPTieqFtWcZIG;
    int uTUuLVVebDakbPjXOQwp;
    int uqHugYAAqkSnCCYonqCt;
    int jtBWMhagVIfXgzsydrnm;
    int jodrcfdVqEtXMUFJulgi;
    int kDIJsXmMuRtKrTNwutxt;
    int kGKqPjmETQEaXPuTJmiS;

    // Asymmetric Padding
    cudnnPoolingDescriptor_t lqYqXvaqiZxCnTfQwVBT;
    cudnnTensorDescriptor_t* TwiaHttwApyaipMEKPSg;
    cudnnTensorDescriptor_t* hfpQGkYwRCbaOxpSIoHn;
    cudnnTensorDescriptor_t* hpOzCTZasBMYKoXVxMDZ;

    // 2-output MaxPool plugin setup
    bool QGJQoIbCBTjWYrGBxsre;
    int bSBYTisdxwqVzKIRnOvc;
    int dOkBWZYpNkSIfEYRNKmc;

    float* RlwtKXlNBNTmWbDUiwqD;
    float* NmJNEQWHajbWzPxzwUTG;

    MW_IPLUGIN* lQtIWwFYsIqUppVzkbip;

    void pluginSetup(int, int, int, int, int, int);
};
} // namespace MWTensorrtTarget
#endif

