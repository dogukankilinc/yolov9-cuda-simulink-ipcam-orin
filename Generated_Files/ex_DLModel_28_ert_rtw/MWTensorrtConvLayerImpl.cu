#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtConvLayerImpl.hpp"
#include "tensorrt/MWTensorrtUtils.hpp"
#include "tensorrt/MWTensorrtVersionSpecificImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtConvLayerImpl.hpp"
#include "MWTensorrtUtils.hpp"
#include "MWTensorrtVersionSpecificImpl.hpp"
#endif
#include <cstdlib>
#include <cassert>
#include <cstdio>
#include <cassert>
#include <iostream>
#include <vector>
 namespace MWTensorrtTarget { MWConvLayerImpl::MWConvLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl, int filterH, int filterW, int numGroups, 
int numChannels, int numFilters, int strideH, int strideW, int paddingH_T, int 
paddingH_B, int paddingW_L, int paddingW_R, int dilationFactorH, int 
dilationFactorW, const char* zSFgFiuBTIOgBUfGevLf, const char* 
JBdvwIleyLFUnlmQKTKI) : MWCNNLayerImpl{layer, ntwk_impl} , 
ckANhWvcJoOYJzfoBaoE{numGroups} , aOzuQTZkTpvQtweIMprM{numChannels} , 
boZxhUbgnNUlJQXTuWwi{numFilters} , OuTwywxKeMgznElXdjGp{filterH} , 
PAwKCndEJEByqwNZnPgb{filterW} , uTUuLVVebDakbPjXOQwp{strideH} , 
uqHugYAAqkSnCCYonqCt{strideW} , MPrDSEASJfAaxVcXjtke{dilationFactorH} , 
MmeSJXZBVyUbgMuuFbuc{dilationFactorW} , jtBWMhagVIfXgzsydrnm{paddingH_T} 
, jodrcfdVqEtXMUFJulgi{paddingH_B} , kDIJsXmMuRtKrTNwutxt{paddingW_L} , 
kGKqPjmETQEaXPuTJmiS{paddingW_R} , wofzmsDCvutojgaNALNn{nullptr} , 
IGBjAMvMJXqrubGDtvyq{nullptr} { wofzmsDCvutojgaNALNn = (float*)calloc(aOzuQTZkTpvQtweIMprM * 
boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE * OuTwywxKeMgznElXdjGp * 
PAwKCndEJEByqwNZnPgb, sizeof(float)); IGBjAMvMJXqrubGDtvyq = 
(float*)calloc(boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE, sizeof(float)); 
loadWeights(zSFgFiuBTIOgBUfGevLf); loadBias(JBdvwIleyLFUnlmQKTKI); } void 
MWConvLayerImpl::allocate() { filt_weights.values = wofzmsDCvutojgaNALNn; 
filt_weights.count = aOzuQTZkTpvQtweIMprM * boZxhUbgnNUlJQXTuWwi * 
ckANhWvcJoOYJzfoBaoE * OuTwywxKeMgznElXdjGp * PAwKCndEJEByqwNZnPgb; 
filt_weights.type = DataType::kFLOAT; filt_bias.values = IGBjAMvMJXqrubGDtvyq; 
filt_bias.count = boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE; filt_bias.type 
= DataType::kFLOAT; ITensor* prevLayerTensor = getInputITensor(0); if 
(getLayer()->getInputTensor(0)->hasCBFormat()) { prevLayerTensor = 
aAhADHkrrFEJiHNuuJmX->expandToDimsNCHW(prevLayerTensor); } IConvolutionLayer* 
ConvLayerT; if ((jtBWMhagVIfXgzsydrnm == jodrcfdVqEtXMUFJulgi) && 
(kDIJsXmMuRtKrTNwutxt == kGKqPjmETQEaXPuTJmiS)) { ConvLayerT = 
aAhADHkrrFEJiHNuuJmX->network->addConvolutionNd(*prevLayerTensor, 
boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE, DimsHW{OuTwywxKeMgznElXdjGp, 
PAwKCndEJEByqwNZnPgb}, filt_weights, filt_bias); DimsHW padDims = 
DimsHW{jtBWMhagVIfXgzsydrnm, kDIJsXmMuRtKrTNwutxt}; 
ConvLayerT->setPaddingNd(padDims); } else { ITensor* DytNxKWQcYUHaYuuACXS = 
MWTensorrtUtils::insertPaddingLayer(prevLayerTensor,aAhADHkrrFEJiHNuuJmX, 
getLayer()->getName().c_str(), 
jtBWMhagVIfXgzsydrnm,kDIJsXmMuRtKrTNwutxt,jodrcfdVqEtXMUFJulgi,kGKqPjmETQEaXPuTJmiS); 
ConvLayerT = 
aAhADHkrrFEJiHNuuJmX->network->addConvolutionNd(*DytNxKWQcYUHaYuuACXS, 
boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE, DimsHW{OuTwywxKeMgznElXdjGp, 
PAwKCndEJEByqwNZnPgb}, filt_weights, filt_bias); } DimsHW dilationDims = 
DimsHW{MPrDSEASJfAaxVcXjtke, MmeSJXZBVyUbgMuuFbuc}; 
ConvLayerT->setDilationNd(dilationDims); DimsHW strideDims = 
DimsHW{uTUuLVVebDakbPjXOQwp, uqHugYAAqkSnCCYonqCt}; 
ConvLayerT->setStrideNd(strideDims); 
ConvLayerT->setNbGroups(ckANhWvcJoOYJzfoBaoE); 
ConvLayerT->setName(getLayer()->getName().c_str()); ITensor* opITensor = 
ConvLayerT->getOutput(0); if (getLayer()->getInputTensor(0)->hasCBFormat()) { 
opITensor = aAhADHkrrFEJiHNuuJmX->squeezeToDims2(opITensor); } 
assert(opITensor); setOpTensorPtr(opITensor); } void MWConvLayerImpl::cleanup() 
{ if (wofzmsDCvutojgaNALNn) { free(wofzmsDCvutojgaNALNn); wofzmsDCvutojgaNALNn = nullptr; } if 
(IGBjAMvMJXqrubGDtvyq) { free(IGBjAMvMJXqrubGDtvyq); IGBjAMvMJXqrubGDtvyq = nullptr; } } void 
MWConvLayerImpl::loadWeights(const char* OFXGTgQYmVJLJPBNAVgS) { FILE* 
PGZiGqeTEpirdHmNpvcb = MWCNNLayer::openBinaryFile(OFXGTgQYmVJLJPBNAVgS); 
assert(PGZiGqeTEpirdHmNpvcb); int aFIIJSbJDJUndqPzwinJ = aOzuQTZkTpvQtweIMprM * 
boZxhUbgnNUlJQXTuWwi * ckANhWvcJoOYJzfoBaoE * OuTwywxKeMgznElXdjGp * 
PAwKCndEJEByqwNZnPgb; MWCNNLayer::call_fread(wofzmsDCvutojgaNALNn, sizeof(float), 
aFIIJSbJDJUndqPzwinJ, PGZiGqeTEpirdHmNpvcb, OFXGTgQYmVJLJPBNAVgS); fclose(PGZiGqeTEpirdHmNpvcb); } 
void MWConvLayerImpl::loadBias(const char* OFXGTgQYmVJLJPBNAVgS) { FILE* 
PGZiGqeTEpirdHmNpvcb = MWCNNLayer::openBinaryFile(OFXGTgQYmVJLJPBNAVgS); 
assert(PGZiGqeTEpirdHmNpvcb); int aFIIJSbJDJUndqPzwinJ = boZxhUbgnNUlJQXTuWwi * 
ckANhWvcJoOYJzfoBaoE; MWCNNLayer::call_fread(IGBjAMvMJXqrubGDtvyq, sizeof(float), 
aFIIJSbJDJUndqPzwinJ, PGZiGqeTEpirdHmNpvcb, OFXGTgQYmVJLJPBNAVgS); fclose(PGZiGqeTEpirdHmNpvcb); } 
void MWConvLayerImpl::setLearnables(std::vector<float*> learnables) { 
assert(learnables.size() == 2); float* xfOxpszwKJaexOQGsUnd = learnables[0]; 
memcpy(wofzmsDCvutojgaNALNn, xfOxpszwKJaexOQGsUnd, sizeof(float) * filt_weights.count); 
assert(wofzmsDCvutojgaNALNn == filt_weights.values); float* IggeMCRfncIoKgBcfyKF = 
learnables[1]; memcpy(IGBjAMvMJXqrubGDtvyq, IggeMCRfncIoKgBcfyKF, sizeof(float) * 
filt_bias.count); assert(IGBjAMvMJXqrubGDtvyq == filt_bias.values); const std::string 
layerName = getLayer()->getName(); bool success = 
aAhADHkrrFEJiHNuuJmX->refitter->setWeights(layerName.c_str(), 
WeightsRole::kKERNEL, filt_weights); if (!success) { throw 
std::runtime_error("Updating weights for " + layerName + " layer failed"); } 
success = 
aAhADHkrrFEJiHNuuJmX->refitter->setWeights(getLayer()->getName().c_str(), 
WeightsRole::kBIAS, filt_bias); if (!success) { throw 
std::runtime_error("Updating bias for " + layerName + " layer failed"); } } } 