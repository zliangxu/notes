
## layer catalogue


### 安装
1. 安装开发依赖包
```shell
sudo apt-get install build-essential
sudo apt-get install vim cmake git
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev
```
2 安装ATLAS
ATLAS是做线性代数运算的，还有俩可以选：一个是Intel 的 MKL，这个要收费，还有一个是OpenBLAS，这个比较麻烦；但是运行效率ATLAS < OpenBLAS < MKL
sudo apt-get install libatlas-base-dev 
5. 安装Caffe需要的Python包
网上介绍用现有的anaconda，我反正不建议，因为路径设置麻烦，很容易出错，而且自己安装很简单也挺快的。
首先需要安装pip
sudo apt-get install python-pip
再下载caffe，我把caffe放在用户目录下
cd
git clone https://github.com/BVLC/caffe.git
再转到caffe的python目录，安装scipy
cd caffe/python
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo apt-get install python-sklearn python-skimage python-h5py python-protobuf python-leveldb python-networkx python-gflags cython ipython
sudo apt-get install protobuf-c-compiler protobuf-compiler
最后安装requirement里面的包，需要root权限
sudo su
for req in $(cat requirements.txt); do pip install $req; done
如果提示报错，一般是缺少必须的包引起的，直接根据提示 
pip install <package-name>就行了。
安装完后退出root权限
exit 
编译：

cd ~/caffe
make pycaffe 

添加~/caffe/python到$PYTHONPATH：
sudo gedit /etc/profile
sudo vim ~/.bashrc (这个比较好)
添加： 
export PYTHONPATH=/path/to/caffe/python:$PYTHONPATH

$ source /etc/profile # 使之生效


### Question
.build_release/src/caffe/proto/caffe.pb.cc:46977:11: error: expected ‘)’ before ‘else’
Makefile:588: recipe for target '.build_release/src/caffe/proto/caffe.pb.o' failed
make: *** [.build_release/src/caffe/proto/caffe.pb.o] Error 1
解决方法
应该是缺少了依赖包，重新按照上面的安装教程来了一遍，重新下了caffe的源码，编译成功

./include/caffe/util/hdf5.hpp:6:18: fatal error: hdf5.h: No such file or directory
解决方法
在Makefile.config文件的第85行，添加 /usr/include/hdf5/serial/ 到 INCLUDE_DIRS，也就是把下面第一行代码改为第二行代码。
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/
在Makefile文件的第173行，把 hdf5_hl 和hdf5修改为hdf5_serial_hl 和 hdf5_serial，也就是把下面第一行代码改为第二行代码。
LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_hl hdf5
LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial
