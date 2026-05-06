/* Copyright 2019-2022 The MathWorks, Inc. */

#include "MWConcatenationLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

#include <cstdarg>
#include <cassert>
#include <cstring>

MWConcatenationLayer::MWConcatenationLayer() {
}

MWConcatenationLayer::~MWConcatenationLayer() {
}

void MWConcatenationLayer::createConcatenationLayer(MWTargetNetworkImplBase* ntwk_impl,
                                                    int numInputs,
                                                    ...) {
    va_list args;
    va_start(args, numInputs);

    for (int i = 0; i < numInputs; i++) {
        MWTensorBase* inputTensor = va_arg(args, MWTensorBase*);
        setInputTensor(inputTensor, i);
    }

    dimension = va_arg(args, int);
    const char* dimensionLabel = va_arg(args, const char*);

    if (strcmp(dimensionLabel, "S") == 0) {
        // 3p codegen only supports two spatial dimensions, which will always be the first two dimensions
        assert(dimension == 1 || dimension == 2);
    } else if (strcmp(dimensionLabel, "C") == 0) {
        dimension = 3;
    } else {
        assert(false);
    }

    const char* outFormat = va_arg(args, const char*);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    int outbufIdx = va_arg(args, int);
    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createConcatenationLayerImpl(this, ntwk_impl, dimension);
}

void MWConcatenationLayer::propagateSize() {
    MWTensorBase* firstInputTensor = getInputTensor(0);
    int height = firstInputTensor->getHeight();
    int width = firstInputTensor->getWidth();
    int numChannels = firstInputTensor->getChannels();
    int batchSize = firstInputTensor->getBatchSize();
    int sequenceLength = firstInputTensor->getSequenceLength();
    for (int k = 1; k < static_cast<int>(getNumInputs()); k++) {
        // Determine along which dimension concatenation will take place. Check that all input
        // tensors match in size in all dimensions except the concatenation dimension.
        assert(batchSize == getInputTensor(k)->getBatchSize());
        assert(sequenceLength == getInputTensor(k)->getSequenceLength());

        switch (dimension) {
        case 1: {
            assert(getInputTensor(0)->getWidth() == getInputTensor(k)->getWidth());
            assert(getInputTensor(0)->getChannels() == getInputTensor(k)->getChannels());
            height += (int)getInputTensor(k)->getHeight();
        } break;

        case 2: {
            assert(getInputTensor(0)->getHeight() == getInputTensor(k)->getHeight());
            assert(getInputTensor(0)->getChannels() == getInputTensor(k)->getChannels());
            width += (int)getInputTensor(k)->getWidth();
        } break;

        case 3: {
            assert(getInputTensor(0)->getHeight() == getInputTensor(k)->getHeight());
            assert(getInputTensor(0)->getWidth() == getInputTensor(k)->getWidth());
            numChannels += (int)getInputTensor(k)->getChannels();
        } break;

        default:
            assert((dimension == 1 || dimension == 2) || dimension == 3);
        }
    }

    resizeOutputTensor(height, width, numChannels, batchSize, sequenceLength);

    m_impl->propagateSize();
}
