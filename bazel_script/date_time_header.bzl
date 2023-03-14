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

exports_files(["BUILD"])
exports_files(["Binary2Header.cmake"])
