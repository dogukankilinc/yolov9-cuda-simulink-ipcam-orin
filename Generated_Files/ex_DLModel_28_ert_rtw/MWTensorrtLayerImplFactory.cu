#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWLayerImplFactory.hpp"
#include "layer/MWCNNLayerImplBase.hpp"
#include "tensorrt/MWTensorrtLayerImplFactory.hpp"
#include "tensorrt/MWTensorrtCNNLayerImpl.hpp"
#include "tensorrt/MWTensorrtTargetNetworkImpl.hpp"
#else
#include "MWLayerImplFactory.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorrtLayerImplFactory.hpp"
#include "MWTensorrtCNNLayerImpl.hpp"
#include "MWTensorrtTargetNetworkImpl.hpp"
#endif
 class MWCNNLayer;
#ifndef CREATE_INPUT_LAYER_IMPL_DEFINITION
#define CREATE_INPUT_LAYER_IMPL_DEFINITION

#include "MWTensorrtInputLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createInputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWTensorrtTarget::MWInputLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_CONV_LAYER_IMPL_DEFINITION
#define CREATE_CONV_LAYER_IMPL_DEFINITION

#include "MWTensorrtConvLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createConvLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
int arg11,
int arg12,
int arg13,
int arg14,
int arg15,
const char* arg16,
const char* arg17) {
return new MWTensorrtTarget::MWConvLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12,
arg13,
arg14,
arg15,
arg16,
arg17);
}

#endif

#ifndef CREATE_CONCATENATION_LAYER_IMPL_DEFINITION
#define CREATE_CONCATENATION_LAYER_IMPL_DEFINITION

#include "MWTensorrtConcatenationLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createConcatenationLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3) {
return new MWTensorrtTarget::MWConcatenationLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2),
arg3);
}

#endif

#ifndef CREATE_AVGPOOLING_LAYER_IMPL_DEFINITION
#define CREATE_AVGPOOLING_LAYER_IMPL_DEFINITION

#include "MWTensorrtAvgPoolingLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createAvgPoolingLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
bool arg11) {
return new MWTensorrtTarget::MWAvgPoolingLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11);
}

#endif

#ifndef CREATE_ADDITION_LAYER_IMPL_DEFINITION
#define CREATE_ADDITION_LAYER_IMPL_DEFINITION

#include "MWTensorrtAdditionLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createAdditionLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWTensorrtTarget::MWAdditionLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DEFINITION
#define CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DEFINITION

#include "MWTensorrtElementwiseAffineLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createElementwiseAffineLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
bool arg9,
int arg10,
int arg11,
const char* arg12,
const char* arg13) {
return new MWTensorrtTarget::MWElementwiseAffineLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12,
arg13);
}

#endif

#ifndef CREATE_MAXPOOLING_LAYER_IMPL_DEFINITION
#define CREATE_MAXPOOLING_LAYER_IMPL_DEFINITION

#include "MWTensorrtMaxPoolingLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createMaxPoolingLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
int arg9,
int arg10,
bool arg11,
int arg12) {
return new MWTensorrtTarget::MWMaxPoolingLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12);
}

#endif

#ifndef CREATE_OUTPUT_LAYER_IMPL_DEFINITION
#define CREATE_OUTPUT_LAYER_IMPL_DEFINITION

#include "MWTensorrtOutputLayerImpl.hpp"
MWCNNLayerImplBase* MWTensorrtLayerImplFactory::createOutputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWTensorrtTarget::MWOutputLayerImpl(arg1,
static_cast<MWTensorrtTarget::MWTargetNetworkImpl*>(arg2));
}

#endif
