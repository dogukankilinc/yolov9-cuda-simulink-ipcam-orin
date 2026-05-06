#ifdef PRECOMPILE_LAYERFILES
#include "tensorrt/MWTensorrtOutputLayerImpl.hpp"
#include "tensorrt/MWTensorrtCNNLayerImpl.hpp"
#else
#include "MWTensorrtOutputLayerImpl.hpp"
#include "MWTensorrtCNNLayerImpl.hpp"
#endif
 class MWCNNLayer; namespace MWTensorrtTarget { class MWTargetNetworkImpl; 
MWOutputLayerImpl::MWOutputLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl) : MWCNNLayerImpl{layer, ntwk_impl} { } void 
MWOutputLayerImpl::allocate() { ITensor* prevLayerTensor = getInputITensor(0); 
setOpTensorPtr(prevLayerTensor); } } 