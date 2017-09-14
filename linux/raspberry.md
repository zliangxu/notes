## 无法访问外网的解决方法
当提示无法解析域名时，说明dns不起作用，需要编辑dns
sudo nano /etc/resolv.conf
修改nameserver 8.8.8.8 ??? 127.0.0.1

