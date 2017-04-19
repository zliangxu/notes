## lstm: long short-term memory (时间递归神经网络)
## lrcn: long-term recurrent convolutional network




- matcaffe(matlab)
# tutorial
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
- data layer
    image data
    database: levelDB、LMDB
    hdf5 input 
    hdf5 output
    input 
    window data
    memory data
    dummy data

- vision layer
    conv1
    pool1

- Activation /Neuron Layers
    ReLU1/Rectified-Linear and Leaky-ReLU Layer 
    是rectified linear units的缩写
6. interfaces
- cmdcaffe 
    在build/tools/
- pycaffe
7. Data:Ins and Outs
# notebook examples
1. image classification and filter visuallization
    convolutional network
    input image -> convolution -> non-linearity(rectified linear unite) -> pooling -> feature maps
2. learning LeNet
    DAG: directed acyclic graph(有向无环图)
    loss
3. brewing models
4. fine-tuning
5. editing model parameters
6. R-CNN detection
7. Siamese network embedding

# command line examples
都是在调用 build/tools/caffe可执行文件
1. ImageNet tutorial
    主要用于imageNet
    examples/imagenet/create_imagenet.sh  由图像转lmdb数据集
    examples/imagenet/make_imagenet_mean.sh 计算图像均值，这个根据网络结构的需要进行的
    models/bvlc_reference_caffenet/train_val.prototxt 定义网络结构，卷积核大小，神经元数目……
    models/bvlc_reference_caffenet/solver.prototxt 定义网络参数，迭代次数，epoches，batch-size……
2. LeNet MNIST Tutorial   (LeNet 1998)
    examples/mnist/lenet_train_test.prototxt 网络结构
    [网络结构定义解释](http://caffe.berkeleyvision.org/gathered/examples/mnist.html)
    ReLU层的top和bottom可以是相同的blob，因为它是elemnet-wise操作，所以可以节省内存
    Layer definitions can include rules for whether and when they are included in the network definition()
3. CIFAR-10 tutorial [CIFAR-dataset](http://www.cs.toronto.edu/~kriz/cifar.html)
    score 0 is the accuracy,
    score 1 is the testing loss function.
4. Fine-tuning for style recognition
    使用相同的神经网络结构，初始化时使用已经训练好的模型参数，加上自己的数据集，来做调整，可以加速训练
5. Feature extraction with Caffe C++ code.
    ./build/tools/extract_features.bin 
    仅仅是提特征，如何使用这些特征没有提到
6. CaffeNet C++ Classification example    
7. Web demo
8. Siamese Network Tutorial(孪生网络，一种网络结构)