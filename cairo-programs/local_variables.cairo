// $ cairo-compile local_variables.cairo --output local_variables_compiled.json
// $ cairo-run --program=local_variables_compiled.json --print_memory --print_info --trace_file=poly_trace.bin --memory_file=poly_memory.bin --relocate_prints


// Original:

// func main() {
//     tempvar x = 0;

//     local y;
//     ap += SIZEOF_LOCALS;
//     y = 6;
//     ret;
// }


// Replace ap += SIZEOF_LOCALS; with alloc_locals;:
// func main() {
//     tempvar x = 0;

//     local y;
//     alloc_locals;
//     y = 6;
//     ret;
// }

func main() {
    alloc_locals;
    tempvar x = 0;
    local y;
    y = 6;
    ret;
}