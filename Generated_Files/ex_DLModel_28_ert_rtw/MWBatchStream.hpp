/* Copyright 2018-2024 The MathWorks, Inc. */
#ifndef MWBATCH_STREAM_HPP
#define MWBATCH_STREAM_HPP

#ifdef PRECOMPILE_LAYERFILES
#include "tensorrt/MWTensorrtCNNLayerImpl.hpp"
#else
#include "MWTensorrtCNNLayerImpl.hpp"
#endif

#include <iterator> // needed for std::istream_iterator
#include <fstream>  // needed for std::ofstream
#include <vector>
#include <assert.h>
#include <algorithm>
#include <string.h> //needed for strcmp

#include "NvInfer.h"
#ifndef NV_TENSORRT_MAJOR
#include "NvInferVersion.h"
#endif

/* This file contains the classes ,used to parse the calibration data set .
 * Parsed data is used by TensorRT for creating the Calibration Table
 * which is then used for int8 execution*/

extern std::string getValidDataPath(std::string& fileName);
extern void CHECK(cudaError_t status);
extern std::string gvalidDatapath;
using namespace nvinfer1;


class BatchStream {

  public:
    BatchStream(int maxBatches, std::string& calibrationDataPath)
        : mNumCalibrationBatches(maxBatches)
        , m_calibrationDataPath(calibrationDataPath)
        , mCalibrationBatchCount(0) {


        std::string filename = m_calibrationDataPath + "/batch0";
        std::string filename1 = getValidDataPath(filename);
        FILE* file = fopen(filename1.c_str(), "rb");
        if (file == NULL) {
            printf("Unable to open file\n");
            exit(1);
        }

        int d[4];
        if (fread(d, sizeof(int), 4, file) != 4) {
            throw std::runtime_error("Unexpected number of bytes read from " + filename1);
        }

        fclose(file);
        mBatchSize = 1; // batchsize is one because this is the batchsize passed to enqueue

        mImageSize = d[0] * d[1] * d[2] * d[3];

        // allocate memory for data buffer
        mBatchData = new float[mBatchSize * mImageSize];
    }

    ~BatchStream() {

        if (mBatchData) {
            delete[] mBatchData;
            mBatchData = 0;
        }
    }

    float* getBatchPtr() {
        return mBatchData;
    }

    int getBatchSize() const {

        return mBatchSize;
    }

    bool next() {

        if (mCalibrationBatchCount == mNumCalibrationBatches) {
            return false;
        } else {
            return true;
        }
    }

    float* getBatch() {

        std::string inputFileName =
            m_calibrationDataPath + "/batch" + std::to_string(mCalibrationBatchCount);

        std::string filename1 = getValidDataPath(inputFileName);

        FILE* file = fopen(filename1.c_str(), "rb");
        if (file == NULL) {
            printf("Unable to open file %s \n", filename1.c_str());
            exit(1);
        }

        if (mCalibrationBatchCount == 0) {
            int status = fseek(file, sizeof(int) * 4, SEEK_SET);
            assert(status == 0);
        }

        size_t readInputCount = fread(getBatchPtr(), sizeof(float), mBatchSize * mImageSize, file);
        fclose(file);

        mCalibrationBatchCount++;

        return getBatchPtr();
    }

    long int getImageSize() {
        return mImageSize;
    }


  private:
    int mBatchSize;
    int mCalibrationBatchCount;
    int mNumCalibrationBatches;
    long int mImageSize;
    float* mBatchData;
    std::string m_calibrationDataPath;
};

/*
  By default we choose IInt8EntropyCalibrator2 and based on our experiments,
  it seems IInt8EntropyCalibrator2 doesn't perform well in some cases. Therefore,
  exposing hidden property via coder.DeepLearningConfig to override this default
  calibrator. In case, if some user comes back with accuracy drop issues we can
  suggest this hidden flag to choose IInt8MinMaxCalibrator (defined further down).
*/
class Int8EntropyCalibrator final : public IInt8EntropyCalibrator2 {

  public:
    Int8EntropyCalibrator(BatchStream& stream, int /* firstBatch */, bool readCache = true)
        : mStream(stream)
        , mReadCache(readCache) {
        mInputCount = mStream.getBatchSize() * mStream.getImageSize();
        CUDA_CALL(cudaMalloc(&mDeviceInput, mInputCount * sizeof(float)));
    }

