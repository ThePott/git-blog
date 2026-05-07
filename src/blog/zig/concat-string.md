# concat strings

```zig
const text_many = [_][]const u8{ "count: ", count_in_string };
const text = try std.mem.concat(gpa, u8, &text_many);
```
