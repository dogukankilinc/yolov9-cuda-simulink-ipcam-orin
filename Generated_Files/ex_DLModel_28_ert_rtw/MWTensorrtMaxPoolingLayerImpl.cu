#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtMaxPoolingLayerImpl.hpp"
#include "tensorrt/MWTensorrtVersionSpecificImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtMaxPoolingLayerImpl.hpp"
#include "MWTensorrtVersionSpecificImpl.hpp"
#endif
 namespace MWTensorrtTarget { void __global__ __launch_bounds__(1024) 
MWSetDyForBackPropImpl(float* NmJNEQWHajbWzPxzwUTG, const int dOkBWZYpNkSIfEYRNKmc) { 
for (int i = blockDim.x * blockIdx.x + threadIdx.x; i < dOkBWZYpNkSIfEYRNKmc; i 
+= blockDim.x * gridDim.x) { NmJNEQWHajbWzPxzwUTG[i] = i + 1; } } void __global__ 
__launch_bounds__(1024) doMWMaxPoolingLayerImpl(float* 
RlwtKXlNBNTmWbDUiwqD, float* RgALmBtPIZWDevjZBUHy, const int 
CZiiieLxAFTgpdhdjNUA) { for (int i = blockDim.x * blockIdx.x + threadIdx.x; i < 
CZiiieLxAFTgpdhdjNUA; i += blockDim.x * gridDim.x) { if 
(static_cast<int>(RlwtKXlNBNTmWbDUiwqD[i]) != 0) { 
RgALmBtPIZWDevjZBUHy[static_cast<int>(RlwtKXlNBNTmWbDUiwqD[i]) - 1] = 
i; } } } MWMaxPoolingLayerImpl::MWMaxPoolingLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int poolH, int poolW, int strideH, int strideW, 
int paddingH_T, int paddingH_B, int paddingW_L, int paddingW_R, bool 
FCgChnBQLAUXyoWzTlfg, int ) : MWCNNLayerImpl{layer, ntwk_impl} , 
mJHKRLbEVeCWkBgMqjYL{poolH} , mMiQeYHoTbNUGLyNakei{poolW} , 
lxBZLYcHXoXUkMjfqsuo{poolH} , mJnXzwDFPTieqFtWcZIG{poolW} , uTUuLVVebDakbPjXOQwp{strideH} 
, uqHugYAAqkSnCCYonqCt{strideW} , jtBWMhagVIfXgzsydrnm{paddingH_T} , 
jodrcfdVqEtXMUFJulgi{paddingH_B} , kDIJsXmMuRtKrTNwutxt{paddingW_L} , 
kGKqPjmETQEaXPuTJmiS{paddingW_R} , 
QGJQoIbCBTjWYrGBxsre{FCgChnBQLAUXyoWzTlfg} , lQtIWwFYsIqUppVzkbip{nullptr} , 
RlwtKXlNBNTmWbDUiwqD{nullptr} , NmJNEQWHajbWzPxzwUTG{nullptr} {} void 
MWMaxPoolingLayerImpl::propagateSize() { MWTensorBase* ipTensorBase = 
getLayer()->getInputTensor(0); if ((mJHKRLbEVeCWkBgMqjYL == -1) && 
(mMiQeYHoTbNUGLyNakei == -1)) { lxBZLYcHXoXUkMjfqsuo = 
ipTensorBase->getHeight(); mJnXzwDFPTieqFtWcZIG = ipTensorBase->getWidth(); } } 
void MWMaxPoolingLayerImpl::allocate() { ITensor* prevLayerTensor = 
getInputITensor(0); if (!QGJQoIbCBTjWYrGBxsre && (jtBWMhagVIfXgzsydrnm == 
jodrcfdVqEtXMUFJulgi) && (kDIJsXmMuRtKrTNwutxt == kGKqPjmETQEaXPuTJmiS)) { 
IPoolingLayer* iMaxPoolingLayer = aAhADHkrrFEJiHNuuJmX->network->addPoolingNd( 
*prevLayerTensor, PoolingType::kMAX, DimsHW{lxBZLYcHXoXUkMjfqsuo, 
mJnXzwDFPTieqFtWcZIG}); DimsHW strideDims = DimsHW{uTUuLVVebDakbPjXOQwp, 
uqHugYAAqkSnCCYonqCt}; iMaxPoolingLayer->setStrideNd(strideDims); DimsHW padDims 
= DimsHW{jtBWMhagVIfXgzsydrnm, kDIJsXmMuRtKrTNwutxt}; 
iMaxPoolingLayer->setPaddingNd(padDims); 
iMaxPoolingLayer->setName(getLayer()->getName().c_str()); 
setOpTensorPtr(iMaxPoolingLayer->getOutput(0)); } else { 
pluginSetup(lxBZLYcHXoXUkMjfqsuo, mJnXzwDFPTieqFtWcZIG, uTUuLVVebDakbPjXOQwp, 
uqHugYAAqkSnCCYonqCt, jtBWMhagVIfXgzsydrnm, kDIJsXmMuRtKrTNwutxt); 
lQtIWwFYsIqUppVzkbip = aAhADHkrrFEJiHNuuJmX->setupLayerPlugin(getLayer(), this); } 
} float* MWMaxPoolingLayerImpl::getIndexData() { return nullptr; } void 
MWMaxPoolingLayerImpl::cleanup() { if (lQtIWwFYsIqUppVzkbip) { 
CUDNN_CALL(cudnnDestroyPoolingDescriptor(lqYqXvaqiZxCnTfQwVBT)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*TwiaHttwApyaipMEKPSg)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*hfpQGkYwRCbaOxpSIoHn)); delete 
lQtIWwFYsIqUppVzkbip; lQtIWwFYsIqUppVzkbip = nullptr; } if (QGJQoIbCBTjWYrGBxsre) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*hpOzCTZasBMYKoXVxMDZ)); } if 
(RlwtKXlNBNTmWbDUiwqD) { assert(QGJQoIbCBTjWYrGBxsre); 
CUDA_FREE_CALL(RlwtKXlNBNTmWbDUiwqD); RlwtKXlNBNTmWbDUiwqD = 
nullptr; } if (NmJNEQWHajbWzPxzwUTG) { assert(QGJQoIbCBTjWYrGBxsre); 
CUDA_FREE_CALL(NmJNEQWHajbWzPxzwUTG); NmJNEQWHajbWzPxzwUTG = nullptr; } } void 
MWMaxPoolingLayerImpl::pluginSetup(int EMtxAWxHxCcPIkaNDIHM, int EOuFmpbshvhRMfQlfIXQ, 
int EiBytenrthqoQrTnOFaK, int EpwuhXsRcwdqXSjBpUeO, int EFRxTzGDLCOxVeZLDhRL, int 
EBrSnWuJobWBIFNZLSZN) { MWTensorBase* ipTensor = getLayer()->getInputTensor(); 
CUDNN_CALL(cudnnCreatePoolingDescriptor(&lqYqXvaqiZxCnTfQwVBT)); CUDNN_CALL( 
cudnnSetPooling2dDescriptor(lqYqXvaqiZxCnTfQwVBT, CUDNN_POOLING_MAX, 
CUDNN_NOT_PROPAGATE_NAN, EMtxAWxHxCcPIkaNDIHM, EOuFmpbshvhRMfQlfIXQ, 
EFRxTzGDLCOxVeZLDhRL, EBrSnWuJobWBIFNZLSZN, EiBytenrthqoQrTnOFaK, 
EpwuhXsRcwdqXSjBpUeO)); TwiaHttwApyaipMEKPSg = new cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(TwiaHttwApyaipMEKPSg)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*TwiaHttwApyaipMEKPSg, CUDNN_TENSOR_NCHW,  
CUDNN_DATA_FLOAT, ipTensor->getBatchSize(),  ipTensor->getChannels(),  
ipTensor->getHeight(),  ipTensor->getWidth()));  int YwVURcspGhtSnbZFmwMD, 
JzbfdFmhBWGJmkbIAzSY, PsSZzscVKwYLIATdyqkh, wofzmsDCvutojgaNALNn; 
CUDNN_CALL(cudnnGetPooling2dForwardOutputDim(lqYqXvaqiZxCnTfQwVBT, 
*TwiaHttwApyaipMEKPSg, &YwVURcspGhtSnbZFmwMD, &JzbfdFmhBWGJmkbIAzSY, &PsSZzscVKwYLIATdyqkh, 
&wofzmsDCvutojgaNALNn)); PsSZzscVKwYLIATdyqkh = getLayer()->getOutputTensor(0)->getHeight(); 
wofzmsDCvutojgaNALNn = getLayer()->getOutputTensor(0)->getWidth(); hfpQGkYwRCbaOxpSIoHn = 
new cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(hfpQGkYwRCbaOxpSIoHn)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*hfpQGkYwRCbaOxpSIoHn, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, YwVURcspGhtSnbZFmwMD, JzbfdFmhBWGJmkbIAzSY, PsSZzscVKwYLIATdyqkh, wofzmsDCvutojgaNALNn)); if 
(QGJQoIbCBTjWYrGBxsre) { hpOzCTZasBMYKoXVxMDZ = new cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(hpOzCTZasBMYKoXVxMDZ)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*hpOzCTZasBMYKoXVxMDZ, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, YwVURcspGhtSnbZFmwMD, JzbfdFmhBWGJmkbIAzSY, PsSZzscVKwYLIATdyqkh, wofzmsDCvutojgaNALNn)); 
assert((JzbfdFmhBWGJmkbIAzSY == ipTensor->getChannels()) && (YwVURcspGhtSnbZFmwMD == 
ipTensor->getBatchSize())); bSBYTisdxwqVzKIRnOvc = (ipTensor->getHeight()) * 
(ipTensor->getWidth()) * (ipTensor->getChannels()) * 
(ipTensor->getBatchSize()); CUDA_CALL( 
cudaMalloc((void**)&RlwtKXlNBNTmWbDUiwqD, sizeof(float) * 
bSBYTisdxwqVzKIRnOvc)); dOkBWZYpNkSIfEYRNKmc = wofzmsDCvutojgaNALNn * PsSZzscVKwYLIATdyqkh * 
JzbfdFmhBWGJmkbIAzSY * YwVURcspGhtSnbZFmwMD; CUDA_CALL(cudaMalloc((void**)&NmJNEQWHajbWzPxzwUTG, 
sizeof(float) * dOkBWZYpNkSIfEYRNKmc)); int vmBqKEmdajzGggqevoGl = 
(dOkBWZYpNkSIfEYRNKmc < 1024) ? dOkBWZYpNkSIfEYRNKmc : 1024; int 
JIvyuxbwfcCFMnLLAUOz = (dOkBWZYpNkSIfEYRNKmc + vmBqKEmdajzGggqevoGl - 
1) / vmBqKEmdajzGggqevoGl; 
MWSetDyForBackPropImpl<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( NmJNEQWHajbWzPxzwUTG, dOkBWZYpNkSIfEYRNKmc); } } int 
MWMaxPoolingLayerImpl::pluginEnqueueImpl(const void* const* inputs, void** 
outputs) { 
CUDNN_CALL(cudnnPoolingForward(*aAhADHkrrFEJiHNuuJmX->getCudnnHandle(), 
lqYqXvaqiZxCnTfQwVBT, getOnePtr(), *TwiaHttwApyaipMEKPSg, static_cast<float 
const*>(inputs[0]), getZeroPtr(), *hfpQGkYwRCbaOxpSIoHn, 
static_cast<float*>(outputs[0]))); if (QGJQoIbCBTjWYrGBxsre) { MWTensorBase* 
ipTensor = getLayer()->getInputTensor(); 
CUDNN_CALL(cudnnPoolingBackward(*aAhADHkrrFEJiHNuuJmX->getCudnnHandle(), 
lqYqXvaqiZxCnTfQwVBT, getOnePtr(), *hfpQGkYwRCbaOxpSIoHn, 
static_cast<float*>(outputs[0]), *hfpQGkYwRCbaOxpSIoHn, NmJNEQWHajbWzPxzwUTG, 
*TwiaHttwApyaipMEKPSg, static_cast<float const*>(inputs[0]), getZeroPtr(), 
*TwiaHttwApyaipMEKPSg, RlwtKXlNBNTmWbDUiwqD)); int 
vmBqKEmdajzGggqevoGl = (bSBYTisdxwqVzKIRnOvc < 1024) ? bSBYTisdxwqVzKIRnOvc : 
1024; int JIvyuxbwfcCFMnLLAUOz = (bSBYTisdxwqVzKIRnOvc + 
vmBqKEmdajzGggqevoGl - 1) / vmBqKEmdajzGggqevoGl; 
doMWMaxPoolingLayerImpl<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( RlwtKXlNBNTmWbDUiwqD, 
static_cast<float*>(outputs[1]), bSBYTisdxwqVzKIRnOvc); } return 0; } } 