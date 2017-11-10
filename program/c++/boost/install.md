[doc](http://www.boost.org/doc/libs/1_65_1/libs/python/doc/html/index.html)
[boost list](http://www.boost.org/doc/libs/1_50_0/libs/python/doc/v2/list.html)

## tips
boost.python.numpy只是c++版本的numpy库，并不能用与python向c++传递numpy数组

## ubuntu上的boost.python安装
- 库文件安装
sudo apt-get install libboost-python-dev

- 从源代码安装
参照index.html里的内容步骤如下：
```shell
./bootstrap.sh --with-libraries=python --with-python-version=2.7  # 需要指定编译的python版本
./b2 --with-python
sudo ./b2 --with-python install
```

- 编译程序时没有报错，但是运行程序时报错
./numpy: error while loading shared libraries: libboost_numpy.so.1.65.1: cannot open shared object file: No such file or directory
解决方法：
这里是引文编译时，库的搜索路径包含/usr/local/lib，而运行时链接库的查找路径不包含/usr/local/lib，可以使用ldd命令查看库的依赖信息，解决方法就是重新安装到/usr/lib/
