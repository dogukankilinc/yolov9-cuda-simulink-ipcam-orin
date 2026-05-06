/* Copyright 2022 The MathWorks, Inc. */

#ifndef MW_TENSORRT_UTILS_HPP
#define MW_TENSORRT_UTILS_HPP

class MWCNNLayer;
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;
} // namespace MWTensorrtTarget

class MWTensorrtUtils{
  public:
    static ITensor* insertPaddingLayer(ITensor* prevLayerTensor,
                                            MWTensorrtTarget::MWTargetNetworkImpl* ntwk_impl,
                                            const char* layerName,
                                            int gLigJhdhajdbqAuZwhOM,
                                            int gFIRzpicltDDOEfHdtoM,
                                            int eypvwTKabmFWrxfLLOWc,
                                            int gJJWRjXklapoEujuiRhJ);
};


#endif
