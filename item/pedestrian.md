### dataset
- [CityPersons](https://www.cityscapes-dataset.com/)
    account:lixiaoguang key:hust2012，需要等待管理员验证
    由于citypersons是基于cityscapes的语义分割数据集标注得来的，所以在cityscapes网站上
- [dataset](http://www.vision.caltech.edu/Image_Datasets/CaltechPedestrians/index.html)

- [USC行人数据库](http://iris.usc.edu/Vision-Users/OldUsers/bowu/DatasetWebpage/dataset.html)
    该数据库包含三组数据集（USC-A、USC-B和USC-C），以XML格式提供标注信息。USC-A[Wu, 2005]的图片来自于网络，共205张图片，313个站立的行人，行人间不存在相互遮挡，拍摄角度为正面或者背面；USC-B的图片主要来自于CAVIAR视频库，包括各种视角的行人，行人之间有的相互遮挡，共54张图片，271个行人；USC-C有100张图片来自网络的图片，232个行人（多角度），行人之间无相互遮挡。
- [INRIA数据库](http://pascal.inrialpes.fr/data/human/)
    该数据库是目前使用最多的静态行人检测数据库，提供原始图片及相应的标注文件。训练集有正样本614张（包含2416个行人），负样本1218张；测试集有正样本288张（包含1126个行人），负样本453张。图片中人体大部分为站立姿势且高度大于100个象素，部分标注可能不正确。图片主要来源于GRAZ-01、个人照片及google，因此图片的清晰度较高。在XP操作系统下部分训练或者测试图片无法看清楚，但可用OpenCV正常读取和显示。 
- [MIT数据库]()
    该数据库为较早公开的行人数据库，共924张行人图片（ppm格式，宽高为64x128），肩到脚的距离约80象素。该数据库只含正面和背面两个视角，无负样本，未区分训练集和测试集。Dalal等采用“HOG&#43;SVM”，在该数据库上的检测准确率接近100%。     

### algorithm  
- ACF(aggregate channel features)，积分通道特征  
    通道可以通过原图像线性变换或非线性变换得到，通道应该具有平移变换不变性，其中，I为输入图像，C为通道，使用Omega表示通道的生成函数
    $$C=\Omega(I) \longrightarrow C'=\Omega(I')$$

hog　　
yolo

## essay
- integral channel features 2009　　　　
    目标检测包括两部分内容: 1,特征提取，2,学习算法　　　　　　
    这篇文章使用boost的方法，集中注意力于特征提取方面．作者把由图像进行线性或非线性变换得到的图像称为通道(channel)，这些通道满足平移不变性，在通道上使用integral images(积分图)获得的特征为integral channel features，这些特征通过积分图获取计算速度很快．
    包括 LUV(三通道)+Grad(一通道)+Hist(六个方向的梯度通道)　共十个通道，特征在各通道使用积分图单独获取．
    adaboost, realboost, logitboost,　决策树adaboost，软级联adaboost
    使用soft cascade做分类器
- the fastest pedestrian detector in the west 2010
    提出了一种建特征金字塔的近似方法，以提高检测速度
- fast feature pyramids for object detection
    通过对特征图插值生成特征金字塔．
    128*64窗口内，128*64*10/16=5120维特征，10指存在十个通道，16指4*4的小块取和．
    使用adaboost训练2048深度的两个树
    
## reading 
http://blog.csdn.net/carson2005/article/details/8455837
http://blog.csdn.net/rainbow0210/article/details/53586385
[原理讲解](http://blog.csdn.net/xiny520/article/details/51460148)
