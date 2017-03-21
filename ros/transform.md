[setting up your robot using tf](http://wiki.ros.org/navigation/Tutorials/RobotSetup/TF)
----------
[frame naming conversions](http://www.ros.org/reps/rep-0105.html)

tf树结构保证了只有一种遍历整棵树的方法，并且所有的边都是从父节点到子节点的有向边,即所有的转换默认的都是从父坐标系到子坐标系的转换。   
如下：  把base\_laser下的雷达数据转换到base\_link下只需加上转换矩阵

![tf_robot](../image/tf_robot.png)

[introduction to tf](http://wiki.ros.org/tf/Tutorials/Introduction%20to%20tf)
three coordinate frames
- a world frame
- turtle1 frame
- turtle2 frame
tf broadcaster 
tf listener

### 生成由tf发布的坐标系转换结构
```shell
$ rosrun tf view_frames
$ evince frames.pdf
```
### 实时查看tf树结构
```shell
$ rosrun rqt\_tf\_tree rqt\_tf\_tree
或者
$ rqt &  #好像不行
```

### 查看两个坐标系之间的转换
```shell
#用法 rosrun tf tf_echo [reference_frame] [target_frame]
$ rosrun tf tf_echo /turtle1 /turtle2
```
