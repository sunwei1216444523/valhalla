# 其实如果本地就安装了sqlite的话，根本不需要在build中指定sqlite的路径，
# 直接在configure中指定就可以了，但是如果本地没有安装sqlite的话，就需要在build中指定sqlite的路径，否则会报错，找不到sqlite的头文件和库文件。
# 代码中通过 <sqlite3.h> 方式引用的可以直接去找
cc_import(
    name = "libspatialite",
    shared_library = "lib/x86_64-linux-gnu/libspatialite.so",
    static_library = "lib/x86_64-linux-gnu/libspatialite.a",
    visibility = ["//visibility:public"],
)

cc_import(name = \"libspatialite\",shared_library = \"lib/x86_64-linux-gnu/libspatialite.so\",static_library = \"lib/x86_64-linux-gnu/libspatialite.a\",visibility = [\"//visibility:public\"],)