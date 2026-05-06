/* Copyright 2017-2025 The MathWorks, Inc. */

#ifndef MW_TENSORRT_TARGET_NETWORK_IMPL
#define MW_TENSORRT_TARGET_NETWORK_IMPL

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTargetNetworkImplBase.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/shared_layers_export_macros.hpp"
#include "layer/rtwtypes.hpp"
#include "tensorrt/MWTensorrtVersionSpecificImpl.hpp"
#else
#include "MWTargetNetworkImplBase.hpp"
#include "MWTensorBase.hpp"
#include "shared_layers_export_macros.hpp"
#include "rtwtypes.h"
#include "MWTensorrtVersionSpecificImpl.hpp"
#endif

#include <cudnn.h>

/*TensorRT related header files */
#include "NvInfer.h"
#include "cuda_runtime_api.h"
#include <map>
#include <set>
#include <cassert>
#include <cstdarg>
#include <vector>
#include <string>
#include <memory>

#ifndef NV_TENSORRT_MAJOR
#include "NvInferVersion.h"
#endif

using namespace nvinfer1;

class MWCNNLayer;
class MWTensorrtCustomLayerBase;
class BatchStream;
class Int8EntropyCalibrator;
class Int8MinMaxCalibrator;

template <class T>
struct TensorrtDeleter {
    void operator() (T* ptr) const {
        if (cudaFree(0) != cudaErrorCudartUnloading) {
            delete ptr;
        }
    }
};

namespace MWTensorrtTarget {
class MWCNNLayerImpl;
class DLCODER_EXPORT_CLASS MWTargetNetworkImpl final : public MWTargetNetworkImplBase {

  public:
    MWTargetNetworkImpl();
    ~MWTargetNetworkImpl();

    void preSetup() override;
    void allocate();
    void deallocate() override;
    void postSetup(MWCNNLayer* layers[],
                   int numLayers,
                   int inputLayerIdxs[],
                   int numIns,
                   int layerIdxs[],
                   int portIdxs[],
                   int numOuts,
                   int rnnLayerIdxs[],
                   int numRNNLayers,
                   int batchSize);
    void doInference(int batchSize);
    void cleanup() override;
    cudnnHandle_t* getCudnnHandle();

    enum NETWORKPRECISION { INT8 = 0, FP16, FP32 };

    void setNetworkComputePrecision(int);

    void setCalibrationDataPath(const char*);

    void setIsRefittable(bool);

    void setUseMinMaxCalibrator(bool);

    ITensor* expandToDimsNCHW(ITensor* inputITensor);

    ITensor* squeezeToDims2(ITensor* inputITensor);

    void setMixedPrecisionComputeConstraint(bool);

    // setup plugin layer interface
    MW_IPLUGIN* setupLayerPlugin(MWCNNLayer* layer, MWCNNLayerImpl* layerImpl);
    MW_IPLUGIN* setupCustomLayerPlugin(MWTensorrtCustomLayerBase*);

    int getEngineBindingIndex(std::string ITensorName) const;
    void swapBuffers(int idx_x, int idx_y);

    IBuilder* getBuilder() const{ return builder.get(); }
    void setBuilder(IBuilder* aBuilder) { builder = std::unique_ptr<IBuilder,TensorrtDeleter<IBuilder>>(aBuilder); }

    IBuilderConfig* getBuilderConfig() { return builderConfig.get(); }
    void setBuilderConfig(IBuilderConfig* aConfig) { builderConfig = std::unique_ptr<IBuilderConfig,TensorrtDeleter<IBuilderConfig>>(aConfig); }

    INetworkDefinition* getNetwork() { return network.get(); }
    void setNetwork(INetworkDefinition* aNetwork) { network = std::unique_ptr<INetworkDefinition,TensorrtDeleter<INetworkDefinition>>(aNetwork); }
    
    ICudaEngine* getEngine() const { return engine.get() ; }
    void setEngine(ICudaEngine* aEngine) { 
        // Old context must be destroyed before old engine is destroyed, or else we see a TensorRT runtime error saying
        // "Destroying an engine object before destroying the IExecutionContext objects it created leads to undefined behavior."
        context = nullptr; 
        engine = std::unique_ptr<ICudaEngine,TensorrtDeleter<ICudaEngine>>(aEngine);
    }

