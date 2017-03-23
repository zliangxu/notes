# [publishing Odometry information over ROS](http://wiki.ros.org/navigation/Tutorials/RobotSetup/Odom)
**expressions:**
- coordinate frame 坐标系    

导航堆栈使用 tf 来表示机器人在世界坐标系的位置，把传感器的数据体现在静态地图上，但是 tf 并不能提供机器人的速度消息。因此，导航堆栈需要节点提供如下两条消息：
- 一条是从"odom“坐标系到"base_link"坐标系的转换 over tf
- 另一条是nav\_msgs::Odometry消息。

**nav\_msgs::Odometry数据结构**
```python
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id  
geometry_msgs/PoseWithCovariance pose #参考坐标系是header.frame_id的位置 odom
geometry_msgs/TwistWithCovariance twist #参考坐标系是child_frame_id的速度 base_link
```
**geometry\_msgs::PoseWithCovariance**
```python
# This represents a pose in free space with uncertainty.
geometry_msgs/Pose pose
# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance
```
**geometry\_msgs::TwistWithCovariance**
```python
# This expresses velocity in free space with uncertainty.
Twist twist
# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance
```