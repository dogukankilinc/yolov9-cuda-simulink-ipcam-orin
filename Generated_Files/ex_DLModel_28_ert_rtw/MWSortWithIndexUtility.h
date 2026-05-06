// Copyright 2018-2024 The MathWorks, Inc.

#ifndef __MW_SORT_WITH_INDEX_UTIL_HOST_H__
#define __MW_SORT_WITH_INDEX_UTIL_HOST_H__
#ifdef __CUDACC__
#define CUB_IGNORE_DEPRECATED_CPP_DIALECT
#define THRUST_IGNORE_DEPRECATED_CPP_DIALECT
#include "MWConstants.h"
#if MW_INCLUDE_CUB
#include <cub/device/device_merge_sort.cuh>
#include <cub/device/device_radix_sort.cuh>
#include <cub/device/device_segmented_sort.cuh>
#endif

#include <thrust/sort.h>
#include <thrust/execution_policy.h>
#include <thrust/fill.h>
#include "MWSortFunctors.h"
#include "MWShuffleUtility.h"
#include "MWCudaMemoryFunctions.hpp"

//-------------------------
// Host declarations
//-------------------------
template <class T>
    struct ValueIndexPair {
  T v1;
  int ind;
};

template <class T>
  void sortAlongEdgeDimWithIndex(T* d_key, double* d_ind, int s, bool
  isAscending, int nelements);
template <>
  inline void sortAlongEdgeDimWithIndex<float>(float* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements);
template <>
  inline void sortAlongEdgeDimWithIndex<double>(double* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements);
template <class T>
  void sortAlongOtherDimWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  int nelements,
  bool isRowMajor);
