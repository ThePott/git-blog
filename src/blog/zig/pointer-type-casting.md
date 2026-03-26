# Pointer Type Casting

## Align before casting

- let's say there are some bytes
- you want to type cast of the pointer to single integer type
- before that, you need to align it

```zig
const std = @import("std");
const expect = std.testing.expect;

test {
    const bytes align(@alignOf(u32)) = [_]u8{ 0x12, 0x12, 0x12, 0x12 }; // 2. before that, I need to align it as u32
    const u32_ptr: *const u32 = @ptrCast(&bytes); // 1. I want to cast it to u32 (u8 * 4)
    try expect(@TypeOf(u32_ptr) == *const u32);
}
```
