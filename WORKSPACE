load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Boost
# Famous C++ library that has given rise to many new additions to the C++ Standard Library
# Makes @boost available for use: For example, add `@boost//:algorithm` to your deps.
# For more, see https://github.com/nelhage/rules_boost and https://www.boost.org
# http_archive(
#     name = "com_github_nelhage_rules_boost",

#     # Replace the commit hash in both places (below) with the latest, rather than using the stale one here.
#     # Even better, set up Renovate and let it do the work for you (see "Suggestion: Updates" in the README).
#     url = "https://github.com/nelhage/rules_boost/archive/96e9b631f104b43a53c21c87b01ac538ad6f3b48.tar.gz",
#     strip_prefix = "rules_boost-96e9b631f104b43a53c21c87b01ac538ad6f3b48",
#     # When you first run this tool, it'll recommend a sha256 hash to put here with a message like: "DEBUG: Rule 'com_github_nelhage_rules_boost' indicated that a canonical reproducible form can be obtained by modifying arguments sha256 = ..."
# )
# load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
# boost_deps()

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

http_archive(
    name = "rules_proto",
    sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
    strip_prefix = "rules_proto-5.3.0-21.7",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.7.tar.gz",
    ],
)
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

# 如果通过http_archive下载的话，会报错，因为没有strip_prefix，com_google_protobuf会报错
# http_archive(
#     name = "com_google_googletest",
#     url = "https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip",
#     strip_prefix = "googletest-release-1.11.0",
# )

# 官方推荐尽量使用http_archieve的方式而不是git的方式

git_repository(
    name = "com_google_protobuf",
    # 此处如果使用更高版本就会出现c++14不支持的问题
    tag = "v3.21.7",
    remote = "https://github.com/protocolbuffers/protobuf.git",
)
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

# OSM
new_git_repository(
    name = "osm-binary",
    remote = "https://github.com/openstreetmap/OSM-binary.git",
    commit = "4e32fa2",
    # build_file = "third_party_bazel_files/osm_binary.BUILD",
    build_file_content = "cc_library(name = \"osm-binary\",hdrs = [\"include/osmpbf/osmpbf.h\"],visibility = [\"//visibility:public\"],)\nproto_library(name = \"fileformat_proto\",srcs = [\"src/fileformat.proto\"],visibility = [\"//visibility:public\"],)\nproto_library(name = \"osmformat_proto\",srcs = [\"src/osmformat.proto\"],visibility = [\"//visibility:public\"],)\ncc_proto_library(name = \"osm_cc_proto_fileformat\",deps = [\":fileformat_proto\",],visibility = [\"//visibility:public\"],)\ncc_proto_library(name = \"osm_cc_proto_osmformat\",deps = [\":osmformat_proto\"],visibility = [\"//visibility:public\"],)",
)

# benchmark
new_git_repository(
    name = "benchmark",
    remote = "https://github.com/google/benchmark.git",
    commit = "e991355",
    # build_file = "third_party_bazel_files/benchmark.BUILD",
    build_file_content = "cc_library(name = \"benchmark\",hdrs = glob([\"include/benchmark/*.h\"]),srcs = glob([\"src/*.cc\"])+glob([\"src/*.h\"]),includes = [\"include\"],visibility=[\"//visibility:public\"],)",
)

# cpp-statsd-client
new_git_repository(
    name = "cpp-statsd-client",
    remote = "https://github.com/vthiery/cpp-statsd-client.git",
    commit = "8cc00d0",
    # build_file = "third_party_bazel_files/cpp-statsd-client.BUILD",
    build_file_content = "cc_library(name = \"cpp-statsd-client\",hdrs = glob([\"include/cpp-statsd-client/*.hpp\"]),visibility = [\"//visibility:public\"],)",
)

# cxxopts
new_git_repository(
    name = "cxxopts",
    remote = "https://github.com/jarro2783/cxxopts.git",
    commit = "302302b",
    # build_file = "third_party_bazel_files/cxxopts.BUILD",
    build_file_content = "cc_library(name = \"cxxopts\",hdrs = glob([\"include/*.hpp\"]),srcs = glob([\"src/*.cpp\"]),includes = [\"include\"],visibility = [\"//visibility:public\"],)",
)

# date
new_git_repository(
    name = "date",
    remote = "https://github.com/HowardHinnant/date.git",
    commit = "a2fdba1",
    # build_file = "third_party_bazel_files/date.BUILD",
    build_file_content = "cc_library(name = \"date\",srcs = glob([\"src/*.cpp\"]),hdrs = glob([\"include/date/*.h\"]),includes = [\"include\", \"include/date\"],visibility = [\"//visibility:public\"],)",
)
# new_local_repository(
#     name = "date",
#     path = "third_party/date",
#     build_file = "third_party_bazel_files/date/BUILD.bazel",
# )

