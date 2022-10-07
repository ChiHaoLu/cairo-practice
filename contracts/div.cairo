%builtins output

func main(output_ptr: felt*) -> (output_ptr: felt*) {

    div2(2);

    ret;
}

func div2(output_ptr: felt*, x) {
    %{ memory[ap] = ids.x % 2 %}
    jmp odd if [ap] != 0, ap++;

    even:
    // Case x % 2 == 0.
    [ap] = x / 2, ap++;
    ret;

    odd:
    // Case x % 2 == 1.
    [ap] = x - 1, ap++;
    [ap] = [ap - 1] / 2, ap++;
    ret;
}

// $ cairo-compile div.cairo --output div_compiled.json
// $ cairo-run --program=div_compiled.json --print_output --layout=small  