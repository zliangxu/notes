http://docs.opencv.org/master/dc/d88/tutorial_traincascade.html

### 1. opencv_createsamples  
负样本需要手工准备，正样本可以用如下程序操作
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
```
Directory structure:
/img
  img1.jpg
  img2.jpg
bg.txt
File bg.txt:
img/img1.jpg
img/img2.jpg
```
正样本：  
An example of description file:
```
Directory structure:(目录结构，不是配置文件)
/img
  img1.jpg
  img2.jpg
info.dat
File info.dat:
img/img1.jpg  1  140 100 45 45
img/img2.jpg  2  100 200 50 50   50 30 25 25
```
使用记录：
```
opencv_createsamples -info info.dat -vec facesvec -num 2704 -w 20 -h 20  
-info 即上面的info.dat(有了这个-img参数就不需要了) 
-vec 生成的vec文件名  
-num 图像数据数目    
-w 生成图像的宽度  
-h 生成图像的高度  
```
### 2. opencv_traincascade
```
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
  [-mode <BASIC(default) | CORE | ALL
--lbpFeatureParams--
--HOGFeatureParams--

```
使用记录：
```
opencv_traincascade  -data cascadeface -vec facesvec -bg nonfaces.txt -numPos 2000 -numNeg 1000 -w 20 -h 20

-data 生成的cascade文件放置的文件夹名，要提前mkdir
-vec 正样本文件名，即opencv_createsample生成的文件
-bg 负样本文件名，是上面的bg.txt文件
-numPos 用于训练每一个stage的样本数目，而不是正样本总数
-numNeg 用于训练每一个stage的样本数目
-numStages 训练的stage数目
-w 宽度，与opencv_createsample用到的参数-w，-h保持一致
-h 高度
正样本总数要满足这个公示：
numPose + (numStages - 1) * (1 - minHitRate) * numPose + S
S：正样本文件中即vec文件中没有目标的样本数目，即目标数为0
可以使用 gnome-system-monitor监控系统资源使用情况来监控程序是否在运行
```
### opencv_haartraining旧版本
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

使用记录
opencv_haartraining -data cascadeface -vec facesvec -bg nonfaces.txt  -w 20 -h 20 

### 3. opencv_visualisation
