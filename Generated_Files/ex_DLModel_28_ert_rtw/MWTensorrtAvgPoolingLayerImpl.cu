#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtAvgPoolingLayerImpl.hpp"
#include "tensorrt/MWTensorrtUtils.hpp"
#include "tensorrt/MWTensorrtVersionSpecificImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtAvgPoolingLayerImpl.hpp"
#include "MWTensorrtUtils.hpp"
#include "MWTensorrtVersionSpecificImpl.hpp"
#endif
#include <cassert>
 namespace MWTensorrtTarget { 
MWAvgPoolingLayerImpl::MWAvgPoolingLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int poolH, int poolW, int strideH, int strideW, 
int paddingH_T, int paddingH_B, int paddingW_L, int paddingW_R, bool 
poolingIncludesPadding) : MWCNNLayerImpl{layer, ntwk_impl} , 
mJHKRLbEVeCWkBgMqjYL{poolH} , mMiQeYHoTbNUGLyNakei{poolW} , 
lxBZLYcHXoXUkMjfqsuo{poolH} , mJnXzwDFPTieqFtWcZIG{poolW} , uTUuLVVebDakbPjXOQwp{strideH} 
, uqHugYAAqkSnCCYonqCt{strideW} , jtBWMhagVIfXgzsydrnm{paddingH_T} , 
jodrcfdVqEtXMUFJulgi{paddingH_B} , kDIJsXmMuRtKrTNwutxt{paddingW_L} , 
kGKqPjmETQEaXPuTJmiS{paddingW_R} , 
mXWolnmmwQGkQZhSmvqw{poolingIncludesPadding} { const bool 
asymmetricPadding = (jtBWMhagVIfXgzsydrnm != jodrcfdVqEtXMUFJulgi) || 
(kDIJsXmMuRtKrTNwutxt != kGKqPjmETQEaXPuTJmiS); assert (!(asymmetricPadding 
&& !mXWolnmmwQGkQZhSmvqw)); } void 
MWAvgPoolingLayerImpl::propagateSize() { MWTensorBase* ipTensorBase = 
getLayer()->getInputTensor(0); if ((mJHKRLbEVeCWkBgMqjYL == -1) && 
(mMiQeYHoTbNUGLyNakei == -1)) { lxBZLYcHXoXUkMjfqsuo = 
ipTensorBase->getHeight() + jtBWMhagVIfXgzsydrnm + jodrcfdVqEtXMUFJulgi; 
mJnXzwDFPTieqFtWcZIG = ipTensorBase->getWidth() + kDIJsXmMuRtKrTNwutxt + 
kGKqPjmETQEaXPuTJmiS ; } } void MWAvgPoolingLayerImpl::allocate() { 
MWCNNLayer* poolingLayer = getLayer(); ITensor* prevLayerTensor = 
getInputITensor(0); IPoolingLayer* iAvgPoolingLayer; if ((jtBWMhagVIfXgzsydrnm 
== jodrcfdVqEtXMUFJulgi) && (kDIJsXmMuRtKrTNwutxt == kGKqPjmETQEaXPuTJmiS)) 
{ iAvgPoolingLayer = aAhADHkrrFEJiHNuuJmX->network->addPoolingNd( 
*prevLayerTensor, PoolingType::kAVERAGE, DimsHW{lxBZLYcHXoXUkMjfqsuo, 
mJnXzwDFPTieqFtWcZIG}); DimsHW padDims = DimsHW{jtBWMhagVIfXgzsydrnm, 
kDIJsXmMuRtKrTNwutxt}; iAvgPoolingLayer->setPaddingNd(padDims); } else { 
ITensor* DytNxKWQcYUHaYuuACXS = 
MWTensorrtUtils::insertPaddingLayer(prevLayerTensor,aAhADHkrrFEJiHNuuJmX, 
getLayer()->getName().c_str(), 
jtBWMhagVIfXgzsydrnm,kDIJsXmMuRtKrTNwutxt,jodrcfdVqEtXMUFJulgi,kGKqPjmETQEaXPuTJmiS); 
iAvgPoolingLayer = aAhADHkrrFEJiHNuuJmX->network->addPoolingNd( 
*DytNxKWQcYUHaYuuACXS, PoolingType::kAVERAGE, DimsHW{lxBZLYcHXoXUkMjfqsuo, 
mJnXzwDFPTieqFtWcZIG}); } DimsHW strideDims = DimsHW{uTUuLVVebDakbPjXOQwp, 
uqHugYAAqkSnCCYonqCt}; iAvgPoolingLayer->setStrideNd(strideDims); 
iAvgPoolingLayer->setAverageCountExcludesPadding(!mXWolnmmwQGkQZhSmvqw); 
iAvgPoolingLayer->setName(getLayer()->getName().c_str()); 
setOpTensorPtr(iAvgPoolingLayer->getOutput(0)); } } 