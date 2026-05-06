// Copyright 2018-2024 The MathWorks, Inc.

#ifndef __MW_SHUFFLE_UTIL_H__
#define __MW_SHUFFLE_UTIL_H__
#ifdef __CUDACC__
#define MW_HOST_DEVICE                 __host__ __device__

//-------------------------
// Segmented sort helper
//-------------------------
static __global__ void createOffsets(int* d_offsets, int s, int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix <= nelements / s) {
    d_offsets[ix] = s * ix;
  }
}

static __global__ void createInd(double* d_ind, int s, int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix < nelements) {
    d_ind[ix] = ix % s + 1;
  }
}

//-------------------------
// Without index
//-------------------------
static MW_HOST_DEVICE int calcRowMajorStrideAndDim(const int* dims,
  int numDims,
  int sortAlongDim,
  int* stride,
  int* shflStride,
  int* oldDim);
static MW_HOST_DEVICE int calcColMajorStrideAndDim(const int* dims,
  int numDims,
  int sortAlongDim,
  int* stride,
  int* shflStride,
  int* oldDim);
static __global__ void createSeqEdgeDim(int* d_seq, int s, int nelements);
static __global__ void createSeqOtherDim(int* d_seq, int s, int nelements, int
  nelem2);
static __device__ void createSeqEdgeDimDevice(int* d_seq, int s, int nelements);
static __device__ void createSeqOtherDimDevice(int* d_seq, int s, int nelements,
  int nelem2);
