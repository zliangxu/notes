[nav2d](http://wiki.ros.org/nav2d)

[tutorial](http://wiki.ros.org/nav2d/Tutorials/MultiMapper)

### 边建地图边探索
```shell
roslaunch nav2d_tutorials tutorial3.launch
rosservice call /StartMapping 
rosservice call /StartExploration 
```
由上面的指令知道，导航所用到的有两个部分mapping和explore.
而mapping只是做了一个full turn to have a initial map，后面的工作都是explore在运行

### server
- mLocalizeActionServer
  ```
  turorial3中好像没有调用这个节点
  receiveLocalizeGoal
  调用isLocalized，return waitForTransform
  ```
  
- mExploreActionServer      mStatus = NAV_ST_EXPLORING
  ```
  receiveExploreGoal
  调用setCurrentPosition设置机器人当前位置
  调用preparePlan
  搜索目标点findExplorationTarget
  switch 
    EXPL_TARGET_SET createPlan
    EXPL_FINISHED
    EXPL_WAITING
    EXPL_FAILED
  generateCommand，路径规划，发布机器人移动指令
  ```

- mGetMapActionServer       mStatus = NAV_ST_RECOVERING
  ```
  receiveGetMapGoal
  setCurrentPosition设置机器人当前位置

  ```
  
- mMoveActionServer         mStatus = NAV_ST_RECOVERING
  ```
  这个应该是单独运行的，与explore类似
  receiveMoveGoal 
  每几个循环
    调用preparePlan，会setCurrentPosition设置当前机器人位置, 会inflateMap
  然后createPlan
  然后setCurrentPosition设置当前机器人位置
  判断是否到达目的地
  调用generateCommand，发布机器人移动指令
  ```

### client
- localize_client           //获得tf转换数据，即定位
- explore_client            //搜索目标点
- get_map_client            //是不是只有初始化时才会用到
- set_goal_client           //订阅goal话题，然后sendGoal到哪？？
