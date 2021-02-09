//     Author: Chihiro Nakatani
//     February 9th, 2021
//     This script contains the inner product function with cpp.

#include <iostream>
#include <math.h>

// Define innter product function
void inner_product(int n, float *x, float *y, float& z)
{
    for (int i = 0; i < n; i++)
        z += x[i] * y[i];
}

// Define main function
int main(void)
{
    //   Define input vector length
    int N = 5;
    std::cout << "Vector size : " << N << std::endl;  
   
    //   Initialize a float variable
    float z = 0;

    // Initialize float vectors with different float value
    float *x = new float[N];
    float *y = new float[N];
    for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }
    
    // Check whether Initialization is right (If you use big N, you should not check it in command line)
    std::cout << "Initialzze scalar z: " << z << std::endl;  

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

    // Execute inner product function
    inner_product(N, x, y, z);
    std::cout << "Inner product (z = (x,y)): " << z << std::endl;

    // Free memory which is used for vectors
    delete [] x;
    delete [] y;

    return 0;
}