# dirent skadi模块 这个完全依赖于Windows的系统文件，Valhalla中会判断
# platform是不是Windows，是的话才会include进来，如果是Linux平台我们就先不考虑
# new_git_repository(
#     name = "dirent",
#     remote = "https://github.com/tronkko/dirent.git",
#     commit = "287ba92",
#     # build_file = "third_party_bazel_files/dirent.BUILD",
#     build_file_content = "cc_library(name = \"dirent\",hdrs = [\"include/dirent.h\"],srcs = glob([\"examples/*.c\"]),includes = [\"include\"],)",
# )

# # python 项目，可能c++内部并不直接引用，而是间接产生中间文件
# 只是通过这个模块生成一个叫做 converage.info的文件，用途暂时没确定，在最外层
# CMakeLists.txt中提及
# new_git_repository(
#     name = "fastcov",
#     remote = "https://github.com/RPGillespie6/fastcov.git",
#     commit = "1128b0f",
#     build_file = "third_party_bazel_files/fastcov/BUILD.bazel",
# )

# googletest 本身自带bazel文件
git_repository(
    name = "googletest",
    remote = "https://github.com/google/googletest.git",
    commit = "e2239ee",
)

#just_gtfs
new_git_repository(
    name = "just_gtfs",
    remote = "https://github.com/mapsme/just_gtfs.git",
    commit = "a363830",
    # build_file = "third_party_bazel_files/just_gtfs.BUILD",
    build_file_content = "cc_library(name = \"just_gtfs\",hdrs = glob([\"include/just_gtfs/*.h\"]),includes = [\"include/just_gtfs\"],visibility = [\"//visibility:public\"],)",
)

# libosmium
new_git_repository(
    name = "libosmium",
    remote = "https://github.com/osmcode/libosmium.git",
    commit = "9c50fde",
    # build_file = "third_party_bazel_files/libosmium.BUILD",
    build_file_content = "cc_library(name = \"libosmium\",hdrs = glob([\"include/osmium/*.hpp\"]) + glob([\"include/*.hpp\"]) +glob([\"include/osmium/area/*.hpp\"]) + glob([\"include/osmium/area/detail/*.hpp\"]) +glob([\"include/osmium/builder/*.hpp\"]) + glob([\"include/osmium/experimental/*.hpp\"]) +glob([\"include/osmium/geom/*.hpp\"]) + glob([\"include/osmium/handler/*.hpp\"]) +glob([\"include/osmium/index/*.hpp\"]) + glob([\"include/osmium/index/detail/*.hpp\"]) +glob([\"include/osmium/index/map/*.hpp\"]) + glob([\"include/osmium/index/multimap/*.hpp\"]) +glob([\"include/osmium/io/*.hpp\"]) + glob([\"include/osmium/io/detail/*.hpp\"]) +glob([\"include/osmium/memory/*.hpp\"]) + glob([\"include/osmium/osm/*.hpp\"]) +glob([\"include/osmium/relations/*.hpp\"]) + glob([\"include/osmium/relations/detail/*.hpp\"]) +glob([\"include/osmium/storage/*.hpp\"]) + glob([\"include/osmium/tags/*.hpp\"]) +glob([\"include/osmium/threads/*.hpp\"]) + glob([\"include/osmium/util/*.hpp\"]),srcs = glob([\"example/*.cpp\"]),includes = [\"include\"],visibility = [\"//visibility:public\"],)",
)

# lz4 应用于 valhalla::skadi模块
new_git_repository(
    name = "lz4",
    remote = "https://github.com/lz4/lz4.git",
    commit = "d443718",
    # build_file = "third_party_bazel_files/lz4.BUILD",
    build_file_content = "cc_library(name = \"lz4\",hdrs = glob([\"lib/*.h\"]) + [\"lib/lz4.c\"],srcs = glob([\"lib/*.c\"], exclude = [\"lib/lz4.c\"]),includes = [\"lib\"],visibility = [\"//visibility:public\"],)",
)

# microtar
new_git_repository(
    name = "microtar",
    remote = "https://github.com/rxi/microtar.git",
    commit = "27076e1",
    # 目前使用build_file的方式会报错，但是使用build_file_content的方式就能通过编译
    # 查阅网上的资料貌似说是这个new_git_repository和native。new_git_repository有区别
    # 不是很好用，直接弃用好了
    # build_file = "third_party_bazel_files/microtar/BUILD",
    # 单独提供build_file_content而不是一个build_file就能通过编译
    build_file_content = "cc_library(name = \"microtar\",hdrs = [\"src/microtar.h\"],srcs = [\"src/microtar.c\"],visibility = [\"//visibility:public\"],)",
)

