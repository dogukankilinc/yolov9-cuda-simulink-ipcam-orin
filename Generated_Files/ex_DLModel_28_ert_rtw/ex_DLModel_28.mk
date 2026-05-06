###########################################################################
## Makefile generated for component 'ex_DLModel_28'. 
## 
## Makefile     : ex_DLModel_28.mk
## Generated on : Tue May 05 18:09:34 2026
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/ex_DLModel_28.elf
## Product type : executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile

PRODUCT_NAME              = ex_DLModel_28
MAKEFILE                  = ex_DLModel_28.mk
MATLAB_ROOT               = $(MATLAB_WORKSPACE)/C/Program_Files/MATLAB/R2025b
MATLAB_BIN                = $(MATLAB_WORKSPACE)/C/Program_Files/MATLAB/R2025b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = $(MATLAB_WORKSPACE)/C/Users/Dogukan.kilinc/OneDrive_-_figes.com.tr/Documents/MATLAB/Examples/R2025b/nvidia/ClassifyWebcamImagesOnNVIDIAJetsonFromSimulinkExample
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ..
LINUX_TARGET_CUSTOM_LIBS  = -lSDL
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          NVCC for NVIDIA Embedded Processors
# Supported Version(s):    
# ToolchainInfo Version:   2025b
# Specification Revision:  1.0
# 

#-----------
# MACROS
#-----------

CCOUTPUTFLAG  = --output_file=
LDOUTPUTFLAG  = --output_file=
XCOMPILERFLAG = -Xcompiler

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm -lm

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: NVCC for NVIDIA Embedded Processors1.0 NVIDIA CUDA C Compiler Driver
CC = nvcc

# Linker: NVCC for NVIDIA Embedded Processors1.0 NVIDIA CUDA C Linker
LD = nvcc

# C++ Compiler: NVCC for NVIDIA Embedded Processors1.0 NVIDIA CUDA C++ Compiler Driver
CPP = nvcc

# C++ Linker: NVCC for NVIDIA Embedded Processors1.0 NVIDIA CUDA C++ Linker
CPP_LD = nvcc

# Archiver: NVCC for NVIDIA Embedded Processors1.0 Archiver
AR = ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = $(MEX_PATH)/mex

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: Make Tool
MAKE = make


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g -G
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g -G
OUTPUT_FLAG         = -o
CPPDEBUG            = -g -G
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g -G
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  =
ECHO                = echo
MV                  =
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = -ruvs
CFLAGS               = -rdc=true -Xcudafe "--diag_suppress=unsigned_compare_with_zero" \
                       -c \
                       -Xcompiler -MMD,-MP \
                       -O0
CPPFLAGS             = -rdc=true -Xcudafe "--diag_suppress=unsigned_compare_with_zero" \
                       -c \
                       -Xcompiler -MMD,-MP \
                       -O2
CPP_LDFLAGS          = -lm -lrt -ldl \
                       -Xlinker -rpath,/usr/lib32 -Xnvlink -w -lcudart -lcuda -Wno-deprecated-gpu-targets
