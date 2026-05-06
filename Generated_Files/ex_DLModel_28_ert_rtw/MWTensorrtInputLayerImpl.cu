#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtInputLayerImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtInputLayerImpl.hpp"
#endif
#include <cstring>
 namespace MWTensorrtTarget { MWInputLayerImpl::MWInputLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImpl{layer, ntwk_impl} { } 
void MWInputLayerImpl::allocate() { std::string layerName = 
getLayer()->getName() + std::string("_mwinput"); ITensor* InputLayerITensor; if 
(getLayer()->getOutputTensor(0)->hasCBFormat()) { InputLayerITensor = 
aAhADHkrrFEJiHNuuJmX->network->addInput( layerName.c_str(), DataType::kFLOAT, 
Dims2(getLayer()->getOutputTensor(0)->getBatchSize(), 
getLayer()->getOutputTensor(0)->getChannels())); } else { InputLayerITensor = 
aAhADHkrrFEJiHNuuJmX->network->addInput( layerName.c_str(), DataType::kFLOAT, 
Dims4{getLayer()->getOutputTensor(0)->getBatchSize(), 
getLayer()->getOutputTensor(0)->getChannels(), 
getLayer()->getOutputTensor(0)->getHeight(), 
getLayer()->getOutputTensor(0)->getWidth()}); } 
setOpTensorPtr(InputLayerITensor); } } 