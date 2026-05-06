/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_AVG_POOLING_LAYER_IMPL
#define MW_TENSORRT_AVG_POOLING_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

// AvgPooling2DLayer
class MWAvgPoolingLayerImpl final : public MWCNNLayerImpl {

  public:
    MWAvgPoolingLayerImpl(MWCNNLayer*,
                          MWTargetNetworkImpl*,
                          int, /* PoolH */
                          int, /* PoolW */
                          int, /* StrideH */
                          int, /* StrideW */
                          int, /* PaddingT */
                          int, /* PaddingB */
                          int, /* PaddingL */
                          int,  /* PaddingR */
                          bool /* PoolingIncludesPadding*/
    );
    ~MWAvgPoolingLayerImpl() {
    }
    void propagateSize() override;
    void allocate() override;

  private:
    // initial pool dimensions, which will be set to -1 in the case of global average pooling
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
    bool mXWolnmmwQGkQZhSmvqw;
};
} // namespace MWTensorrtTarget
#endif

