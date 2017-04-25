## lstm: long short-term memory (时间递归神经网络)
## lrcn: long-term recurrent convolutional network

# notebook examples
1. image classification and filter visuallization  
    convolutional network  
    input image -> convolution -> non-linearity(rectified linear unite) -> pooling -> feature maps
<<<<<<< HEAD

    net.blobs['data'].data[...]\(这里的三个点指data里的所有数据都赋值) = transformed_image

    net.blobs.iteritems() 迭代每层网络的输出(batch_size, channel_dim, height, width).
    net.forwad()的输出是一个Dict，使用key-value的方式存储


2. learning LeNet
    create_mnist.sh 生成lmdb数据集
    DAG: directed acyclic graph(有向无环图)
    loss
=======
2. learning LeNet  
    create_mnist.sh 生成lmdb数据集  
    DAG: directed acyclic graph(有向无环图)  
    loss  
    - solver.net.forward()  
    定义的网络内有lmdb数据的路径，调用 solver.net.forward() 后，才会调出数据集，加载网络只是生成网络结构。
<<<<<<< HEAD
    - solver.net.blobs['data'].data[:8, 0].transpose(1, 0, 2).reshape(28, 8*28)，其中，blobs['data'].data是(64,1,28,,28)维数据，而[:8, 0]并没有把序号写完全，那么他们只是表示最外层的两个维度，在这里即是(64,1)这两个维度，所以结果为(8,28,28)的维度  
    - solver.step(1)  
        进行一次SGD运算，会调用新的数据，但是没有输出提示信息
```python
#显示数据集里的数字，data[0,0]中的第一个0表示，batch-size里的第0个数字
imshow(solver.net.blobs['data'].data[0,0],cmap='gray')
show()
#显示标签
solver.net.blobs['label'].data
#显示预测结果，这个score好像没有归一化，越高越好???
solver.net.blobs['score'].data[0]

```
=======
      
>>>>>>> eb1fcce51eba0a0b25870ad035b0591aee25af0c
>>>>>>> 6f23394e446f53518af3411b779a2f19b34d4b2e
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
    models/bvlc_reference_caffenet/solver.prototxt 定义网络参数，迭代次数，  epoches，batch-size……  
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