# [tutorial](http://caffe.berkeleyvision.org/tutorial/)

1. Blobs, Layers, and Nets: anatomy of a Caffe model
    - Blob storage and communication: an N-dimensional array stored in C-contiguous fashion, is the standard array and unified memory               interface for the framework.
    - Layer computation and connections 
        The layer comes next as the foundation of both model and computation.
        Layers convolve filters, pool, take inner products, apply nonlinearities like rectified-linear and sigmoid and other elementwise    transformations, normalize, load data, and compute losses like softmax and hinge. 
        每一层神经网络都有三部分
        * setup 初始化网络和连接
        * forward 根据输入计算输出
        * backward 根据输出接口提供的梯度计算梯度，并传递到本层网络的输入接口
    - Layer computation and connections
        The net is a set of layers connected in a computation graph – a directed acyclic graph (DAG)，即从数据输入到完成分类或回归的完整结构。
        Net::Init()模型初始化 
    - model format
        caffe.proto #模型文件存储统一格式
        binaryproto.caffemodel #训练好的模型文件

2. Forward and Backward
    Net::Forward(), Net::Backward()完成整个网络的前向后向传播
    Layer::Forward, Layer::Backward()完成单个网络层的传播
3. Loss(error,cost,objective function)
    in a SoftmaxWithLoss function, the top blob is a scalar (empty shape) which averages the loss (computed from predicted labels pred and  actuals labels label) over the entire mini-batch.
    ```
    layer {
      name: "loss"
      type: "SoftmaxWithLoss"
      bottom: "pred"
      bottom: "label"
      top: "loss"
    }
    ```
4. solver
    solver负责根据Net提供的梯度更新参数
    base_lr: learning rate
    momenum: the momentum μ is the weight of the previous update.
    - Stochastic Gradient Descent (type: "SGD"),
    - AdaDelta (type: "AdaDelta"),
    - Adaptive Gradient (type: "AdaGrad"),
    - Adam (type: "Adam"),
    - Nesterov’s Accelerated Gradient (type: "Nesterov") and
    - RMSprop (type: "RMSProp")  

        $V_{t+1} = \mu V_t - \alpha \nabla L(W_t)$

5. Layer Catalogue
    - data layer[博客输入端](http://blog.csdn.net/whiteinblue/article/details/45330801)
        image data
        database: levelDB、LMDB
        hdf5 input 
        hdf5 output
        input 
        window data
        memory data
        dummy data
        
        batch_size：？？
    - vision layer
        conv1
        pool1
    - full connect layer
        fc1    
    - Activation /Neuron Layers
        ReLU1/Rectified-Linear and Leaky-ReLU Layer 
        是rectified linear units的缩写
    - loss layers
        multinomial logistic loss：多项式逻辑损失函数
        softmax with loss：等价于一个softmax层 + multinomial logistic loss层，把两个层合在一起，可以减少计算量，让梯度更稳定

6. interfaces
    - cmdcaffe 
        在build/tools/
    - pycaffe

7. Data:Ins and Outs
    tops 是输出，bottoms是输入，data层网络只有tops,
```python
    layer {
            name: "mnist"
            # Data layer loads leveldb or lmdb storage DBs for high-throughput.
            type: "Data"
            # the 1st top is the data itself: the name is only convention
            top: "data"
            # the 2nd top is the ground truth: the name is only convention
            top: "label"
            # the Data layer configuration
            data_param {
              # path to the DB
              source: "examples/mnist/mnist_train_lmdb"
              # type of DB: LEVELDB or LMDB (LMDB supports concurrent reads)
              backend: LMDB
              # batch processing improves efficiency.
              batch_size: 64
            }
            # common data transformations
            transform_param {
              # feature scaling coefficient: this maps the [0, 255] MNIST data to [0, 1]
              scale: 0.00390625
              mean_file_size、mirros、crop_size、……
            }
        }   
```
        * caffe.Net is the central interface for loading, configuring, and running models. 
        * caffe.Classifier and caffe.Detector provide convenience interfaces for common tasks.
        * caffe.SGDSolver exposes the solving interface.
        * caffe.io handles input / output with preprocessing and protocol buffers.
        * caffe.draw visualizes network architectures.
        * Caffe blobs are exposed as numpy ndarrays for ease-of-use and efficiency.
<<<<<<< HEAD
=======
7. Data:Ins and Outs
>>>>>>> 7594cedfc360f594dcd849b2160a6eac261ba6f5
