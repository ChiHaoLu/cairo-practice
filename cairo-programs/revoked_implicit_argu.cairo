from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2

func foo(n) {
    if (n == 0) {
        return ();
    }
    foo(n=n - 1);
    return ();
}

func bar{hash_ptr: HashBuiltin*}() {
    hash2(1, 2);
    foo(3);
    hash2(3, 4);
    return ();
}

// $ cairo-compile revoked_implicit_argu.cairo --output revoked_implicit_argu_compiled.json
// $ cairo-run --program=revoked_implicit_argu_compiled.json --print_output --layout=small 