template <class T>
  void callThrustSortByKeyWithIndex(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <class T>
  void callThrustSortByKeyWithIndexSimple(T* d_key, double* d_ind, bool
  isAscending, int nelements);
template <class T>
  void sortMatrixWithIndex(T* d_key, double* d_ind, int* d_seq, bool isAscending,
  int nelements);
template <>
  inline void sortMatrixWithIndex<float>(float* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <>
  inline void sortMatrixWithIndex<double>(double* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <class T>
  void sortMatrixWithNaNWithIndex(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <class T>
  void sortMatrixWithIndexSegmented(T* d_key, double* d_ind, int s, bool
  isAscending, int nelements);
template <class T>
  void sortPairs(T* d_key, double* d_ind, bool isAscending, int nelements);
template <>
  inline void sortPairs<float>(float* d_key, double* d_ind, bool isAscending,
  int nelements);
template <>
  inline void sortPairs<double>(double* d_key, double* d_ind, bool isAscending,
  int nelements);
template <class T>
  void mergeSortPairs(T* d_key, double* d_ind, bool isAscending, int nelements);
template <class T>
  void gpuSortImplWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  bool isRowMajor);

//-------------------------
// Host implementations
//-------------------------
template <class T>
  __global__ void createValueIndexPairArray(T* d_v1,
  double* d_ind,
  ValueIndexPair<T>* d_value,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix < nelements) {
    d_value[ix].v1 = d_v1[ix];
    d_value[ix].ind = static_cast<int>(d_ind[ix]);
  }
}

template <class T>
  __global__ void decomposeValueIndexPairArray(ValueIndexPair<T>* d_value,
  T* d_v1,
  double* d_ind,
  int nelements)
{
  int ix = threadIdx.x + blockIdx.x * blockDim.x;
  if (ix < nelements) {
    d_v1[ix] = d_value[ix].v1;
    d_ind[ix] = static_cast<double>(d_value[ix].ind);
  }
}

template <class T>
  void sortAlongEdgeDimWithIndex(T* d_key, double* d_ind, int s, bool
  isAscending, int nelements)
{

#if MW_INCLUDE_CUB

  if (nelements / s >= mw::detail::SEGMENT_THRESHOLD) {
    sortMatrixWithIndexSegmented<T>(d_key, d_ind, s, isAscending, nelements);
  } else {
    int* d_seq;
    mwCudaMalloc(&d_seq, sizeof(int) * nelements);
    dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
    int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
    dim3 dimGrid(numBlocksX, 1, 1);
    createSeqEdgeDimWithIndex<<<dimGrid, dimBlock>>>(d_seq, d_ind, s, nelements);
    sortMatrixWithIndex<T>(d_key, d_ind, d_seq, isAscending, nelements);
    mwCudaFree(d_seq);
  }

#else

  int* d_seq;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createSeqEdgeDimWithIndex<<<dimGrid, dimBlock>>>(d_seq, d_ind, s, nelements);
  callThrustSortByKeyWithIndex<T>(d_key, d_ind, d_seq, isAscending, nelements);
  mwCudaFree(d_seq);

#endif

}

// Specialize float and double type as CUB segmented sort does not support custom comparator.
template <>
  inline void sortAlongEdgeDimWithIndex<float>(float* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements)
{
  int* d_seq;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createSeqEdgeDimWithIndex<<<dimGrid, dimBlock>>>(d_seq, d_ind, s, nelements);

#if MW_INCLUDE_CUB

  sortMatrixWithIndex<float>(d_key, d_ind, d_seq, isAscending, nelements);

#else

  callThrustSortByKeyWithIndex<float>(d_key, d_ind, d_seq, isAscending,
    nelements);

#endif

  mwCudaFree(d_seq);
}

template <>
  inline void sortAlongEdgeDimWithIndex<double>(double* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements)
{
  int* d_seq;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createSeqEdgeDimWithIndex<<<dimGrid, dimBlock>>>(d_seq, d_ind, s, nelements);

#if MW_INCLUDE_CUB

  sortMatrixWithIndex<double>(d_key, d_ind, d_seq, isAscending, nelements);

#else

  callThrustSortByKeyWithIndex<double>(d_key, d_ind, d_seq, isAscending,
    nelements);

#endif

  mwCudaFree(d_seq);
}

template <class T>
  void sortAlongOtherDimWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  int nelements,
  bool isRowMajor)
{
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  int* oldDim = new int[numDims];
  int* stride = new int[numDims];
  int* shflStride = new int[numDims];
  int* d_seq;
  T* d_key_out;
  double* d_ind_out;
  int nelem2;
  int s;
  int d;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  mwCudaMalloc(&d_key_out, sizeof(T) * nelements);
  mwCudaMalloc(&d_ind_out, sizeof(double) * nelements);
  if (isRowMajor) {
    nelem2 = calcRowMajorStrideAndDim(dims, numDims, sortAlongDim, stride,
      shflStride, oldDim);
  } else {
    nelem2 = calcColMajorStrideAndDim(dims, numDims, sortAlongDim, stride,
      shflStride, oldDim);
  }

  s = stride[sortAlongDim];
  d = dims[sortAlongDim];
  createSeqOtherDimWithIndex<<<dimGrid, dimBlock>>>(d_seq, d_ind, s, d,
    nelements, nelem2);

#if MW_INCLUDE_CUB

  sortMatrixWithIndex<T>(d_key, d_ind, d_seq, isAscending, nelements);

#else

  callThrustSortByKeyWithIndex<T>(d_key, d_ind, d_seq, isAscending, nelements);

#endif

  if (numDims == 2) {
    if (isRowMajor) {
      shuffleRowMajorWithIndex_ndims_2<T>
        <<<dimGrid, dimBlock>>>(d_key, d_key_out, d_ind, d_ind_out, shflStride[0],
        shflStride[1], oldDim[1], nelements);
    } else {
      shuffleColMajorWithIndex_ndims_2<T>
        <<<dimGrid, dimBlock>>>(d_key, d_key_out, d_ind, d_ind_out, shflStride[0],
        shflStride[1], oldDim[0], nelements);
    }
  } else if (numDims == 3) {
    if (isRowMajor) {
      shuffleRowMajorWithIndex_ndims_3<T><<<dimGrid, dimBlock>>>(
        d_key, d_key_out, d_ind, d_ind_out, shflStride[0], shflStride[1],
        shflStride[2],
        oldDim[1], oldDim[2], nelements);
    } else {
      shuffleColMajorWithIndex_ndims_3<T><<<dimGrid, dimBlock>>>(
        d_key, d_key_out, d_ind, d_ind_out, shflStride[0], shflStride[1],
        shflStride[2],
        oldDim[0], oldDim[1], nelements);
    }
  } else {
    int* d_shflStride;
    int* d_oldDim;
    mwCudaMalloc(&d_shflStride, sizeof(int) * numDims);
    mwCudaMalloc(&d_oldDim, sizeof(int) * numDims);
    cudaMemcpy(d_shflStride, shflStride, numDims * sizeof(int),
               cudaMemcpyHostToDevice);
    cudaMemcpy(d_oldDim, oldDim, numDims * sizeof(int), cudaMemcpyHostToDevice);
    if (isRowMajor) {
      shuffleRowMajorWithIndex<T><<<dimGrid, dimBlock>>>(
        d_key, d_key_out, d_ind, d_ind_out, d_shflStride, d_oldDim, numDims,
        nelements);
    } else {
      shuffleColMajorWithIndex<T><<<dimGrid, dimBlock>>>(
        d_key, d_key_out, d_ind, d_ind_out, d_shflStride, d_oldDim, numDims,
        nelements);
    }

    mwCudaFree(d_shflStride);
    mwCudaFree(d_oldDim);
  }

  cudaMemcpy(d_key, d_key_out, nelements * sizeof(T), cudaMemcpyDeviceToDevice);
  cudaMemcpy(d_ind, d_ind_out, nelements * sizeof(double),
             cudaMemcpyDeviceToDevice);
  mwCudaFree(d_key_out);
  mwCudaFree(d_ind_out);
  mwCudaFree(d_seq);
  delete[] oldDim;
  delete[] stride;
  delete[] shflStride;
}

template <class T>
  void callThrustSortByKeyWithIndex(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements)
{
  if (isAscending) {
    thrust::stable_sort_by_key(thrust::device, d_key, d_key + nelements,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)),
      customLesser<T>());
  } else {
    thrust::stable_sort_by_key(thrust::device, d_key, d_key + nelements,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)),
      customGreater<T>());
  }

  thrust::stable_sort_by_key(thrust::device, d_seq, d_seq + nelements,
    thrust::make_zip_iterator(thrust::make_tuple(d_key, d_ind)));
}

