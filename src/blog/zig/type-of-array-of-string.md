# type of array of string

```zig
const word = "apple"; // type: *const [5:0]u8
const word_array = [_][]u8{"apple", "banana"}; // type: [2][]const u8
const word_slice: []const []const u8 = &.{"apple", "banana"}; // type: []const []const u8
```
