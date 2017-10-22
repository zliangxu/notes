规则化是以降低泛化误差而不是训练误差为目的时，对模型做的修改方式的总称。

## 1.parameter norm penalties
通过使用规则项降低模型容量来提升泛化性能。对于神经网络，只对权重系数做规则化，而不约束偏置系数。因为偏置系数相对于权重需要更少的数据，而且偏置系数只关系到一个变量，而权重系数是连接两个系数的桥梁。最好是每层网络都有一个规则化系数？？？  
- L2规则项，ridge regression, Tikhonov regularization
>  $$\Omega(\theta)=\frac{1}{2}\|w\|_2^2$$
从一步梯度传播上来看L2规则项的影响($\epsilon$ 是学习率)，将
> $$w \leftarrow w - \epsilon \nabla_wJ(w;X,y)$$
变为
> $$w \leftarrow (1-\epsilon \alpha)w - \epsilon \nabla_wJ(w;X,y)$$
从总的L2规则项对最有化点的影响，假设代价函数$J(w)$的最优解为$w^*$，加入L2规则项后，变为  
> $$\tilde{w}=Q(\Lambda+\alpha I)^{-1}Q^Tw^*$$
它说明，L2规则项对w中对代价函数有较大影响的参数没有太大影响，而对代价函数中影响较小的w会影响很大，将它托向0的位置。
- L1规则项  
L1规则项有稀疏特性，可以用于特征选择
> $$\Omega(\theta)=\|w\|_1=\sum_i |w_i|$$
加入L1规则化项的代价函数变为
> $$\nabla_w\tilde{J}(w;X,y)=\alpha sign(w)+\nabla_w J(w;X,y)$$
上式子可以看到L1规则化项对梯度的影响是加入了一个常数，而符号是$sign(w)$。  
假设H为对角矩阵，从L1对最优解的影响的角度来看，最优解变为
> $$w_i = sign(w_i^*) \max \{|w_i^*|-\frac{\alpha}{H_{i,i}}, 0\}$$

## 2. Norm as Constrained Optimization :blush:
拉格朗日乘子 KKT条件
??

## 3. Regularization and Under-Constrained Problems ？？
invert the matrix: 对矩阵求逆
Moore-Penrose pseudoinverse 伪逆？？

## 4. dataset augmentation
- 朝各个方向平移
- 旋转
- 缩放
- 水平、上下翻转
- 引入输入噪声、隐藏层噪声
- dropout can be seen as a process of constructing new inputs by multiplying by noise
数据增强的划分有很强的主观性，如图像剪切被认为是一种预处理操作而不是增强，通用的对输入添加高斯噪声被认为是一种机器学习算法而不是增强。

## 5. noise robustness
一般情况下，为输入增加噪声比添加权重规则项更有用，特别是对隐藏层神经元引入噪声后的泛化能力更强，dropout就是基于这个原理的。  
给参数添加噪声，相当于寻找一个参数点使得代价函数最低，并且这个点周围的参数点也使得代价函数最低。  
给标签引入噪声。

## 6. semi-supervised learning
分开的，使用无标签数据学习数据的表达，例如，主成分分析，然后再使用有标签数据训练分类器  
一起的，生成模型与判别模型共享参数，不懂？？

## 7. multi-task learning
多任务学习有助于提升泛化性能，但是有个前提假设是各任务应该存在潜在的关系。