template <class T>
  void callThrustSortByKeyWithIndexSimple(T* d_key, double* d_ind, bool
  isAscending, int nelements)
{
  thrust::sequence(thrust::device, d_ind, d_ind + nelements, 1);// starts at 1
  if (isAscending) {
    thrust::stable_sort_by_key(thrust::device, d_key, d_key + nelements, d_ind,
      customLesser<T>());
  } else {
    thrust::stable_sort_by_key(thrust::device, d_key, d_key + nelements, d_ind,
      customGreater<T>());
  }
}

// Only compile CUB when it is included.
#if MW_INCLUDE_CUB

template <class T>
  void sortMatrixWithIndex(T* d_key, double* d_ind, int* d_seq, bool isAscending,
  int nelements)
{
  // Create an array of ValueIndexPair <d_seq, d_ind>
  ValueIndexPair<int>* d_value1;
  mwCudaMalloc(&d_value1, sizeof(ValueIndexPair<int>) * nelements);
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createValueIndexPairArray<<<dimGrid, dimBlock>>>(d_seq, d_ind, d_value1,
    nelements);

  // Create a buffer of array of ValueIndexPair
  ValueIndexPair<int>* d_value1_buf;
  mwCudaMalloc(&d_value1_buf, sizeof(ValueIndexPair<int>) * nelements);
  T* d_key_buf;
  mwCudaMalloc(&d_key_buf, sizeof(T) * nelements);

  // Create a set of DoubleBuffers to wrap pairs of device pointers
  cub::DoubleBuffer<T> d_keys(d_key, d_key_buf);
  cub::DoubleBuffer<ValueIndexPair<int>> d_values1(d_value1, d_value1_buf);

  // Determine temporary device storage requirements
  void* d_temp_storage = nullptr;
  size_t temp_storage_bytes = 0;
  if (isAscending) {
    cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_keys,
      d_values1,
      nelements);
  } else {
    cub::DeviceRadixSort::SortPairsDescending(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_values1, nelements);
  }

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  if (isAscending) {
    cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_keys,
      d_values1,
      nelements);
  } else {
    cub::DeviceRadixSort::SortPairsDescending(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_values1, nelements);
  }

  if (d_keys.Current() == d_key_buf) {
    cudaMemcpy(d_key, d_key_buf, nelements * sizeof(T), cudaMemcpyDeviceToDevice);
  }

  // Decompose to d_seq and d_ind
  if (d_values1.Current() == d_value1) {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value1, d_seq, d_ind,
      nelements);
  } else {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value1_buf, d_seq,
      d_ind, nelements);
  }

  mwCudaFree(d_value1);
  mwCudaFree(d_value1_buf);
  mwCudaFree(d_key_buf);
  mwCudaFree(d_temp_storage);

  // Create an array of ValueIndexPair <d_key, d_ind>
  ValueIndexPair<T>* d_value2;
  mwCudaMalloc(&d_value2, sizeof(ValueIndexPair<T>) * nelements);
  createValueIndexPairArray<<<dimGrid, dimBlock>>>(d_key, d_ind, d_value2,
    nelements);

  // Create a buffer of array of ValueIndexPair
  ValueIndexPair<T>* d_value2_buf;
  mwCudaMalloc(&d_value2_buf, sizeof(ValueIndexPair<T>) * nelements);
  int* d_seq_buf;
  mwCudaMalloc(&d_seq_buf, sizeof(int) * nelements);

  // Create a set of DoubleBuffers to wrap pairs of device pointers
  cub::DoubleBuffer<int> d_seqs(d_seq, d_seq_buf);
  cub::DoubleBuffer<ValueIndexPair<T>> d_values2(d_value2, d_value2_buf);

  // Determine temporary device storage requirements
  d_temp_storage = nullptr;
  temp_storage_bytes = 0;
  cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_seqs,
    d_values2,
    nelements);

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_seqs,
    d_values2,
    nelements);
  if (d_seqs.Current() == d_seq_buf) {
    cudaMemcpy(d_seq, d_seq_buf, nelements * sizeof(int),
               cudaMemcpyDeviceToDevice);
  }

  // Decompose to d_key and d_ind
  if (d_values2.Current() == d_value2) {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value2, d_key, d_ind,
      nelements);
  } else {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value2_buf, d_key,
      d_ind, nelements);
  }

  mwCudaFree(d_value2);
  mwCudaFree(d_value2_buf);
  mwCudaFree(d_seq_buf);
  mwCudaFree(d_temp_storage);
}

