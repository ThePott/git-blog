# print with `{}`

## meanings of specifiers

| Specifier | Output         | Example |
| --------- | -------------- | ------- |
| {d}       | Decimal number | 80      |
| {c}       | Character      | P       |
| {s}       | String         | Pedro   |
| {x}       | Hexadecimal    | 50      |

```zig
pub fn main() !void { const name = "Pedro";
    for (name, 0..) |char, index| {
        std.debug.print("{c}", .{char});
        std.debug.print(" \_\_{d} | ", .{index});
    }
}
```
