# slice는 원본을 향한 포인터이다

```zig
pub fn main() !void {
    var ar = [_]i32{ 1, 2, 3, 4 };
    const sl = ar[0..ar.len];
    sl.*[0] = 9;
    std.debug.print("{any}\n", .{sl});
}

// prints: { 9, 2, 3, 4 }
```

- `slice`를 하고 원소를 바꾸면 원본의 원소도 바뀐다