CPP_SHAREDLIB_LDFLAGS  = -shared  \
                         -lm -lrt -ldl \
                         -Xlinker -rpath,/usr/lib32 -Xnvlink -w -lcudart -lcuda -Wno-deprecated-gpu-targets
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -lm -lrt -ldl \
                       -Xlinker -rpath,/usr/lib32 -Xnvlink -w -lcudart -lcuda -Wno-deprecated-gpu-targets
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE) -j4
SHAREDLIB_LDFLAGS    = -shared  \
                       -lm -lrt -ldl \
                       -Xlinker -rpath,/usr/lib32 -Xnvlink -w -lcudart -lcuda -Wno-deprecated-gpu-targets



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/ex_DLModel_28.elf
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I$(MATLAB_ROOT)/toolbox/eml/externalDependency/timefun -I$(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/include -I$(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/export/include/vision -I$(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/sources/utils -I$(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/realtime/targets/linux/include -I$(START_DIR)/ex_DLModel_28_ert_rtw -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert -I$(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/include -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils -I$(MATLAB_ROOT)/toolbox/target/codertarget/rtos/inc

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D_SIMULINK_TGT_ -DMW_CUDA_ARCH=870 -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__ -DMW_CAN_BITRATE=500000 -DMW_CAN_ALLOWALLMSGS=1 -DMW_SCHED_OTHER=1
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=1 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=1 -DINTEGER_CODE=0 -DMT=0
DEFINES_CUSTOM = 
DEFINES_OPTS = -DTID01EQ=0
DEFINES_SKIPFORSIL = -D__linux__ -DARM_PROJECT -D_USE_TARGET_UDP_ -D_RUNONTARGETHARDWARE_BUILD_ -DSTACK_SIZE=64 -DRT
DEFINES_STANDARD = -DMODEL=ex_DLModel_28 -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0
DEFINES_TARGETBASEDPATHFORMATTINGGROUP = -DMW_DL_DATA_PATH=$(MATLAB_WORKSPACE)/C/Users/Dogukan.kilinc/OneDrive_-_figes.com.tr/Documents/MATLAB/Examples/R2025b/nvidia/ClassifyWebcamImagesOnNVIDIAJetsonFromSimulinkExample

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD) $(DEFINES_TARGETBASEDPATHFORMATTINGGROUP)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(MATLAB_ROOT)/toolbox/eml/externalDependency/timefun/coder_posix_time.c $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/insertShapeUtilsCore.cpp $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/cvstDraw.cpp $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/insertShapeAndMarkerUtils.cpp $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/sources/utils/MW_gstNetworkVideoReceive.c $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/realtime/targets/linux/src/MW_SDL_video_display.c $(START_DIR)/ex_DLModel_28_ert_rtw/MWAdditionLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWAvgPoolingLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWCNNLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWConcatenationLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWConvLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWElementwiseAffineLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWInputLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWMaxPoolingLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWOutputLayer.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorBase.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWElementwiseAffineLayerImplKernel.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtAdditionLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtAvgPoolingLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtConcatenationLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtConvLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtElementwiseAffineLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtInputLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtMaxPoolingLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtOutputLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtCNNLayerImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtTargetNetworkImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtLayerImplFactory.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtCustomLayerBase.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtUtils.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtVersionSpecificImpl.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWLaunchParametersUtilities.cpp $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2801.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2802.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2804.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2805.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2807.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2808.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWResize2DLayer_Yolov9t0_ex_DLModel_2801.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWResize2DLayer_Yolov9t0_ex_DLModel_2802.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2801.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28010.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280100.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280101.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280102.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280103.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280104.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280105.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280106.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280107.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280108.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280109.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28011.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280110.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280111.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280112.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280113.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280114.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280115.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280116.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280117.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280118.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280119.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28012.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280120.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280121.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280122.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280123.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280124.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280125.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280126.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280127.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280128.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280129.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28013.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280130.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280131.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280132.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280133.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280134.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280135.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280136.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280137.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280138.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280139.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28014.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280140.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280141.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280142.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280143.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280144.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280145.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280146.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280147.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280148.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280149.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28015.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280150.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280151.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280152.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280153.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280154.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280155.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280156.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280157.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280158.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280159.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28016.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280160.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280161.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280162.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280163.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280164.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280165.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280166.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280167.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280168.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280169.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28017.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280170.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280171.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280172.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280173.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280174.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280175.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280176.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280177.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280178.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280179.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28018.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28019.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2802.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28020.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28021.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28022.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28023.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28024.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28025.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28026.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28027.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28028.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28029.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2803.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28030.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28031.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28032.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28033.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28034.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28035.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28036.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28037.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28038.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28039.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2804.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28040.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28041.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28042.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28043.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28044.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28045.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28046.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28047.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28048.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28049.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2805.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28050.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28051.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28052.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28053.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28054.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28055.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28056.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28057.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28058.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28059.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2806.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28060.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28061.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28062.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28063.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28064.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28065.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28066.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28067.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28068.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28069.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2807.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28070.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28071.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28072.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28073.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28074.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28075.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28076.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28077.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28078.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28079.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2808.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28080.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28081.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28082.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28083.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28084.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28085.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28086.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28087.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28088.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28089.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2809.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28090.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28091.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28092.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28093.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28094.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28095.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28096.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28097.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28098.cu $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28099.cu $(START_DIR)/ex_DLModel_28_ert_rtw/Yolov9t0_ex_DLModel_280.cu $(START_DIR)/ex_DLModel_28_ert_rtw/ex_DLModel_28.cu $(START_DIR)/ex_DLModel_28_ert_rtw/rtGetInf.cu $(START_DIR)/ex_DLModel_28_ert_rtw/rtGetNaN.cu $(START_DIR)/ex_DLModel_28_ert_rtw/rt_nonfinite.cu $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/sources/utils/MW_nvidia_init.c $(MATLAB_ROOT)/toolbox/target/codertarget/rtos/src/linuxinitialize.cpp

MAIN_SRC = $(START_DIR)/ex_DLModel_28_ert_rtw/ert_main.cu

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = coder_posix_time.o insertShapeUtilsCore.o cvstDraw.o insertShapeAndMarkerUtils.o MW_gstNetworkVideoReceive.o MW_SDL_video_display.o MWAdditionLayer.o MWAvgPoolingLayer.o MWCNNLayer.o MWConcatenationLayer.o MWConvLayer.o MWElementwiseAffineLayer.o MWInputLayer.o MWMaxPoolingLayer.o MWOutputLayer.o MWTensorBase.o MWElementwiseAffineLayerImplKernel.o MWTensorrtAdditionLayerImpl.o MWTensorrtAvgPoolingLayerImpl.o MWTensorrtConcatenationLayerImpl.o MWTensorrtConvLayerImpl.o MWTensorrtElementwiseAffineLayerImpl.o MWTensorrtInputLayerImpl.o MWTensorrtMaxPoolingLayerImpl.o MWTensorrtOutputLayerImpl.o MWTensorrtCNNLayerImpl.o MWTensorrtTargetNetworkImpl.o MWTensorrtLayerImplFactory.o MWTensorrtCustomLayerBase.o MWTensorrtUtils.o MWTensorrtVersionSpecificImpl.o MWLaunchParametersUtilities.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2801.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2802.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2804.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2805.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2807.o MWCustomSliceLayer_Yolov9t0_ex_DLModel_2808.o MWResize2DLayer_Yolov9t0_ex_DLModel_2801.o MWResize2DLayer_Yolov9t0_ex_DLModel_2802.o MWSwishLayer_Yolov9t0_ex_DLModel_2801.o MWSwishLayer_Yolov9t0_ex_DLModel_28010.o MWSwishLayer_Yolov9t0_ex_DLModel_280100.o MWSwishLayer_Yolov9t0_ex_DLModel_280101.o MWSwishLayer_Yolov9t0_ex_DLModel_280102.o MWSwishLayer_Yolov9t0_ex_DLModel_280103.o MWSwishLayer_Yolov9t0_ex_DLModel_280104.o MWSwishLayer_Yolov9t0_ex_DLModel_280105.o MWSwishLayer_Yolov9t0_ex_DLModel_280106.o MWSwishLayer_Yolov9t0_ex_DLModel_280107.o MWSwishLayer_Yolov9t0_ex_DLModel_280108.o MWSwishLayer_Yolov9t0_ex_DLModel_280109.o MWSwishLayer_Yolov9t0_ex_DLModel_28011.o MWSwishLayer_Yolov9t0_ex_DLModel_280110.o MWSwishLayer_Yolov9t0_ex_DLModel_280111.o MWSwishLayer_Yolov9t0_ex_DLModel_280112.o MWSwishLayer_Yolov9t0_ex_DLModel_280113.o MWSwishLayer_Yolov9t0_ex_DLModel_280114.o MWSwishLayer_Yolov9t0_ex_DLModel_280115.o MWSwishLayer_Yolov9t0_ex_DLModel_280116.o MWSwishLayer_Yolov9t0_ex_DLModel_280117.o MWSwishLayer_Yolov9t0_ex_DLModel_280118.o MWSwishLayer_Yolov9t0_ex_DLModel_280119.o MWSwishLayer_Yolov9t0_ex_DLModel_28012.o MWSwishLayer_Yolov9t0_ex_DLModel_280120.o MWSwishLayer_Yolov9t0_ex_DLModel_280121.o MWSwishLayer_Yolov9t0_ex_DLModel_280122.o MWSwishLayer_Yolov9t0_ex_DLModel_280123.o MWSwishLayer_Yolov9t0_ex_DLModel_280124.o MWSwishLayer_Yolov9t0_ex_DLModel_280125.o MWSwishLayer_Yolov9t0_ex_DLModel_280126.o MWSwishLayer_Yolov9t0_ex_DLModel_280127.o MWSwishLayer_Yolov9t0_ex_DLModel_280128.o MWSwishLayer_Yolov9t0_ex_DLModel_280129.o MWSwishLayer_Yolov9t0_ex_DLModel_28013.o MWSwishLayer_Yolov9t0_ex_DLModel_280130.o MWSwishLayer_Yolov9t0_ex_DLModel_280131.o MWSwishLayer_Yolov9t0_ex_DLModel_280132.o MWSwishLayer_Yolov9t0_ex_DLModel_280133.o MWSwishLayer_Yolov9t0_ex_DLModel_280134.o MWSwishLayer_Yolov9t0_ex_DLModel_280135.o MWSwishLayer_Yolov9t0_ex_DLModel_280136.o MWSwishLayer_Yolov9t0_ex_DLModel_280137.o MWSwishLayer_Yolov9t0_ex_DLModel_280138.o MWSwishLayer_Yolov9t0_ex_DLModel_280139.o MWSwishLayer_Yolov9t0_ex_DLModel_28014.o MWSwishLayer_Yolov9t0_ex_DLModel_280140.o MWSwishLayer_Yolov9t0_ex_DLModel_280141.o MWSwishLayer_Yolov9t0_ex_DLModel_280142.o MWSwishLayer_Yolov9t0_ex_DLModel_280143.o MWSwishLayer_Yolov9t0_ex_DLModel_280144.o MWSwishLayer_Yolov9t0_ex_DLModel_280145.o MWSwishLayer_Yolov9t0_ex_DLModel_280146.o MWSwishLayer_Yolov9t0_ex_DLModel_280147.o MWSwishLayer_Yolov9t0_ex_DLModel_280148.o MWSwishLayer_Yolov9t0_ex_DLModel_280149.o MWSwishLayer_Yolov9t0_ex_DLModel_28015.o MWSwishLayer_Yolov9t0_ex_DLModel_280150.o MWSwishLayer_Yolov9t0_ex_DLModel_280151.o MWSwishLayer_Yolov9t0_ex_DLModel_280152.o MWSwishLayer_Yolov9t0_ex_DLModel_280153.o MWSwishLayer_Yolov9t0_ex_DLModel_280154.o MWSwishLayer_Yolov9t0_ex_DLModel_280155.o MWSwishLayer_Yolov9t0_ex_DLModel_280156.o MWSwishLayer_Yolov9t0_ex_DLModel_280157.o MWSwishLayer_Yolov9t0_ex_DLModel_280158.o MWSwishLayer_Yolov9t0_ex_DLModel_280159.o MWSwishLayer_Yolov9t0_ex_DLModel_28016.o MWSwishLayer_Yolov9t0_ex_DLModel_280160.o MWSwishLayer_Yolov9t0_ex_DLModel_280161.o MWSwishLayer_Yolov9t0_ex_DLModel_280162.o MWSwishLayer_Yolov9t0_ex_DLModel_280163.o MWSwishLayer_Yolov9t0_ex_DLModel_280164.o MWSwishLayer_Yolov9t0_ex_DLModel_280165.o MWSwishLayer_Yolov9t0_ex_DLModel_280166.o MWSwishLayer_Yolov9t0_ex_DLModel_280167.o MWSwishLayer_Yolov9t0_ex_DLModel_280168.o MWSwishLayer_Yolov9t0_ex_DLModel_280169.o MWSwishLayer_Yolov9t0_ex_DLModel_28017.o MWSwishLayer_Yolov9t0_ex_DLModel_280170.o MWSwishLayer_Yolov9t0_ex_DLModel_280171.o MWSwishLayer_Yolov9t0_ex_DLModel_280172.o MWSwishLayer_Yolov9t0_ex_DLModel_280173.o MWSwishLayer_Yolov9t0_ex_DLModel_280174.o MWSwishLayer_Yolov9t0_ex_DLModel_280175.o MWSwishLayer_Yolov9t0_ex_DLModel_280176.o MWSwishLayer_Yolov9t0_ex_DLModel_280177.o MWSwishLayer_Yolov9t0_ex_DLModel_280178.o MWSwishLayer_Yolov9t0_ex_DLModel_280179.o MWSwishLayer_Yolov9t0_ex_DLModel_28018.o MWSwishLayer_Yolov9t0_ex_DLModel_28019.o MWSwishLayer_Yolov9t0_ex_DLModel_2802.o MWSwishLayer_Yolov9t0_ex_DLModel_28020.o MWSwishLayer_Yolov9t0_ex_DLModel_28021.o MWSwishLayer_Yolov9t0_ex_DLModel_28022.o MWSwishLayer_Yolov9t0_ex_DLModel_28023.o MWSwishLayer_Yolov9t0_ex_DLModel_28024.o MWSwishLayer_Yolov9t0_ex_DLModel_28025.o MWSwishLayer_Yolov9t0_ex_DLModel_28026.o MWSwishLayer_Yolov9t0_ex_DLModel_28027.o MWSwishLayer_Yolov9t0_ex_DLModel_28028.o MWSwishLayer_Yolov9t0_ex_DLModel_28029.o MWSwishLayer_Yolov9t0_ex_DLModel_2803.o MWSwishLayer_Yolov9t0_ex_DLModel_28030.o MWSwishLayer_Yolov9t0_ex_DLModel_28031.o MWSwishLayer_Yolov9t0_ex_DLModel_28032.o MWSwishLayer_Yolov9t0_ex_DLModel_28033.o MWSwishLayer_Yolov9t0_ex_DLModel_28034.o MWSwishLayer_Yolov9t0_ex_DLModel_28035.o MWSwishLayer_Yolov9t0_ex_DLModel_28036.o MWSwishLayer_Yolov9t0_ex_DLModel_28037.o MWSwishLayer_Yolov9t0_ex_DLModel_28038.o MWSwishLayer_Yolov9t0_ex_DLModel_28039.o MWSwishLayer_Yolov9t0_ex_DLModel_2804.o MWSwishLayer_Yolov9t0_ex_DLModel_28040.o MWSwishLayer_Yolov9t0_ex_DLModel_28041.o MWSwishLayer_Yolov9t0_ex_DLModel_28042.o MWSwishLayer_Yolov9t0_ex_DLModel_28043.o MWSwishLayer_Yolov9t0_ex_DLModel_28044.o MWSwishLayer_Yolov9t0_ex_DLModel_28045.o MWSwishLayer_Yolov9t0_ex_DLModel_28046.o MWSwishLayer_Yolov9t0_ex_DLModel_28047.o MWSwishLayer_Yolov9t0_ex_DLModel_28048.o MWSwishLayer_Yolov9t0_ex_DLModel_28049.o MWSwishLayer_Yolov9t0_ex_DLModel_2805.o MWSwishLayer_Yolov9t0_ex_DLModel_28050.o MWSwishLayer_Yolov9t0_ex_DLModel_28051.o MWSwishLayer_Yolov9t0_ex_DLModel_28052.o MWSwishLayer_Yolov9t0_ex_DLModel_28053.o MWSwishLayer_Yolov9t0_ex_DLModel_28054.o MWSwishLayer_Yolov9t0_ex_DLModel_28055.o MWSwishLayer_Yolov9t0_ex_DLModel_28056.o MWSwishLayer_Yolov9t0_ex_DLModel_28057.o MWSwishLayer_Yolov9t0_ex_DLModel_28058.o MWSwishLayer_Yolov9t0_ex_DLModel_28059.o MWSwishLayer_Yolov9t0_ex_DLModel_2806.o MWSwishLayer_Yolov9t0_ex_DLModel_28060.o MWSwishLayer_Yolov9t0_ex_DLModel_28061.o MWSwishLayer_Yolov9t0_ex_DLModel_28062.o MWSwishLayer_Yolov9t0_ex_DLModel_28063.o MWSwishLayer_Yolov9t0_ex_DLModel_28064.o MWSwishLayer_Yolov9t0_ex_DLModel_28065.o MWSwishLayer_Yolov9t0_ex_DLModel_28066.o MWSwishLayer_Yolov9t0_ex_DLModel_28067.o MWSwishLayer_Yolov9t0_ex_DLModel_28068.o MWSwishLayer_Yolov9t0_ex_DLModel_28069.o MWSwishLayer_Yolov9t0_ex_DLModel_2807.o MWSwishLayer_Yolov9t0_ex_DLModel_28070.o MWSwishLayer_Yolov9t0_ex_DLModel_28071.o MWSwishLayer_Yolov9t0_ex_DLModel_28072.o MWSwishLayer_Yolov9t0_ex_DLModel_28073.o MWSwishLayer_Yolov9t0_ex_DLModel_28074.o MWSwishLayer_Yolov9t0_ex_DLModel_28075.o MWSwishLayer_Yolov9t0_ex_DLModel_28076.o MWSwishLayer_Yolov9t0_ex_DLModel_28077.o MWSwishLayer_Yolov9t0_ex_DLModel_28078.o MWSwishLayer_Yolov9t0_ex_DLModel_28079.o MWSwishLayer_Yolov9t0_ex_DLModel_2808.o MWSwishLayer_Yolov9t0_ex_DLModel_28080.o MWSwishLayer_Yolov9t0_ex_DLModel_28081.o MWSwishLayer_Yolov9t0_ex_DLModel_28082.o MWSwishLayer_Yolov9t0_ex_DLModel_28083.o MWSwishLayer_Yolov9t0_ex_DLModel_28084.o MWSwishLayer_Yolov9t0_ex_DLModel_28085.o MWSwishLayer_Yolov9t0_ex_DLModel_28086.o MWSwishLayer_Yolov9t0_ex_DLModel_28087.o MWSwishLayer_Yolov9t0_ex_DLModel_28088.o MWSwishLayer_Yolov9t0_ex_DLModel_28089.o MWSwishLayer_Yolov9t0_ex_DLModel_2809.o MWSwishLayer_Yolov9t0_ex_DLModel_28090.o MWSwishLayer_Yolov9t0_ex_DLModel_28091.o MWSwishLayer_Yolov9t0_ex_DLModel_28092.o MWSwishLayer_Yolov9t0_ex_DLModel_28093.o MWSwishLayer_Yolov9t0_ex_DLModel_28094.o MWSwishLayer_Yolov9t0_ex_DLModel_28095.o MWSwishLayer_Yolov9t0_ex_DLModel_28096.o MWSwishLayer_Yolov9t0_ex_DLModel_28097.o MWSwishLayer_Yolov9t0_ex_DLModel_28098.o MWSwishLayer_Yolov9t0_ex_DLModel_28099.o Yolov9t0_ex_DLModel_280.o ex_DLModel_28.o rtGetInf.o rtGetNaN.o rt_nonfinite.o MW_nvidia_init.o linuxinitialize.o

MAIN_OBJ = ert_main.o

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = $(LINUX_TARGET_LIBS_MACRO)

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = $(LDFLAGS_CUSTOMLIBFLAGS) -lSDL -lcufft -lcublas -lcusolver

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_ = $(XCOMPILERFLAG) `pkg-config --cflags gstreamer-app-1.0` -arch sm_87 -DMW_TENSORRT_10
CFLAGS_CU_OPTS = -std=c++11 -Wno-deprecated-declarations
CFLAGS_SKIPFORSIL = -Xcompiler   -fpermissive
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_) $(CFLAGS_CU_OPTS) $(CFLAGS_SKIPFORSIL) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_ = $(XCOMPILERFLAG) `pkg-config --cflags gstreamer-app-1.0` -arch sm_87 -DMW_TENSORRT_10
CPPFLAGS_CU_OPTS = -std=c++11 -Wno-deprecated-declarations
CPPFLAGS_SKIPFORSIL = -Xcompiler   -fpermissive
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_) $(CPPFLAGS_CU_OPTS) $(CPPFLAGS_SKIPFORSIL) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_ = -lcudnn -lnvinfer -lcudart -arch sm_87 -DMW_TENSORRT_10 -lcublas -lcusolver -lcufft -lcurand -lcusparse
CPP_LDFLAGS_CUSTOMLIBFLAGS = `pkg-config --libs gstreamer-app-1.0`

CPP_LDFLAGS += $(CPP_LDFLAGS_) $(CPP_LDFLAGS_CUSTOMLIBFLAGS)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_ = -lcudnn -lnvinfer -lcudart -arch sm_87 -DMW_TENSORRT_10 -lcublas -lcusolver -lcufft -lcurand -lcusparse
CPP_SHAREDLIB_LDFLAGS_CUSTOMLIBFLAGS = `pkg-config --libs gstreamer-app-1.0`

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_) $(CPP_SHAREDLIB_LDFLAGS_CUSTOMLIBFLAGS)

#-----------
# Linker
#-----------

LDFLAGS_ = -lcudnn -lnvinfer -lcudart -arch sm_87 -DMW_TENSORRT_10 -lcublas -lcusolver -lcufft -lcurand -lcusparse
LDFLAGS_CUSTOMLIBFLAGS = `pkg-config --libs gstreamer-app-1.0`

LDFLAGS += $(LDFLAGS_) $(LDFLAGS_CUSTOMLIBFLAGS)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_ = -lcudnn -lnvinfer -lcudart -arch sm_87 -DMW_TENSORRT_10 -lcublas -lcusolver -lcufft -lcurand -lcusparse
SHAREDLIB_LDFLAGS_CUSTOMLIBFLAGS = `pkg-config --libs gstreamer-app-1.0`

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_) $(SHAREDLIB_LDFLAGS_CUSTOMLIBFLAGS)

