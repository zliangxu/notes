http://www.cnblogs.com/liqizhou/archive/2012/05/12/2497220.html  
[定义](http://blog.csdn.net/carson2005/article/details/7337432)  
[matlab 算法实现](http://blog.csdn.net/hjimce/article/details/45718593)  

http://blog.csdn.net/abcjennifer/article/details/8170687  
http://blog.csdn.net/itplus/article/details/10088625

## 一、算法原理
概率密度函数的核函数估计也称为parzon窗估计。  
mean shift向量，是个向量，指偏移量  
- 基本的均值偏移形式
$$M_h(x)=\frac{1}{k}\sum_{x_i\in S}(x_i-x)$$
其中，k为属于S的点的数目
- 改进的均值偏移形式  
    引入了核函数和权重的概念
$$M_h(x)=\frac{\sum_{i=1}^{n}G_h(x_i-x)*w(x_i)*(x_i-x)}{\sum_{i=1}^{n}G_h(x_i-x)w(x_i)}$$
其中，n为所有点的数目，$G_h(x)$是核函数，$w(x)$是数据点对应的权重。核函数引入了当前聚类中心与一个数据点距离对
- 均值偏移的概率解释  
    相当于求概率密度最大的点的位置
    parzen窗估计??

## 二、算法描述[参考]((http://blog.csdn.net/google19890102/article/details/51030884))
思想：这里是把每一个数据点当作初始的聚类中心，然后以这个聚类中心计算偏移向量
```shell
初始化：设数据集中的每一个点都不是聚类中心，设mean_shift_distance为一次计算出的均值偏移向量，MIN_DISTANCE为一次偏移位移的最小值。
当mean_shift_distance < MIN_DISTANCE时，进入以下循环  
    对每一个数据点计算均值偏移量
        如果当前点已经设置为聚类中心，则跳过;否则继续运行
        计算该数据点的均值偏移量
        检测该数据点偏移量是否小于本轮主循环的最小偏移量，小则更新;
        并且当偏移量 < MIN_DISTANCE时，设置当前点为聚类中心点
        将该数据点更新为融合进均值偏移量的数据点
根据聚类中心点是否一致对所有数据点进行类标记，这里可以保留聚类中心点的小数点后两位来再判断是否属于同一类。     
```


