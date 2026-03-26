# Anonymous Struct

## can be key value pair, or just value

```zig
// only key value pairs
const someStruct = .{ .id = 1, .name = "Pedro", .email = "pedro@email.com" };

// only values
try stdout.print("{s}\n", .{"Pedro"});

// mixup
const mixed = .{
    .name = "Pedro",  // named field
    42,               // positional field (index 0)
    .active = true,   // named field
    "hello",          // positional field (index 1)
};
// Accessing Mixed Structs
_ = mixed.name;     // "Pedro"
_ = mixed.active;   // true
_ = mixed.@"0";     // 42
_ = mixed.@"1";     // "hello"
```
