# python 调用 c++ 
[mat](https://my.oschina.net/yushulx/blog/756859)

## ctypes作接口

## c++直接编译出python接口
[官方版doc](https://docs.python.org/2/extending/index.html)
[官方版中文doc](http://usyiyi.cn/translate/python_352/extending/index.html)

## 使用boost 封装接口
[构造函数的封装](https://zhuanlan.zhihu.com/p/24059497)
- 使用boost来导出类，使用python导入时，报错
```python
>>> import libcam
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: dynamic module does not define init function (initlibcam)
```
解决方法：这里是因为生成的libcam库与代码中设置的python模块名字不同BOOST_PYTHON_MODULE(libcsam)，也就是说，这里libscam与libcam改成一样的就可以解决问题

- 导入时报错
```python
ImportError: ./hello.so: undefined symbol: _ZNK5boost6python7objects21py_function_impl_base9max_arityEv
```
解决方法
链接库没有找到 boost_python

- 报错
```shell
 error: expected constructor, destructor, or type conversion before ‘(’ token
 BOOST_PPYTHON_MODULE(hellol)
```
解决方法
BOOST_PPYTHON_MODULE拼写错误，应该改成BOOST_PYTHON_MODULE

## 使用swig封装接口