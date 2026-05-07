# number to string

```zig
var print_buffer: [4]u8 = undefined;
const count_in_string = try std.fmt.bufPrint(&print_buffer, "{any}", .{count});
```
