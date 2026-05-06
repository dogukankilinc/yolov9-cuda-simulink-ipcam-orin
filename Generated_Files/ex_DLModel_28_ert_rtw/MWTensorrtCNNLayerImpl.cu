#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtCustomLayerBase.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtCustomLayerBase.hpp"
#endif
#include <cstdlib>
#include <cassert>
#include <cstdio>
#include <cassert>
#include <iostream>
#include <sstream>
 namespace MWTensorrtTarget { float* malloc_call_line_file(size_t msize, const 
int XOJRvKzQwSaZobhyUoOi, const char* OFCpCZzJyMkmfKSPMfBS) { float* mem = 
(float*)malloc(msize); if (!mem) { std::stringstream ss; ss << 
"Failed to allocate memory at line : " << XOJRvKzQwSaZobhyUoOi << ", file : " << 
OFCpCZzJyMkmfKSPMfBS << "\n"; throw std::runtime_error(ss.str()); } return mem; } 
void cuda_call_line_file(cudaError_t uCFAEgNHsqohrRmdzgue, const int 
XOJRvKzQwSaZobhyUoOi, const char* OFCpCZzJyMkmfKSPMfBS) { if (uCFAEgNHsqohrRmdzgue != 
cudaSuccess) { throw_cuda_error(uCFAEgNHsqohrRmdzgue, XOJRvKzQwSaZobhyUoOi, 
OFCpCZzJyMkmfKSPMfBS); } } void throw_cuda_error(cudaError_t uCFAEgNHsqohrRmdzgue, 
const int XOJRvKzQwSaZobhyUoOi, const char* OFCpCZzJyMkmfKSPMfBS) { std::stringstream ss; 
ss << "CUDA Error " << uCFAEgNHsqohrRmdzgue << "(" << 
cudaGetErrorString(uCFAEgNHsqohrRmdzgue) << ") at line " << XOJRvKzQwSaZobhyUoOi << 
", file: " << OFCpCZzJyMkmfKSPMfBS << "\n"; uCFAEgNHsqohrRmdzgue = cudaGetLastError();  
throw std::runtime_error(ss.str()); } void cudnn_call_line_file(cudnnStatus_t 
uCFAEgNHsqohrRmdzgue, const int XOJRvKzQwSaZobhyUoOi, const char* OFCpCZzJyMkmfKSPMfBS) { if 
(uCFAEgNHsqohrRmdzgue != CUDNN_STATUS_SUCCESS) { std::stringstream ss; ss << 
"CuDNN Error " << uCFAEgNHsqohrRmdzgue << "(" << 
cudnnGetErrorString(uCFAEgNHsqohrRmdzgue) << ") at line " << XOJRvKzQwSaZobhyUoOi << 
", file: " << OFCpCZzJyMkmfKSPMfBS << "\n"; throw std::runtime_error(ss.str()); } } 
MWCNNLayerImpl::MWCNNLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl) : MWCNNLayerImplBase(layer) , aAhADHkrrFEJiHNuuJmX(ntwk_impl) , 
OBMMxSzXPgmgBcyZJTzo(0.0) , NhdIzzqqVxMjekDIWciw(1.0) , NSzdekOvRhMhRCXdWsdY(-1.0) , 
DkurstfAQrzgDAsSrxmO(0) { } MWCNNLayerImpl::~MWCNNLayerImpl() { for 
(std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
jXNXIjpdcoiJUsfPyJJv.begin(); it != jXNXIjpdcoiJUsfPyJJv.end(); ++it) { 
delete it->second; it->second = 0; } } ITensor* 
MWCNNLayerImpl::getInputITensor(int inputIdx) { MWTensorBase* ipTensor = 
getLayer()->getInputTensor(inputIdx); assert(ipTensor); return 
MWCNNLayerImpl::getITensor(ipTensor); } ITensor* 
MWCNNLayerImpl::getITensor(MWTensorBase* tensor) { MWCNNLayerImplBase* 
owningLayerImpl = tensor->getOwner()->getImpl(); int tensorIdx = 
tensor->getSourcePortIndex(); if (owningLayerImpl == nullptr) { MWCNNLayer* 
owningLayer = tensor->getOwner(); if (owningLayer->isCustomLayer()) { return 
static_cast<MWTensorrtCustomLayerBase*>(owningLayer) 
->getCustomLayerITensorOut(tensorIdx); } else { return 
MWCNNLayerImpl::getITensor(owningLayer->getInputTensor(0)); } } else { return 
static_cast<MWCNNLayerImpl*>(owningLayerImpl)->getOpTensorPtr(tensorIdx); } } 
cudnnTensorDescriptor_t* MWCNNLayerImpl::getOutputDescriptor(int index) { 
std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
jXNXIjpdcoiJUsfPyJJv.find(index); if (it == jXNXIjpdcoiJUsfPyJJv.end()) { 
cudnnTensorDescriptor_t* tmp = new cudnnTensorDescriptor_t; 
jXNXIjpdcoiJUsfPyJJv[index] = tmp; assert(tmp != 0); return tmp; } else { 
assert(it->second != 0); return it->second; } } cudnnTensorDescriptor_t* 
MWCNNLayerImpl::getCuDNNDescriptor(MWTensorBase* tensor) { return 
static_cast<MWCNNLayerImpl*>(tensor->getOwner()->getImpl()) 
->getOutputDescriptor(tensor->getSourcePortIndex()); } int 
MWCNNLayerImpl::pluginEnqueueImpl(const void* const* , void** ) { 
assert(false); return 0; } nvinfer1::ITensor* 
MWCNNLayerImpl::addPluginPreprocess(int inIdx) { return 
MWCNNLayerImpl::getITensor(getLayer()->getInputTensor(inIdx)); } 
nvinfer1::ITensor* MWCNNLayerImpl::addPluginPostprocess(ITensor* pluginOut, int 
) { return pluginOut; } } 