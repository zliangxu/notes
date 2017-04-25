## NumPy   [referrence](https://docs.scipy.org/doc/numpy/reference/arrays.html)

![numpy](../image/python/ndarray.png)

1. the n-dimensional array  
    - 提供了一个N维的矩阵，简写为 ndarray，
    - [array creation routines](https://docs.scipy.org/doc/numpy/reference/routines.array-creation.html#routines-array-creation)
3. indexing
    - 有三种indexing方法
        filed access  
        basic slicing：通过slicing得到的矩阵，是original矩阵的views   
        advanced indexing  
    - 省略号(ellipsis, "...")  
```python
  >>> a = arange(16).reshape(2,2,2,2)  
  # 现在，有了一个4维矩阵2x2x2x2，如果选择4维矩阵中所有的首元素，你可以使用ellipsis符号。  
  >>> a[..., 0].flatten()  
  array([ 0,  2,  4,  6,  8, 10, 12, 14])  
  # 这相当于  
  >>> a[:,:,:,0].flatten()  
  array([ 0,  2,  4,  6,  8, 10, 12, 14])  
```
