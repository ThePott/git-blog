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

## setting up for print

```zig
fn print_name(self: User, stdout: *std.Io.Writer) !void {
    try stdout.print("{s}\n", .{self.name});
    try stdout.flush();
}

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer); // put buffer's pointer
    const stdout = &stdout_writer.interface; // put writer's pointer
    const user = User.init(1, "Pedro", "pedro@email.com");
    try user.print_name(stdout);
}

```
