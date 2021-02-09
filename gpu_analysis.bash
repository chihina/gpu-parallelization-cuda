g++ inner_product.cpp -o inner_product_cpp
nvcc inner_product.cu -o inner_product_cuda 
nvcc inner_product_block.cu -o inner_product_block_cuda 
nvcc inner_product_grid.cu -o inner_product_grid_cuda 

./inner_product_cpp
nvprof ./inner_product_cuda
nvprof ./inner_product_block_cuda
nvprof ./inner_product_grid_cuda