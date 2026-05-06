#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTensorBase.hpp"
#include "tensorrt/MWTensorrtVersionSpecificImpl.hpp"
#include "tensorrt/MWTensorrtCommonHeaders.hpp"
#include "tensorrt/MWTensorrtTargetNetworkImpl.hpp"
#include "tensorrt/MWTensorrtCustomLayerBase.hpp"
#include "tensorrt/MWTensorrtLayerImplFactory_precompile.hpp"
#else
#include "MWTensorBase.hpp"
#include "MWTensorrtVersionSpecificImpl.hpp"
#include "MWTensorrtCommonHeaders.hpp"
#include "MWTensorrtTargetNetworkImpl.hpp"
#include "MWTensorrtCustomLayerBase.hpp"
#include "MWTensorrtLayerImplFactory.hpp"
#endif