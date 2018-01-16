# an analysis of scale invariance in object detection---snip
## abstract
snip: scale normalization image pyramids  

## introduction
为解决多尺度及小目标检测的问题：
- 浅层网络特征与深层网络特征结合 FPN
- dilated/deformable 卷积，用于增大感受野检测大目标
- 使用多层特征，多层输出 SSD
- 使用上下文信息
- 使用不同大小的输入图像训练
- 建立输入图像金字塔，金字塔各层分别做inference

## related work

## image classification at multiple scales
domain shift，即训练与测试时的输入图片大小不同，引入的输入分布变化。  
典型的训练时输入$800\times 1200$，测试时$1400\times 2000$
- CNN-B-FT
 使用上采样低分辨率的图像上微调CNN-B 