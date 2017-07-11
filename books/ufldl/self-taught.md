## self-taught(自学习)
特征学习分为自学习和半监督学习，它们的区别在于自学习使用的无标标训练集和已标注数据来自于不同的分布，即使用的数据不是从已标注数据去除标注而提取出来的；半监督学习使用的无标注数据和已标注数据来自于同一个分布。
## 新特征下的数据表示方式
替代表示(replacement representation)
$$x^i \Rightarrow a^i$$
级联表示(concatenation representation)
$$x^i \Rightarrow (x^i,a^i)$$
一般级联表示包含更多的数据，所以效果会更好一些。