template <class T>
  void sortMatrixWithNaNWithIndex(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements)
{
  // Determine temporary device storage requirements
  void* d_temp_storage = nullptr;
  std::size_t temp_storage_bytes = 0;
  if (isAscending) {
    cub::DeviceMergeSort::StableSortPairs(
      d_temp_storage, temp_storage_bytes, d_key,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)), nelements,
      customLesser<T>());
  } else {
    cub::DeviceMergeSort::StableSortPairs(
      d_temp_storage, temp_storage_bytes, d_key,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)), nelements,
      customGreater<T>());
  }

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  if (isAscending) {
    cub::DeviceMergeSort::StableSortPairs(
      d_temp_storage, temp_storage_bytes, d_key,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)), nelements,
      customLesser<T>());
  } else {
    cub::DeviceMergeSort::StableSortPairs(
      d_temp_storage, temp_storage_bytes, d_key,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)), nelements,
      customGreater<T>());
  }

  mwCudaFree(d_temp_storage);

  // Create an array of ValueIndexPair <d_key, d_ind>
  ValueIndexPair<T>* d_value;
  mwCudaMalloc(&d_value, sizeof(ValueIndexPair<T>) * nelements);
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createValueIndexPairArray<<<dimGrid, dimBlock>>>(d_key, d_ind, d_value,
    nelements);

  // Create a buffer of array of ValueIndexPair
  ValueIndexPair<T>* d_value_buf;
  mwCudaMalloc(&d_value_buf, sizeof(ValueIndexPair<T>) * nelements);
  int* d_seq_buf;
  mwCudaMalloc(&d_seq_buf, sizeof(int) * nelements);

  // Create a set of DoubleBuffers to wrap pairs of device pointers
  cub::DoubleBuffer<int> d_seqs(d_seq, d_seq_buf);
  cub::DoubleBuffer<ValueIndexPair<T>> d_values(d_value, d_value_buf);

  // Determine temporary device storage requirements
  d_temp_storage = nullptr;
  temp_storage_bytes = 0;
  cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_seqs,
    d_values,
    nelements);

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_seqs,
    d_values,
    nelements);
  if (d_seqs.Current() == d_seq_buf) {
    cudaMemcpy(d_seq, d_seq_buf, nelements * sizeof(int),
               cudaMemcpyDeviceToDevice);
  }

  // Decompose to d_key and d_ind
  if (d_values.Current() == d_value) {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value, d_key, d_ind,
      nelements);
  } else {
    decomposeValueIndexPairArray<<<dimGrid, dimBlock>>>(d_value_buf, d_key,
      d_ind, nelements);
  }

  mwCudaFree(d_value);
  mwCudaFree(d_value_buf);
  mwCudaFree(d_seq_buf);
  mwCudaFree(d_temp_storage);
}

