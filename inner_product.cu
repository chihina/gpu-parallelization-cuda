//     Author: Chihiro Nakatani
//     February 9th, 2021
//     This script contains the inner product function with cpp.

#include <iostream>

// Define kernel function for inner product
__global__
void inner_product(int n, float *x, float *y, float *z)
{
    for (int i = 0; i < n; i++)
        z[0] += x[i] * y[i];
}

// Define main function
int main(void)
{
    //   Define input vector length
    int N = 5;
    std::cout << "Vector size : " << N << std::endl;  
   
    //   Initialize a float variable
    float *z = new float[1];
    cudaMallocManaged(&z, 1*sizeof(float));
    z[0] = 0;

    // Initialize float vectors with different float values
    float *x = new float[N];
    float *y = new float[N];
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));
    for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // Check whether Initialization is right (If you use big N, you should not check it in command line)
    std::cout << "Initialzze scalar z: " << z[0] << std::endl;  

    std::cout << "Initialize vector x: [ ";
    for (int i = 0; i < N; i++) {
        std::cout << x[i] << " ";
    }
    std::cout << "]" << std::endl;

    std::cout << "Initialize vector y: [ ";
    for (int i = 0; i < N; i++) {
        std::cout << y[i] << " ";
    }
    std::cout << "]" << std::endl;

    // Execute kernel on vector on the GPU
    inner_product<<<1, 1>>>(N, x, y, z);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    std::cout << "Inner product (z = (x,y)): " << z[0] << std::endl;

    // Free memory which is used for vectors
    cudaFree(x);
    cudaFree(y);
    cudaFree(z);

    return 0;
}