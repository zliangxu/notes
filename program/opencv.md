linux下查看Opencv的版本

pkg-config --modversion opencv  

## 安装
前提：系统更新
sudo apt-get update   
sudo apt-get upgrade  
（1）搭建编译环境，并安装相关关联库
搭建C/C++编译环境：
sudo apt-get install build-essential  
安装关联库：
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev  
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev  
sudo apt-get install gstreamer-base-1.0 gthread-2.0 gtk+-2.0 gtk+-3.0 gstreamer-pbutils-1.0 gstreamer-pbutils-0.10
（2）下载OpenCV3.0 代码
下载地址https://github.com/Itseez/opencv/archive/3.0.0.zip
下载完源代码后，解压至特定文件夹下面。
（3）进入opencv-3.0.0中，键入如下命令：
cmake .  （注意，cmake命令后面隔着一个空格，然后带了一个.）
（4）在terminal中键入：
sudo make  
（5）然后执行安装
sudo make install  
（6）完成安装
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'  
sudo ldconfig  
（7）测试OpenCV3.0
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