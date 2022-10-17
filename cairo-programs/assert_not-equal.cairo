from starkware.cairo.common.math import assert_not_zero

func inverse(x) -> (res: felt) {
    with_attr error_message("x must not be zero. Got x={x}.") {
        return (res=1 / x);
    }
}

func assert_not_equal(a, b) {
    let diff = a - b;
    with_attr error_message("a and b must be distinct.") {
        inverse(diff);
    }
    return ();
}

func main() {
    assert_not_equal(0, 0);
    ret;
}

// $ cairo-compile assert_not-equal.cairo --output assert_not-equal_compiled.json
// $ cairo-run --program=assert_not-equal_compiled.json