## convolution
input is input, argument is called **kernel**, output is sometimes referred as the **feature map**.  
卷积操作是把**kernel**是反褶以后的相关，因为这样可以保证卷积操作的交换律，而交换律在**writing proofs**上比较有用，在神经网络用处不大，所以神经网络领域的卷积操作实质为相关操作(cross-correlation)。

## motivations
卷积操作有三个优点
1. 稀疏交互(sparse interaction)
指卷积模板小于输入图像的尺寸，即局部连接的性质。
2. 权重共享(parameter sharing)
3. 等变表示(equivariant representation)