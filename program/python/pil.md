[python image library](http://effbot.org/imagingbook/)
[pillow](http://pillow.readthedocs.io/en/latest/index.html)

```python
import Image

# 打开一个jpg图像文件，注意路径要改成你自己的:
im = Image.open('/Users/michael/test.jpg') #rgb顺序
# 获得图像尺寸:
w, h = im.size
# 缩放到50%:
im.thumbnail((w//2, h//2))
# 把缩放后的图像用jpeg格式保存:
im.save('/Users/michael/thumbnail.jpg', 'jpeg')
# 显示图片
im.show()
 
# image 转 numpy.array
numpy.array(image)
# numpy.array 转 image，数据类型要与mode契合
Image.fromarray(array, mode='I')

```