[nav2d](http://wiki.ros.org/nav2d)

[tutorial](http://wiki.ros.org/nav2d/Tutorials/MultiMapper)
```shell
#边建地图边探索
roslaunch nav2d_tutorials tutorial3.launch
rosservice call /StartMapping 
rosservice call /StartExploration 
```