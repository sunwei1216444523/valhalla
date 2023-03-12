# 这个函数需要读取date数_time下的数据，
# 所以必然会存在 data label
def _binary2header_impl(ctx):
    pass

binary2header_library = rule(
    implementation = _binary2header_impl,
    attrs = {
        "date_time_files" : attr.string(),
    },
)