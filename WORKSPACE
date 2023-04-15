load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Boost
# Famous C++ library that has given rise to many new additions to the C++ Standard Library
# Makes @boost available for use: For example, add `@boost//:algorithm` to your deps.
# For more, see https://github.com/nelhage/rules_boost and https://www.boost.org
http_archive(
    name = "com_github_nelhage_rules_boost",

    # Replace the commit hash in both places (below) with the latest, rather than using the stale one here.
    # Even better, set up Renovate and let it do the work for you (see "Suggestion: Updates" in the README).
    url = "https://github.com/nelhage/rules_boost/archive/96e9b631f104b43a53c21c87b01ac538ad6f3b48.tar.gz",
    strip_prefix = "rules_boost-96e9b631f104b43a53c21c87b01ac538ad6f3b48",
    # When you first run this tool, it'll recommend a sha256 hash to put here with a message like: "DEBUG: Rule 'com_github_nelhage_rules_boost' indicated that a canonical reproducible form can be obtained by modifying arguments sha256 = ..."
)
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
boost_deps()

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
    name = "osm_binary",
    remote = "https://github.com/openstreetmap/OSM-binary.git",
    commit = "4e32fa2",
    build_file = "third_party_bazel_files/osm_binary/BUILD.bazel",
)

new_git_repository(
    name = "benchmark",
    remote = "https://github.com/google/benchmark.git",
    commit = "e991355",
    build_file = "third_party_bazel_files/benchmark/BUILD.bazel",
)

new_git_repository(
    name = "cpp-statsd-client",
    remote = "https://github.com/vthiery/cpp-statsd-client.git",
    commit = "8cc00d0",
    build_file = "third_party_bazel_files/cpp-statsd-client/BUILD.bazel",
)

new_git_repository(
    name = "cxxopts",
    remote = "https://github.com/jarro2783/cxxopts.git",
    commit = "302302b",
    build_file = "third_party_bazel_files/cxxopts/BUILD.bazel",
)

# 使用git_repository替代local_repository
new_git_repository(
    name = "date",
    remote = "https://github.com/HowardHinnant/date.git",
    commit = "302302b",
    build_file = "third_party_bazel_files/date/BUILD.bazel",
)
# new_local_repository(
#     name = "date",
#     path = "third_party/date",
#     build_file = "third_party_bazel_files/date/BUILD.bazel",
# )

new_git_repository(
    name = "dirent",
    remote = "https://github.com/tronkko/dirent.git",
    commit = "287ba92",
    build_file = "third_party_bazel_files/dirent/BUILD.bazel",
)

# # python 项目，可能c++内部并不直接引用，而是间接产生中间文件
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

new_git_repository(
    name = "just_gtfs",
    remote = "https://github.com/mapsme/just_gtfs.git",
    commit = "a363830",
    build_file = "third_party_bazel_files/just_gtfs/BUILD.bazel",
)

new_git_repository(
    name = "libosmium",
    remote = "https://github.com/osmcode/libosmium.git",
    commit = "9c50fde",
    build_file = "third_party_bazel_files/libosmium/BUILD.bazel",
)

new_git_repository(
    name = "lz4",
    remote = "https://github.com/lz4/lz4.git",
    commit = "d443718",
    build_file = "third_party_bazel_files/lz4/BUILD.bazel",
)

new_git_repository(
    name = "microtar",
    remote = "https://github.com/rxi/microtar.git",
    commit = "27076e1",
    build_file = "third_party_bazel_files/microtar/BUILD.bazel",
)

new_git_repository(
    name = "protozero",
    remote = "https://github.com/mapbox/protozero.git",
    commit = "7487f81",
    build_file = "third_party_bazel_files/protozero/BUILD.bazel",
)

new_git_repository(
    name = "pybind11",
    remote = "https://github.com/pybind/pybind11.git",
    commit = "914c06f",
    build_file = "third_party_bazel_files/pybind11/BUILD.bazel",
)

new_git_repository(
    name = "rapidjson",
    remote = "https://github.com/Tencent/rapidjson.git",
    commit = "73063f5",
    build_file = "third_party_bazel_files/rapidjson/BUILD.bazel",
)

new_git_repository(
    name = "robin-hood-hashing",
    remote = "https://github.com/martinus/robin-hood-hashing.git",
    commit = "f2cae2e",
    build_file = "third_party_bazel_files/robin-hood-hashing/BUILD.bazel",
)

# 安装版本的依赖库
new_local_repository(
    name = "sqlite3",
    path = "/usr",
    build_file = "third_party_bazel_files/sqlite3/BUILD.bazel",
)

new_local_repository(
    name = "spatialite",
    path = "/usr",
    build_file = "third_party_bazel_files/spatialite/BUILD.bazel",
)

new_local_repository(
    name = "curl",
    path = "/usr",
    build_file = "third_party_bazel_files/curl/BUILD.bazel",
)