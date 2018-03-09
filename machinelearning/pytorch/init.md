# 参数初始化

conv2d:默认使用xavier-uniform初始化参数
bn2d:running_mean,running_var用于记录输入数据的均值、方差，从而用于eval阶段的均值、方差。
# 编写
使用Module.apply(fn)函数

## tips
- immediate children modules
immdiate表示