    IExecutionContext* getExecutionContext() const { return context.get(); }
    void setContext(IExecutionContext* aContext) { context = std::unique_ptr<IExecutionContext,TensorrtDeleter<IExecutionContext>>(aContext); }

    void setRefitter(IRefitter* aRefitter) { refitter = std::unique_ptr<IRefitter,TensorrtDeleter<IRefitter>>(aRefitter); }

    // 0: INT8
    // 1: FP16
    // 2: FP32
    enum NETWORKPRECISION m_networkComputePrecision = NETWORKPRECISION::FP32;

  private:
    // builder should be destroyed after the other objects it spawns.
    // Thus, declaring builder before builderConfig, network, etc. 
    // since non-static data members are destroyed in reverse-declaration order.
    std::unique_ptr<IBuilder,TensorrtDeleter<IBuilder>> builder = nullptr;
    std::unique_ptr<IBuilderConfig,TensorrtDeleter<IBuilderConfig>> builderConfig = nullptr;

  public:
    std::unique_ptr<INetworkDefinition,TensorrtDeleter<INetworkDefinition>> network = nullptr;

  private:
    std::unique_ptr<ICudaEngine,TensorrtDeleter<ICudaEngine>> engine = nullptr;
    std::unique_ptr<IExecutionContext,TensorrtDeleter<IExecutionContext>> context = nullptr;  

  public:
    std::unique_ptr<IRefitter,TensorrtDeleter<IRefitter>> refitter = nullptr;

  private:
    size_t pftlHOwGoyqRMhdBMRLU;
    cudnnHandle_t* LZEABFNFLwHjTnspYjfK;

    void** m_buffers;
    std::map<ITensor*, std::set<MWTensorBase*>> AjhVZuQXURJimwbnYqDF;
    BatchStream* calibrationStream;
    Int8EntropyCalibrator* calibrator;
    Int8MinMaxCalibrator* minMaxCalibrator;

    std::map<MWCNNLayer*, int*> BPopsTekpsLUceakbymV;

    std::string m_calibrationDataPath;
    bool isRefittable;
    bool m_strictComputeConstraint;
    bool mUseMinMaxCalibrator;
    static char fSetupErrorMessage[];

  private:
    void setupBuffers(MWCNNLayer* layers[],
                      int inputLayerIdxs[],
                      int numIns,
                      int layerIdxs[],
                      int portIdxs[],
                      int numOuts,
                      int rnnLayerIndices[],
                      int numRNNLayers,
                      std::set<std::pair<void*, ITensor*>>& buffers,
                      int batchSize);
    void setupInputBuffers(MWCNNLayer* layers[],
                           int inputLayerIdxs[],
                           int numIns,
                           std::map<ITensor*, void*>& iTensorToLayerBufferMap);
    void setupOutputBuffers(MWCNNLayer* layers[],
                            int layerIdxs[],
                            int portIdxs[],
                            int numOuts,
                            std::map<ITensor*, void*>& iTensorToLayerBufferMap);

    void setupRNNStateBuffers(MWCNNLayer* layers[],
                              int rnnLayerIdxs[],
                              int numRNNLayers,
                              std::map<ITensor*, void*>& iTensorToLayerBufferMap);
    void setupSequenceLengthBuffers(MWCNNLayer* layers[],
                                    int numRNNLayers,
                                    int rnnLayerIdxs[],
                                    int batchSize,
                                    std::map<ITensor*, void*>& iTensorToLayerBufferMap);


    float* getBuffer(MWTensorBase* aTensorBase);


    // functions for reordering input and output for custom layers
    std::vector<ITensor*> reorderInputs(MWTensorrtCustomLayerBase* layer);
    void reorderOutputs(MWTensorrtCustomLayerBase* layer, MW_IPLUGIN_LAYER* lggXzMqaGsHRfEEBxYjD);

