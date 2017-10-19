## face dataset
[链接总表](http://blog.csdn.net/chenriwei2/article/details/50631212)

- face detection data set and benchmark ，椭圆标记
    [fddb](http://vis-www.cs.umass.edu/fddb/results.html)
    在2845图像中取了5171张人脸图像

- annotated facial landmarks in the wild(下载需申请，链接中有其他数据库，百度网盘)
    [aflw](https://www.tugraz.at/institute/icg/research/team-bischof/lrs/downloads/aflw/)
    [aflw解压工具](http://blog.csdn.net/andeyeluguo/article/details/72875308)
    25k幅人脸，每个有21处标记
    most are color, some are gray

- PASCAL　Face dataset
    851 images, 1341 annotated faces 

- labeled faces in the wild
    [LFW](http://vis-www.cs.umass.edu/lfw/)
    205 images with 473 annotated faces 

- Adience
    [Adience](http://www.openu.ac.il/home/hassner/Adience/data.html)有8组年龄、性别、丰富环境下
    数据集: Adience dataset   21K images with 24K face annotation
- [IMDB-WIKI](https://data.vision.ee.ethz.ch/cvl/rrothe/imdb-wiki/)
    名人性别、年龄

# dataset link
[all of kinds dataset](http://personal.ie.cuhk.edu.hk/~ccloy/download.html)
[pascal voc](http://host.robots.ox.ac.uk/pascal/VOC/)
[coco](http://cocodataset.org/#home)

## evaluation
[文件结构说明](http://vis-www.cs.umass.edu/fddb/README.txt)
1. 生成 roc 数据文件
```shell
# 源代码中默认给每张图像名追加后缀.jpg或.ppm，如果系统为windows，则为.jpg 
./evaluate [OPTIONS]
   -h              : print usage
   -a fileName     : file with face annotations (default: ellipseList.txt)  # 注释文件必须是椭圆
   -d fileName     : file with detections (default: faceList.txt)
   -f format       : representation of faces in the detection file (default: 0)
                   : [ 0 (rectangle), 1 (ellipse) or  2 (pixels) ]
   -i dirName      : directory where the original images are stored (default: ~/scratch/Data/facesInTheWild/)
   -l fileName     : file with list of images to be evaluated (default: temp.txt)  
   -r fileName     : prefix for files to store the ROC curves (default: temp)
   -s showMatchedImage 

# 注释文件结构，在源代码的EllipseR中有说明
# 长轴半径 短轴半径 长轴方向 x轴中心坐标 y轴中心坐标 1
<major_axis_radius minor_axis_radius angle center_x center_y 1>.
```
2. 根据 roc 数据文件绘制roc曲线
```shell
# 安装gnuplot
sudo apt-get install gnuplot
# 绘制曲线
gnuplot  contROC.p
```
