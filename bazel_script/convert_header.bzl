def _convert_impl:
    print("fefaef")

_convert = rule(
    implementation = _convert_impl,
    attrs = {
        "binary_files": attr.label_list(allow_files = True),
        
    },
)