func main() {
    [fp + 1] = 2, ap++;
    [fp] = 5201798304953761792, ap++;
    jmp rel -1;
}



// $ cairo-compile pc_loop2.cairo --output pc_loop2_compiled.json
// $ cairo-run --program=pc_loop2_compiled.json --print_memory --print_info --print_output --layout=small --no_end --step=16 