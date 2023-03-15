def _generate_header_file_impl(ctx):
    header_file = ctx.actions.declare_file("date_time_%s.h" % ctx.tz_db_file)
    cmd = [
        "cmake",
        "-DMSVC=" + ("1" if ctx.configuration.is_windows() else "0"),
        "-P",
        ctx.file.date_time_bin2header_script.path(),
        ctx.file.date_time_dir.path() + "/" + ctx.tz_db_file,
        header_file.path(),
        "--variable-name",
        "date_time_%s" % ctx.tz_db_file,
        "--skip",
        "1",
        "--raw"
    ]
    ctx.actions.run(
        inputs = [ctx.file.date_time_bin2header_script, ctx.file.date_time_dir.path() + "/" + ctx.tz_db_file],
        outputs = [header_file],
        arguments = cmd,
        working_directory = ctx.workspace_dir,
        mnemonic = "Generate date time header file for %s" % ctx.tz_db_file
    )
    return header_file

def generate_header_files_rule(ctx, tz_db_files):
    header_files = []
    for tz_db_file in tz_db_files:
        header_file = ctx.attr._generate_header_file_impl(tz_db_file=tz_db_file)
        header_files.append(header_file)
    return struct(
        header_files = header_files,
    )

generate_header_files = rule(
    implementation = generate_header_files_rule,
    attrs = {
        "_generate_header_file_impl": attr.label(
            executable=True,
            cfg=host,
            doc="The implementation rule for generating a header file.",
        ),
        "tz_db_files": attr.string_list(
            mandatory=True,
            doc="The list of timezone database files.",
        ),
    },
)
