# deep neural networks for object detection

general architecture for classification [14]

## related work
deformable part-based model [9]

## dnn based detection

## detection as dnn regression
5层卷积2层全连接的网络。
output mask of size dxd, and d=24

## precise object localization via dnn-generated masks
现在得到了目标mask，但是依然面临很多问题：
1. 输出的一张mask，无法区分两个相邻的物体的边界
2. 输出的mask尺度过小，无法对物体准确定位，例如input size = 400x400，output size=24x24，那么1个输出，对应16个像素的输入，这16个像素就无法继续区分物体
3. 因为输入是整张图像，而如果图像中的目标很小，输入中受目标影响的像素就很少

解决方法：
1. multiple masks for robust localization  
2. object localization from dnn output  
使用ouput mask coordinate来定位目标，也就是获得目标在输入图像中的左上角、右下角坐标  
non-maximum suppression [9]
3. multi-scale refinement of dnn localizer  
有两个步骤可以提升定位的准确度：

## dnn training

## experiments
sliding window version of a dnn classifier [14]

## conclusion