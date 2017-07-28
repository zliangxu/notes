you only look once
-----
[yolo](https://zhuanlan.zhihu.com/p/25236464)  
## abstract 
思想是把整幅图像均分成$7*7$的格子，然后把目标检测的任务分到图像中物体中心所在图像中的小格子内。每一个小格子的输出信息是Bounding box加上conditional class probability。这样就把问题转换为回归问题，而不再是分类器。具体地网络输出层包括:$7*7*(B*5+C)$维度向量，相当于每个格子输出$B*5+C$维向量：
- Bounding box(包含物体的矩形区域，注意，不是划分的小格子)  
    该信息包括5个数据  
    x,y：是物体即框的中心，相对于划分的小格子的偏移，归一化后的;  
    width,height：相对于整幅图像的长和宽，归一化后的;  
    confidence：是由两个数字乘积得到的，第一个是该小格子内是否有目标$Pr(object)$，有是1，无是0;第二个是3预测的物体框与标记数据的框的重合面积(intersection over union)$IOU^{truth}_{pred}$(是否归一化？？是)，这个是输出数据，训练的时候由标记数据与预测框一起计算误差做truth-label，测试的时候没有标记数据时怎么计算？？由网络直接输出预测重合面积;
- conditional class probability(每个类的条件概率)  
    输出C个类别的概率
## tips
- 输出层是全连接层，所以输入层的图像大小需要一致。
- 每个小格子可以输出B个Bounding Box，但是只保留一个$IOU$最大的框为物体检测输出。这意味着每个格子最多只能检测出一个物体。