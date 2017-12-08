[opencv package](https://sourceforge.net/p/opencvlibrary/activity/?page=0&limit=100#553a433fe88f3d0ccc1e5008)

linux下查看Opencv的版本

pkg-config --modversion opencv  

## 直接安装库
```shell
sudo apt-get install libcv-dev
```
## 源代码编译安装

前提：系统更新
sudo apt-get update   
sudo apt-get upgrade  
1. 搭建编译环境，并安装相关关联库  
搭建C/C++编译环境：  
sudo apt-get install build-essential    
安装关联库：  
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev   
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev  
sudo apt-get install gstreamer-base-1.0 gthread-2.0 gtk+-2.0 gtk+-3.0 gstreamer-pbutils-1.0 gstreamer-pbutils-0.10
2. 下载OpenCV3.0 代码  
下载地址https://github.com/Itseez/opencv/archive/3.0.0.zip  
下载完源代码后，解压至特定文件夹下面。  
3. 进入opencv-3.0.0中，键入如下命令：  
cmake -D CMAKE_BUILD_TYPE=Debug -D BUILD_TIFF=ON -D BUILD_EXAMPLES=ON -D CUDA_GENERATION=Auto .. (debug版本opencv，也可以设置把gpu关掉)

4. 在terminal中键入：  
make -j5  
5. 然后执行安装  
sudo make install  
6. 完成安装  
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'    
sudo ldconfig    
7. 测试OpenCV3.0
切换到OpenCV3.0的samples目录下面，并编译samples程序  
cd opencv/opencv-3.0.0-beta/samples/  
sudo cmake .  
sudo make -j $(nproc)  
然后切换到cpp目录下运行测试程序
cd cpp/  
./cpp-example-facedetect girls.jpg (自己下载一张图片放在该目录)

## 卸载
进入build目录
sudo make uninstall

## ubuntu 安装opencv 至 conda
```sh
# 源代码编译安装，这种方法可以使用VideoCapture，PATHON_PACKAGES_PATH的指定有用吗？？？ ，不过这次是可行的
cmake -D PYTHON_PACKAGES_PATH=/home/lxg/anaconda2/lib/python2.7/site-packages/ -D BUILD_TIFF=ON ..
cmake -D PYTHON_PACKAGES_PATH=/home/lxg/anaconda3/lib/python3.6/site-packages/ -D BUILD_TIFF=ON ..

# 这种方式安装无法打开视频，也就是不能使用VideoCapture 
conda install -c https://conda.binstar.org/menpo opencv
```

## 插件
windows VisualStudio下的 image watch

## halcon
机器视觉工程开发流程：　http://www.ihalcon.com/read-1285.html
主要是光源、工业相机、镜头选择
一、图像采集，二、图像分割，三、形态学处理，四、特征提取，五、输出结果。

匹配方法
Component-Based
Gray-Value-Based
Shape-Based,


## opencv3.3.0安装 带contrib模块
```shell
cmake -DBUILD_TIFF=ON  -DOPENCV_EXTRA_MODULES_PATH=/home/lxg/app/opencv-3.3.0/opencv_contrib/modules ..
```
## question
1. 一堆"undefined reference to `TIFFReadDirectory@LIBTIFF_4.0'"  
问题解释  
According to this, OpenCV needs libtiff4, which Ubuntu has dropped, i.e. the package that replaced it is libtiff5-dev.  
As a temporary workaround you can specify -DBUILD_TIFF=ON on cmake when configuring, in order to build the libtiff4 version that is distributed with OpenCV.  
This worked for me in Ubuntu 16.04, with OpenCV 3.2.1.  
解决方法  
cmake -DBUILD_TIFF=ON  ..

2. 安装opencv后，不能使用imshow
OpenCV Error: Unspecified error (The function is not implemented. Rebuild the library with Windows, GTK+ 2.x or Carbon support. If you are on Ubuntu or Debian, install libgtk2.0-dev and pkg-config, then re-run cmake or configure script) in cvShowImage, file /tmp/build/80754af9/opencv_1512687413662/work/modules/highgui/src/window.cpp, line 611
解决方法：
```shell
# 对于c++版本
sudo apt-get install libgtk # 可以按tab键自动补全的形式查找可安装版本，然后重新编译、安装
# 对于python版本
cmake -D CMAKE_BUILD_TYPE=Release -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF \
-D BUILD_EXAMPLES=ON \
-D OPENCV_EXTRA_MODULES_PATH=/home/ubuntu/cb/pkg/opencv/opencv_contrib/modules \
-D CMAKE_LIBRARY_PATH=/usr/local/cuda-8.0/targets/x86_64-linux/lib/stubs -D WITH_CUDA=ON -DBUILD_TIFF=ON \
-DBUILD_opencv_java=OFF -DWITH_OPENGL=ON -DWITH_OPENCL=ON -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_EIGEN=ON -DWITH_V4L=ON -DWITH_VTK=OFF \
-DBUILD_TESTS=OFF -DBUILD_opencv_dnn=ON -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES --expt-relaxed-constexpr"  \
-DBUILD_LIBPROTOBUF_FROM_SOURCES=ON \
-DBUILD_PERF_TESTS=OFF \
-DCMAKE_INSTALL_PREFIX=$(python -c "import sys; print(sys.prefix)") \
-DPYTHON3_EXECUTABLE=$(which python) \
-DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
-DPYTHON_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
-DPYTHON2_NUMPY_INCLUDE_DIRS=/home/ubuntu/anaconda2/envs/virenv_name/lib/python2.7/site-packages/numpy/core/include/ ..

 cmake -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D PYTHON_EXECUTABLE=/home/lxg/anaconda3/bin/python ..
```
