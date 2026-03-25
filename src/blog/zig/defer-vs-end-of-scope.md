# `defer` vs end of scope

## `defer` works even for early return

```zig
pub fn main() !void {
    defer std.debug.print("this always get printed", .{});

    const x: u8 = 4;

    if (x < 10) {
        return;
    }

    std.debug.print("this only get printed if not early returned", .{});
}
```
