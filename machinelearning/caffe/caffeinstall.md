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
    在打开的文件内添加：
    export PYTHONPATH=/path/to/caffe/python:$PYTHONPATH
    $ source /etc/profile # 使之生效
caffe官网编译安装
```shell
cp Makefile.config.example Makefile.config
#Adjust Makefile.config (for example, if using Anaconda Python, or if cuDNN is desired)
make all
make test
make runtest
```

### Question
1. .build_release/src/caffe/proto/caffe.pb.cc:46977:11: error: expected ‘)’ before ‘else’
Makefile:588: recipe for target '.build_release/src/caffe/proto/caffe.pb.o' failed
make: *** [.build_release/src/caffe/proto/caffe.pb.o] Error 1
解决方法
应该是缺少了依赖包，重新按照上面的安装教程来了一遍，重新下了caffe的源码，编译成功

2. ./include/caffe/util/hdf5.hpp:6:18: fatal error: hdf5.h: No such file or directory
解决方法
在Makefile.config文件的第85行，添加 /usr/include/hdf5/serial/ 到 INCLUDE_DIRS，也就是把下面第一行代码改为第二行代码。
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/
在Makefile文件的第173行，把 hdf5_hl 和hdf5修改为hdf5_serial_hl 和 hdf5_serial，也就是把下面第一行代码改为第二行代码。
LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_hl hdf5
LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial

3.  64\x65t_fg_fraction\x18\x38 \x01(\x02:\x04\x30.25\x12\x1a\n\x0f\x64\x65t_context_pad\x18: \x01(\r:\x01\x30\x12\x1b\n\rdet_crop_mode\x18; \x01(\t:\x04warp\x12\x12\n\x07new_num\x18< \x01(\x05:\x01\x30\x12\x17\n\x0cnew_channels\x18= \x01(\x05:\x01\x30\x12\x15\n\nnew_height\x18> \x01(\x05:\x01\x30\x12\x14\n\tnew_width\x18? \x01(\x05:\x01\x30\x12\x1d\n\x0eshuffle_images\x18@ \x01(\x08:\x05\x66\x61lse\x12\x15\n\nconcat_dim\x18\x41 \x01(\r:\x01\x31\x12\x36\n\x11hdf5_output_param\x18\xe9\x07 \x01(\x0b\x32\x1a.caffe.HDF5OutputParameter\".\n\nPoolMethod\x12\x07\n\x03MAX\x10\x00\x12\x07\n\x03\x41VE\x10\x01\x12\x0e\n\nSTOCHASTIC\x10\x02\"W\n\x0ePReLUParameter\x12&\n\x06\x66iller\x18\x01 \x01(\x0b\x32\x16.caffe.FillerParameter\x12\x1d\n\x0e\x63hannel_shared\x18\x02 \x01(\x08:\x05\x66\x61lse*\x1c\n\x05Phase\x12\t\n\x05TRAIN\x10\x00\x12\x08\n\x04TEST\x10\x01')
TypeError: __init__() got an unexpected keyword argument 'syntax'
解决方法，不知道为什么sudo apt-get update 还有upgrade不起更新版本的作用，只能手动安装
protoc --version
python-protobuf 
protoc与python-protobuf的版本要一致，
安装protobuf-3.0
sudo pip install https://pypi.python.org/packages/42/c7/047793776afddfd70f576691cf2d4fd2260405ad6adf7dd4b81b1fdb5c7d/protobuf-3.0.0-cp27-cp27mu-manylinux1_x86_64.whl