# https://code.visualstudio.com/docs  
# [main page](https://code.visualstudio.com/)
可以下载insiders版本

安装clang C/C++插件时，clang 需要单独安装  

ctrl+shift+p 后搜索edit configuration编辑c_cpp_properties.json//属性  
                    后搜索tasks:configure task runner编辑tasks.json///编译  
                    编辑launch.json//debug  
## 快捷键
- shift+alt 鼠标，可以竖着选中一些列  
- ctrl+D 鼠标，选中相同的变量  
- ctrl+鼠标点击， 找到选中变量名的定义
- ctrl+shift+. markdown预显示
- ctrl+shift+v markdown预显示
- f12 定位鼠标光标所在变量的定义
- ctrl+z:撤销
- ctrl+y:重复
- ctrl+shift+c:以当前code打开的文件夹为路径打开终端

MakeFile要配置成debug模式，才可在vscode下单步调试，详见cmake

```
launch.json包含两部分，一个用于调试的启动，一个用于调试的连接
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "C++ Launch (GDB)",                // 配置名称，将会在启动配置的下拉菜单中显示
            "type": "cppdbg",                          // 配置类型，这里只能为cppdbg
            "request": "launch",                        // 请求配置类型，可以为launch（启动）或attach（附加）
            "launchOptionType": "Local",                // 调试器启动类型，这里只能为Local
            "targetArchitecture": "x86",                // 生成目标架构，一般为x86或x64，可以为x86, arm, arm64, mips, x64, amd64, x86_64
            "program": "${file}.exe",                  // 将要进行调试的程序的路径
            "miDebuggerPath":"C:\\MinGW\\bin\\gdb.exe", // miDebugger的路径，注意这里要与MinGw的路径对应
            "args": [],                                // 程序调试时传递给程序的命令行参数，一般设为空即可
            "stopAtEntry": false,                      // 设为true时程序将暂停在程序入口处，一般设置为false
            "cwd": "${workspaceRoot}",                  // 调试程序时的工作目录，一般为${workspaceRoot}即代码所在目录
            "externalConsole": true,                    // 调试时是否显示控制台窗口，一般设置为true显示控制台
            "preLaunchTask": "g++"                    // 调试会话开始前执行的任务，一般为编译程序，c++为g++, c为gcc
        }
    ]
}
```
## 设置
- 默认字体
```
<!-- 字体 -->
"editor.fontFamily": "'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
<!-- clang语法 -->
"clang.cxxflags": ["-std=c++11"]
<!-- 缩略图 -->
"editor.minimap.enabled": false  
<!-- CMakeLists自动补全 -->
CMake
```

## 插件
- markdown+math： 编辑公式
- C/C++ clang：语法分析
- c/c++ intelisense
- cmake language support:自动补全
- python 
- latex workshop