template <class T>
  static __global__ void shuffleColMajor(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  static __global__ void shuffleColMajor_ndims_2(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int oldDim0,
  int nelements);
template <class T>
  static __global__ void shuffleColMajor_ndims_3(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim0,
  int oldDim1,
  int nelements);
template <class T>
  static __global__ void shuffleRowMajor(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  static __global__ void shuffleRowMajor_ndims_2(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int oldDim1,
  int nelements);
template <class T>
  static __global__ void shuffleRowMajor_ndims_3(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim1,
  int oldDim2,
  int nelements);
template <class T>
  static __device__ void shuffleColMajorDevice(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  static __device__ void shuffleRowMajorDevice(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  static __global__ void shuffleColMajor(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int i = 0;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    while (i < numDims - 1) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i++;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __global__ void shuffleColMajor_ndims_2(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int oldDim0,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim0;
    outIdx += (t * shflStride0);
    inIdx = (inIdx - t) / oldDim0;
    outIdx += (inIdx * shflStride1);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __global__ void shuffleColMajor_ndims_3(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim0,
  int oldDim1,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim0;
    outIdx += (t * shflStride0);
    inIdx = (inIdx - t) / oldDim0;
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride2);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __global__ void shuffleRowMajor(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int i = numDims - 1;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    while (i > 0) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i--;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __global__ void shuffleRowMajor_ndims_2(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int oldDim1,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride0);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __global__ void shuffleRowMajor_ndims_3(T* d_key,
  T* d_key_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim1,
  int oldDim2,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim2;
    outIdx += (t * shflStride2);
    inIdx = (inIdx - t) / oldDim2;
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride0);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __device__ void shuffleColMajorDevice(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    int i = 0;
    int t = 0;
    int inIdx = ix;
    int outIdx = 0;
    while (i < numDims - 1) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i++;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
  }
}

template <class T>
  static __device__ void shuffleRowMajorDevice(T* d_key,
  T* d_key_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    int i = numDims - 1;
    int t = 0;
    int inIdx = ix;
    int outIdx = 0;
    while (i > 0) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i--;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
  }
}

static __global__ void createSeqEdgeDim(int* d_seq, int s, int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix < nelements) {
    d_seq[ix] = ix / s;
  }
}

static __global__ void createSeqOtherDim(int* d_seq, int s, int nelements, int
  nelem2)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int off = 0;
  if (ix < nelements) {
    if (ix >= nelem2) {
      off = (ix / nelem2) * s;
    }

    d_seq[ix] = ix % s + off;
  }
}

static __device__ void createSeqEdgeDimDevice(int* d_seq, int s, int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    d_seq[ix] = ix / s;
  }
}

static __device__ void createSeqOtherDimDevice(int* d_seq, int s, int nelements,
  int nelem2)
{
  for (int ix = 0; ix < nelements; ix++) {
    int off = 0;
    if (ix >= nelem2) {
      off = (ix / nelem2) * s;
    }

    d_seq[ix] = ix % s + off;
  }
}

static MW_HOST_DEVICE int calcRowMajorStrideAndDim(const int* dims,
  int numDims,
  int sortAlongDim,
  int* stride,
  int* shflStride,
  int* oldDim)
{
  stride[numDims - 1] = 1;
  for (int i = numDims - 2; i >= 0; i--) {
    stride[i] = dims[i + 1] * stride[i + 1];
  }

  oldDim[numDims - 1] = dims[sortAlongDim];
  shflStride[numDims - 1] = stride[sortAlongDim];
  for (int i = numDims - 2; i >= sortAlongDim; i--) {
    oldDim[i] = dims[i + 1];
    shflStride[i] = stride[i + 1];
  }

  for (int i = sortAlongDim - 1; i >= 0; i--) {
    oldDim[i] = dims[i];
    shflStride[i] = stride[i];
  }

  int nelem2 = 1;
  for (int j = numDims - 1; j >= sortAlongDim; j--) {
    nelem2 *= dims[j];
  }

  return nelem2;
}

static MW_HOST_DEVICE int calcColMajorStrideAndDim(const int* dims,
  int numDims,
  int sortAlongDim,
  int* stride,
  int* shflStride,
  int* oldDim)
{
  stride[0] = 1;
  for (int i = 1; i < numDims; i++) {
    stride[i] = dims[i - 1] * stride[i - 1];
  }

  oldDim[0] = dims[sortAlongDim];
  shflStride[0] = stride[sortAlongDim];
  for (int i = 1; i <= sortAlongDim; i++) {
    oldDim[i] = dims[i - 1];
    shflStride[i] = stride[i - 1];
  }

  for (int i = sortAlongDim + 1; i < numDims; i++) {
    oldDim[i] = dims[i];
    shflStride[i] = stride[i];
  }

  int nelem2 = 1;
  for (int j = 0; j <= sortAlongDim; j++) {
    nelem2 *= dims[j];
  }

  return nelem2;
}

//-------------------------
// With index
//-------------------------
static __global__ void createSeqEdgeDimWithIndex(int* d_seq, double* d_ind, int
  s, int nelements);
static __global__ void createSeqOtherDimWithIndex(int* d_seq,
  double* d_ind,
  int s,
  int d,
  int nelements,
  int nelem2);
template <class T>
  __global__ void shuffleColMajorWithIndex(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  __global__ void shuffleColMajorWithIndex_ndims_2(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int oldDim0,
  int nelements);
template <class T>
  __global__ void shuffleColMajorWithIndex_ndims_3(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim0,
  int oldDim1,
  int nelements);
template <class T>
  __global__ void shuffleRowMajorWithIndex(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  __global__ void shuffleRowMajorWithIndex_ndims_2(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int oldDim1,
  int nelements);
template <class T>
  __global__ void shuffleRowMajorWithIndex_ndims_3(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim1,
  int oldDim2,
  int nelements);
static __device__ void createSeqEdgeDimWithIndexDevice(int* d_seq,
  double* d_ind,
  int s,
  int nelements);
static __device__ void createSeqOtherDimWithIndexDevice(int* d_seq,
  double* d_ind,
  int s,
  int d,
  int nelements,
  int nelem2);
template <class T>
  __device__ void shuffleColMajorWithIndexDevice(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
template <class T>
  __device__ void shuffleRowMajorWithIndexDevice(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements);
static __global__ void createSeqEdgeDimWithIndex(int* d_seq, double* d_ind, int
  s, int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix < nelements) {
    d_seq[ix] = ix / s;
    d_ind[ix] = ix % s + 1;
  }
}

static __global__ void createSeqOtherDimWithIndex(int* d_seq,
  double* d_ind,
  int s,
  int d,
  int nelements,
  int nelem2)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int off = 0;
  if (ix < nelements) {
    if (ix >= nelem2) {
      off = (ix / nelem2) * s;
    }

    d_seq[ix] = ix % s + off;
    d_ind[ix] = (ix / s) % d + 1;
  }
}

template <class T>
  __global__ void shuffleColMajorWithIndex(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int i = 0;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    while (i < numDims - 1) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i++;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __global__ void shuffleColMajorWithIndex_ndims_2(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int oldDim0,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim0;
    outIdx += (t * shflStride0);
    inIdx = (inIdx - t) / oldDim0;
    outIdx += (inIdx * shflStride1);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __global__ void shuffleColMajorWithIndex_ndims_3(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim0,
  int oldDim1,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim0;
    outIdx += (t * shflStride0);
    inIdx = (inIdx - t) / oldDim0;
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride2);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __global__ void shuffleRowMajorWithIndex(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int i = numDims - 1;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    while (i > 0) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i--;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __global__ void shuffleRowMajorWithIndex_ndims_2(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int oldDim1,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride0);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __global__ void shuffleRowMajorWithIndex_ndims_3(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int shflStride0,
  int shflStride1,
  int shflStride2,
  int oldDim1,
  int oldDim2,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  int t = 0;
  int inIdx = ix;
  int outIdx = 0;
  if (ix < nelements) {
    t = inIdx % oldDim2;
    outIdx += (t * shflStride2);
    inIdx = (inIdx - t) / oldDim2;
    t = inIdx % oldDim1;
    outIdx += (t * shflStride1);
    inIdx = (inIdx - t) / oldDim1;
    outIdx += (inIdx * shflStride0);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

static __device__ void createSeqEdgeDimWithIndexDevice(int* d_seq,
  double* d_ind,
  int s,
  int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    d_seq[ix] = ix / s;
    d_ind[ix] = ix % s + 1;
  }
}

static __device__ void createSeqOtherDimWithIndexDevice(int* d_seq,
  double* d_ind,
  int s,
  int d,
  int nelements,
  int nelem2)
{
  for (int ix = 0; ix < nelements; ix++) {
    int off = 0;
    if (ix >= nelem2) {
      off = (ix / nelem2) * s;
    }

    d_seq[ix] = ix % s + off;
    d_ind[ix] = (ix / s) % d + 1;
  }
}

template <class T>
  __device__ void shuffleColMajorWithIndexDevice(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    int i = 0;
    int t = 0;
    int inIdx = ix;
    int outIdx = 0;
    while (i < numDims - 1) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i++;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

template <class T>
  __device__ void shuffleRowMajorWithIndexDevice(T* d_key,
  T* d_key_out,
  double* d_ind,
  double* d_ind_out,
  int* shflStride,
  int* oldDim,
  int numDims,
  int nelements)
{
  for (int ix = 0; ix < nelements; ix++) {
    int i = numDims - 1;
    int t = 0;
    int inIdx = ix;
    int outIdx = 0;
    while (i > 0) {
      t = inIdx % oldDim[i];
      outIdx += (t * shflStride[i]);
      inIdx = (inIdx - t) / oldDim[i];
      i--;
    }

    outIdx += (inIdx * shflStride[i]);
    d_key_out[outIdx] = d_key[ix];
    d_ind_out[outIdx] = d_ind[ix];
  }
}

#endif
#endif
