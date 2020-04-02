# Autogenerated wrapper script for Libgcrypt_jll for x86_64-apple-darwin14
export libgcrypt

using Libgpg_error_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"

# Relative path to `libgcrypt`
const libgcrypt_splitpath = ["lib", "libgcrypt.20.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgcrypt_path = ""

# libgcrypt-specific global declaration
# This will be filled out by __init__()
libgcrypt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgcrypt = "@rpath/libgcrypt.20.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Libgcrypt")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Libgpg_error_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Libgpg_error_jll.LIBPATH_list,))

    global libgcrypt_path = normpath(joinpath(artifact_dir, libgcrypt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgcrypt_handle = dlopen(libgcrypt_path)
    push!(LIBPATH_list, dirname(libgcrypt_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

