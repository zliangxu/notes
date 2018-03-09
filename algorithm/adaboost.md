[tutorial](http://docs.opencv.org/master/dc/d88/tutorial_traincascade.html)   
[csdn introduction adaboost](https://zhuanlan.zhihu.com/p/31427728)

## tips
1. 不同stage的训练有什么不同？？    
不同stage使用的正负样本不同，因为正样本是前面stage判断为true positive的正样本，而负样本是前面stage判断为false positive的负样本，即每一个stage的训练有一个收集样本加分类的过程。而一个stage的第一个弱分类器训练时，权重初始化为相同值。   
对于正样本已经被前面的stage判断为negative的样本，没有必要继续存在于下一stage的正样本数据中，因为已经被串联stage排除在外了。

2. 同一stage的不同弱分类器训练数据有什么关系？？   
权重有更新，数据没有变化。

## 制作info.dat
```shell
cat tmp.txt | while read line 
do 
  echo $line 1 0 0 23 23 >> info.dat
done
```

# 1. opencv_createsamples  
负样本只提供照片就行了，不需要截取出和正样本大小一致的图片。训练时(opencv_traincascade命令)，程序会自动从提供的负样本照片内滑窗提取指定数目的负样本，注意，这里的负样本数目与提供的负样本照片个数并不是同一个数。
参数：
```
Usage: opencv_createsamples
  [-info <collection_file_name>]
  [-img <image_file_name>]
  [-vec <vec_file_name>]
  [-bg <background_file_name>]
  [-num <number_of_samples = 1000>]
  [-bgcolor <background_color = 0>]
  [-inv] [-randinv] [-bgthresh <background_color_threshold = 80>]
  [-maxidev <max_intensity_deviation = 40>]
  [-maxxangle <max_x_rotation_angle = 1.100000>]
  [-maxyangle <max_y_rotation_angle = 1.100000>]
  [-maxzangle <max_z_rotation_angle = 0.500000>]
  [-show [<scale = 4.000000>]]
  [-w <sample_width = 24>]
  [-h <sample_height = 24>]
  [-maxscale <max sample scale = -1.000000>]
```

负样本：  
An example of such a negative description file:
```sh
# 文件目录结构Directory structure:
/img
  img1.jpg
  img2.jpg
bg.txt

# File bg.txt:
img/img1.jpg
img/img2.jpg
```

正样本：  
An example of description file:
```sh
# Directory structure:(目录结构，不是配置文件)
/img
  img1.jpg
  img2.jpg
info.dat
# File info.dat:
img/img1.jpg  1  140 100 45 45
img/img2.jpg  2  100 200 50 50   50 30 25 25
```

使用记录：
```
opencv_createsamples -info info.dat -vec facesvec -num 2704 -w 20 -h 20  
opencv_createsamples -info info.dat -vec posl.vec -bg bg.txt -num 4000 -w 24 -h 24  -maxzangle 1.8
opencv_createsamples -info infol.dat -vec posl.vec -num 3734 -w 24 -h 24  
opencv_createsamples -info infol.dat -vec posl.vec -num 1305 -w 24 -h 24  
opencv_createsamples -info infol.dat -vec posl.vec -num 21564 -w 24 -h 24  

-info 即上面的info.dat(有了这个-img参数就不需要了) 
-vec 生成的vec文件名  
-num 图像数据数目    
-w 生成图像的宽度  
-h 生成图像的高度  
```

# 2. opencv_traincascade
```shell
Usage: opencv_traincascade
  -data <cascade_dir_name>
  -vec <vec_file_name>
  -bg <background_file_name>
  [-numPos <number_of_positive_samples = 2000>]
  [-numNeg <number_of_negative_samples = 1000>]
  [-numStages <number_of_stages = 20>]
  [-precalcValBufSize <precalculated_vals_buffer_size_in_Mb = 1024>]
  [-precalcIdxBufSize <precalculated_idxs_buffer_size_in_Mb = 1024>]
  [-baseFormatSave]
  [-numThreads <max_number_of_threads = 8>]
  [-acceptanceRatioBreakValue <value> = -1>]
--cascadeParams--
  [-stageType <BOOST(default)>]
  [-featureType <{HAAR(default), LBP, HOG}>]
  [-w <sampleWidth = 24>]
  [-h <sampleHeight = 24>]
--boostParams--
  [-bt <{DAB, RAB, LB, GAB(default)}>]
  [-minHitRate <min_hit_rate> = 0.995>]
  [-maxFalseAlarmRate <max_false_alarm_rate = 0.5>]
  [-weightTrimRate <weight_trim_rate = 0.95>]
  [-maxDepth <max_depth_of_weak_tree = 1>]
  [-maxWeakCount <max_weak_tree_count = 100>]
--haarFeatureParams--
  [-mode <BASIC(default) | CORE | ALL   # Core指，带有中心黑，四周白的正方形特征；all指带有45°倾斜的特征
--lbpFeatureParams--
--HOGFeatureParams--
```
使用记录：
```sh
opencv_traincascade  -data cascadeface/ -vec facesvec -bg nonfaces.txt -numPos 4100 -numNeg 1000 -w 20 -h 20 -numStages 13
opencv_traincascade  -data cascadeface/ -vec posData.vec -bg neg.txt -numPos 3800 -numNeg 20000 -w 20 -h 20 -numStages 13 -minHitRate 0.95

<!-- opencv_traincascade  -data cascadeface/ -vec facesvec -bg nonfaces.txt -numPos 4100 -numNeg 1000 -w 20 -h 20 -numStages 13 -->
opencv_traincascade  -data cascadeface/ -vec posData.vec -bg neg.txt -numPos 3800 -numNeg 20000 -w 20 -h 20 -numStages 13 
opencv_traincascade -data cascade/ -vec pos.vec -bg neg.txt -numPos 3000 -numNeg 20000 -w 24 -h 24 -numStages 10
opencv_traincascade -data cascadehead/ -vec posl.vec -bg neg.txt -numPos 2800 -numNeg 6000 -w 24 -h 24 
opencv_traincascade_tbb -data cascadehead_tbb/ -vec posl.vec -bg neg.txt -numPos 2800 -numNeg 6000 -w 24 -h 24 
./opencv_traincascade_tbb -data cascadehead_tbb/ -vec posl.vec -bg neg.txt -numPos 2000 -numNeg 10000 -w 24 -h 24 -mode ALL -maxFalseAlarmRate 0.4 # 0917训练  扣出的背景图
./opencv_traincascade_tbb -data cascadehead_tbb/ -vec posl.vec -bg neg.txt -numPos 3200 -numNeg 12000 -w 24 -h 24 -numStages 15
nohup opencv_traincascade -data cascade/ -vec posl.vec -bg bg.txt -numPos 3200 -numNeg 16000 -w 24 -h 24  & # 服务器 delltest 扣出的背景图
nohup opencv_traincascade -data cascade/ -vec posl.vec -bg bg.txt -numPos 2200 -numNeg 10000 -w 24 -h 24 -mode ALL & # 服务器 haarall  扣出的背景图
nohup opencv_traincascade -data cascade/ -vec posl.vec -bg bg.txt -numPos 2200 -numNeg 10000 -w 24 -h 24 -mode ALL & # 服务器 haarall  扣出的背景图
nohup ./opencv_traincascade_tbb -data cascadeWide/ -vec posl.vec -bg bg.txt -numPos 900 -numNeg 4500 -w 24 -h 24 & # 笔记本 使用包含头比较大的图片做正样本
./opencv_traincascade_tbb -data cascadeWide/ -vec posl.vec -bg bg.txt -numPos 1000 -numNeg 6000 -w 24 -h 24 -mode ALL # 笔记本 使用包含头比较大的图片做正样本
./opencv_traincascade_tbb -data cascadeWide/ -vec posl.vec -bg bg.txt -numPos 1200 -numNeg 6000 -w 24 -h 24 # 笔记本 添加了walmat正样本
./opencv_traincascade_tbb -data cascadeWide/ -vec posl.vec -bg bg.txt -numPos 21300 -numNeg 50000 -w 24 -h 24 -mode CORE # 十一过后

-maxFalseAlarmRate <max_false_alarm_rate = 0.5>] 0.4 每一个stage分类器的误检率
-model haar特征，对于人头可以使用ALL
-data 生成的cascade文件放置的文件夹名，要提前mkdir
-vec 正样本文件名，即opencv_createsample生成的文件
-bg 负样本文件名，是上面的bg.txt文件
-numPos 用于训练每一个stage的样本数目，"而不是正样本总数"
-numNeg 用于训练每一个stage的样本数目
-numStages 训练的stage数目
-w 宽度，与opencv_createsample用到的参数-w，-h保持一致
-h 高度
```
听说，正负样本比例满足1：5最好  
正样本总数要满足这个公示：
> $$numPose + (numStages - 1) * (1 - minHitRate) * numPose + S$$
上式中S表示正样本文件中即vec文件中没有目标的样本数目，即目标数为0   
可以使用 gnome-system-monitor监控系统资源使用情况来监控程序是否在运行

训练过程中的输出
N|HR|FA
----|---|---
number|HitRate|FalseAlarm
弱分类器的个数|分类器在正样本中正确识别的比例|分类器在负样本中识别为正样本的比例
## 输出解释
```shell
===== TRAINING 0-stage =====
<BEGIN
POS count : consumed   2800 : 2800  # 训练时用的正样本，若前一个stage没有检测出的positive sample，在下一个stage从正样本中除去，并吸入新的正样本
NEG count : acceptanceRatio    6000 : 1 # 从neg.txt中的负样本中选出6000个被当前分类器分类为正样本的负样本，1代表得到的6000个框都被误判为正样本
Precalculation time: 34 # 从neg.txt中的负样本中选出6000个被已有分类起误判为正样本的负样本
+----+---------+---------+
|  N |    HR   |    FA   |
+----+---------+---------+
|   1|        1|        1|
+----+---------+---------+
|   2|        1|        1|
+----+---------+---------+
|   3| 0.995714| 0.406333|
+----+---------+---------+
END>
Training until now has taken 0 days 0 hours 3 minutes 50 seconds.
```
## 原理
OpenCV中实现了
- DAB: discrete adaboost
- RAB: real adaboost
- LB: logitboost
- [GAB](http://blog.csdn.net/dataningwei/article/details/54836386)
一个完整的GAB(gentle adaboost)训练过程算是对一个stage的训练，一个stage就是一个强分类器。通过将强分类器级联就得到了OpenCV中的级联Adaboost分类器。而强分类器是由多个弱分类器'并联'组成的，'并联'的意思是多个弱分类器的输出值加起来与该级强分类器阈值比较。  
```html
<!-- 一个stage中的一个弱分类器的结构 -->
<_>
  <internalNodes>
    0 -1 16 -2.7647718787193298e-01</internalNodes>
  <leafValues>
    3.5338345170021057e-01 -9.5717346668243408e-01</leafValues></_>
<_>
```
多尺度目标的检测有两种方法，1.逐步缩小图像，2.逐步放大检测窗口，位于检测窗口的haar特征也同样比例放大。一般来说，用硬件实现缩小图像的方法更快，用软件实现放大检测窗口的方法更快？？  
NMS对检测窗口进行非极大值抑制。

## 训练一个stage(强分类器)的算法步骤
1. 利用已经训练好的分类器，收集numPos个TP正样本和numNeg个FP负样本
2. 计算所有haar特征对收集到的正、负样本的特征值并排序，计算当前权重下的Best Split threhold + leftValue + rightValue，组成了一个个弱分类器
3. 选择2步骤中GAB WSE(weighted square error)最小的弱分类器为最优弱分类器，将其添加进当前stage分类器。
4. 更新当前stage中每个样本的权重。
5. 依据minHitRate计算当前stage强分类器的阈值
6. 重复上述1-5步骤，直到falseAlarmRate达到要求，或弱分类器数量足够。停止循环，输出stage。
7. 进入下一个stage训练

# 3. opencv_haartraining旧版本
```
Usage: opencv_haartraining
  -data <dir_name>
  -vec <vec_file_name>
  -bg <background_file_name>
  [-bg-vecfile]
  [-npos <number_of_positive_samples = 2000>]
  [-nneg <number_of_negative_samples = 2000>]
  [-nstages <number_of_stages = 14>]
  [-nsplits <number_of_splits = 1>]
  [-mem <memory_in_MB = 200>]
  [-sym (default)] [-nonsym]
  [-minhitrate <min_hit_rate = 0.995000>]
  [-maxfalsealarm <max_false_alarm_rate = 0.500000>]
  [-weighttrimming <weight_trimming = 0.950000>]
  [-eqw]
  [-mode <BASIC (default) | CORE | ALL>]
  [-w <sample_width = 24>]
  [-h <sample_height = 24>]
  [-bt <DAB | RAB | LB | GAB (default)>]
  [-err <misclass (default) | gini | entropy>]
  [-maxtreesplits <max_number_of_splits_in_tree_cascade = 0>]
  [-minpos <min_number_of_positive_samples_per_cluster = 500>]
```

使用记录
```sh
opencv_haartraining -data cascadeface -vec facesvec -bg nonfaces.txt  -w 20 -h 20   
训练过程中，如果分类器达到了minhitrate，就会计算falsealarm，如果falsealarm大于maxfalsealarm，系统就会拒绝这个分类器，继续训练下一个
haartraing训练出的是txt文件，需要使用convert_cascade来转成xml文件

-maxfalsealarm(FA): maximum false alarm, that stage may have，分类器在负样本中识别为正样本的比例
-minhitrate(HR): minimal hit rate, that should stage have at least，分类器在正样本中至少正确识别的比例
-nstages: number of stages in cascade， stage是强分类器，最后的cascade是stage的级联
-sys: 如果正样本是x轴或者y轴对称的，则设置，否则-nonsym
-eqw： 如果有不同数目的正样本、负样本数目，最好不要设置，put no eqw
-weighttrimming: 是对计算效率与性能的权衡，设置了计算时间更少
-bt: Gental AB, Real AB，代表一个stage弱分类器的boost形式
-nsplits: 树的最少节点数
-maxtreesplits: 树的最大节点数，要大于nsplits
-minpos: 一个节点的训练过程中，需要的正样本数目，通常minpos不应该小于npos/nsplits
```
Required leaf false alarm rate achieved. Branch training terminated – it’s impossible to build classifier with good false alarm on this negative images. Check your negative images are really negative =),  maxfalsealarm should be in [0.4-0.5]   
这个是在训练时，FA=0后得到的错误提示，是说验证stage时，false alarm太小，也就是负样本都没有被识别为正样本，那么负样本的质量就太差了

# 4. opencv_visualisation
```shell
opencv_visuallisation 
Usage: opencv_visualisation [params] 
	-?, -h, --help, --usage
		show this message
	-d, --data
		(optional) path to video output folder
	-i, --image
		(required) path to reference image
	-m, --model
		(required) path to cascade xml file
Limits of the current interface:
 - Only handles cascade classifier models, trained with the opencv_traincascade tool, containing stumps as decision trees [default settings].
 - The image provided needs to be a sample window with the original model dimensions, passed to the --image parameter.
```
## usage
```sh
opencv_visualisation -d=visual/ -i=select24/wide_1_1.jpg -m=cascadeWide_all.xml
```
