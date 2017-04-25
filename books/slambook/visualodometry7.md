## 视觉里程计1

视觉slam分为视觉前端和优化后端，前端就是视觉里程计(VO, visual odometry)

根据是否需要特征点分为两种方法
- 特征点法
- 直接法

fast 关键点， 没有描述子

### ORB特征
由关键点与描述子两部分组成，关键点称为 oriented fast(一种改进的fast角点)，描述子称为 BRIEF(binary robust independent elmentary fefatures)
- fast关键点，是一种角点，
    orb对其做了改进，添加了尺度不变性，旋转不变性
- BRIEF描述子，
    orb对其做了改进，根据改进的fast角点的方向信息，计算旋转之后的 steer BRIEF，如此有了旋转不变性。
- 特征匹配
    暴力匹配 (brute-force matcher)
    快速近似最近邻 (flann)

### 2D-2D对极几何
- 对极约束
- 本质矩阵
- 单应矩阵