[matplotlib](http://matplotlib.org/users/index.html)  
[tutorial](http://www.labri.fr/perso/nrougier/teaching/matplotlib/)  
[pyplot](http://matplotlib.org/users/pyplot_tutorial.html)  

rc?
rcParams是RcParams的一个实例，用于设置matplotlib的默认绘图参数，并使其有效
```python
# 更改大小，有报错？？
matploylib.rcParams['figure.figize'] = (12.0, 6.0)

# 创建窗口对象的时候设置大小 
import matplotlib.pyplot as plt
plt.figure('head', figsize=(8,8))
f, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2,2)
plt.imshow()
plt.hist()
plt.show()
plt.set_figwidth(10)
plt.set_figheight(10)
plt.suptitle('sd')
```