// Specialize float and double type to use CUB merge sort when sorting <d_key, <d_seq, d_ind>>.
// CUB radix sort does not support custom comparator to deal with NaN.
template <>
  inline void sortMatrixWithIndex<float>(float* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements)
{
  sortMatrixWithNaNWithIndex(d_key, d_ind, d_seq, isAscending, nelements);
}

template <>
  inline void sortMatrixWithIndex<double>(double* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements)
{
  sortMatrixWithNaNWithIndex(d_key, d_ind, d_seq, isAscending, nelements);
}

// Apply segmented sort to sort matrix if operating along the primary dimension.
template <class T>
  void sortMatrixWithIndexSegmented(T* d_key, double* d_ind, int s, bool
  isAscending, int nelements)
{
  int num_segments = nelements / s;
  int* d_offsets;
  mwCudaMalloc(&d_offsets, (num_segments + 1) * sizeof(int));
  dim3 dimBlock(mw::detail::BLOCK_SIZE, 1, 1);
  int numBlocksX = num_segments / mw::detail::BLOCK_SIZE + 1;
  dim3 dimGrid(numBlocksX, 1, 1);
  createOffsets<<<dimGrid, dimBlock>>>(d_offsets, s, nelements);
  numBlocksX = (nelements - 1) / mw::detail::BLOCK_SIZE + 1;
  dimGrid = dim3(numBlocksX, 1, 1);
  createInd<<<dimGrid, dimBlock>>>(d_ind, s, nelements);
  T* d_key_buf;
  mwCudaMalloc(&d_key_buf, sizeof(T) * nelements);
  double* d_ind_buf;
  mwCudaMalloc(&d_ind_buf, sizeof(double) * nelements);

  // Create a DoubleBuffer to wrap the pair of device pointers
  cub::DoubleBuffer<T> d_keys(d_key, d_key_buf);
  cub::DoubleBuffer<double> d_inds(d_ind, d_ind_buf);

  // Determine temporary device storage requirements
  void* d_temp_storage = nullptr;
  size_t temp_storage_bytes = 0;
  if (isAscending) {
    cub::DeviceSegmentedSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_inds, nelements, num_segments, d_offsets,
      d_offsets + 1);
  } else {
    cub::DeviceSegmentedSort::StableSortPairsDescending(d_temp_storage,
      temp_storage_bytes,
      d_keys, d_inds, nelements, num_segments,
      d_offsets, d_offsets + 1);
  }

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  if (isAscending) {
    cub::DeviceSegmentedSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_inds, nelements, num_segments, d_offsets,
      d_offsets + 1);
  } else {
    cub::DeviceSegmentedSort::StableSortPairsDescending(d_temp_storage,
      temp_storage_bytes,
      d_keys, d_inds, nelements, num_segments,
      d_offsets, d_offsets + 1);
  }

  if (d_keys.Current() == d_key_buf) {
    cudaMemcpy(d_key, d_key_buf, nelements * sizeof(T), cudaMemcpyDeviceToDevice);
  }

  if (d_inds.Current() == d_ind_buf) {
    cudaMemcpy(d_ind, d_ind_buf, nelements * sizeof(double),
               cudaMemcpyDeviceToDevice);
  }

  mwCudaFree(d_offsets);
  mwCudaFree(d_key_buf);
  mwCudaFree(d_ind_buf);
  mwCudaFree(d_temp_storage);
}

