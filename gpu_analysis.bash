# compile cpp and cuda scripts
g++ inner_product.cpp -o inner_product_cpp
nvcc inner_product.cu -o inner_product_cuda 
nvcc inner_product_block.cu -o inner_product_block_cuda 
nvcc inner_product_grid.cu -o inner_product_grid_cuda 

# execute cpp and cuda scripts
./inner_product_cpp > inner_product_cpp.log
nvprof ./inner_product_cuda > inner_product_cuda.log
nvprof ./inner_product_block_cuda > inner_product_block_cuda.log
nvprof ./inner_product_grid_cuda > inner_product_grid_cuda.log