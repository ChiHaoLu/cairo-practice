func main() {
    [ap] = 10, ap++;

    my_loop:
    [ap] = [ap - 1] - 1, ap++;
    jmp my_loop if [ap - 1] != 0;

    ret;
}

// $ cairo-compile pc_loop_conditional.cairo --output pc_loop_conditional_compiled.json
// $ cairo-run --program=pc_loop_conditional_compiled.json --print_memory --print_info --print_output --layout=small --no_end --step=16 