    virtual ~Int8EntropyCalibrator() {
        if (mDeviceInput) {
            CUDA_FREE_CALL((mDeviceInput));
            mDeviceInput = nullptr;
        }
    }

    int getBatchSize() const noexcept override {
        return mStream.getBatchSize();
    }

    bool getBatch(void* bindings[], const char* /* names */ [], int /* nbBindings */) noexcept override {
        if (!mStream.next()) {
            return false;
        }

        CUDA_CALL(cudaMemcpy(mDeviceInput, mStream.getBatch(), mInputCount * sizeof(float),
                             cudaMemcpyHostToDevice));
        bindings[0] = mDeviceInput;
        return true;
    }

    const void* readCalibrationCache(size_t& length) noexcept override {
        mCalibrationCache.clear();

        gvalidDatapath.append("/");

        gvalidDatapath.append("CalibrationTable");
        std::ifstream input(gvalidDatapath.c_str(), std::ios::binary);
        input >> std::noskipws;
        if (mReadCache && input.good()) {
            std::copy(std::istream_iterator<char>(input), std::istream_iterator<char>(),
                      std::back_inserter(mCalibrationCache));
        }

        length = mCalibrationCache.size();
        return length ? &mCalibrationCache[0] : nullptr;
    }

    void writeCalibrationCache(const void* cache, size_t length) noexcept override{

        gvalidDatapath.append("/");

        gvalidDatapath.append("CalibrationTable");
        std::ofstream output(gvalidDatapath.c_str(), std::ios::binary);
        output.write(reinterpret_cast<const char*>(cache), length);
    }

  private:
    BatchStream& mStream;
    bool mReadCache{true};

    size_t mInputCount;
    void* mDeviceInput{nullptr};
    std::vector<char> mCalibrationCache;
};

class Int8MinMaxCalibrator final : public IInt8MinMaxCalibrator {

  public:
        Int8MinMaxCalibrator(BatchStream& stream, int /* firstBatch */, bool readCache = true)
        : mStream(stream)
        , mReadCache(readCache) {
        mInputCount = mStream.getBatchSize() * mStream.getImageSize();
        CUDA_CALL(cudaMalloc(&mDeviceInput, mInputCount * sizeof(float)));
    }

    virtual ~Int8MinMaxCalibrator() {
        if (mDeviceInput) {
            CUDA_FREE_CALL((mDeviceInput));
            mDeviceInput = nullptr;
        }
    }

    int getBatchSize() const noexcept override {
        return mStream.getBatchSize();
    }

        bool getBatch(void* bindings[], const char* /* names */ [], int /* nbBindings */ ) noexcept override {
        if (!mStream.next()) {
            return false;
        }

        CUDA_CALL(cudaMemcpy(mDeviceInput, mStream.getBatch(), mInputCount * sizeof(float),
                             cudaMemcpyHostToDevice));
        bindings[0] = mDeviceInput;
        return true;
    }

    const void* readCalibrationCache(size_t& length) noexcept override {
        mCalibrationCache.clear();

        gvalidDatapath.append("/");

        gvalidDatapath.append("CalibrationTable");
        std::ifstream input(gvalidDatapath.c_str(), std::ios::binary);
        input >> std::noskipws;
        if (mReadCache && input.good()) {
            std::copy(std::istream_iterator<char>(input), std::istream_iterator<char>(),
                      std::back_inserter(mCalibrationCache));
        }

        length = mCalibrationCache.size();
        return length ? &mCalibrationCache[0] : nullptr;
    }

    void writeCalibrationCache(const void* cache, size_t length) noexcept override {

        gvalidDatapath.append("/");

        gvalidDatapath.append("CalibrationTable");
        std::ofstream output(gvalidDatapath.c_str(), std::ios::binary);
        output.write(reinterpret_cast<const char*>(cache), length);
    }

  private:
    BatchStream& mStream;
    bool mReadCache{true};

    size_t mInputCount;
    void* mDeviceInput{nullptr};
    std::vector<char> mCalibrationCache;
};
    
#endif

