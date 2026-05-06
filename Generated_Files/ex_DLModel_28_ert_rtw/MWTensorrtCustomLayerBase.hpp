/* Copyright 2019-2022 The MathWorks, Inc. */

// Target Specific (tensorRT) header for Custom Layer Base Class
#ifndef MW_TENSORRT_CUSTOM_LAYER_BASE
#define MW_TENSORRT_CUSTOM_LAYER_BASE

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayer.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/shared_layers_export_macros.hpp"
#include "layer/rtwtypes.hpp"

#include "tensorrt/MWTensorrtTargetNetworkImpl.hpp"
#else
#include "MWCNNLayer.hpp"
#include "MWTensorBase.hpp"
#include "shared_layers_export_macros.hpp"
#include "rtwtypes.h"

#include "MWTensorrtTargetNetworkImpl.hpp"
#endif

#include <vector>
#include <cstdarg>

/* forward declare classes */
namespace MWTensorrtTarget {
class MWTargetNetworkImpl;
}

namespace nvinfer1 {
class ITensor;
class MW_IPLUGIN;
} // namespace nvinfer1

class DLCODER_EXPORT_CLASS MWTensorrtCustomLayerBase : public MWCNNLayer {

  public:
    MWTensorrtCustomLayerBase();
    ~MWTensorrtCustomLayerBase();

    MWTensorrtTarget::MWTargetNetworkImpl* m_ntwkImpl;

    // setter and getter for ITensors corresponding to MWTensors
    nvinfer1::ITensor* getCustomLayerITensorOut(int index);
    void setCustomLayerITensorOut(nvinfer1::ITensor* aITensor, int index);

    // Plugin layer Enqueue interface
    virtual void predictEnqueueImpl(float** inputs, float** outputs);

    void allocate();
    void deallocate();
    void cleanup();

    boolean_T getNeedsInputReorder(int inIndex) const {
        return ZCIXlZiWXjcnCOFqwRGo[inIndex];
    }
    boolean_T getNeedsOutputReorder(int outIndex) const {
        return ZKeyHBhoZPWskJswVRuM[outIndex];
    }
    MWTensorBase::DIMSLABEL getPermutedInputFormats(int inIndex, int dimIndex) const {
        std::map<int, std::vector<MWTensorBase::DIMSLABEL>>::const_iterator it =
            kYvlQsAMRufnPWDWFZNj.find(inIndex);
        assert(it != kYvlQsAMRufnPWDWFZNj.end());
        return it->second[dimIndex];
    }
    MWTensorBase::DIMSLABEL getPermutedOutputFormats(int outIndex, int dimIndex) const {
        std::map<int, std::vector<MWTensorBase::DIMSLABEL>>::const_iterator it =
            kdwKYCcEoCxgtNVKYgHu.find(outIndex);
        assert(it != kdwKYCcEoCxgtNVKYgHu.end());
        return it->second[dimIndex];
    }
    MWTensorBase::DIMSLABEL getLayerLayout(int dimIndex) const {
        return XGQjNlvPuckcHnviTrkP[dimIndex];
    }

    // This API returns the number of DIMLABEL elements passed from CGIR
    int getNumLayerLayoutDims() const {
        return static_cast<int>(XGQjNlvPuckcHnviTrkP.size());
    }

    // This API returns the number of dims elements in ITensor
    // For feature input = 2 (NC)
    //     CNN input     = 4 (NCHW)
    //     RNN input     = 3 (SNC)
    static int getNumDimsForTensorRT(MWTensorBase* tensor);

  protected:
    MW_IPLUGIN* m_plugin;

    // setup the custom layer
    void setupLayer(MWTensorrtTarget::MWTargetNetworkImpl*,
                    boolean_T[],
                    boolean_T[],
                    MWTensorBase::DIMSLABEL[],
                    int,
                    ...);
    // set up input and output formats
    void setupIOFormats(boolean_T[], boolean_T[], int, va_list);

    // cleanup
    virtual void cleanupLayer(){};

  private:
    std::vector<nvinfer1::ITensor*> AUjQjfbaYUcIYlesMFxV;
    std::vector<boolean_T> ZCIXlZiWXjcnCOFqwRGo;
    std::vector<boolean_T> ZKeyHBhoZPWskJswVRuM;
    std::map<int, std::vector<MWTensorBase::DIMSLABEL>> kYvlQsAMRufnPWDWFZNj;
    std::map<int, std::vector<MWTensorBase::DIMSLABEL>> kdwKYCcEoCxgtNVKYgHu;
    std::vector<MWTensorBase::DIMSLABEL> XGQjNlvPuckcHnviTrkP;
};

#endif

