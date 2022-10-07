func main() {
    %{ memory[ap] = program_input['secret'] %}
    [ap] = [ap], ap++;
    ret;
}

// $ cairo-compile input.cairo --output input_compiled.json
// $ cairo-run --program=input_compiled.json --print_memory --print_info --print_output --layout=small --program_input=input.json