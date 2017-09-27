```cpp
#include <getopt.h>

extern char *optarg;
extern int optind;

extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
```
__shortopts格式 
'a'  标志变量
'b:' b参数后有接其它参数，并把字符串赋值给optarg