###########################################################################
## INLINED COMMANDS
###########################################################################


DERIVED_SRCS = $(subst .o,.dep,$(OBJS))

build:

%.dep:



-include codertarget_assembly_flags.mk
-include *.dep


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild download execute


all : build
	echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS) $(LIBS)
	echo "### Successfully generated all binary outputs."


prebuild : 


download : $(PRODUCT)


execute : download
	echo "### Invoking postbuild tool "Execute" ..."
	$(EXECUTE) $(EXECUTE_FLAGS)
	echo "### Done invoking postbuild tool."


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(LIBS) $(MAIN_OBJ)
	echo "### Creating standalone executable "$(PRODUCT)" ..."
	$(CPP_LD) $(CPP_LDFLAGS) -o $(PRODUCT) $(OBJS) $(MAIN_OBJ) $(LIBS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : %StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : %.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(START_DIR)/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(START_DIR)/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(START_DIR)/ex_DLModel_28_ert_rtw/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(START_DIR)/ex_DLModel_28_ert_rtw/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(START_DIR)/ex_DLModel_28_ert_rtw/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(START_DIR)/ex_DLModel_28_ert_rtw/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/rtw/c/src/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/simulink/src/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/simulink/src/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%StandardCExtension
	$(CC) $(CFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


coder_posix_time.o : $(MATLAB_ROOT)/toolbox/eml/externalDependency/timefun/coder_posix_time.c
	$(CC) $(CFLAGS) -o $@ $<


insertShapeUtilsCore.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/insertShapeUtilsCore.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


cvstDraw.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/cvstDraw.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


insertShapeAndMarkerUtils.o : $(MATLAB_ROOT)/toolbox/vision/builtins/src/vision/insertShapeAndMarkerUtils.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MW_gstNetworkVideoReceive.o : $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/sources/utils/MW_gstNetworkVideoReceive.c
	$(CC) $(CFLAGS) -o $@ $<


MW_SDL_video_display.o : $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/realtime/targets/linux/src/MW_SDL_video_display.c
	$(CC) $(CFLAGS) -o $@ $<


MWAdditionLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWAdditionLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWAvgPoolingLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWAvgPoolingLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCNNLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCNNLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWConcatenationLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWConcatenationLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWConvLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWConvLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWElementwiseAffineLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWElementwiseAffineLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWInputLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWInputLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWMaxPoolingLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWMaxPoolingLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWOutputLayer.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWOutputLayer.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorBase.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorBase.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWElementwiseAffineLayerImplKernel.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWElementwiseAffineLayerImplKernel.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtAdditionLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtAdditionLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtAvgPoolingLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtAvgPoolingLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtConcatenationLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtConcatenationLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtConvLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtConvLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtElementwiseAffineLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtElementwiseAffineLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtInputLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtInputLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtMaxPoolingLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtMaxPoolingLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtOutputLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtOutputLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtCNNLayerImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtCNNLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtTargetNetworkImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtTargetNetworkImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtLayerImplFactory.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtLayerImplFactory.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtCustomLayerBase.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtCustomLayerBase.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtUtils.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtUtils.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWTensorrtVersionSpecificImpl.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWTensorrtVersionSpecificImpl.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


ert_main.o : $(START_DIR)/ex_DLModel_28_ert_rtw/ert_main.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWLaunchParametersUtilities.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWLaunchParametersUtilities.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2801.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2801.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2802.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2802.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2803.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2804.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2804.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2805.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2805.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2806.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2807.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2807.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWCustomSliceLayer_Yolov9t0_ex_DLModel_2808.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWCustomSliceLayer_Yolov9t0_ex_DLModel_2808.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWResize2DLayer_Yolov9t0_ex_DLModel_2801.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWResize2DLayer_Yolov9t0_ex_DLModel_2801.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWResize2DLayer_Yolov9t0_ex_DLModel_2802.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWResize2DLayer_Yolov9t0_ex_DLModel_2802.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2801.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2801.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28010.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28010.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280100.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280100.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280101.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280101.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280102.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280102.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280103.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280103.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280104.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280104.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280105.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280105.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280106.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280106.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280107.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280107.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280108.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280108.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280109.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280109.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28011.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28011.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280110.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280110.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280111.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280111.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280112.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280112.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280113.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280113.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280114.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280114.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280115.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280115.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280116.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280116.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280117.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280117.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280118.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280118.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280119.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280119.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28012.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28012.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280120.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280120.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280121.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280121.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280122.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280122.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280123.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280123.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280124.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280124.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280125.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280125.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280126.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280126.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280127.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280127.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280128.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280128.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280129.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280129.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28013.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28013.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280130.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280130.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280131.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280131.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280132.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280132.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280133.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280133.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280134.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280134.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280135.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280135.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280136.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280136.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280137.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280137.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280138.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280138.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280139.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280139.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28014.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28014.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280140.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280140.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280141.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280141.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280142.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280142.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280143.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280143.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280144.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280144.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280145.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280145.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280146.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280146.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280147.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280147.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280148.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280148.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280149.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280149.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28015.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28015.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280150.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280150.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280151.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280151.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280152.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280152.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280153.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280153.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280154.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280154.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280155.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280155.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280156.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280156.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280157.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280157.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280158.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280158.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280159.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280159.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28016.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28016.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280160.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280160.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280161.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280161.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280162.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280162.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280163.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280163.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280164.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280164.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280165.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280165.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280166.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280166.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280167.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280167.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280168.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280168.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280169.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280169.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28017.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28017.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280170.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280170.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280171.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280171.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280172.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280172.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280173.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280173.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280174.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280174.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280175.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280175.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280176.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280176.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280177.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280177.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280178.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280178.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_280179.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_280179.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28018.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28018.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28019.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28019.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2802.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2802.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28020.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28020.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28021.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28021.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28022.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28022.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28023.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28023.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28024.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28024.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28025.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28025.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28026.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28026.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28027.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28027.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28028.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28028.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28029.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28029.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2803.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2803.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28030.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28030.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28031.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28031.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28032.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28032.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28033.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28033.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28034.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28034.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28035.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28035.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28036.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28036.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28037.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28037.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28038.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28038.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28039.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28039.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2804.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2804.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28040.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28040.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28041.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28041.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28042.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28042.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28043.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28043.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28044.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28044.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28045.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28045.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28046.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28046.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28047.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28047.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28048.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28048.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28049.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28049.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2805.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2805.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28050.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28050.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28051.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28051.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28052.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28052.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28053.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28053.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28054.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28054.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28055.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28055.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28056.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28056.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28057.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28057.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28058.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28058.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28059.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28059.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2806.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2806.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28060.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28060.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28061.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28061.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28062.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28062.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28063.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28063.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28064.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28064.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28065.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28065.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28066.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28066.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28067.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28067.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28068.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28068.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28069.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28069.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2807.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2807.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28070.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28070.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28071.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28071.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28072.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28072.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28073.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28073.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28074.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28074.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28075.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28075.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28076.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28076.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28077.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28077.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28078.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28078.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28079.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28079.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2808.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2808.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28080.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28080.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28081.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28081.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28082.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28082.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28083.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28083.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28084.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28084.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28085.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28085.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28086.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28086.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28087.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28087.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28088.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28088.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28089.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28089.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_2809.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_2809.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28090.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28090.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28091.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28091.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28092.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28092.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28093.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28093.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28094.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28094.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28095.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28095.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28096.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28096.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28097.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28097.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28098.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28098.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MWSwishLayer_Yolov9t0_ex_DLModel_28099.o : $(START_DIR)/ex_DLModel_28_ert_rtw/MWSwishLayer_Yolov9t0_ex_DLModel_28099.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


Yolov9t0_ex_DLModel_280.o : $(START_DIR)/ex_DLModel_28_ert_rtw/Yolov9t0_ex_DLModel_280.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


ex_DLModel_28.o : $(START_DIR)/ex_DLModel_28_ert_rtw/ex_DLModel_28.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


rtGetInf.o : $(START_DIR)/ex_DLModel_28_ert_rtw/rtGetInf.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


rtGetNaN.o : $(START_DIR)/ex_DLModel_28_ert_rtw/rtGetNaN.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


rt_nonfinite.o : $(START_DIR)/ex_DLModel_28_ert_rtw/rt_nonfinite.cu
	$(CPP) $(CPPFLAGS) -o $@ $<


MW_nvidia_init.o : $(MATLAB_WORKSPACE)/C/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/nvidia/sources/utils/MW_nvidia_init.c
	$(CC) $(CFLAGS) -o $@ $<


linuxinitialize.o : $(MATLAB_ROOT)/toolbox/target/codertarget/rtos/src/linuxinitialize.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	echo "### PRODUCT = $(PRODUCT)"
	echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	echo "### BUILD_TYPE = $(BUILD_TYPE)"
	echo "### INCLUDES = $(INCLUDES)"
	echo "### DEFINES = $(DEFINES)"
	echo "### ALL_SRCS = $(ALL_SRCS)"
	echo "### ALL_OBJS = $(ALL_OBJS)"
	echo "### LIBS = $(LIBS)"
	echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	echo "### CFLAGS = $(CFLAGS)"
	echo "### LDFLAGS = $(LDFLAGS)"
	echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	echo "### CPPFLAGS = $(CPPFLAGS)"
	echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	echo "### ARFLAGS = $(ARFLAGS)"
	echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(RM) *.c.dep
	$(RM) *.cpp.dep .cu.dep
	$(ECHO) "### Deleted all derived files."


