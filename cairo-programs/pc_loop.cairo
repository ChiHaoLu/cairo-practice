func main() {
    [ap] = 2, ap++;

    my_loop:
    [ap] = [ap - 1] * [ap - 1], ap++;
    [ap] = [ap - 1] + 1, ap++;
    jmp my_loop;
}



// $ cairo-compile pc_loop.cairo --output pc_loop_compiled.json
// $ cairo-run --program=pc_loop_compiled.json --print_memory --print_info --print_output --layout=small --no_end --step=16 