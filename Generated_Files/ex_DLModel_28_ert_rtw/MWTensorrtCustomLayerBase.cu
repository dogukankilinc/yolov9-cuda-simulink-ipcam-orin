#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCustomLayerBase.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCustomLayerBase.hpp"
#endif
#include <cstdarg>
#include <vector>
#include <map>
 MWTensorrtCustomLayerBase::MWTensorrtCustomLayerBase() : m_ntwkImpl(nullptr) , 
m_plugin(nullptr) { m_isCustomLayer = true; } 
MWTensorrtCustomLayerBase::~MWTensorrtCustomLayerBase() { } ITensor* 
MWTensorrtCustomLayerBase::getCustomLayerITensorOut(int index) { assert(index < 
static_cast<int>(AUjQjfbaYUcIYlesMFxV.size())); return 
AUjQjfbaYUcIYlesMFxV[index]; } void 
MWTensorrtCustomLayerBase::setCustomLayerITensorOut(ITensor* aITensorOut, int 
index) { assert(index == static_cast<int>(AUjQjfbaYUcIYlesMFxV.size())); 
AUjQjfbaYUcIYlesMFxV.push_back(aITensorOut); } void 
MWTensorrtCustomLayerBase::predictEnqueueImpl(float** , float** ) { 
assert(false); } void 
MWTensorrtCustomLayerBase::setupLayer(MWTensorrtTarget::MWTargetNetworkImpl* 
targetImpl, boolean_T needsInputReorder[], boolean_T needsOutputReorder[], 
MWTensorBase::DIMSLABEL layerLayout[], int numLayerLayoutDims, ...) { 
m_ntwkImpl = targetImpl; XGQjNlvPuckcHnviTrkP.reserve(numLayerLayoutDims); 
for (int i = 0; i < numLayerLayoutDims; ++i) { 
XGQjNlvPuckcHnviTrkP.push_back(layerLayout[i]); } va_list args; 
va_start(args, numLayerLayoutDims); this->setupIOFormats(needsInputReorder, 
needsOutputReorder, numLayerLayoutDims, args); va_end(args); } void 
MWTensorrtCustomLayerBase::setupIOFormats(boolean_T needsInputReorder[], 
boolean_T needsOutputReorder[], int numLayerLayoutDims, va_list args) { 
ZCIXlZiWXjcnCOFqwRGo.reserve(getNumInputs()); for (int inputIndex = 0; 
inputIndex < static_cast<int>(getNumInputs()); ++inputIndex) { 
assert(inputIndex == static_cast<int>(ZCIXlZiWXjcnCOFqwRGo.size())); 
ZCIXlZiWXjcnCOFqwRGo.push_back(needsInputReorder[inputIndex]); if 
(needsInputReorder[inputIndex]) { 
assert(kYvlQsAMRufnPWDWFZNj.find(inputIndex) == 
kYvlQsAMRufnPWDWFZNj.end()); MWTensorBase::DIMSLABEL* inputLayout = 
va_arg(args, MWTensorBase::DIMSLABEL*); for (int dimIndex = 0; dimIndex < 
numLayerLayoutDims; ++dimIndex) { 
kYvlQsAMRufnPWDWFZNj[inputIndex].push_back(inputLayout[dimIndex]); } 
} } ZKeyHBhoZPWskJswVRuM.reserve(getNumOutputs()); for (int 
outputIndex = 0; outputIndex < static_cast<int>(getNumOutputs()); 
++outputIndex) { assert(outputIndex == 
static_cast<int>(ZKeyHBhoZPWskJswVRuM.size())); 
ZKeyHBhoZPWskJswVRuM.push_back(needsOutputReorder[outputIndex]); if 
(needsOutputReorder[outputIndex]) { 
assert(kdwKYCcEoCxgtNVKYgHu.find(outputIndex) == 
kdwKYCcEoCxgtNVKYgHu.end()); MWTensorBase::DIMSLABEL* outputLayout 
= va_arg(args, MWTensorBase::DIMSLABEL*); for (int dimIndex = 0; dimIndex < 
numLayerLayoutDims; ++dimIndex) { 
kdwKYCcEoCxgtNVKYgHu[outputIndex].push_back(outputLayout[dimIndex]); 
} } } } void MWTensorrtCustomLayerBase::allocate() { m_plugin = 
m_ntwkImpl->setupCustomLayerPlugin(this); } void 
MWTensorrtCustomLayerBase::deallocate() { AUjQjfbaYUcIYlesMFxV.clear(); if 
(m_plugin) { delete m_plugin; m_plugin = nullptr; } } void 
MWTensorrtCustomLayerBase::cleanup() { this->MWCNNLayer::cleanup(); 
this->cleanupLayer(); ZCIXlZiWXjcnCOFqwRGo.clear(); 
ZKeyHBhoZPWskJswVRuM.clear(); kYvlQsAMRufnPWDWFZNj.clear(); 
kdwKYCcEoCxgtNVKYgHu.clear(); XGQjNlvPuckcHnviTrkP.clear(); } int 
MWTensorrtCustomLayerBase::getNumDimsForTensorRT(MWTensorBase* tensor) { if 
(tensor->hasTimeDim()) return 3;  else if (tensor->hasSpatialDim()) return 4;  
else return 2;  }