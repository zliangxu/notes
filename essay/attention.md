# attention is all you need 2017
## abstract
主流的序列翻译模型都是利用了编码器与解码器结构的RNN或CNN，作者使用了编码、解码结构，未使用RNN与CNN，提出了一个完全基于注意力机制的简单模型，叫做Transformer。这个模型易于并行化、训练，并且在两个机器翻译数据库上取得了好的结果，在WMT 2014 English-to-German上取得28.4BLEU，在WMT 2014 English-to-French上取得41.8BLEU。

## introduction
在以往的研究中，RNN、LSTM、GTN是效果最好的处理序列数据的模型。RNN通过factorization tricks[21]和conditional computation[32]能够改善计算效率，但是本质的序列化计算依然没有改变。注意力机制已经称为了序列化模型中不可或缺的部分，但它依然是结合在RNN中。

## background
multi-head attention  
self-attention(intra-attention)

## model architecture
编码器是将符号表示的序列$(x_1,……,x_n)$映射到连续数字表示的序列$\bold z=(z_1,……,z_n)$，解码器是将$\bold z$转换为输出符号序列$(y_1,……,y_n)$，解码器一次只输出一个符号，并且前面输出的符号会被用于求解剩下的符号。  
Transformer也是基于编码、解码的结构。
### 编码器、解码器
编码器由$6$个相同的结构堆叠而成，每一个结构内部包含两个部分，第一个是multi-head self-attention，第二个是position-wise前向全连接网络，这两个组成部分都使用了layer normalization及residual connection。  
解码器由$6$个相同的结构堆叠而成，每一个结构内部包含三个部分，比解码器多的一个是用于输入编码器的输出部分。
### attention
```python
# google的attention实现代码注释
# query: The query used to calculate attention scores.
#   In seq2seq this is typically the current state of the decoder.
#   A tensor of shape `[B, ...]`
# keys: The keys used to calculate attention scores. In seq2seq, these
#   are typically the outputs of the encoder and equivalent to `values`.
#   A tensor of shape `[B, T, ...]` where each element in the `T`
#   dimension corresponds to the key for that value.
# values: The elements to compute attention over. In seq2seq, this is
#   typically the sequence of encoder outputs.
#   A tensor of shape `[B, T, input_dim]`.
```
attention其实就是一个函数，将query、keys计算出一个权重，然后加权求和values得到输出。
- scaled dot-product attention  
- multi-head attention  


