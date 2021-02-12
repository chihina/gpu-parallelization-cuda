# gpu-parallelization-cuda
This repository contains parallelization scripts for inner product with cuda.

## Contents 
- inner_product.cpp ... C++ script to calculate vector inner product.  
- inner_product.cu ... CUDA script to calculate vector inner product (1 Thread-block, 1 Thread per thread-block).  
- inner_product_block.cu ... CUDA script to calculate vector inner product (1 Thread-block, 256 Thread per thread-block).  
- inner_product_grid.cu ... CUDA script to calculate vector inner product (Multi Thread-block, 1 Thread per thread-block).  

## Profile tools
I used two profiler (C++ and CUDA)  
- gprof  
- nvprof  

## How to try it
I wrote a bash script to test this project.

```
bash ./gpu_analysis.bash
```
