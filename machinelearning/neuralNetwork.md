# [neural network summury](http://lanbing510.info/public/file/posts/neural-network.pdf)
## 基本模型
单层感知机、多层感知机、RBF网络(radial basis function、径向基网络)
- RBF网络  
是3层结构，包括输入层，一层隐含层，一层输出层。隐含层一般是高斯径向基函数，输出层是隐含层输出的线性叠加。
## 扩展模型
Hopfield网络、Boltzman machine、RBM(Restricted Boltzman machine)、CNN、DBN、DBM
- Belief Network  
由有向无环图组成，主要包括两个方面的问题，1.inferrence problem(推断未观测变量的状态)，2.learning problem(调整网络参数，使其输出更趋向于观测数据)
- Hopfield Network  
网络内神经元结构、功能完全相同。
- Boltzman machine  
结构类似Hopfield Network，但独具特色的具有隐单元的反馈互联网络。
- RBM  
隐单元条件独立于可观测变量
从马尔科夫随机场的角度看RBM，RBM是限定了二分图结构的玻尔兹曼机(是一个无向图，并且顶点可分割为两个互补相交的子集，互不相交指顶点集合不相交，并且每条边连接的是两个集合的点)
CD算法(Contrastive Divergence)
- DBN(Deep Belief Network)  
可以看做多层RBM的堆叠
- DBM