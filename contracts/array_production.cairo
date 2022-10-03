%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func array_production(arr: felt*, size) -> felt {
    if (size == 0) {
        return 1;
    }
    if (size + 1 == 0) {
        return 1;
    }

    let sum_of_rest = array_production(arr=arr + 2, size=size - 2);
    return arr[0] * sum_of_rest;
}

func main{output_ptr: felt*}() {
    const ARRAY_SIZE = 5;

    // Allocate an array.
    let (ptr) = alloc();

    // Populate some values in the array.
    assert [ptr] = 9;
    assert [ptr + 1] = 16;
    assert [ptr + 2] = 25;
    assert [ptr + 3] = 36;
    assert [ptr + 4] = 49;

    // Call array_production to compute the prod. of the elements.
    let prod = array_production(arr=ptr, size=ARRAY_SIZE);

    // Write the prod to the program output.
    serialize_word(prod);

    return ();
}