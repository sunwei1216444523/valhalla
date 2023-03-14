def cc_date_time(tz_db_files):
    hdrs = []
    for tz_db_file in tz_db_files:
        hdr_file = "date_time_%s.h" % tz_db_file  # use the tz_db_file name as part of the header file name
        hdr_path = native.new_local_repository_path(hdr_file)
        native.cc_binary(
            name = hdr_file,
            srcs = [tz_db_file],
            out_hdrs = [hdr_path],
            args = [
                "-DMSVC=%s" % (if_else(platform.system() == "Windows", "TRUE", "FALSE")),
                "-P", native.package_path() + "/Binary2Header.cmake",
                tz_db_file,
                hdr_path,
                "--variable-name", "date_time_%s" % tz_db_file,
                "--skip", "1",
                "--raw",
            ],
            visibility = ["//visibility:public"],
            data = [native.new_local_repository_path(tz_db_file)],
        )
        hdrs.append(hdr_path)
    return hdrs

# 是 bazel 的一种规则，在 bzl 文件中使用，用于告诉 bazel，
# 这个 bzl 文件可以导出（export）文件到外部调用该文件的其他 bzl 文件。
# 在这里，我们使用 exports_files(["BUILD"]) 来声明这个 bzl 文件可以
# 导出 BUILD 文件。这意味着，在使用 load 函数加载这个 bzl 文件的 BUILD 文件中，
# 可以通过相对路径（如 #path/to/my_bzl:BUILD）直接访问该 bzl 文件的 BUILD 文件，
# 而无需显式声明或使用其他方法引用。

# 在这个例子中，我们使用 exports_files(["BUILD"]) 来声明
# 该 date_time_header.bzl 文件可以导出 BUILD 文件，这样我们
# 就可以在使用 load 函数加载 date_time_header.bzl 的 BUILD 文件中
# 直接访问 date_time_header.bzl 文件所在目录下的 BUILD 文件。
exports_files(["BUILD"])
exports_files(["Binary2Header.cmake"])
