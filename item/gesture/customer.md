# background substraction

[background substraction](https://en.wikipedia.org/wiki/Background_subtraction)

[vs](http://docs.opencv.org/ref/2.4/dd/dc5/classCvBlobTrackerAuto.html)

[vs blog](http://blog.csdn.net/fengbingchun/article/details/7872325)

## opencv自带的video surveilance模块

opencv vs框架示例代码 blobtrack_sample.cpp

## steps

 vs提供了三种前景背景分割的方法，但是都不能达到实时，每帧640*480最少0.4s，可以使用wiki里面找到的开源库，libvibe比较不错

- 注释
```cpp
// class CvBlobTrackerAuto1 
m_pFG // pointer to forground mask detector
m_pFGMask // pointer to forground mask, 可以是传入的参数，也可以是用m_pFG检测得到
m_TimesFile //
m_FGTrainFrames //用于训练背景模型的图像数目
m_pBD // pointer to blob detector，with default parameter
m_BlobList // blob 存储列表
m_pBT // pointer to blob tracker，with default parameter
m_BTReal // int 类型
```

1. back substraction
 ```c++
{cvCreateFGDetector0,"FG_0","Foreground Object Detection from Videos Containing Complex Background. ACM MM2003."},
{cvCreateFGDetector0Simple,"FG_0S","Simplified version of FG_0"},
{cvCreateFGDetector1,"FG_1","Adaptive background mixture models for real-time tracking. CVPR1999"},
 ```
2. blob tracker

```cpp
{cvCreateBlobTrackerCCMSPF,"CCMSPF","connected component tracking and MSPF resolver for collision"},
{cvCreateBlobTrackerCC,"CC","Simple connected component tracking"},
{cvCreateBlobTrackerMS,"MS","Mean shift algorithm "},
{cvCreateBlobTrackerMSFG,"MSFG","Mean shift algorithm with FG mask using"},
{cvCreateBlobTrackerMSPF,"MSPF","Particle filtering based on MS weight"},
```

- blob post-processing module
- blob deleter

3. blob detection
CvBlobDetector在前景掩模的基础上检测新进入场景的Blob（块），子类有两个，分别是CvBlobDetectorSimple和CvBlobDetectorCC，参考文献为《Appearance Models for Occlusion Handling 》2001，检测新目标的基本原则是：当连续多帧图像中包含该连通区域，且具有一致的合理的速度。CvBlobDetectorCC CvBlobDetectorSimple一个最显著的不同在于引入了 CvObjectDetector，用于检测分离的目标块
算法
删除宽高很小的目标矩形
删除与前一帧中目标举行相交的目标矩形
将目标矩形排序，只取最大的10个
如果该目标矩形连续10帧出现，且与图像边缘距离足够大，且保持较为一致的运动，则认为新目标生成
```cpp
{cvCreateBlobDetectorCC,"BD_CC","Detect new blob by tracking CC of FG mask"},
{cvCreateBlobDetectorSimple,"BD_Simple","Detect new blob by uniform moving of connected components of FG mask"},
```

4. blob track generator

5. blob trajectory analysis
