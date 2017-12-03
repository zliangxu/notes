[referrence](https://docs.scipy.org/doc/numpy/reference/)
[referrence](https://docs.scipy.org/doc/numpy/reference/arrays.html)
[quickstart](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)

在numpy，axis就是dimensions， axes的数目被称为rank，也就是维数。
ndarray是numpy里面定义的array，也可以叫array，但是它不同于python标准库里的array
1. basics
    - print
         设置完全打印输出，np.set_printoptions(threshold='nan')
    - basic operations
    - Indexing, Slicing and Iterating

## NumPy   

![numpy](../image/python/ndarray.png)

1. the n-dimensional array  
    - 提供了一个N维的矩阵，简写为 ndarray，
    - [array creation routines](https://docs.scipy.org/doc/numpy/reference/routines.array-creation.html#routines-array-creation)
3. indexing
    - 有三种indexing方法
        filed access  
        basic slicing：通过slicing得到的矩阵，是original矩阵的views   
        advanced indexing  
    - 省略号(ellipsis,` "...")  
```python
维度变化
squeeze()
a = arange(16).reshape(2,2,2,2)  
# 现在，有了一个4维矩阵2x2x2x2，如果选择4维矩阵中所有的首元素，你可以使用ellipsis符号。  
 a[..., 0].flatten()  
array([ 0,  2,  4,  6,  8, 10, 12, 14])  
# 这相当于  
a[:,:,:,0].flatten()  
array([ 0,  2,  4,  6,  8, 10, 12, 14]) 

# 数据类型
np.uint8 
```
