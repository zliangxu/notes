roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/slam/cartographer_paper_deutsches_museum.bag


ros如何编译指定的包？？
[ros中文wiki](http://wiki.ros.org/cn) ，
[ros入门讲解](http://www.jianshu.com/p/b604b00b7053) 

## ros
ros安装路径显示: echo ${ROS_PACKAGE_PATH}

rosnode list //显示节点列表
rostopic list //显示话题列表

bag-gui显示 rosbag  rqt_bag rqt_bag
rosbag play NAME.bag
rosbag info NAME.bag  //打开.bag格式数据

rosrun [package_name] [node_name] //运行一个包里的节点，即运行ros程序
rqt_graph //ros包，显示节点关系图
rqt_bag //打开.bag文件的程序

roslaunch [package_name] [filename.launch] //从launch文件中启动一个节点
rostopic echo [topic] //查看消息
rostopic pub [topic] [ms_types] [args]     //发布消息
rostopic record /[topic] //记录话题，成为.bag文件

rosservice call /clear //刷新
apt-cache search ros-ROSNAME
ros消息回调处理函数: ros::spin(),,ros::spinOnce(),
catkin_make //在工作空间根目录下编译
source devel/setup.bash  //添加路径，或者写入.bashrc，是永久添加路径，即打开终端后自动运行了source命令

launch文件中 remap标签
重映射就是甲节点得到相关的信息，通过重映射使乙节点得到甲节点一样的信息，从而使得乙节点模仿甲节点做出相应的响应。​
<remap>标签适用于在其范围内随后的所有声明(<launch>, <node> or<group>)。

## ros workspace setup
创建工作空间文件夹，创建ws/src
创建包catkin_create_package 
添加依赖文件时，不只要修改CmakeLists.txt，需要同步到package.xml
## rosApi

ros头文件路径： /opt/ros/kinetic/include  
http://wiki.ros.org/APIs

## ros-navigation

[navigation bag](http://wiki.ros.org/hector_exploration_planner?distro=kinetic)   
[ros navigation](http://wiki.ros.org/navigation  ) 
[ros setup tf(transform)]:(http://wiki.ros.org/navigation/Tutorials/RobotSetup/TF) 
navigation stack
  需要设置目标点，navigation stack应该只是做导航，路径规划，目标地址需要其他节点提供。

costmap fonfiguration
  local_costmap：局部地图，用于本地的避障与规划
  global_costmap：全局地图，意味着用于整个环境的长期规划
  如此存在三个设置，common configuration, global configuration, local configuration

## ros map
ros坐标系标准 ： http://www.ros.org/reps/rep-0105.html
earth -->> map -->> odom -->> base_link?????

map数据结构： http://wiki.ros.org/rviz/DisplayTypes/Map


nav_msgs/Path.msg路径数据
.child_frame_id   tf结构成员，搜索结果少，可以用作定位代码

输出的tf文件夹内有两种child_frame_id（odom, base_link），是用同一个结构体（geometry_msgs::TransformStamped）连续两次输出的结果。
验证后不是上面的这种结构，而是tf2_msgs::TFMessage

cpp读写 tf 数据： http://wiki.ros.org/tf/Tutorials/

## cartographer
cartographer 与雷达hokuyo  http://www.cnblogs.com/wenhust/p/6047258.html  
cartographer 解析数据代码： https://github.com/googlecartographer/cartographer_ros/tree/master/cartographer_ros/cartographer_ros  
rostopic list /TOPIC_NAME      //输出打印 topics  

## Launch the 2D backpack demo.
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag  

error
 rosrun turtlesim turtlesim_node [ERROR] [1345405836.027275917]: [registerPublisher] Failed to contact master at [localhost:11311]. Retrying...  
要在另一个终端运行roscore

视觉slam框架： 传感器数据-——》》 前端里程计--》》后端非线性优化--》》建图  
                                                  ---》》回环检测---》》  

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


## 测试cartographer

- 在ubuntu上安装ros，需要选择一可安装版本。
- [安装cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [安装 cartographer ros](https://google-cartographer-ros.readthedocs.io/en/latest/) 

测试启动launch
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/cartographer_paper_deutsches_museum.bag
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/mybag.bag
roslaunch cartographer_ros demo_revo_lds.launch bag_filename:=${HOME}/mybag.bag

mappint 文件夹
     map_builder.h

cartographer_ros
google_binary是一个.cmake文件里定义的函数，其实是addexecute()
以node_main.cc或者offline_node_main.cc(没有找到依据)为源文件编译出cartographer_ros节点，
robot_state_publisher节点

## 雷达数据采集结构
laserScan http://docs.ros.org/api/sensor_msgs/html/msg/MultiEchoLaserScan.html  
采样角度间隔、时间间隔都视为均匀的，没有每一个数据都记录一个对应的角度和采样时间。
```
// Modeled after ROS's MultiEchoLaserScan message.
// http://docs.ros.org/api/sensor_msgs/html/msg/MultiEchoLaserScan.html
message LaserScan {
  message Values {
  repeated float value = 1 [packed = true];
  }
  optional float angle_min = 2;
  optional float angle_max = 3;
  optional float angle_increment = 4;
  optional float time_increment = 5;
  optional float scan_time = 6;
  optional float range_min = 7;
  optional float range_max = 8;

  repeated Values range = 9;
  repeated Values intensity = 10;
}

点云数据结构
//point_cloud.h
typedef std::vector<Eigen::Vector3f> PointCloud;

//.proto
// Collection of 3D 'points'.
message PointCloud {
  // Points as repeated floats for efficiency. All fields have the same size.
  repeated float x = 3 [packed = true];
  repeated float y = 4 [packed = true];
  repeated float z = 5 [packed = true];
}

protobuf
谷歌的一个跨平台、跨语言的
生成代码
protoc -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/addressbook.proto

scan-to-scan matching 存在误差累计的问题,用于计算pose change
scan-to-map matching 会限制误差，使用 gauss-newton
scan-to-submap

local error accumulation, partical filter and graph-based SLAM
不适用粒子滤波，而做姿态优化

pose包括 x,y,theta
```