## 安装
```shell
pip install visdom
```
## 使用
```shell
# 对于本地电脑，本地电脑直接运行
python -m visdom.server # 浏览器可以直接打开默认端口，127.0.0.1:8097
# 对于服务器，服务器电脑运行
python -m visdom.server # 本地主机浏览器打开端口，127.0.0.1:8097，注意因为服务器在局域网内，所以需要在路由器上添加8097的端口转发功能
```