## lstm: long short-term memory (时间递归神经网络)
## lrcn: long-term recurrent convolutional network

# notebook examples
1. image classification and filter visuallization
    convolutional network
    input image -> convolution -> non-linearity(rectified linear unite) -> pooling -> feature maps
2. learning LeNet
    create_mnist.sh 生成lmdb数据集
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