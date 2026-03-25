# labeling code block

## inline function execution

```zig
var y: i32 = 123;
const x = add_one: {
    y += 1;
    break :add_one y;
};
if (x == 124 and y == 124) {
    try stdout.print("Hey!", .{});
    try stdout.flush();
}
```

## controlling flow in switch

```zig
xsw: switch (@as(u8, 1)) {
    1 => {
        try stdout.print("First branch\n", .{});
        continue :xsw 2;
    },
    2 => continue :xsw 3,
    3 => return,
    4 => {},
    else => {
        try stdout.print(
            "Unmatched case, value: {d}\n", .{@as(u8, 1)}
        );
        try stdout.flush();
    },
}
```
