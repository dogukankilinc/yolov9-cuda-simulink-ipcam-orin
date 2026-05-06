/* Copyright 2020-2024 The MathWorks, Inc. */

#include "MWCNNLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#include "MWTargetNetworkImplBase.hpp"

#include <string>
#include <stdexcept>
#include <cstdarg>
#include <cassert>
#include <cstdio>
#include <cctype> // for isspace
#include <sstream> // for tokenized processing of strings
#include <vector>

// Get string value from the macro
#define XSTR(x) #x
#define STR(x) XSTR(x)

MWCNNLayer::MWCNNLayer()
    : m_impl(nullptr)
        , m_isCustomLayer(false) {
    }

MWCNNLayer::~MWCNNLayer() {
}

void MWCNNLayer::predict() {
    if (m_impl) {
        m_impl->predict();
    }
}

/**
* everything instantiated during setup() should be cleaned up here
*/
void MWCNNLayer::cleanup() {
    if (m_impl) {
        m_impl->cleanup();
        delete m_impl;
        m_impl = 0;
    }

    for (int idx = 0; idx < static_cast<int>(getNumOutputs()); idx++) {
        MWTensorBase* op = getOutputTensor(idx);
        delete op;
        op = 0;
        m_output[idx] = 0;
    }

    // free up tensor maps
    m_input.clear();
    m_output.clear();
}



void MWCNNLayer::allocate() {
    if (m_impl) {
        // allocate memory for each input tensor, needed by ARM target (empty for other targets)
        for (int inIdx = 0; inIdx < static_cast<int>(getNumInputs()); ++inIdx) {
            m_impl->allocateInput(inIdx);
        }

        // allocate memory for each output tensor
        for (int outIdx = 0; outIdx < static_cast<int>(getNumOutputs()); ++outIdx) {
            m_impl->allocateOutput(outIdx);
        }

        // allocate any auxiliary memory needed by the layer
        m_impl->allocate();
    }
}

void MWCNNLayer::deallocate() {
    if (m_impl) {
        // deallocate memory for each input tensor, needed by ARM target (empty for other targets)
        for (int inIdx = 0; inIdx < static_cast<int>(getNumInputs()); ++inIdx) {
            m_impl->deallocateInput(inIdx);
        }

        // deallocate memory for each output tensor
        for (int outIdx = 0; outIdx < static_cast<int>(getNumOutputs()); ++outIdx) {
            this->deallocateOutput(outIdx);
        }

        // deallocate any auxiliary memory needed by the layer
        m_impl->deallocate();
    }
    resetTensorDataPointers();
}

void MWCNNLayer::deallocateOutput(int outIdx) {
    MWTensorBase* opTensorBase = getOutputTensor(outIdx);

    bool bufferReuse = opTensorBase->getopBufIndex() >= 0;
    if (!bufferReuse) {
        bool hasData = true;

        if (getOutputTensor(outIdx)->isFloat()) {
            hasData = static_cast<MWTensor<float>*>(opTensorBase)->getData() != nullptr;
        } else {
            assert(getOutputTensor(outIdx)->isInt8());
            hasData = static_cast<MWTensor<signed char>*>(opTensorBase)->getData() != nullptr;
        }

        if (hasData) {
            m_impl->deallocateOutput(outIdx);
        }
    }
}

// remove dangling pointers
void MWCNNLayer::resetTensorDataPointers() {
    for (int i = 0; i < static_cast<int>(getNumOutputs()); ++i) {
        MWTensorBase* opTensorBase = getOutputTensor(i);

        if (opTensorBase->isFloat()) {
            static_cast<MWTensor<float>*>(opTensorBase)->setData((float*)nullptr);
        } else {
            assert(opTensorBase->isInt8());
            static_cast<MWTensor<signed char>*>(opTensorBase)->setData((signed char*)nullptr);
        }
    }
}

void MWCNNLayer::postSetup() {
    if (m_impl) {
        m_impl->postSetup();
    }
}

void MWCNNLayer::setName(const std::string& n) {
    m_name = n;
    return;
}

MWTensorBase* MWCNNLayer::getInputTensor(int index) {
    std::map<int, MWTensorBase*>::iterator it = m_input.find(index);
    assert(it != m_input.end());
    return it->second;
}

MWTensorBase* MWCNNLayer::getOutputTensor(size_t index) {
    std::map<int, MWTensorBase*>::iterator it = m_output.find(static_cast<const int>(index));
    assert(it != m_output.end());
    return it->second;
}

