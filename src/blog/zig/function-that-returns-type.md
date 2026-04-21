# comptime type factory

```zig
// NOTE: return type
fn IntArray(comptime length: usize) type {
    return [length]i64; // NOTE: like [1024]u32
}
```
