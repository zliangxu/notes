# [gnuplot](http://www.gnuplot.info/)

所有设置均以set开头
```shell
set grid  # 引入网格
set xlabel " " # 坐标轴取名
set ylabel  " " # 坐标轴取名
set xr [1:2] # x轴取值范围
set yr [1:2] # y轴取值范围
set xtics # 最小分隔刻度
set ytics # 最小分隔刻度
set size 1,1 # x轴的最小刻度与y轴的最小刻度几何长度相等
set key # key(线的标示)位置的放置{left|right|center}{top|bottom|center}
set output ".png" # 输出图像保存位置及文件名
```

plot画线
```shell
# title为线的名字，lw表示线宽，
plot "数据文件名.txt" using <> title "" with lines lw 2, \
```