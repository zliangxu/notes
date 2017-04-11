## ros
```
ros安装路径显示: echo ${ROS_PACKAGE_PATH}  
ros包的安装命令 sudo apt-get install ros-indigo-[package_name]  

rosnode list //显示节点列表  
rostopic list //显示话题列表  
rosbag  rqt_bag rqt_bag //bag-gui显示   
rosbag play NAME.bag  
rosbag info NAME.bag  //打开.bag格式数据  
rosrun [package_name] [node_name] //运行一个包里的节点，即运行ros程序  
rqt_graph //ros包，显示节点关系图  
rqt_bag //打开.bag文件的程序  
roslaunch [package_name] [filename.launch] //从launch文件中启动一个节点  


保存地图，订阅的话题是nav_msgs::Occupancy_Grid
rosrun map_server map_saver -f NAME


rostopic echo [topic] //查看消息  
rostopic pub [topic] [ms_types] [args]     //发布消息  
rosservice call /clear //刷新  
apt-cache search ros-ROSNAME  

rosbag record /[topic] //记录话题，成为.bag文件    



ros消息回调处理函数: ros::spin(),,ros::spinOnce(),  
spinOnce只是如果有信息到来，则运行到spinOnce时会调用中断，并不会停止程序的运行？？？

catkin_make //在工作空间根目录下编译  
source devel/setup.bash  //添加路径，或者写入.bashrc，是永久添加路径，即打开终端后自动运行了source命令  

launch文件中 remap标签  
重映射就是甲节点得到相关的信息，通过重映射使乙节点得到甲节点一样的信息，从而使得乙节点模仿甲节点做出相应的响应。​
<remap>标签适用于在其范围内随后的所有声明(<launch>, <node> or<group>)。
```