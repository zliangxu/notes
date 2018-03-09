## RetinaNet,Deformable Convolution改进总结
### 遇到的问题
1. WiderFace数据集验证集AP指标上不去
难以想象，同一个模型，不同数据集的测试方法是不同的。在S3FD在WiderFace原图大小测试，水平翻转后再测试，使用
