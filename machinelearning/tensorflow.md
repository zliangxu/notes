[document](https://www.tensorflow.org/api_docs/)

## tensorboard
tensorboard --logdir=/home/lxg/codedata/tensorflow/log

## placeholder
tf.placeholder() 相当于定义了一个位置，这个位置中的数据在程序运行过程中指定。  
feed_dict={x:} 这是一个字典map， 用于指定placeholder中的变量。

[保存和加载模型pb](http://blog.csdn.net/u014432647/article/details/75276718)
## install
[conda](http://blog.csdn.net/nxcxl88/article/details/52704877?locationNum=13)
还是使用pip install靠谱

# 动态图、静态图的区别
如下tensorflow中代码
```python
node1 = tf.constant(3.0, dtype=tf.float32)
node2 = tf.constant(4.0) # also tf.float32 implicitly
print(node1, node2)
# 输出信息为
Tensor("Const:0", shape=(), dtype=float32) Tensor("Const_1:0", shape=(), dtype=float32)
sess = tf.Session() # 产生一个会话
print(sess.run([node1, node2]))
# 输出为
[3.0, 4.0]
```
这里面不包含 3.0或者4.0，因为上面只是定义了计算图，并没有运行

## 使用cpu(http://blog.csdn.net/silent56_th/article/details/72628606) 
1. 运行的时候加上前缀
CUDA_VISIBLE_DEVICES="" python3 train.py