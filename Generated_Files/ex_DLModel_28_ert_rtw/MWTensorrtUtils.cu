#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtUtils.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtUtils.hpp"
#endif
#include <string>
 ITensor* MWTensorrtUtils::insertPaddingLayer(ITensor* prevLayerTensor, 
MWTensorrtTarget::MWTargetNetworkImpl* aAhADHkrrFEJiHNuuJmX, const char* 
layerName, int gLigJhdhajdbqAuZwhOM, int gFIRzpicltDDOEfHdtoM, int 
eypvwTKabmFWrxfLLOWc, int gJJWRjXklapoEujuiRhJ) { IPaddingLayer* iPaddingLayer = 
aAhADHkrrFEJiHNuuJmX->network->addPaddingNd( *prevLayerTensor, 
DimsHW{gLigJhdhajdbqAuZwhOM, gFIRzpicltDDOEfHdtoM}, DimsHW{eypvwTKabmFWrxfLLOWc, 
gJJWRjXklapoEujuiRhJ}); std::string padLayerName = layerName + 
std::string("_pad"); iPaddingLayer ->setName(padLayerName.c_str()); ITensor* 
opITensor = iPaddingLayer ->getOutput(0); return opITensor; }