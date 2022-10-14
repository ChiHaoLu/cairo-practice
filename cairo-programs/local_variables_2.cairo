// $ cairo-compile local_variables_2.cairo --output local_variables_2_compiled.json
// $ cairo-run --program=local_variables_2_compiled.json --print_memory --print_info --trace_file=poly_trace.bin --memory_file=poly_memory.bin --relocate_prints


// Original:
// func pow4(n) -> (m: felt) {
//     alloc_locals;
//     local x;

//     jmp body if n != 0;
//     [ap] = 0, ap++;
//     ret;

//     body:
//     x = n * n;
//     [ap] = x * x, ap++;
//     ret;
// }

// func main() {
//     pow4(n=5);
//     ret;
// }

func pow4(n) -> (m: felt) {

    jmp body if n != 0;
    [ap] = 0, ap++;
    ret;

    body:
    tempvar x = n * n;
    [ap] = x * x, ap++;
    ret;
}

func main() {
    pow4(n=5);
    ret;
}