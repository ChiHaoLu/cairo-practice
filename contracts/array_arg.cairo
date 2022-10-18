%lang starknet

@external
func compare_arrays(
    a_len: felt, a: felt*, b_len: felt, b: felt*
) {
    assert a_len = b_len;
    if (a_len == 0) {
        return ();
    }
    assert a[0] = b[0];
    return compare_arrays(
        a_len=a_len - 1, a=&a[1], b_len=b_len - 1, b=&b[1]
    );
}

struct Point {
    x: felt,
    y: felt,
}

@view
func sum_points(points: (Point, Point)) -> (res: Point) {
    return (
        res=Point(
        x=points[0].x + points[1].x,
        y=points[0].y + points[1].y),
    );
}

@external
func sum_points_arr(a_len: felt, a: Point*) -> (res: Point) {
    if (a_len == 0) {
        return (res=Point(0, 0));
    }
    let (res) = sum_points_arr(a_len=a_len - 1, a=&a[1]);
    return (res=Point(x=res.x + a[0].x, y=res.y + a[0].y));
}