## 8. early stopping
可以解释为一种超参数或者一种规则化技术
- 超参数解释  
许多超参数的验证误差都是一个U型曲线，迭代次数也是这样，那么就可以通过调整训练次数来控制模型的有效容量(effective capacity of the model)。
要做到early stopping就需要一个单独的没有输入到训练过程中的验证集，而这个验证集在训练完成后的使用方法包括两种，一是记录下达到验证误差最小的迭代次数，然后把验证集添加入训练集，从头开始训练记录下的迭代次数次训练；二是在前面保存的最有验证误差时的模型的基础上，使用训练集加上验证集进行微调。
- 规则化解释  
![early](../../image/deeplearning/deeplearning7.jpg)
首先，在左图中，假设代价函数的最优解是$w^*$，而$w^*$周围的实线圈表示等代价函数值时的各参数值，然后由内向外代价函数依次变高，注意，坐标系为参数。early stopping相当于虚线中，参数由原点周围经过SGD一步步趋向于最优解，然后在这个过程中，取使验证集误差最小的参数。  
右图是带有L2规则化项的代价函数，虚线表示等代价函数中使规则化项数值相等的参数。由于规则化项的存在，最有解不再在$w^*$，而变为了在$\tilde w$  
**to obtain symmetry breaking between hidden units, we cann't initialize all the parameters to 0**

## 9. parameter Tying and Parameter Sharing
规则化、约束、权重共享都相当于 prior knowledge about suitable values of the model parameters
cnn

## 10. Sparse Representation
place a penalty on the activations of the units in a neural network  
稀疏性的意思就是为了提取有效的特征，即用更少的数据来表示原始数据，类似于PCA(principle component analysis)  
representional regularization  
orthognonal mathing pursuit , OMP-k

## 11. bagging and other ensemble methods
**bagging (short for bootstrap aggregating)**  
集成方法比较适用与回归模型，因为回归的是概率，而一个模型预测的误差有正、有负，所以集成后效果要好，但是这有一个前提就是各模型之间的协方差。  
假设有k个回归模型，每一个回归模型在每一个样本上的误差为$\epsilon_i$，它服从方差为$\mathbb{E}[\epsilon_i^2]=v$，协方差为$\mathbb{E}[\epsilon_i\epsilon_j]$的分布，那么集成模型的期望误差为
> $$\mathbb{E[\epsilon_i]}=\frac{1}{k}\sum_{i}\epsilon_i$$
误差的方差为
> $$\begin{aligned}\mathbb{E[(\frac{1}{k}\sum_{i}\epsilon_i)^2]} 
&= \frac{1}{k^2} \mathbb{E}[\sum_{i}(\epsilon_i^2+\sum_{j\rlap{\,/}{=}i}\epsilon_i\epsilon_j)]  \\
&= \frac{1}{k}v + \frac{k-1}{k}c 
\end{aligned}$$
如果各模型之间完全相关，则误差方差不变  
**boosting**  
<font face="黑体" color=#ff0000>测试</font>

## 12. Dropout
can be thought of as a method making bagging practical for ensembles of very many large neural networks.  
输入层神经元被选中的概率设为0.8，隐藏层神经元被选中的概率设为0.5  
dropout与bagging的不同之处：
- bagging中所有模型是相互独立的，而dropout中各模型是参数共享的
- bagging各模型是独立训练并且在某一数据集上收敛的模型，而dropout并没有为每一模型进行显而易见地     单独训练

geometric mean 、arithmetic mean  
weight scaling inference rule，训练好dropout模型后，使用一次网络前向传播来得到output，这个网络包括所有神经元，它的每一个神经元输出要和它的dropout概率相乘来作为该神经元的输出。经验效果比较好，但没有理论说明。它需要模型中不存在非线性特性。

dropout的advatange:
- computational cheap , 训练时仅仅需要增加哪些神经元被屏蔽掉的记录，推断时仅仅需要将权重减半
- 适用面广，不会对训练过程产生约束， 各种网络都适用, feedforward neural network, probabilistic models such as restricted Boltzmann machiens, recurrent neural networks.

dropout的disadvantage:
- 作为一项规则化技术，会降低模型的有效容量，然后对于数据集很充分的任务，dropout并不能有效减少泛化误差

dropout 也可以看做是一个共性隐藏层神经元的模型的集合

## 13. adversarial(排斥的) training (难例学习) (adversarial nets 对抗神经网络)



