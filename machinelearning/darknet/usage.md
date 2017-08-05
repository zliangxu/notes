## darknet
Darknet is an open source neural network framework written in C and CUDA. It is fast, easy to install, and supports CPU and GPU computation.

- Tiny YOLO
Tiny YOLO is based off of the Darknet reference network and is much faster but less accurate than the normal YOLO model. 


## usage
```shell
# 选项
-nogpu #不使用gpu，完全使用cpu计算

./darknet imtest data/eagle.jpg  #测试opencv安装成功与否
./darknet classifier
./darknet classifier train .data .cfg
./darknet detector
./darknet detector train .data .cfg  .conv(pretrained model)
```

- .data内容
数据信息，每张图片的标签在文件名字上？？
classes=10: the dataset has 10 different classes
train = ...: where to find the list of training files
valid = ...: where to find the list of validation files
labels = ...: where to find the list of possible classes
backup = ...: where to save backup weight files during training
top = 2: calculate top-n accuracy at test time (in addition to top-1)

- .cfg内容
网络参数结构