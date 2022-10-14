func main(){

    // Original Solution:
    // [ap] = 100, ap++; # x
    // [ap] = [ap - 1] * [ap - 1], ap++; # x^2
    // [ap] = [ap - 1] * [ap - 2], ap++; # x^3
    // [ap] = [ap - 3] * 45, ap++; # 45x
    // [ap] = [ap - 3] * 23, ap++; # 23x^2
    // [ap] = [ap - 3] + [ap - 1], ap++; # x^3 + 23x^2
    // [ap] = [ap - 3] + [ap - 1], ap++; # x^3 + 23x^2 + 45x
    // [ap] = [ap - 1] + 67, ap++; # x^3 + 23x^2 + 45x + 67

    [ap] = 100, ap++; // x
    let x = ap - 1;
    tempvar res = [x]*[x]*[x] + 23*[x]*[x] + 45*[x] + 67;
    
    ret;
}

// $ cairo-compile polynomial_excercise_with_temp.cairo --output polynomial_excercise_with_temp_compiled.json
// $ cairo-run --program=polynomial_excercise_with_temp_compiled.json --print_memory --print_info --trace_file=poly_trace.bin --memory_file=poly_memory.bin --relocate_prints 