template <class T>
  void sortPairs(T* d_key, double* d_ind, bool isAscending, int nelements)
{
  thrust::sequence(thrust::device, d_ind, d_ind + nelements, 1);// starts at 1
  T* d_key_buf;
  mwCudaMalloc(&d_key_buf, sizeof(T) * nelements);
  double* d_ind_buf;
  mwCudaMalloc(&d_ind_buf, sizeof(double) * nelements);

  // Create a set of DoubleBuffers to wrap pairs of device pointers
  cub::DoubleBuffer<T> d_keys(d_key, d_key_buf);
  cub::DoubleBuffer<double> d_inds(d_ind, d_ind_buf);

  // Determine temporary device storage requirements
  void* d_temp_storage = nullptr;
  size_t temp_storage_bytes = 0;
  if (isAscending) {
    cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_keys,
      d_inds,
      nelements);
  } else {
    cub::DeviceRadixSort::SortPairsDescending(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_inds, nelements);
  }

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  if (isAscending) {
    cub::DeviceRadixSort::SortPairs(d_temp_storage, temp_storage_bytes, d_keys,
      d_inds,
      nelements);
  } else {
    cub::DeviceRadixSort::SortPairsDescending(d_temp_storage, temp_storage_bytes,
      d_keys,
      d_inds, nelements);
  }

  if (d_keys.Current() == d_key_buf) {
    cudaMemcpy(d_key, d_key_buf, nelements * sizeof(T), cudaMemcpyDeviceToDevice);
  }

  if (d_inds.Current() == d_ind_buf) {
    cudaMemcpy(d_ind, d_ind_buf, nelements * sizeof(double),
               cudaMemcpyDeviceToDevice);
  }

  mwCudaFree(d_key_buf);
  mwCudaFree(d_ind_buf);
  mwCudaFree(d_temp_storage);
}

template <class T>
  void mergeSortPairs(T* d_key, double* d_ind, bool isAscending, int nelements)
{
  thrust::sequence(thrust::device, d_ind, d_ind + nelements, 1);// starts at 1

  // Determine temporary device storage requirements
  void* d_temp_storage = nullptr;
  std::size_t temp_storage_bytes = 0;
  if (isAscending) {
    cub::DeviceMergeSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_key, d_ind,
      nelements, customLesser<T>());
  } else {
    cub::DeviceMergeSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_key, d_ind,
      nelements, customGreater<T>());
  }

  // Allocate temporary storage
  mwCudaMalloc(&d_temp_storage, temp_storage_bytes);

  // Run sorting operation
  if (isAscending) {
    cub::DeviceMergeSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_key, d_ind,
      nelements, customLesser<T>());
  } else {
    cub::DeviceMergeSort::StableSortPairs(d_temp_storage, temp_storage_bytes,
      d_key, d_ind,
      nelements, customGreater<T>());
  }

  mwCudaFree(d_temp_storage);
}

// Specialize float and double type to use CUB merge sort when sorting <d_key, d_ind>.
// CUB radix sort does not support custom comparator to deal with NaN.
template <>
  inline void sortPairs<float>(float* d_key, double* d_ind, bool isAscending,
  int nelements)
{
  mergeSortPairs(d_key, d_ind, isAscending, nelements);
}

template <>
  inline void sortPairs<double>(double* d_key, double* d_ind, bool isAscending,
  int nelements)
{
  mergeSortPairs(d_key, d_ind, isAscending, nelements);
}

#endif

