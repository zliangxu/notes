# graphical models
## bayesian network
有向箭头尾部是父节点，头部是子节点。  
贝叶斯网络也叫作有向图模型    
阴影圆表示: 可观测变量    
实心点圆表示: 确定参数    

## conditional independence
给定$c$，$a$独立于$b$
> $$a\perp b \mid c \iff p(a,b\mid c)=p(a\mid c)\cdot p(b\mid c)$$

条件独立特性能够使概率模型结构简单，能够简化概率模型训练、推测时的计算。d-separation，其中d代表directed，可以很容易的从图结构中看出哪些变量是条件独立的。以下提供三个例子：
1. tail-to-tail，a与b不满足条件独立，观测到中间变量c后，a与b变为条件独立的    
2. head-to-tail，a与b不满足条件独立，观测到中间变量c后，a与b变为条件独立的    
给定$(8.26)$，证明下式???
> $$\text{已知} p(a,b,c)=p(a)\cdot p(c\mid a) \cdot p(b\mid c), \quad \text{求解} p(a,b)$$(8.26)
> $$p(a,b)=p(a)\sum_c p(c\mid a)\cdot p(b\mid c)=p(a)\sum_c p(c,b\mid a) = p(a)\cdot p(b\mid a)$$
也就是说
> $$p(c,b\mid a)=p(c\mid a)\cdot p(b\mid c,a)=p(c\mid a)\cdot p(b\mid c)$$
3. head-to-head，a与b满足条件独立，观测到中间变量c后，a与b不满足条件独立

## Markov random fields
马尔科夫随机场也叫作无向图模型，Markov network    
- Ising model(易辛模型)


## factor graph
可以将有向图与无向图模型都转换为factor graph