void MWCNNLayer::setInputTensor(MWTensorBase* other, int index) {
    m_input[index] = other;
}

int MWCNNLayer::getHeight(int index) {
    return getOutputTensor(index)->getHeight();
}

int MWCNNLayer::getBatchSize() {
    // return batch size from the output tensor
    return getOutputTensor(0)->getBatchSize();
}

int MWCNNLayer::getWidth(int index) {
    return getOutputTensor(index)->getWidth();
}

int MWCNNLayer::getNumInputFeatures(int index) {
    return getInputTensor(index)->getChannels();
}

int MWCNNLayer::getNumOutputFeatures(int index) {
    return getOutputTensor(index)->getChannels();
}

float* MWCNNLayer::getLayerOutput(int index) {
    // assumes layer output is float type
    return static_cast<MWTensor<float>*>(getOutputTensor(index))->getData();
}

void MWCNNLayer::resizeOutputTensor(int numHeight,
                                    int numWidth,
                                    int numChannels,
                                    int batchSize,
                                    int sequenceLength,
                                    int index) {
    std::map<int, MWTensorBase*>::iterator it = m_output.find(index);
    assert(it != m_output.end());
    it->second->setHeight(numHeight);
    it->second->setWidth(numWidth);
    it->second->setChannels(numChannels);
    it->second->setBatchSize(batchSize);
    it->second->setSequenceLength(sequenceLength);
}

void MWCNNLayer::setupTensors(int numInputs, int numOutputs, ...) {

    // initialize the variable argument list
    va_list args;
    va_start(args, numOutputs);

    // set all the input tensors
    for (int iTensor = 0; iTensor < numInputs; iTensor++) {
        MWTensorBase* inputTensor = va_arg(args, MWTensorBase*);
        setInputTensor(inputTensor, iTensor);
    }

    std::vector<const char*> outFormats(numOutputs, nullptr);

    // get output format arguments for all the output tensors
    for (int oTensor = 0; oTensor < numOutputs; oTensor++) {
        outFormats[oTensor] = va_arg(args, const char*);
    }

    // set buffer index for all the output tensors
    for (int oTensor = 0; oTensor < numOutputs; oTensor++) {

        int bufferIdx = va_arg(args, int);

        // allocate the tensor
        allocateOutputTensor<float>(-1, -1, -1, -1, -1, nullptr, outFormats[oTensor], oTensor);

        getOutputTensor(oTensor)->setopBufIndex(bufferIdx);
    }

    va_end(args);
}

// static util functions
/*
    open filename following the steps below
    1. open file with provided filePath
    2. if failure, replace spaces in provided filePath with underscore and open that path
    3. upon failure, 
        3a. If MW_RUNTIME_DL_DATA_PATH macro is defined, compute the path using mwGetRuntimeDLDataPath
        3b. Instead if MW_DL_DATA_PATH is defined
            3b.i. Compute path using the environment variable CODER_DATA_PATH or USER_DL_DATA_PATH
            3b.ii. If CODER_DATA_PATH and USER_DL_DATA_PATH are not set, then compute the path using the value of the MW_DL_DATA_PATH macro.
        3c. If 3a. and 3b. are false, check if the environment variable CODER_DATA_PATH or USER_DL_DATA_PATH is set, if it is set then return the path from it.
        3d. If CODER_DATA_PATH and USER_DL_DATA_PATH are not set, then extract the file name from the provided filePath and open the file from the current directory
    4. if failure, check if path returned by step 3 has path separator, if it is only a fileName (3d) then open the file from the immediate parent directory
    5. if failure, repeat steps 3 using the reformatted path (spaces formatted as underscores)
    6. if failure, report that file cannot be found
*/

