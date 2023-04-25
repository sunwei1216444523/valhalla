cc_library(
    name = "lz4",
    hdrs = glob(["lib/*.h"]) + ["lib/lz4.c"],
    srcs = glob(["lib/*.c"], exclude = ["lib/lz4.c"]),
    includes = ["lib"],
    visibility = ["//visibility:public"],
)

cc_library(name = \"lz4\",hdrs = glob([\"lib/*.h\"]) + [\"lib/lz4.c\"],srcs = glob([\"lib/*.c\"], exclude = [\"lib/lz4.c\"]),includes = [\"lib\"],visibility = [\"//visibility:public\"],)

cc_import(
    name = "liblz4",
    includes = ["include"],
    shared_library = "lib/x86_64-linux-gnu/liblz4.so",
    visibility = ["//visibility:public"],
)

cc_import(name = \"liblz4\",includes = [\"include\"],shared_library = \"lib/x86_64-linux-gnu/liblz4.so\",visibility = [\"//visibility:public\"],)