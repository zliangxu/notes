## evaluation
这是FDDB数据集自带的绘ROC曲线程序，但是也可以用在其它目标检测数据集上面。
1. evaluate程序的编译  
下载evaluation code， 链接： http://vis-www.cs.umass.edu/fddb/results.html  
源代码依赖opencv，直接 make 可能因为版本原因找不到opencv，所以参照 http://vis-www.cs.umass.edu/fddb/faq.html 中的最后一条，对Makefile文件进行修改  
```makefile
# Manually provide the inputs to include files and libraries.

INCS = -I/usr/local/include/opencv

LIBS = -L/usr/local/lib -lopencv_core -lopencv_imgproc -lopencv_highgui
       -lopencv_ml -lopencv_video -lopencv_features2d -lopencv_calib3d 
       -lopencv_objdetect -lopencv_contrib -lopencv_legacy
		
# Change the order in the evaluate. 

evaluate: $(OBJS)
    	$(CC) $(OBJS) -o $@ $(LIBS)
```

2. 生成 roc 数据文件  
[评估程序的帮助文档及文件结构说明](http://vis-www.cs.umass.edu/fddb/README.txt)
```shell
./evaluate [OPTIONS]
   -h              : print usage
   -a fileName     : file with face annotations (default: ellipseList.txt)  # 注释文件必须是椭圆
   -d fileName     : file with detections (default: faceList.txt)
   -f format       : representation of faces in the detection file (default: 0)
                   : [ 0 (rectangle), 1 (ellipse) or  2 (pixels) ]
   -i dirName      : directory where the original images are stored (default: ~/scratch/Data/facesInTheWild/)
   -l fileName     : file with list of images to be evaluated (default: temp.txt)  
   -r fileName     : prefix for files to store the ROC curves (default: temp)
   -s showMatchedImage # evaluate程序帮助中没有说明的参数，可以显示注释椭圆与预测框
```
- a 参数  
注释文件结构，其中图像的注释信息(label),在源代码的EllipseR中有说明
其中  <major_axis_radius minor_axis_radius angle center_x center_y 1>.  分别对应 长轴半径 短轴半径 长轴方向 x轴中心坐标 y轴中心坐标 1 
示例：
```
livet1/videoImage/livet_1_179.jpg
1
55.2	51.0	0	434.6	419.5	1
livet1/videoImage/livet_1_354.jpg
2
52.8	67.8	0	26.4	96.9	1
47.4	50.4	0	23.7	327.2	1
```
- d 参数   
为预测输出的文件结构， 示例
```
livet1/videoImage/livet_1_179.jpg
1
395.217590332	402.91708374	107.763519287	78.0846252441	0.961679816246	1
livet1/videoImage/livet_1_354.jpg
2
4.12399768829	74.584564209	95.432261467	103.784500122	0.99744617939	1
2.01198101044	292.987335205	85.8906831741	99.1528930664	0.893540740013	1
```
- f 是预测输出文件的格式，与-a参数无关  
0 (rectangle), 1 (ellipse) or  2 (pixels)  
数据集的标注信息仍是椭圆，此处只是标明预测输出文件的格式。 
- i 图像的父路径  
dirName, default: ~/scratch/Data/facesInTheWild/
- l 图像路径及文件名，evaluate程序读图像时使用的路径是 dirName+fileName
其中fileName由此处定义，示例
```
livet1/videoImage/livet_1_179.jpg
livet1/videoImage/livet_1_354.jpg
```
- r 生成roc文件的前缀

源代码中默认的根据系统不同，给参数文档中每张图像名的面追加后缀.jpg或.ppm，如果系统为windows，则为.jpg，否则为.ppm 
代码中可以在 evaluate.cpp 第205行看到，
```cpp
string imFullName = imDir + imName + annotImageFormat; 
// string imFullName = imDir + imName; // 如果参数文档中已经包含了后缀，可以这样修改，即直接把annoImageFormat去掉
```


3. 根据 roc 数据文件绘制roc曲线  
下载Comparison Code，解压后把第二步生成的roc文件放入rocCurves/
```shell
# 安装gnuplot，它是一个命令行的交互式绘图工具
sudo apt-get install gnuplot
# 绘制曲线，按照contROC.p里的内容，将自己的ROC文件名添加进代码中
gnuplot  contROC.p
```
