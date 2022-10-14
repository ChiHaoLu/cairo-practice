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
    alloc_locals;
    hash2(1, 2);
    // You can skip the line below, and the compiler will add
    // it automatically, because of the alloc_locals keyword.
    local hash_ptr: HashBuiltin* = hash_ptr;
    foo(3);
    hash2(3, 4);
    return ();
}

// $ cairo-compile revoked_implicit_argu_correct.cairo --output revoked_implicit_argu_correct_compiled.json
// $ cairo-run --program=revoked_implicit_argu_correct_compiled.json --print_output --layout=small 