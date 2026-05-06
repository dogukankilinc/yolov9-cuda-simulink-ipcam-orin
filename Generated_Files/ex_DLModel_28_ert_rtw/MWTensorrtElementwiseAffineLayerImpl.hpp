/* Copyright 2019-2024 The MathWorks, Inc. */

#ifndef MW_TENSORRT_ELEMENTWISE_AFFINE_LAYER_IMPL
#define MW_TENSORRT_ELEMENTWISE_AFFINE_LAYER_IMPL

#include "MWTensorrtCNNLayerImpl.hpp"

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

/**
 *  Codegen class for Elementwise affine layer
 **/
class MWElementwiseAffineLayerImpl final : public MWCNNLayerImpl {
  public:
    MWElementwiseAffineLayerImpl(MWCNNLayer* layer,
                                 MWTargetNetworkImpl* ntwk_impl,
                                 int scale_H,
                                 int scale_W,
                                 int scale_C,
                                 int offset_H,
                                 int offset_W,
                                 int offset_C,
                                 bool isClipped,
                                 int lowerbound,
                                 int upperbound,
                                 const char* scale_file,
                                 const char* offsetfile);

    ~MWElementwiseAffineLayerImpl() {
    }
    void allocate() override;

    int pluginEnqueueImpl(const void* const*, void**) override;

    void cleanup() override;
    nvinfer1::ITensor* addPluginPreprocess(int inIdx) override;
    nvinfer1::ITensor* addPluginPostprocess(ITensor* pluginOut, int outIdx) override;

  private:
    void loadScale(const char*);
    void loadOffset(const char*);

    int qMpgAuYpEDGDohMcPvRY;
    int rwPhFWHcKnJsClVtebGW;
    int qLXeoFROCbISdsnwpYgl;

    int fdiBdaeFcIDdmsgMxaJT;
    int hQnbBWOvLzwXEOLhKugH;
    int fPIxBBGHjPkvmoaWByBr;

    bool VCFeDUyufHZJwIEMHAWF;

    int YmfPcXPXNFZDznkzKZrl;
    int wPWTzEWitnRdoCGvnvtf;

    float* qJWXFXvcpbSwehmlTNru;
    float* ekFKUFSJOBakwDuHENjA;

    long int TYgANfbwgYWWZKKtdxCC;
    long int TbrveedUYuqCPPSPaVab;
    long int TAtTmiIniopalIZnGYzp;
    long int UdXKaaSyRlPmZWCVHODj;
    long int UROOthsHWeMcNycRifoq;
    long int UIgLxHHJdliWAJIeloVl;

    long int sCDdEyIOjXBVHhcakBhd;
    long int hTbrmZSPUORqMIprVbKk;

    float* sDWnRjToSPjYnOQzVfhS;
    float* hYTzvgWajqchLzrmxjqn;

    Weights reGtUwUlPSwEenEBVIzH;
    Weights suFVgcuEVpCOrewbJfkB;
    Weights oBBTWcYGdlswNVGXNBSQ;

    void setLayerProperties();
    void loadScaleAndOffset(const char*, const char*);

    MW_IPLUGIN* lQtIWwFYsIqUppVzkbip;
};


} // namespace MWTensorrtTarget
#endif

