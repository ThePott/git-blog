# pointer arithmetic(산수)

## in c: `u8*`

## in zig: `[*]u8` vs `*u8`

- `[*]u8` in zig == `u8*` in c
    - can arithmetic
- `*u8` cannot arithmetic
    - because it is pointing exactly that one thing
