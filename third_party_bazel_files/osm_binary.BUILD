cc_library(
    name = "osm-binary",
    hdrs = ["include/osmpbf/osmpbf.h"],
    visibility = ["//visibility:public"],
)

proto_library(
    name = "fileformat_proto",
    srcs = ["src/fileformat.proto"],
    visibility = ["//visibility:public"],
)

proto_library(
    name = "osmformat_proto",
    srcs = ["src/osmformat.proto"],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "osm_cc_proto_fileformat",
    deps = [
        ":fileformat_proto",
        ],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "osm_cc_proto_osmformat",
    deps = [
        ":osmformat_proto"
        ],
    visibility = ["//visibility:public"],
)



cc_library(name = \"osm-binary\",hdrs = [\"include/osmpbf/osmpbf.h\"],visibility = [\"//visibility:public\"],)\nproto_library(name = \"fileformat_proto\",srcs = [\"src/fileformat.proto\"],visibility = [\"//visibility:public\"],)\nproto_library(name = \"osmformat_proto\",srcs = [\"src/osmformat.proto\"],visibility = [\"//visibility:public\"],)\ncc_proto_library(name = \"osm_cc_proto_fileformat\",deps = [\":fileformat_proto\",],visibility = [\"//visibility:public\"],)\ncc_proto_library(name = \"osm_cc_proto_osmformat\",deps = [\":osmformat_proto\"],visibility = [\"//visibility:public\"],)

