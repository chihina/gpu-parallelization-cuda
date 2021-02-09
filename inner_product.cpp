//     Author: Chihiro Nakatani
//     February 9th, 2021
//     This script contains the inner product function with cpp.

#include <iostream>
#include <numeric>
#define SIZE_OF_ARRAY(array) (sizeof(array)/sizeof(array[0]))

// Define innter product function
void inner_product(int n, float *x, float *y, float *z)
{
    for (int i = 0; i < n; i++)
        z[i] = x[i] * y[i];
}

// Define main function
int main(void)
{
    //   Define input vector length
    int N = 10000;
    std::cout << "Vector size : " << N << std::endl;  
   
    // Initialize float vectors with different float value
    float *x = new float[N];
    float *y = new float[N];
    float *z = new float[N];

    for (int i = 0; i < N; i++) {
        x[i] = 1;
        y[i] = 2;
        z[i] = 0;
    }
    
    // Check whether Initialization is right (If you use big N, you should not check it in command line)
    // std::cout << "Initialize vector x: [ ";
    // for (int i = 0; i < N; i++) {
    //     std::cout << x[i] << " ";
    // }
    // std::cout << "]" << std::endl;

    // std::cout << "Initialize vector y: [ ";
    // for (int i = 0; i < N; i++) {
    //     std::cout << y[i] << " ";
    // }
    // std::cout << "]" << std::endl;

    // std::cout << "Initialize vector z: [ ";
    // for (int i = 0; i < N; i++) {
    //     std::cout << z[i] << " ";
    // }
    // std::cout << "]" << std::endl;

    // Execute inner product function
    inner_product(N, x, y, z);

    // std::cout << "Output vector z:     [ ";
    // for (int i = 0; i < N; i++) {
    //     std::cout << z[i] << " ";
    // }
    // std::cout << "]" << std::endl;

    float inner_product_value = std::accumulate(z, z + N, 0);
    std::cout << "Inner product (z = (x,y)): " << inner_product_value << std::endl;
    
    // Free memory which is used for vectors
    delete [] x;
    delete [] y;
    delete [] z;

    return 0;
}