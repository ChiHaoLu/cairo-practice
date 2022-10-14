func main{}() {

    [ap] = 25, ap++;
    %{
        import math
        memory[ap] = int(math.sqrt(memory[ap - 1]))
    %}
    [ap - 1] = [ap] * [ap], ap++;

    return ();
}


// $ cairo-compile hint1.cairo --output hint1_compiled.json
// $ cairo-run --program=hint1_compiled.json --print_memory --print_info --print_output --layout=small 