FILE* MWCNNLayer::openBinaryFile(const char* filePath) {

    FILE* fp = fopen(filePath, "rb");
    if (fp) {
        return fp;
    }

    std::string reformattedPath = MWCNNLayer::reformatPathForHSPWorkflow(filePath);
    fp = fopen(reformattedPath.c_str(), "rb");
    if (fp) {
        return fp;
    }
    std::string fileS = MWCNNLayer::computeFilePathOnFailure(filePath);
    if (!fileS.empty()) {
        fp = fopen(fileS.c_str(), "rb");
    }
    if (fp) {
        return fp;
    }

    if (fileS.find_first_of("/\\") == std::string::npos){
        // if file path does not contain path delimiters, try opening it from parent folder. This is to support executing SIL from /sil folder.
        std::string relativePathToParent = MWCNNLayer::computeRelativePathToParentFolder(fileS);
        fp = fopen(relativePathToParent.c_str(), "rb");
        if (fp){
            return fp;
        }
    }

    std::string reformattedFileS = MWCNNLayer::computeFilePathOnFailure(reformattedPath);
    if (!reformattedFileS.empty()) {
        fp = fopen(reformattedFileS.c_str(), "rb");
    }

    if (fp) {
        return fp;
    } else {

        std::string errMsg = std::string("Unable to find the ") + fileS +
            std::string(" binary file in ") + MWCNNLayer::computeCodegenFolder(fileS);
        if (fileS.compare(reformattedFileS) != 0) {
            // if provided filePath and reformatted filePath don't match then mention reformatted
            // filePath in the error message as well
            errMsg = errMsg + std::string(" or in ") +
                MWCNNLayer::computeCodegenFolder(reformattedFileS);
        }
        errMsg = errMsg + std::string(".");
        throw std::runtime_error(errMsg.c_str());
    }
}


// returns the codegenDirectory corresponding to the provided file path
//          provided file path: "/someDir1/someDir2/somefile.bin"
//          returns: "/someDir1/someDir2/"
//
//          provided file path: "somefile.bin"
//          returns: "."
std::string MWCNNLayer::computeCodegenFolder(std::string filePath) {
    /* Code to extract the directory path */
    std::string codegenFolder;

    size_t fNamePos = filePath.find_last_of("/\\");

    if (fNamePos != std::string::npos) {
        codegenFolder = filePath.substr(0, fNamePos);
    } else {
        /* Default path when there is no directory*/
        codegenFolder = std::string(".");
    }

    return codegenFolder;
}

// returns the path computed by  mwGetRuntimeDLDataPath if user has set MW_RUNTIME_DL_DATA_PATH
// if MW_DL_DATA_PATH is set instead, returns the path based on if user has set CODER_DATA_PATH or USER_DL_DATA_PATH.
// If ML_DL_DATA_PATH is set, and CODER_DATA_PATH and USER_DL_DATA_PATH are not set, then we prepend the filepath with ML_DL_DATA_PATH. (This code path is triggerd for NVIDIA and ARM HSP)
// if MW_DL_DATA_PATH is not set, however, if CODER_DATA_PATH or USER_DL_DATA_PATH are set then we extract filepath based on the set environment variable.
// otherwise extracts fileName from the provided filePath 
//          provided filePath: /someDir1/someDir2/somefile.bin
//          returns: somefile.bin
std::string MWCNNLayer::computeFilePathOnFailure(std::string filePath) {
    
    size_t pos = 0;

#ifdef MW_RUNTIME_DL_DATA_PATH
    extern void mwGetRuntimeDLDataPath(std::string&);
    mwGetRuntimeDLDataPath(filePath);
#elif defined(MW_DL_DATA_PATH)
    //For HSP workflow, we hit this branch since we define MW_DL_DATA_PATH for both ARM and NVIDIA HSP workflow while generating code.

    std::string envVarFilePath = MWCNNLayer::getCustomUserDataPath(filePath);
    if (!envVarFilePath.empty()) {
        filePath = envVarFilePath;
    } else {   
        filePath = MWCNNLayer::getMwDlDataFilePath(filePath);
    }
#else
    // The below logic is to support non-HSP workflows. Users can set CODER_DATA_PATH or USER_DL_DATA_PATH and relocate weight and bias files from the default codegen directory and run the generated executable.
    // Executable will load weights and bias from the path specified on CODER_DATA_PATH or USER_DL_DATA_PATH. We come here only for non-HSP workflows.

    std::string envVarFilePath = MWCNNLayer::getCustomUserDataPath(filePath);
    if (!envVarFilePath.empty()) {
        return envVarFilePath;
    }
    
#if defined(_WIN32) || defined(_WIN64)

    char delim_unix[] = "/";
    char delim_win[] = "\\";

    while (((pos = filePath.find(delim_unix)) != std::string::npos) ||
           ((pos = filePath.find(delim_win)) != std::string::npos))
#else
    char delim_unix[] = "/";

    while ((pos = filePath.find(delim_unix)) != std::string::npos)
#endif
    {
        if (pos == (filePath.size() - 1)) {
            filePath = "";
            break;
        }
        filePath = filePath.substr(pos + 1);
    }
#endif

    return filePath;
}

