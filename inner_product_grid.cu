//     Author: Chihiro Nakatani
//     February 9th, 2021
//     This script contains the inner product function with cpp.

#include <iostream>
#include <numeric>
#define SIZE_OF_ARRAY(array) (sizeof(array)/sizeof(array[0]))

// Define kernel function for inner product
__global__
void inner_product(int n, float *x, float *y, float *z)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride)
        z[i] = x[i] * y[i];
}

// Define main function
int main(void)
{
    //   Define input vector length
    int N = 10000000;
    std::cout << "Vector size : " << N << std::endl;  
   
    // Initialize float vectors with different float values
    float *x = new float[N];
    float *y = new float[N];
    float *z = new float[N];
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));
    cudaMallocManaged(&z, N*sizeof(float));
    for (int i = 0; i < N; i++) {
        x[i] = 1;
        y[i] = 2;
        z[i] = 0;
    }

    // Check whether Initialization is right (If you use big N, you should not check it in command line)

    //std::cout << "Initialize vector x: [ ";
    //for (int i = 0; i < N; i++) {
    //    std::cout << x[i] << " ";
    //}
    //std::cout << "]" << std::endl;

    //std::cout << "Initialize vector y: [ ";
    //for (int i = 0; i < N; i++) {
    //    std::cout << y[i] << " ";
    //}
    //std::cout << "]" << std::endl;

    // Execute kernel on vector on the GPU
    int blockSize = 256;
    int numBlocks = (N+blockSize-1) / blockSize;    
    inner_product<<<numBlocks, blockSize>>>(N, x, y, z);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    float inner_product_value = std::accumulate(z, z + N, 0);
    std::cout << "Inner product (z = (x,y)): " << inner_product_value << std::endl;

    // Free memory which is used for vectors
    cudaFree(x);
    cudaFree(y);
    cudaFree(z);

    return 0;
}