
# cartographer
cartographer 与雷达hokuyo  http://www.cnblogs.com/wenhust/p/6047258.html  
cartographer 解析数据代码： https://github.com/googlecartographer/cartographer_ros/tree/master/cartographer_ros/cartographer_ros  


error  
 rosrun turtlesim turtlesim_node [ERROR] [1345405836.027275917]: [registerPublisher] Failed to contact master at [localhost:11311]. Retrying...    
要在另一个终端运行roscore  

视觉slam框架： 传感器数据-——》》 前端里程计--》》后端非线性优化--》》建图  
                                                  ---》》回环检测---》》  
## cartographer代码
cartographer发布的topic,在cartographer_ros文件夹内node.h中定义  
1. ::ros::Publisher submap_list_publisher_;
  话题： /submap_list
  存储点云数据的变换矩阵？？？

2. ::ros::ServiceServer submap_query_server_;  
  服务：/submap_query //使用rosservice list 可以看到
  submap的数据传输是以service的形式获取的，所以topic list并没有，需要查询才会得到，而且是点云数据的形式。

3. ::ros::Publisher scan_matched_point_cloud_publisher_;  
  话题： /scan_matched_points2  
  点云匹配，就是子地图

4. ::ros::Publisher occupancy\_grid\_publisher_;  
  话题： /map
  cartographer的map发布没有附在节点上,所以rqt_graph上没有显示，应该是有订阅才会有显示。
  发布的 std::unique_ptr<nav_msgs::OccupancyGrid>信息

## cartographer框架
获得的每一帧laser scan数据，利用scan match在最佳估计位置处插入子图（submap）中，且scan matching只跟当前submap有关。在生成一个submap后，会进行一次局部的回环（loop close），
利用分支定位和预先计算的网格，所有submap完成后，会进行全局的回环。  

scan-to-submap,   loop closure detection,  graph optimization
local approach : scan-to-submap, 把每次扫描匹配到子地图(submap)M上， 使用非线性优化方法对齐子地图内每次的扫描，这个过程被称为scan matching。
子地图建立过程中的累积误差用global approach消去。grid-based SLAM approach.
scans --> submaps --> ceres scan matching
probability grids,  Phit   Pmiss, ceres scan matcher

global approach：closing loops
optimization problem, branch-and-bound scan matching

ros是为机器人软件发展的一个软件框架集合，提供操作系统类似的功能，hardware abstraction、low-level device control、message-passing between process、package management。
是为简化上层应用开发的一个平台，ros只支持特定的操作系统，所以安装ros前需要根据当前的操作系统版本选择ros版本。  
hitcm博客安装 : http://www.cnblogs.com/hitcm/p/5939507.html  
泡泡机器人讲cartographer : http://mp.weixin.qq.com/s/LdbFp-Zvkr02-_25ILb16g  
http://blog.csdn.net/jsgaobiao/article/details/53116042  
http://blog.csdn.net/zyh821351004/article/details/52421005  
http://blog.csdn.net/u010566411/article/category/6467677  
Google开源的代码包含两个部分：cartographer[2]和cartographer_ros。cartographer主要负责处理来自雷达、IMU和里程计的数据并基于这些数据进行地图的构建，是cartographer理论的底层实现。
cartographer_ros则基于ros的通信机制获取传感器的数据并将它们转换成cartographer中定义的格式传递给cartographer处理，与此同时也将cartographer的处理结果发布用于显示或保存，
是基于cartographer的上层应用。  


## 安装测试cartographer

- 在ubuntu上安装[ros]()，需要选择一可安装版本。
- [安装cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [安装 cartographer ros](https://google-cartographer-ros.readthedocs.io/en/latest/) 

mappint 文件夹
     map_builder.h

cartographer_ros
google_binary是一个.cmake文件里定义的函数，其实是addexecute()
以node_main.cc或者offline_node_main.cc(没有找到依据)为源文件编译出cartographer_ros节点，
robot_state_publisher节点