std::string MWCNNLayer::computeRelativePathToParentFolder(const std::string& filePath) {

    assert(filePath.find_first_of("/\\") == std::string::npos);
#if defined(_WIN32) || defined(_WIN64)
    std::string delim = "\\";
#else
    std::string delim = "/";
#endif

    // Create "../abc.bin" or "..\\abc.bin"
    return ".." + delim + filePath;
}

std::string MWCNNLayer::reformatPathForHSPWorkflow(const char* fileName) {
    // if there are spaces in the path, then it is only because the codegenDirectory has space in it
    // replace spaces in the path with underscore to mimic path reformatting for HSP workflows
    std::string reformattedPath(fileName);
    for (size_t i = 0; i < reformattedPath.length(); i++) {
        if (isspace(reformattedPath[i])) {
            reformattedPath[i] = '_';
        }
    }
    return reformattedPath;
}

std::runtime_error MWCNNLayer::getFileOpenError(const char* filename) {
    const std::string message = std::string("Error! Unable to open file ") + std::string(filename);
    return std::runtime_error(message);
}

// This is a helper function for tokenized processing of 'startDirPath' to construct dataFilePath
std::vector<std::string> tokenize(const std::string &str, char delim) {
    std::vector<std::string> tokens;
    std::stringstream ss(str);
    std::string token;
    while (std::getline(ss, token, delim)) {
        if (!token.empty()) {
            tokens.push_back(token);
        }
    }
    return tokens;
}

// fetch the file path based on the value of the macro MW_DL_DATA_PATH
std::string MWCNNLayer::getMwDlDataFilePath(const std::string& fileS) {
    std::string startDirPath = STR(MW_DL_DATA_PATH);
    size_t posOfLeadingPathSep;
    std::string fileSWithoutRelPathSep;
    std::string dataFilePath;
    fileSWithoutRelPathSep = fileS.substr(2, fileS.size());
    posOfLeadingPathSep = fileSWithoutRelPathSep.find_first_of("/\\");

    if (posOfLeadingPathSep == std::string::npos) {
        /* No match of "/" in fileSWithoutRelPathSep, it happens when fileS
        contains only name. */
        dataFilePath = startDirPath + "/" + fileSWithoutRelPathSep;
    } else {
        std::string codegenDir;
        codegenDir = fileS.substr(2, posOfLeadingPathSep);

        // Tokenize 'startDirPath'
        std::vector<std::string> tokenizedStartDirPath = tokenize(startDirPath, '/');

        // If the -d codegen flag is specified, the codegenDir is 
        // already present in startDirPath. This duplicacy needs to be
        // removed. This happens in the case of ARM tests for RPi, atleast.
        if (!tokenizedStartDirPath.empty() && tokenizedStartDirPath.back() == codegenDir) {            
            size_t lastDelimPos = startDirPath.rfind('/');
            startDirPath = startDirPath.substr(0, lastDelimPos);
        }
        
        dataFilePath = startDirPath + "/" + fileSWithoutRelPathSep;
    }

    return dataFilePath;
}

// Takes in a file path and an environment variable.
// If the environment variable is set to some nonempty value, then extracts the file name from the file path and appends it to the contents of the environment variable (which is expected to be a file path without a name.)
// Otherwise, returns an empty string.
std::string MWCNNLayer::getFilePathFromEnvironmentVariable(const std::string& filePath, std::string ev) {
    char* usrDataPath;
    

    // Get file path from user environment
    usrDataPath = getenv(ev.c_str());
    if (usrDataPath != nullptr) {
        std::string dataFilePath;
        
        /* User has provided custom weight files path */
        size_t posOfTrailingPathSep = filePath.find_last_of("/\\");
        if (posOfTrailingPathSep != std::string::npos) {
            std::string fileNameWithoutPath(filePath.substr(posOfTrailingPathSep));
            dataFilePath = usrDataPath + fileNameWithoutPath;
        } else {
            /* fileS contains only weight file without any directory
            structure.
            */
            dataFilePath = usrDataPath + filePath;
        }
        return dataFilePath;
    } else {
        return std::string();
    }
}

// Check CODER_DATA_PATH first, and then USER_DL_DATA_PATH. Return empty if neither env variable is set.
std::string MWCNNLayer::getCustomUserDataPath(const std::string& filePath) {
    std::string mwCoderDataFilePath = MWCNNLayer::getFilePathFromEnvironmentVariable(filePath,"CODER_DATA_PATH");
    
    if (!mwCoderDataFilePath.empty()) {
        return mwCoderDataFilePath;
    } else {
        return MWCNNLayer::getFilePathFromEnvironmentVariable(filePath,"USER_DL_DATA_PATH");
    }
}
