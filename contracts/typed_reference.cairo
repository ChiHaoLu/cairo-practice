struct MyStruct {
    x: felt,
    y: felt,
    z: felt,
}

func main(){
    let ptr: MyStruct* = cast([fp], MyStruct*);
    assert ptr.y = 10;
    // This will compile to [ptr + MyStruct.y],
    // which will subsequently compile to [[fp] + 1].


    // or else:
    // You may omit the type and write (the Cairo compiler will deduce the type from the right-hand side):
    // let ptr = cast([fp], MyStruct*);

}