template <class T>
  void gpuSortImplWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  bool isRowMajor)
{
  int nelements = 1;
  for (int i = 0; i < numDims; i++) {
    nelements *= dims[i];
  }

  // 0-based indexing
  sortAlongDim--;
  if (nelements == 1 ||                // Sorting scalar
      sortAlongDim > numDims - 1 ||    // Return back the input like matlab does
      dims[sortAlongDim] == 1) {
                        // Sorting along singleton dimension, nothing to be done
    thrust::fill(thrust::device, d_ind, d_ind + nelements, 1);// all elements = 1
    return;
  }

  // Sorting row/column vector
  if (numDims == 2 && (dims[0] == 1 || dims[1] == 1)) {

#if MW_INCLUDE_CUB

    sortPairs<T>(d_key, d_ind, isAscending, nelements);

#else

    callThrustSortByKeyWithIndexSimple(d_key, d_ind, isAscending, nelements);

#endif

    return;
  }

  // Sorting 2d, 3d ... nd matrices along "sortAlongDim"
  if ((sortAlongDim == 0 && !isRowMajor) || (sortAlongDim == numDims - 1 &&
       isRowMajor)) {
    sortAlongEdgeDimWithIndex<T>(d_key, d_ind, dims[sortAlongDim], isAscending,
      nelements);
  } else {
    sortAlongOtherDimWithIndex<T>(d_key, d_ind, numDims, dims, sortAlongDim,
      isAscending,
      nelements, isRowMajor);
  }
}

//-------------------------
// Device declarations
//-------------------------
template <class T>
  __device__ void sortAlongEdgeDimWithIndexDevice(T* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements);
template <class T>
  __device__ void sortAlongOtherDimWithIndexDevice(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  int nelements,
  bool isRowMajor);
template <class T>
  __device__ void callThrustSortByKeyWithIndexDevice(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <class T>
  __device__ void callThrustSortByKeyWithIndexSimpleDevice(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements);
template <class T>
  __device__ void thrustSortDeviceImplWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  bool isRowMajor);

//-------------------------
// Device implementations
//-------------------------
template <class T>
  __device__ void sortAlongEdgeDimWithIndexDevice(T* d_key,
  double* d_ind,
  int s,
  bool isAscending,
  int nelements)
{
  int* d_seq;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  createSeqEdgeDimWithIndexDevice(d_seq, d_ind, s, nelements);
  callThrustSortByKeyWithIndexDevice<T>(d_key, d_ind, d_seq, isAscending,
    nelements);
  mwCudaFree(d_seq);
}

template <class T>
  __device__ void sortAlongOtherDimWithIndexDevice(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  int nelements,
  bool isRowMajor)
{
  int* d_seq;
  T* d_key_out;
  double* d_ind_out;
  int* d_stride;
  int* d_shflStride;
  int* d_oldDim;
  int nelem2;
  int s;
  int d;
  mwCudaMalloc(&d_seq, sizeof(int) * nelements);
  mwCudaMalloc(&d_key_out, sizeof(T) * nelements);
  mwCudaMalloc(&d_ind_out, sizeof(double) * nelements);
  mwCudaMalloc(&d_stride, sizeof(int) * numDims);
  mwCudaMalloc(&d_shflStride, sizeof(int) * numDims);
  mwCudaMalloc(&d_oldDim, sizeof(int) * numDims);
  if (isRowMajor) {
    nelem2 =
      calcRowMajorStrideAndDim(dims, numDims, sortAlongDim, d_stride,
      d_shflStride, d_oldDim);
  } else {
    nelem2 =
      calcColMajorStrideAndDim(dims, numDims, sortAlongDim, d_stride,
      d_shflStride, d_oldDim);
  }

  s = d_stride[sortAlongDim];
  d = dims[sortAlongDim];
  createSeqOtherDimWithIndexDevice(d_seq, d_ind, s, d, nelements, nelem2);
  callThrustSortByKeyWithIndexDevice<T>(d_key, d_ind, d_seq, isAscending,
    nelements);
  if (isRowMajor) {
    shuffleRowMajorWithIndexDevice<T>(d_key, d_key_out, d_ind, d_ind_out,
      d_shflStride,
      d_oldDim, numDims, nelements);
  } else {
    shuffleColMajorWithIndexDevice<T>(d_key, d_key_out, d_ind, d_ind_out,
      d_shflStride,
      d_oldDim, numDims, nelements);
  }

  memcpy(d_key, d_key_out, nelements * sizeof(T));
  memcpy(d_ind, d_ind_out, nelements * sizeof(double));
  mwCudaFree(d_key_out);
  mwCudaFree(d_ind_out);
  mwCudaFree(d_seq);
  mwCudaFree(d_stride);
  mwCudaFree(d_shflStride);
  mwCudaFree(d_oldDim);
}

