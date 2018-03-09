[深度](https://xmfbit.github.io/2017/03/08/mathfunctions-in-caffe/)
# Datum
caffe内置的数据结构，由proto自动生成的读写代码，在caffe.proto中有定义
datum = caffe.proto.caffe_pb2.Datum()

# caffe.Classifier 继承自　caffe.Net

## 基类
### Blob 网络参数
### layer 网络层
pad 参数
- base_conv_layer
    - conv_layer

## 依赖库
- BLAS(basic linear algebra subprograms，基础线性代数子程序库)
    提供了一些低层次的通用线性代数运算的实现函数，如向量的相加，数乘，点积和矩阵相乘等。在BLAS的统一框架下，不同厂商根据自己硬件的特点，开发了自己的加速库，这里BLAS起到了应用程序接口(API)标准的作用。
    有多种选择，默认是开源的ATLAS
    [对比](https://www.zhihu.com/question/27872849)

## 名词缩写
- gemm（GEMM: General Matrix to Matrix Multiplication）矩阵与矩阵相乘
- gemv 矩阵和向量相乘
- unified virtual address（UVA），将CPU和GPU看做一个统一的空间。