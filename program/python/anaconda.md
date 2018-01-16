[doc](https://conda.io/docs/user-guide/configuration/use-condarc.html#general-configuration)

python的一个环境、版本管理工具包

使用anaconda安装的pytorch，需要使用命令
```python
import torch # 而不是pytorch，据说是因为兼容老版本
```
## 添加[清华的源](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes # 显示下载源的地址
```