template <class T>
  __device__ void callThrustSortByKeyWithIndexDevice(T* d_key,
  double* d_ind,
  int* d_seq,
  bool isAscending,
  int nelements)
{
  if (isAscending) {
    thrust::stable_sort_by_key(thrust::seq, d_key, d_key + nelements,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)),
      customLesser<T>());
  } else {
    thrust::stable_sort_by_key(thrust::seq, d_key, d_key + nelements,
      thrust::make_zip_iterator(thrust::make_tuple(d_seq, d_ind)),
      customGreater<T>());
  }

  thrust::stable_sort_by_key(thrust::seq, d_seq, d_seq + nelements,
    thrust::make_zip_iterator(thrust::make_tuple(d_key, d_ind)));
}

template <class T>
  __device__ void callThrustSortByKeyWithIndexSimpleDevice(T* d_key,
  double* d_ind,
  bool isAscending,
  int nelements)
{
  thrust::sequence(thrust::seq, d_ind, d_ind + nelements, 1);// starts at 1
  if (isAscending) {
    thrust::stable_sort_by_key(thrust::seq, d_key, d_key + nelements, d_ind,
      customLesser<T>());
  } else {
    thrust::stable_sort_by_key(thrust::seq, d_key, d_key + nelements, d_ind,
      customGreater<T>());
  }
}

template <class T>
  __device__ void thrustSortDeviceImplWithIndex(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  bool isRowMajor)
{
  int nelements = 1;
  for (int i = 0; i < numDims; i++) {
    nelements *= dims[i];
  }

  // 0-based indexing
  sortAlongDim--;
  if (nelements == 1 ||                // Sorting scalar
      sortAlongDim > numDims - 1 ||    // Return back the input like matlab does
      dims[sortAlongDim] == 1) {
                        // Sorting along singleton dimension, nothing to be done
    thrust::fill(thrust::seq, d_ind, d_ind + nelements, 1);// all elements = 1
    return;
  }

  // Sorting row/column vector
  if (numDims == 2 && (dims[0] == 1 || dims[1] == 1)) {
    callThrustSortByKeyWithIndexSimpleDevice<T>(d_key, d_ind, isAscending,
      nelements);
    return;
  }

  // Sorting 2d, 3d ... nd matrices along "sortAlongDim"
  if ((sortAlongDim == 0 && !isRowMajor) || (sortAlongDim == numDims - 1 &&
       isRowMajor)) {
    sortAlongEdgeDimWithIndexDevice<T>(d_key, d_ind, dims[sortAlongDim],
      isAscending,
      nelements);
  } else {
    sortAlongOtherDimWithIndexDevice<T>(d_key, d_ind, numDims, dims,
      sortAlongDim, isAscending,
      nelements, isRowMajor);
  }
}

//-------------------------
// sort entry point
//-------------------------
template <class T>
  __host__ __device__ void gpu_sort_with_index(T* d_key,
  double* d_ind,
  int numDims,
  const int* dims,
  int sortAlongDim,
  bool isAscending,
  bool isRowMajor)
{
  bool isDevice;

#ifdef __CUDA_ARCH__

  isDevice = true;

#else

  isDevice = false;

#endif

  if (isDevice) {
    thrustSortDeviceImplWithIndex<T>(d_key, d_ind, numDims, dims, sortAlongDim,
      isAscending,
      isRowMajor);
  } else {
    gpuSortImplWithIndex<T>(d_key, d_ind, numDims, dims, sortAlongDim,
      isAscending, isRowMajor);
  }
}

#endif
#endif
