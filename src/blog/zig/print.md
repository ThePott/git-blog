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

// OLD: zig 0.15
pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer); // put buffer's pointer
    const stdout = &stdout_writer.interface; // put writer's pointer
    const user = User.init(1, "Pedro", "pedro@email.com");
    try user.print_name(stdout);
}

// NEW: zig 0.16
pub fn main(init: std.process.Init) !void {
    const io = init.io;
    var writer_buffer: [1024]u8 = undefined;
    var stdout = std.Io.File.Writer.init(.stdout(), io, &writer_buffer);
    const writer = &stdout.interface;

    try writer.print("{any}\n", .{word});
    try writer.print("{s}\n", .{word});
    try writer.flush();
}


```
