## test
## cartographer包运行
```shell
#运行cartographer
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/slam/cartographer_paper_deutsches_museum.bag
#或者
roslaunch cartographer_ros mycartographer.launch bag_filename:=${HOME}/slam/cartographer_paper_deutsches_museum.bag
#ros运行路径规划节点
roslaunch my_robot_name2dnav move_base.launch 
```

## 自己的雷达在线测试
```shell
#改变权限
sudo chmod 777 /dev/ttyUSB0
#跑雷达串口程序
    roslaunch beginner_tutorials myserial.launch 
#运行cartographer
roslaunch cartographer_ros demo_revo_ldsmy.launch
#运行显示轨迹的节点
rosrun beginner_tutorials nav
#轨迹规划
rosrun mappublish mapPublish 

#demo_revo_ldsmy.launch文件内容
<launch>
  <node name="cartographer_node" pkg="cartographer_ros"
      type="cartographer_node" args="
          -configuration_directory $(find cartographer_ros)/configuration_files
          -configuration_basename revo_lds.lua"
      output="screen">
    <remap from="echoes" to="horizontal_laser_2d" /> 
  </node>

  <node name="rviz" pkg="rviz" type="rviz" required="true"
      args="-d $(find cartographer_ros)/configuration_files/demo_2d.rviz" />
</launch>

#revo_lds.lua文件内容
include "map_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  map_frame = "map",
  tracking_frame = "base_link",
  published_frame = "base_link", 
  odom_frame = "odom",
  provide_odom_frame = true,
  use_odometry = false,
  use_laser_scan = true,
  use_multi_echo_laser_scan = false,
  num_point_clouds = 0,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
}

MAP_BUILDER.use_trajectory_builder_2d = true

TRAJECTORY_BUILDER_2D.laser_min_range = 0.3
TRAJECTORY_BUILDER_2D.laser_max_range = 15.
TRAJECTORY_BUILDER_2D.laser_missing_echo_ray_length = 1.
TRAJECTORY_BUILDER_2D.use_imu_data = false
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true

SPARSE_POSE_GRAPH.optimization_problem.huber_scale = 1e2

return options
```

## 接口程序已更改，下面的不一定能成功
## 运行cartographer，使用数据包
```shell
roslaunch cartographer_ros demo_revo_ldsbag.launch bag_filename:=${HOME}/data/cartographerOutput/mytest.bag
#使用数据包时的 demo_revo_lds.launch 的配置
<launch>
  <param name="/use_sim_time" value="true" />

  <node name="cartographer_node" pkg="cartographer_ros"
      type="cartographer_node" args="
          -configuration_directory $(find cartographer_ros)/configuration_files
          -configuration_basename revo_lds.lua"
      output="screen">
    <remap from="echoes" to="horizontal_laser_2d" />
  </node>

  <node name="rviz" pkg="rviz" type="rviz" required="true"
      args="-d $(find cartographer_ros)/configuration_files/demo_2d.rviz" />
  <node name="playbag" pkg="rosbag" type="play"
      args="--clock $(arg bag_filename)" />

</launch>
```




