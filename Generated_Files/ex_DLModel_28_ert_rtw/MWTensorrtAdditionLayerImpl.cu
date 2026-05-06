#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtAdditionLayerImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtAdditionLayerImpl.hpp"
#endif
 namespace MWTensorrtTarget { 
MWAdditionLayerImpl::MWAdditionLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImpl{layer, ntwk_impl} { } void 
MWAdditionLayerImpl::allocate() { ITensor* prevLayerTensor1 = 
getInputITensor(0); ITensor* prevLayerTensor2 = getInputITensor(1); 
IElementWiseLayer* AHTFZgpygljIqPClJcDZ = 
aAhADHkrrFEJiHNuuJmX->network->addElementWise(*prevLayerTensor1, 
*prevLayerTensor2, ElementWiseOperation::kSUM); 
AHTFZgpygljIqPClJcDZ->setName(getLayer()->getName().c_str()); 
for (int i = 2; i < static_cast<int>(getLayer()->getNumInputs()); ++i) { 
AHTFZgpygljIqPClJcDZ = 
aAhADHkrrFEJiHNuuJmX->network->addElementWise( 
*AHTFZgpygljIqPClJcDZ->getOutput(0), *getInputITensor(i), 
ElementWiseOperation::kSUM); } 
setOpTensorPtr(AHTFZgpygljIqPClJcDZ->getOutput(0)); } 
MWAdditionLayerImpl::~MWAdditionLayerImpl() { } } 