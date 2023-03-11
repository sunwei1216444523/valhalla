## learning log
1. 在项目中，同时存在类似以下两种头文件引用方式，按照bazel以及编码规范，一般不赞成这种方式，<>方式一般是搜索系统库文件，""才是搜索项目下的头文件[#include rule](https://bazel.build/docs/bazel-and-cpp#include-paths)。并且如果随意使用<>的方式引用，bazel中会出现错误，无法编译通过。 
```
    #include <valhalla/midgard/***.h>  // 常见于各个模块的 *.h 文件
    #include "midgard/***.h"           // 常见于各个模块的 *.cc文件
```
2. includes = [] 和 copts = ["-Ixxx/xxx"] 的作用大致类似，但是推荐使用includes的方式给出头文件搜索路径。
3. 需要指定编译的C++版本，可以指定到rule中，但是推荐的方式还是直接写到WORKSPACE中应用于整个项目（待学习[toolchain](https://bazel.build/tutorials/ccp-toolchain-config?hl=zh-cn)）
    ```
    cc_library(
        ...
        copts = ["-std=c++14"],
        ...
    )
    ```