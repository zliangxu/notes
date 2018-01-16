# autoencoders
自编码器用于不那么完美的复制输入

## undercomplete autoencoders
编码器的输出维度低于输入维度的都叫欠完备的

## regularized autoencoders
overcomplete超完备的，编码器输出维度大于输入维度  
inference proceduer：指给定输入，计算潜变量
### sparse autoencoder
> $$L(x,g(f(x)))+\Omega(h)$$
其中，$\Omega(h)=\lambda \sum_{i} |h_i|$是稀疏惩罚项
### denoising autoencoder
> $$L(x,g(f(\tilde x)))$$
其中，$\tilde x$是$x$引入噪声后的值。
### regularizing by penalizing derivatives
contractive autoencoder，收缩自编码器
> $$L(x,g(f(x)))+\Omega(h,x)$$
其中，$\Omega(h,x)=\lambda \sum_i \|\nabla_xh_i\|^2$，使模型学习到在当输入变化少时，输出变化也要少。   
编码器$h=f(x)$
> $$\Omega(h)=\lambda \|\frac{\partial f(x)}{\partial x}\|^2$$
## representational power, layer size and depth

