/* Copyright 2017-2024 The MathWorks, Inc. */

#ifndef MW_TENSORRT_CNN_LAYER_IMPL
#define MW_TENSORRT_CNN_LAYER_IMPL

#include <cudnn.h>
#include <map>
#include <vector>
#include <cassert>
#include <set>
#include <utility>

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayerImplBase.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/MWTensor.hpp"
#include "layer/MWCNNLayer.hpp"
#else
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#include "MWCNNLayer.hpp"
#endif

/* TensorRT related header files */
#include "NvInfer.h"
#include "cuda_runtime_api.h"

#ifndef NV_TENSORRT_MAJOR
#include "NvInferVersion.h"
#endif

using namespace nvinfer1;

#define CUDA_CALL(status) MWTensorrtTarget::cuda_call_line_file(status, __LINE__, __FILE__)
#define CUDNN_CALL(status) MWTensorrtTarget::cudnn_call_line_file(status, __LINE__, __FILE__)
#define MALLOC_CALL(msize) MWTensorrtTarget::malloc_call_line_file(msize, __LINE__, __FILE__)
#define CUDA_FREE_CALL(buf) MWTensorrtTarget::call_cuda_free(buf, __LINE__, __FILE__)

//#define RANDOM
#ifdef RANDOM
#include <curand.h>
#define CURAND_CALL(status) MWTensorrtTarget::curand_call_line_file(status, __LINE__, __FILE__)
#endif

namespace MWTensorrtTarget {
class MWTargetNetworkImpl;

void cuda_call_line_file(cudaError_t, const int, const char*);
float* malloc_call_line_file(size_t, const int, const char*);
void cudnn_call_line_file(cudnnStatus_t, const int, const char*);

void throw_cuda_error(cudaError_t uCFAEgNHsqohrRmdzgue,
                      const int XOJRvKzQwSaZobhyUoOi,
                      const char* OFCpCZzJyMkmfKSPMfBS);

template <class T>
void call_cuda_free(T* mem, const int XOJRvKzQwSaZobhyUoOi, const char* OFCpCZzJyMkmfKSPMfBS) {
    if (!mem) {
        return;
    }

    cudaError_t uCFAEgNHsqohrRmdzgue = cudaFree(mem);

    if ((uCFAEgNHsqohrRmdzgue != cudaSuccess) && (uCFAEgNHsqohrRmdzgue != cudaErrorCudartUnloading)) {
        throw_cuda_error(uCFAEgNHsqohrRmdzgue, XOJRvKzQwSaZobhyUoOi, OFCpCZzJyMkmfKSPMfBS);
    }
}

#ifdef RANDOM
void curand_call_line_file(curandStatus_t, const int, const char*);
#endif


class MWCNNLayerImpl : public MWCNNLayerImplBase {

  public:
    MWCNNLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl*);
    virtual ~MWCNNLayerImpl();
    MWTargetNetworkImpl* aAhADHkrrFEJiHNuuJmX;

    // no layer should do anything for predict, since it is taken care of by the targetImpl in
    // doInference()
    void predict() override final {
    }

    void cleanup() override {
    }
    void postSetup() override final {
    }
    void propagateSize() override {
    }
    void allocate() override = 0;

    void deallocate() override final {
        DkurstfAQrzgDAsSrxmO.clear();

        deallocateAuxiliaryData();
    }

    virtual void deallocateAuxiliaryData() {
    }

    // In other targets, allocateOutput and deallocateOutput are used to allocate and
    // deallocate memory associated with the output tensor of a layer. In TensorRT, this memory is
    // managed by the TargetNetworkImpl, and so these methods are empty.
    void allocateOutput(int) override final {
    }
    void deallocateOutput(int) override final {
    }

    void allocateInput(int) override final {
    }
    void deallocateInput(int) override final {
    }

    void setLearnables(std::vector<float*>) override{};

    void resetState() override {
    }
    void updateState() override {
    }

    // Get the previous layer output pointer
    ITensor* getOpTensorPtr(int idx = 0) {
        assert(idx < static_cast<int>(DkurstfAQrzgDAsSrxmO.size()));
        return DkurstfAQrzgDAsSrxmO[idx];
    }

    // get iTensor corresponding to MWTensor
    static ITensor* getITensor(MWTensorBase* tensor);

    // set the Output tensor pointer
    void setOpTensorPtr(ITensor* outputTensor, int idx = 0) {
        assert(idx == static_cast<int>(DkurstfAQrzgDAsSrxmO.size()));
        DkurstfAQrzgDAsSrxmO.push_back(outputTensor);
    }

    // Plugin layer Enqueue interface
    virtual int pluginEnqueueImpl(const void* const*, void**);

    // returns vector containing the pairs <<input state Itensor*, state GPU data ptr>>
    virtual std::vector<std::pair<ITensor*, float*>> getStateInputITensorAndData() const {
        // should not come here
        assert(false);

        std::vector<std::pair<ITensor*, float*>> temp;
        temp.push_back(std::make_pair((ITensor*)nullptr, (float*)nullptr));
        return temp;
    }

    // returns vector containing the pairs <<output state Itensor*, state GPU data ptr>>
    virtual std::vector<std::pair<ITensor*, float*>> getStateOutputITensorAndData() const {
        // should not come here
        assert(false);

        std::vector<std::pair<ITensor*, float*>> temp;
        temp.push_back(std::make_pair((ITensor*)nullptr, (float*)nullptr));
        return temp;
    }

    virtual ITensor* getSequenceLengthITensor() {
        assert(false);
        return nullptr;
    }

    virtual nvinfer1::ITensor* addPluginPreprocess(int inIdx);
    virtual nvinfer1::ITensor* addPluginPostprocess(ITensor* pluginOut, int inIdx);

  protected:
    std::map<int, cudnnTensorDescriptor_t*> jXNXIjpdcoiJUsfPyJJv;

    float OBMMxSzXPgmgBcyZJTzo;
    float NhdIzzqqVxMjekDIWciw;
    float NSzdekOvRhMhRCXdWsdY;

    // Get the cuDNN tensor descriptor for the output
    cudnnTensorDescriptor_t* getOutputDescriptor(int index = 0);
    // get Descriptor from a tensor
    cudnnTensorDescriptor_t* getCuDNNDescriptor(MWTensorBase* tensor);

    float* getZeroPtr() {
        return &OBMMxSzXPgmgBcyZJTzo;
    }
    float* getOnePtr() {
        return &NhdIzzqqVxMjekDIWciw;
    }
    float* getNegOnePtr() {
        return &NSzdekOvRhMhRCXdWsdY;
    }

    /**
     * TensorRT API related
     */

    std::vector<ITensor*> DkurstfAQrzgDAsSrxmO;

    // get iTensor corresponding to input
    ITensor* getInputITensor(int inputIdx);
};
} // namespace MWTensorrtTarget
#endif
