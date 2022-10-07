%builtins range_check

func foo{range_check_ptr}(x) {

    // 第一次先檢查 0 <= x < 2^128
    // 第二次檢查 0 <= BOUND - x < 2^128

    tempvar x2 = 1000 - x;
    [range_check_ptr] = x;
    [range_check_ptr + 1] = x2;

    let range_check_ptr = range_check_ptr + 2;
    return ();
}

func main{range_check_ptr}() {

    foo(1000);
    foo(100);
    foo(1);
    // foo(-1); // expect failed
    //foo(1001); // expect failed
    
    return ();
}

// $ cairo-compile range-check.cairo --output range-check_compiled.json
// $ cairo-run --program=range-check_compiled.json --print_output --layout=small 