    void setBuilderPropForINT8();
    void setBuilderPropForFP16();

    static nvinfer1::Permutation getTensorRTPermOrderFromPIRPermVals(MWTensorBase* tensor,
                                                                     int permOrderVals[]);

    void setBuilderRefitProperty(bool isRefittable);
    void createEngine();
    void setComputeConstraints(bool strictComputeConstraint);
    void setEnvVariables();
    void unsetEnvVariables();
    void destroyCudnnHandle(cudnnHandle_t *LZEABFNFLwHjTnspYjfK);
};

/* ***************** Plugin Interface Declaration ********************** */
// Common base class for all Plugin Layers of TensorRT
class MWPluginInterfaceImpl : public MW_IPLUGIN {

  public:
    MWPluginInterfaceImpl(MWCNNLayerImpl*, MWCNNLayer*);

    virtual ~MWPluginInterfaceImpl() {}

    int initialize() noexcept override {
        return 0;
    }

    size_t getWorkspaceSize(int maxBatchSize) const noexcept override {
        assert(maxBatchSize != 0);
        return 0;
    }

    void terminate() noexcept override {}

    int getNbOutputs() const noexcept override;

    Dims getOutputDimensions(int, const Dims*, int) noexcept override;

    void configureWithFormat(Dims const* inputDims,
                             int32_t nbInputs,
                             Dims const* outputDims,
                             int32_t nbOutputs,
                             DataType type,
                             PluginFormat format,
                             int32_t maxBatchSize) noexcept override;

    int32_t enqueue(int32_t batchSize,
                    void const* const* inputs,
                    void* const* outputs,
                    void* workspace,
                    cudaStream_t stream) noexcept override;

    size_t getSerializationSize() const noexcept override {
        return 0;
    }

    void serialize(void*) const noexcept override {}

    AsciiChar const* getPluginType() const noexcept override ;

    AsciiChar const* getPluginVersion() const noexcept override {
        return "2";
    }

    void setPluginNamespace(AsciiChar const* /*pluginNamespace*/) noexcept override {}
    AsciiChar const* getPluginNamespace() const noexcept override {
        return "";
    }

    void destroy() noexcept override {
        delete this;
    }

    MW_IPLUGIN* clone() const noexcept override {
        auto plugin = new MWPluginInterfaceImpl(this->m_layerImpl, this->m_layer);
        return plugin;
    }

    // This function is called by the builder prior to initialize(). It provides an opportunity 
    // for the layer to make algorithm choices on the basis of the provided I/O PluginTensorDesc.
    void configurePlugin(PluginTensorDesc const */*in*/, 
        int32_t /*nbInput*/, 
        PluginTensorDesc const */*out*/, 
        int32_t /*nbOutput*/) noexcept override {}

    // Return true iff plugin supports the format and datatype for the input/output indexed by pos.
    bool supportsFormatCombination(int32_t pos, 
        PluginTensorDesc const *inOut, 
        int32_t nbInputs, 
        int32_t nbOutputs) const noexcept override;

    // Return output data type of plugin. We only support fp32 outputs for custom layers.
    nvinfer1::DataType getOutputDataType(int32_t /*index*/, 
        nvinfer1::DataType const */*inputTypes*/, 
        int32_t /*nbInputs*/) const noexcept override { return DataType::kFLOAT; }

    // Return true if the output tensor is broadcast across a batch.
    // Returns false since we do not broadcast the output across batch today.
    bool isOutputBroadcastAcrossBatch(int32_t /*outputIndex*/, 
        bool const */*inputIsBroadcasted*/, 
        int32_t /*nbInputs*/) const noexcept override { return false; };

    // Return true iff the plugin can use an input tensor that is broadcast across the batch without replication.
    // Returns false since we do not broadcast the input across batch today.
    bool canBroadcastInputAcrossBatch(int32_t /*inputIndex*/) const noexcept override { return false; }

  private:
    MWCNNLayerImpl* m_layerImpl;
    MWCNNLayer* m_layer;
};

/* ****************************************************************** */
} // namespace MWTensorrtTarget
#endif

