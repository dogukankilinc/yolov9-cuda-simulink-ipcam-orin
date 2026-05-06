/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_CONV_LAYER_IMPL
#define MW_TENSORRT_CONV_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

#include <vector>

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

// Convolution2DCNNLayer

class MWConvLayerImpl final : public MWCNNLayerImpl {

  public:
    MWConvLayerImpl(MWCNNLayer*,
                    MWTargetNetworkImpl*,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    int,
                    const char*,
                    const char*);
    ~MWConvLayerImpl() {
    }
    void allocate() override;
    void cleanup() override;
    void setLearnables(std::vector<float*>);

  private:
    int ckANhWvcJoOYJzfoBaoE;
    int aOzuQTZkTpvQtweIMprM;
    int boZxhUbgnNUlJQXTuWwi;
    int OuTwywxKeMgznElXdjGp;
    int PAwKCndEJEByqwNZnPgb;
    int uTUuLVVebDakbPjXOQwp;
    int uqHugYAAqkSnCCYonqCt;
    int MPrDSEASJfAaxVcXjtke;
    int MmeSJXZBVyUbgMuuFbuc;
    int jtBWMhagVIfXgzsydrnm;
    int jodrcfdVqEtXMUFJulgi;
    int kDIJsXmMuRtKrTNwutxt;
    int kGKqPjmETQEaXPuTJmiS;

    float* wofzmsDCvutojgaNALNn;
    float* IGBjAMvMJXqrubGDtvyq;
    void loadWeights(const char*);
    void loadBias(const char*);

    /**
     * TensorRT related
     */
    Weights filt_weights;
    Weights filt_bias;
};
} // namespace MWTensorrtTarget
#endif

