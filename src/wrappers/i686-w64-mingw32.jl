# Autogenerated wrapper script for Libgcrypt_jll for i686-w64-mingw32
export libgcrypt

using Libgpg_error_jll
JLLWrappers.@generate_wrapper_header("Libgcrypt")
JLLWrappers.@declare_library_product(libgcrypt, "libgcrypt-20.dll")
function __init__()
    JLLWrappers.@generate_init_header(Libgpg_error_jll)
    JLLWrappers.@init_library_product(
        libgcrypt,
        "bin\\libgcrypt-20.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
