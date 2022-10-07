%builtins output

func main(output_ptr: felt*) -> (output_ptr: felt*) {
    [ap] = output_ptr, ap++;
    %{
        print('ap =', ap)
        print('[ap - 1] =', memory[ap - 1])
        print()
    %}
    assert [output_ptr] = 12;
    return (output_ptr=output_ptr + 1);
}


// $ cairo-compile segment.cairo --output segment_compiled.json
// $ cairo-run --program=segment_compiled.json --print_output --layout=small --print_memory --print_info --print_segments