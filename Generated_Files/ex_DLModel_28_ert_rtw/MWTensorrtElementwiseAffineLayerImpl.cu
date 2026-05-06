#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "cudnn/MWKernelHeaders.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtElementwiseAffineLayerImpl.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWKernelHeaders.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtElementwiseAffineLayerImpl.hpp"
#endif
 namespace MWTensorrtTarget { 
MWElementwiseAffineLayerImpl::MWElementwiseAffineLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int scaleH, int scaleW, int scaleC, int 
offsetH, int offsetW, int offsetC, bool isClipped, int lowerBound, int 
upperBound, const char* scale_file, const char* offset_file) : 
MWCNNLayerImpl{layer, ntwk_impl} , qMpgAuYpEDGDohMcPvRY{scaleH} , 
rwPhFWHcKnJsClVtebGW{scaleW} , qLXeoFROCbISdsnwpYgl{scaleC} , 
fdiBdaeFcIDdmsgMxaJT{offsetH} , hQnbBWOvLzwXEOLhKugH{offsetW} , 
fPIxBBGHjPkvmoaWByBr{offsetC} , VCFeDUyufHZJwIEMHAWF{isClipped} , 
YmfPcXPXNFZDznkzKZrl{lowerBound} , wPWTzEWitnRdoCGvnvtf{upperBound} , 
qJWXFXvcpbSwehmlTNru{nullptr} , ekFKUFSJOBakwDuHENjA{nullptr} , 
sDWnRjToSPjYnOQzVfhS{nullptr} , hYTzvgWajqchLzrmxjqn{nullptr} , 
lQtIWwFYsIqUppVzkbip{nullptr} { loadScaleAndOffset(scale_file, offset_file); } 
void MWElementwiseAffineLayerImpl::allocate() { setLayerProperties(); bool 
isMatrix2d = (qMpgAuYpEDGDohMcPvRY > 1) && (rwPhFWHcKnJsClVtebGW > 1) && 
(qLXeoFROCbISdsnwpYgl != TAtTmiIniopalIZnGYzp); if ((!VCFeDUyufHZJwIEMHAWF) && 
(sCDdEyIOjXBVHhcakBhd == hTbrmZSPUORqMIprVbKk) && !isMatrix2d && 
(!getLayer()->getInputTensor(0)->hasTimeDim())) { 
reGtUwUlPSwEenEBVIzH.values = sDWnRjToSPjYnOQzVfhS; 
reGtUwUlPSwEenEBVIzH.count = sCDdEyIOjXBVHhcakBhd; 
reGtUwUlPSwEenEBVIzH.type = DataType::kFLOAT; 
oBBTWcYGdlswNVGXNBSQ.values = nullptr; oBBTWcYGdlswNVGXNBSQ.count = 
0; oBBTWcYGdlswNVGXNBSQ.type = DataType::kFLOAT; 
suFVgcuEVpCOrewbJfkB.values = hYTzvgWajqchLzrmxjqn; 
suFVgcuEVpCOrewbJfkB.count = hTbrmZSPUORqMIprVbKk; 
suFVgcuEVpCOrewbJfkB.type = DataType::kFLOAT; ITensor* prevLayerTensor = 
getInputITensor(0); ScaleMode mode = ScaleMode::kUNIFORM; if 
(sCDdEyIOjXBVHhcakBhd == 1) { mode = ScaleMode::kUNIFORM; } else if 
(UROOthsHWeMcNycRifoq == sCDdEyIOjXBVHhcakBhd) { mode = 
ScaleMode::kELEMENTWISE; } else if (qMpgAuYpEDGDohMcPvRY == 1 && rwPhFWHcKnJsClVtebGW 
== 1 && sCDdEyIOjXBVHhcakBhd == qLXeoFROCbISdsnwpYgl) { mode = ScaleMode::kCHANNEL; 
} else { throw std::runtime_error( 
std::string("Error in ElementwiseAffine Layer. ScaleMode could not be selected because the layer's scale parameters are incorrect.")); 
} if (getLayer()->getInputTensor(0)->hasCBFormat()) { prevLayerTensor = 
aAhADHkrrFEJiHNuuJmX->expandToDimsNCHW(prevLayerTensor); } IScaleLayer* 
qeQuIDaHqnxGPDbPoQJF = aAhADHkrrFEJiHNuuJmX->network->addScale( 
*prevLayerTensor, mode, suFVgcuEVpCOrewbJfkB, reGtUwUlPSwEenEBVIzH, 
oBBTWcYGdlswNVGXNBSQ); assert(qeQuIDaHqnxGPDbPoQJF); 
qeQuIDaHqnxGPDbPoQJF->setName(getLayer()->getName().c_str()); ITensor* 
scaleOutputITensor = qeQuIDaHqnxGPDbPoQJF->getOutput(0); if 
(getLayer()->getInputTensor(0)->hasCBFormat()) { scaleOutputITensor = 
aAhADHkrrFEJiHNuuJmX->squeezeToDims2(scaleOutputITensor); } 
setOpTensorPtr(scaleOutputITensor); } else { lQtIWwFYsIqUppVzkbip = 
aAhADHkrrFEJiHNuuJmX->setupLayerPlugin(getLayer(), this); } } void 
MWElementwiseAffineLayerImpl::loadScaleAndOffset(const char* 
sIJgwWDENmKpDHumWxBH, const char* hbDbKlnXjPcqYngFHTUc) { 
CUDA_CALL(cudaMalloc((void**)&qJWXFXvcpbSwehmlTNru, sizeof(float) * 
qMpgAuYpEDGDohMcPvRY * rwPhFWHcKnJsClVtebGW * qLXeoFROCbISdsnwpYgl)); 
CUDA_CALL(cudaMalloc((void**)&ekFKUFSJOBakwDuHENjA, sizeof(float) * 
fdiBdaeFcIDdmsgMxaJT * hQnbBWOvLzwXEOLhKugH * fPIxBBGHjPkvmoaWByBr)); 
loadScale(sIJgwWDENmKpDHumWxBH); loadOffset(hbDbKlnXjPcqYngFHTUc); } void 
MWElementwiseAffineLayerImpl::setLayerProperties() { TYgANfbwgYWWZKKtdxCC = 
getLayer()->getInputTensor(0)->getHeight(); TbrveedUYuqCPPSPaVab = 
getLayer()->getInputTensor(0)->getWidth(); TAtTmiIniopalIZnGYzp = 
getLayer()->getInputTensor(0)->getChannels(); UdXKaaSyRlPmZWCVHODj = 
TYgANfbwgYWWZKKtdxCC * TbrveedUYuqCPPSPaVab; UROOthsHWeMcNycRifoq = 
UdXKaaSyRlPmZWCVHODj * TAtTmiIniopalIZnGYzp; UIgLxHHJdliWAJIeloVl = 
getLayer()->getInputTensor(0)->getNumElements(); sCDdEyIOjXBVHhcakBhd = 
qMpgAuYpEDGDohMcPvRY * rwPhFWHcKnJsClVtebGW * qLXeoFROCbISdsnwpYgl; hTbrmZSPUORqMIprVbKk 
= fdiBdaeFcIDdmsgMxaJT * hQnbBWOvLzwXEOLhKugH * fPIxBBGHjPkvmoaWByBr; 
assert(sCDdEyIOjXBVHhcakBhd <= UIgLxHHJdliWAJIeloVl); assert(hTbrmZSPUORqMIprVbKk 
<= UIgLxHHJdliWAJIeloVl); } int 
MWElementwiseAffineLayerImpl::pluginEnqueueImpl(const void* const* inputs, 
void** outputs) { long int vVyVzWKKaCvGClCSagOb = ((UIgLxHHJdliWAJIeloVl + 31) / 32) 
* 32; long int vmBqKEmdajzGggqevoGl = (vVyVzWKKaCvGClCSagOb < 1024) ? 
vVyVzWKKaCvGClCSagOb : 1024; long int JIvyuxbwfcCFMnLLAUOz = 
(UIgLxHHJdliWAJIeloVl + vmBqKEmdajzGggqevoGl - 1) / 
vmBqKEmdajzGggqevoGl; if (sCDdEyIOjXBVHhcakBhd == 1) { 
scale_scalar_kernel<<<JIvyuxbwfcCFMnLLAUOz, vmBqKEmdajzGggqevoGl>>>( 
static_cast<const float*>(inputs[0]), static_cast<float*>(outputs[0]), 
qJWXFXvcpbSwehmlTNru, UIgLxHHJdliWAJIeloVl); } else if (qMpgAuYpEDGDohMcPvRY == 1 && 
rwPhFWHcKnJsClVtebGW == 1 && sCDdEyIOjXBVHhcakBhd > 1) { 
scale_vector_kernel<<<JIvyuxbwfcCFMnLLAUOz, vmBqKEmdajzGggqevoGl>>>( 
static_cast<const float*>(inputs[0]), static_cast<float*>(outputs[0]), 
qJWXFXvcpbSwehmlTNru, UdXKaaSyRlPmZWCVHODj, UROOthsHWeMcNycRifoq, 
UIgLxHHJdliWAJIeloVl); } else if (UROOthsHWeMcNycRifoq == 
sCDdEyIOjXBVHhcakBhd) { scale_tensor3d_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<const float*>(inputs[0]), 
static_cast<float*>(outputs[0]), qJWXFXvcpbSwehmlTNru, 
UROOthsHWeMcNycRifoq, UIgLxHHJdliWAJIeloVl); } else { 
scale_matrix2d_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<const float*>(inputs[0]), 
static_cast<float*>(outputs[0]), qJWXFXvcpbSwehmlTNru, 
UdXKaaSyRlPmZWCVHODj, UIgLxHHJdliWAJIeloVl); } if 
(hTbrmZSPUORqMIprVbKk == 1) { offset_scalar_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<float*>(outputs[0]), 
static_cast<float*>(outputs[0]), ekFKUFSJOBakwDuHENjA, UIgLxHHJdliWAJIeloVl, 
VCFeDUyufHZJwIEMHAWF, YmfPcXPXNFZDznkzKZrl, wPWTzEWitnRdoCGvnvtf); } else if 
(fdiBdaeFcIDdmsgMxaJT == 1 && hQnbBWOvLzwXEOLhKugH == 1 && hTbrmZSPUORqMIprVbKk > 1) 
{ offset_vector_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<float*>(outputs[0]), 
static_cast<float*>(outputs[0]), ekFKUFSJOBakwDuHENjA, 
UdXKaaSyRlPmZWCVHODj, UROOthsHWeMcNycRifoq, 
UIgLxHHJdliWAJIeloVl, VCFeDUyufHZJwIEMHAWF, YmfPcXPXNFZDznkzKZrl, 
wPWTzEWitnRdoCGvnvtf); } else if (UROOthsHWeMcNycRifoq == 
hTbrmZSPUORqMIprVbKk) { offset_tensor3d_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<float*>(outputs[0]), 
static_cast<float*>(outputs[0]), ekFKUFSJOBakwDuHENjA, 
UROOthsHWeMcNycRifoq, UIgLxHHJdliWAJIeloVl, VCFeDUyufHZJwIEMHAWF, 
YmfPcXPXNFZDznkzKZrl, wPWTzEWitnRdoCGvnvtf); } else { 
offset_matrix2d_kernel<<<JIvyuxbwfcCFMnLLAUOz, 
vmBqKEmdajzGggqevoGl>>>( static_cast<float*>(outputs[0]), 
static_cast<float*>(outputs[0]), ekFKUFSJOBakwDuHENjA, 
UdXKaaSyRlPmZWCVHODj, UIgLxHHJdliWAJIeloVl, VCFeDUyufHZJwIEMHAWF, 
YmfPcXPXNFZDznkzKZrl, wPWTzEWitnRdoCGvnvtf); } return 0; } void 
MWElementwiseAffineLayerImpl::loadScale(const char* sIJgwWDENmKpDHumWxBH) { 
FILE* PGZiGqeTEpirdHmNpvcb = MWCNNLayer::openBinaryFile(sIJgwWDENmKpDHumWxBH); 
assert(PGZiGqeTEpirdHmNpvcb); long int aFIIJSbJDJUndqPzwinJ = qMpgAuYpEDGDohMcPvRY * 
rwPhFWHcKnJsClVtebGW * qLXeoFROCbISdsnwpYgl; sDWnRjToSPjYnOQzVfhS = 
MALLOC_CALL(sizeof(float) * aFIIJSbJDJUndqPzwinJ); 
MWCNNLayer::call_fread(sDWnRjToSPjYnOQzVfhS, sizeof(float), aFIIJSbJDJUndqPzwinJ, 
PGZiGqeTEpirdHmNpvcb, sIJgwWDENmKpDHumWxBH); CUDA_CALL(cudaMemcpy(qJWXFXvcpbSwehmlTNru, 
sDWnRjToSPjYnOQzVfhS, sizeof(float) * aFIIJSbJDJUndqPzwinJ, cudaMemcpyHostToDevice)); 
fclose(PGZiGqeTEpirdHmNpvcb); } void MWElementwiseAffineLayerImpl::loadOffset(const 
char* hbDbKlnXjPcqYngFHTUc) { FILE* PGZiGqeTEpirdHmNpvcb = 
MWCNNLayer::openBinaryFile(hbDbKlnXjPcqYngFHTUc); assert(PGZiGqeTEpirdHmNpvcb); long 
int aFIIJSbJDJUndqPzwinJ = fdiBdaeFcIDdmsgMxaJT * hQnbBWOvLzwXEOLhKugH * 
fPIxBBGHjPkvmoaWByBr; hYTzvgWajqchLzrmxjqn = MALLOC_CALL(sizeof(float) * 
aFIIJSbJDJUndqPzwinJ); MWCNNLayer::call_fread(hYTzvgWajqchLzrmxjqn, sizeof(float), 
aFIIJSbJDJUndqPzwinJ, PGZiGqeTEpirdHmNpvcb, hbDbKlnXjPcqYngFHTUc); 
CUDA_CALL(cudaMemcpy(ekFKUFSJOBakwDuHENjA, hYTzvgWajqchLzrmxjqn, sizeof(float) * 
aFIIJSbJDJUndqPzwinJ, cudaMemcpyHostToDevice)); fclose(PGZiGqeTEpirdHmNpvcb); } void 
MWElementwiseAffineLayerImpl::cleanup() { if (qJWXFXvcpbSwehmlTNru) { 
CUDA_FREE_CALL(qJWXFXvcpbSwehmlTNru); qJWXFXvcpbSwehmlTNru = nullptr; } if 
(ekFKUFSJOBakwDuHENjA) { CUDA_FREE_CALL(ekFKUFSJOBakwDuHENjA); ekFKUFSJOBakwDuHENjA = 
nullptr; } if (sDWnRjToSPjYnOQzVfhS) { free(sDWnRjToSPjYnOQzVfhS); 
sDWnRjToSPjYnOQzVfhS = nullptr; } if (hYTzvgWajqchLzrmxjqn) { 
free(hYTzvgWajqchLzrmxjqn); hYTzvgWajqchLzrmxjqn = nullptr; } if 
(lQtIWwFYsIqUppVzkbip) { delete lQtIWwFYsIqUppVzkbip; lQtIWwFYsIqUppVzkbip = nullptr; } 
} nvinfer1::ITensor* MWElementwiseAffineLayerImpl::addPluginPreprocess(int 
inIdx) { assert(inIdx == 0); MWTensorBase* inputTensor = 
getLayer()->getInputTensor(inIdx); ITensor* inputITensor = 
MWCNNLayerImpl::getITensor(inputTensor); if (inputTensor->hasTimeDim()) { 
nvinfer1::IShuffleLayer* iShuffleLayer = 
aAhADHkrrFEJiHNuuJmX->network->addShuffle(*inputITensor); std::string layerName 
= getLayer()->getName(); const int numChars = 32; char layerNameStr[numChars]; 
snprintf(layerNameStr, numChars, "shuffleInput%d", inIdx); std::string 
layerNameIn = layerName + layerNameStr; 
iShuffleLayer->setName(layerNameIn.c_str()); 
iShuffleLayer->setFirstTranspose(Permutation({1,0,2})); return 
iShuffleLayer->getOutput(0); } else { return inputITensor; } } 
nvinfer1::ITensor* MWElementwiseAffineLayerImpl::addPluginPostprocess(ITensor* 
pluginOut, int outIdx) { assert(outIdx == 0); if 
(getLayer()->getInputTensor(0)->hasTimeDim()) { nvinfer1::IShuffleLayer* 
oShuffleLayer = aAhADHkrrFEJiHNuuJmX->network->addShuffle(*pluginOut); 
std::string layerName = getLayer()->getName(); const int numChars = 32; char 
layerNameStr[numChars]; snprintf(layerNameStr, numChars, "shuffleOutput%d", 
outIdx); std::string layerNameIn = layerName + layerNameStr; 
oShuffleLayer->setName(layerNameIn.c_str()); 
oShuffleLayer->setFirstTranspose(Permutation({1,0,2})); return 
oShuffleLayer->getOutput(0); } else { return pluginOut; } } } 