## ros如何编译指定的包？？
[ros中文wiki](http://wiki.ros.org/cn) ，
[ros入门讲解](http://www.jianshu.com/p/b604b00b7053) 
# aim: complete coverage path planning
FAQ   http://answers.ros.org/question/212614/complete-coverage-path-planning-ros/

## ros workspace setup
创建工作空间文件夹，创建ws/src  
创建包catkin_create_package   
添加依赖文件时，不只要修改CmakeLists.txt，需要同步到package.xml  

## rosApi
ros头文件在PC上的路径： /opt/ros/kinetic/include  
[rosApi网址](http://wiki.ros.org/APIs)  
[common_msgs](http://wiki.ros.org/common_msgs) 包含, nav_msgs, geometry_msgs， sensor_msgs……
- [geometry\_msgs](http://docs.ros.org/api/geometry_msgs/html/index-msg.html)
```
PoseStamped，是一个姿态结构体，包含信息头，位置，姿态信息
Twist，线速度，角速度，都是三元素结构。
```


## ros-navigation
  
[navigation bag:   hector_exploration_planner](http://wiki.ros.org/hector_exploration_planner?distro=kinetic)   
[西工大一学生讲解navigation](http://blog.exbot.net/archives/1129)  

[ros navigation](http://wiki.ros.org/navigation  )   
这一个集合就称为 navigation stack，它的输入是里程计、传感器数据、目标姿态，输出是速度控制。
- base_local_planer  
<pre>
    Trajectory RollOut  
    Dynamic Window Approach(DWA) 
</pre>
- amcl
<pre>
    是一个用于2d机器人移动概率定位的方法，实现了基于粒子滤波的蒙特卡洛定位法。
</pre>
- dwa_local_planner
<pre>
    DWA 局部地图路径规划
</pre>
- global_planner
<pre>

</pre>
- costmap_2d
<pre>
主要有两种方法来初始化costmap_2d，第一种是利用用户已经生成好的静态地图，使用map_server节点，但同时也接收当前传感器的数据来更新地图；
第二种是使用rolling_window保持机器人在地图的中心。
</pre>
- [map_server](http://wiki.ros.org/map_server)
<pre>
是一个ROS节点，从磁盘内读取地图，然后通过service传输消息。
</pre>
- map_saver
<pre>
保存地图，订阅的话题是nav_msgs::Occupancy_Grid
命令rosrun map_server map_saver -f NAME
</pre>

- [nav_core](http://wiki.ros.org/nav_core?distro=electric)  
![navigation](image/navigation.jpg)
<pre>
    nav_core包含了导航堆栈的数据接口，所有的路径规划程序都是依赖于这样的接口，来呈现在move_base节点中。
    nav_core::BaseGlobalPlanner提供了全局路径规划程序的接口，这里全局路径规划程序是一插件的形式体现在move_node上。类初始化函数需要提供全局路径规划程序节点名，即全局路径规划名称，代价地图；制作路径函数需要提供当前地址，目标地址，返回所规划路径。
    nav_core::BaseLocalPlanner提供了局部路径规划程序的接口。类初始化函数需要提供局部路径规划程序节点名，接收路径规划的节点名，代价地图；设置局部路径，（路径是传进去函数的参数）；计算速度函数，提供Twist信息。
    nav_core::RecoveryBehavior规定move_base行为集合中处理异常的行为。初始化时需要提供全局代价地图，局部代价地图。
</pre> 


[ros setup tf(transform)](http://wiki.ros.org/navigation/Tutorials/RobotSetup/TF)   
navigation stack  
  需要设置目标点，navigation stack应该只是做导航，路径规划，目标地址需要其他节点提供。

costmap fonfiguration  
  local_costmap：局部地图，用于本地的避障与规划  
  global_costmap：全局地图，意味着用于整个环境的长期规划  
  如此存在三个设置，common configuration, global configuration, local configuration  

## ros map
[map数据结构](http://wiki.ros.org/rviz/DisplayTypes/Map) 


nav_msgs/Path.msg路径数据
.child_frame_id   tf结构成员，搜索结果少，可以用作定位代码

输出的tf文件夹内有两种child_frame_id（odom, base_link），是用同一个结构体（geometry_msgs::TransformStamped）连续两次输出的结果。
验证后不是上面的这种结构，而是tf2_msgs::TFMessage

cpp读写 tf 数据： http://wiki.ros.org/tf/Tutorials/

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
```
## protobuf
```
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

# FAQ
- navigation包中，使用move_base.launch问题
```
问题： Trajectory Rollout planner initialized with param meter_scoring not set. Set it to true to make your settins robust against changes of costmap resolution
解决方法： 在base_local_planner_params.yaml内加上meter_scoring: true

问题： Timed out waiting for transform from base_link to tf to become available before running costmap, tf error:
解决方法：从 base_link 到 tf 的转换？？tf是一个包含 odom 和 base_link 的结构体，参考 navigation 的手册进行了修改，添加 tf::TransformBroadcaster odom_broadcaster;转换节点可行。

问题： The origin for the sensor at (-49.29, -29.03) is out of map bounds. So, the costmap cannot raytrace for it.
解决方法： 传感器原点超出地图边界？？？ 坐标即是机器人参照？？？？坐标系的坐标，好像是没有map帧的原因

```
- 未定义函数
```
在package.xml， CMakeLists.txt,中添加依赖文件
可以在CMakeLists.txt中add_executable前加上一行 
find_package(catkin REQUIRED COMPONENTS tf)
```