# protozero
new_git_repository(
    name = "protozero",
    remote = "https://github.com/mapbox/protozero.git",
    commit = "7487f81",
    # build_file = "third_party_bazel_files/protozero.BUILD",
    build_file_content = "cc_library(name = \"protozero\",hdrs = glob([\"include/protozero/*.hpp\"]),srcs = glob([\"tools/*.cpp\"]),includes = [\"include\"],visibility = [\"//visibility:public\"],)",
)

# pybind11 主要在 src/bindings/python/CMakeLists.txt中提及
# 猜测是为了完成python版本的Valhalla，理论上可以暂时先不考虑
# 主要用于生成python代码文件
#TODO 暂时不知道怎么结合，或者影响是什么
# new_git_repository(
#     name = "pybind11",
#     remote = "https://github.com/pybind/pybind11.git",
#     commit = "914c06f",
#     build_file = "third_party_bazel_files/pybind11.BUILD",
# )

# rapidjson
new_git_repository(
    name = "rapidjson",
    remote = "https://github.com/Tencent/rapidjson.git",
    commit = "73063f5",
    # build_file = "third_party_bazel_files/rapidjson.BUILD",
    build_file_content = "cc_library(name = \"rapidjson\",hdrs = glob([\"include/rapidjson/*.h\"]) + glob([\"include/rapidjson/error/*.h\"]) + glob([\"include/rapidjson/internal/*.h\"]) + glob([\"include/rapidjson/msinttypes/*.h\"]),includes = [\"include\"],visibility = [\"//visibility:public\"],)",
)

# robin-hood-hashing
new_git_repository(
    name = "robin-hood-hashing",
    remote = "https://github.com/martinus/robin-hood-hashing.git",
    commit = "f2cae2e",
    # build_file = "third_party_bazel_files/robin-hood-hashing.BUILD",
    build_file_content = "cc_library(name = \"robin-hood-hashing\",hdrs = [\"src/include/robin_hood.h\"],includes=[\"src/include\"],visibility = [\"//visibility:public\"],)",
)

# 安装版本的依赖库
# sqlite3
new_local_repository(
    name = "sqlite3",
    path = "/usr",
    # build_file = "third_party_bazel_files/sqlite3.BUILD",
    build_file_content = "cc_import(name = \"libsqlite3\",shared_library = \"lib/x86_64-linux-gnu/libsqlite3.so\",static_library = \"lib/x86_64-linux-gnu/libsqlite3.a\",visibility = [\"//visibility:public\"],)",
)

# spatialite
new_local_repository(
    name = "spatialite",
    path = "/usr",
    # build_file = "third_party_bazel_files/spatialite.BUILD",
    build_file_content = "cc_import(name = \"libspatialite\",shared_library = \"lib/x86_64-linux-gnu/libspatialite.so\",static_library = \"lib/x86_64-linux-gnu/libspatialite.a\",visibility = [\"//visibility:public\"],)",
)

# curl
new_local_repository(
    name = "curl",
    path = "/usr",
    # build_file = "third_party_bazel_files/curl.BUILD",
    build_file_content = "cc_import(name = \"libcurl\",shared_library = \"lib/x86_64-linux-gnu/libcurl.so\",static_library = \"lib/x86_64-linux-gnu/libcurl.a\",visibility = [\"//visibility:public\"],)",
)

# lua
new_local_repository(
    name = "lua",
    path = "/usr",
    build_file_content = "cc_import(name = \"liblua\",shared_library = \"lib/x86_64-linux-gnu/libluajit-5.1.so\",static_library = \"lib/x86_64-linux-gnu/libluajit-5.1.a\",visibility = [\"//visibility:public\"],)",
)

new_local_repository(
    name = "boost",
    path = "/usr",
    build_file_content = "cc_import(name = \"libboost_system\",shared_library = \"lib/x86_64-linux-gnu/libboost_system.so\",static_library = \"lib/x86_64-linux-gnu/libboost_system.a\",visibility = [\"//visibility:public\"],)\ncc_import(name = \"libboost_filesystem\",shared_library = \"lib/x86_64-linux-gnu/libboost_filesystem.so\",static_library = \"lib/x86_64-linux-gnu/libboost_filesystem.a\",visibility = [\"//visibility:public\"],)\ncc_import(name = \"libboost_fiber\",shared_library = \"lib/x86_64-linux-gnu/libboost_fiber.so\",static_library = \"lib/x86_64-linux-gnu/libboost_fiber.a\",visibility = [\"//visibility:public\"],)",
)