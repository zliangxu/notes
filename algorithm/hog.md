[svm+hog 训练](http://blog.csdn.net/yongshengsilingsa/article/details/7535496)
[hand data](http://www.idiap.ch/resource/gestures/)
[svm + hog](http://blog.csdn.net/lonely_geek/article/details/52357544?locationNum=6)
[opencv hog](http://docs.opencv.org/master/d5/d33/structcv_1_1HOGDescriptor.html#a723b95b709cfd3f95cf9e616de988fc8)




[hog参数图解](http://blog.csdn.net/raodotcong/article/details/6239431)
```cpp
// nbins是梯度方向计算的数目，多数为9，即180/20=9，多数以半圆180计算方向
size_t HOGDescriptor::getDescriptorSize() const  
{  
    CV_Assert(blockSize.width % cellSize.width == 0 &&  
        blockSize.height % cellSize.height == 0);  
    CV_Assert((winSize.width - blockSize.width) % blockStride.width == 0 &&  
        (winSize.height - blockSize.height) % blockStride.height == 0 );  
    return (size_t)nbins*  
        (blockSize.width/cellSize.width)*  
        (blockSize.height/cellSize.height)*  
        ((winSize.width - blockSize.width)/blockStride.width + 1)*  
        ((winSize.height - blockSize.height)/blockStride.height + 1);  
}  
```

<!--包含很多注意事项-->
[比较完整HOG+SVM ，，模型加载](http://blog.csdn.net/qianqing13579/article/details/46509037)