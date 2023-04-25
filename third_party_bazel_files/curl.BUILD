cc_import(
    name = "libcurl",
    inlcudes = ["include"],
    shared_library = "lib/x86_64-linux-gnu/libcurl.so",
    static_library = "lib/x86_64-linux-gnu/libcurl.a",
    visibility = ["//visibility:public"],
)

cc_import(name = \"libcurl\",shared_library = \"lib/x86_64-linux-gnu/libcurl.so\",static_library = \"lib/x86_64-linux-gnu/libcurl.a\",visibility = [\"//visibility:public\"],)


# cc_library(
#     name = "curl",
#     srcs = glob(["src/*.c", "lib/*.c", "lib/**/*.c"]),
#     hdrs = glob(["include/curl/*.h", "lib/*.h", "lib/**/*.h"]),
#     includes = ["include", "lib"],
#     visibility = ["//visibility:public"],
# )

# cc_library(name = \"curl\",srcs = glob([\"src/*.c\", \"lib/*.c\", \"lib/**/*.c\"]),hdrs = glob([\"include/curl/*.h\", \"lib/*.h\", \"lib/**/*.h\"]),includes = [\"include\", \"lib\"],visibility = [\"//visibility:public\"],)

cc_library(name = \"curl\",visibility = [\"//visibility:public\"],deps = [\"@system_curl//:libcurl\"])
