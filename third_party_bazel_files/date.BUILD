# 推荐的方式是把这个文件集中放在某个新的文件夹中
cc_library(
    name = "date",
    srcs = glob(["src/*.cpp"]),
    hdrs = glob(["include/date/*.h"]),
    includes = ["include", "include/date"],
    visibility = ["//visibility:public"],
)

cc_library(name = \"date\",srcs = glob([\"src/*.cpp\"]),hdrs = glob([\"include/date/*.h\"]),includes = [\"include\", \"include/date\"],visibility = [\"//visibility:public\"],)