#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtConcatenationLayerImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtConcatenationLayerImpl.hpp"
#endif
#include <vector>
#include <stdexcept>
 namespace MWTensorrtTarget { 
MWConcatenationLayerImpl::MWConcatenationLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int dimension) : MWCNNLayerImpl{layer, 
ntwk_impl} , NIYgTDgYRdovGVvKYwHU{dimension} { } void 
MWConcatenationLayerImpl::allocate() { MWCNNLayer* concatLayer = getLayer(); 
std::vector<ITensor*> SZPsAnAecHGeFCSHofdG; 
SZPsAnAecHGeFCSHofdG.reserve(concatLayer->getNumInputs()); for (int i = 0; 
i < static_cast<int>(concatLayer->getNumInputs()); i++) { 
SZPsAnAecHGeFCSHofdG.push_back(getInputITensor(i)); } IConcatenationLayer* 
ATtTBUflKsatqujkEEiW = 
aAhADHkrrFEJiHNuuJmX->network->addConcatenation(&SZPsAnAecHGeFCSHofdG[0], 
concatLayer->getNumInputs()); assert(ATtTBUflKsatqujkEEiW); 
ATtTBUflKsatqujkEEiW->setAxis(getTensorRTAxis(NIYgTDgYRdovGVvKYwHU)); 
ATtTBUflKsatqujkEEiW->setName(concatLayer->getName().c_str()); 
setOpTensorPtr(ATtTBUflKsatqujkEEiW->getOutput(0)); } 
MWConcatenationLayerImpl::~MWConcatenationLayerImpl() { } int 
MWConcatenationLayerImpl::getTensorRTAxis(int dimension) { int axis = -1;  
switch (dimension) { case 1:  { 
assert(!getLayer()->getInputTensor(0)->hasTimeDim()); 
assert(getLayer()->getInputTensor(0)->hasSpatialDim()); axis = 2; } break; case 
2:  { assert(!getLayer()->getInputTensor(0)->hasTimeDim()); 
assert(getLayer()->getInputTensor(0)->hasSpatialDim()); axis = 3; } break; case 
3:  { if (getLayer()->getInputTensor(0)->hasTimeDim()) { axis = 2;  } else { 
axis = 1;  } } break; default: assert((dimension == 1 || dimension == 2) || 
dimension == 3); } return axis; } } 