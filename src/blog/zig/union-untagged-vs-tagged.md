# untagged union vs tagged union

- union이란, 기본적으로 key-value pairs를 만든 다음 초기화한 한 쌍만 살아남기는 것

```zig
const UntaggedSize = union { sm: u8, md: u16, lg: u32 };
const TaggedSize = union(enum) { sm: u8, md: u16, lg: u32 };

test "handle size" {
    const untagged_size: UntaggedSize = .{ .sm = 10 }; // NOTE: 초기화
    std.debug.print("untagged size: {any}\n", .{untagged_size.sm}); // NOTE: 접근 가능
    std.debug.print("untagged size: {any}\n", .{untagged_size.md}); // ERROR
    std.debug.print("untagged size: {any}\n", .{untagged_size.lg}); // ERROR
    const tagged_size: TaggedSize = .{ .sm = 20 };
    std.debug.print("tagged size: {any}\n", .{tagged_size.sm}); // NOTE: 접근 가능
    std.debug.print("tagged size: {any}\n", .{tagged_size.md}); // ERROR
    std.debug.print("tagged size: {any}\n", .{tagged_size.lg}); // ERROR

    // NOTE: tagged union은 switch로 순회 가능
    switch (tagged_size) {
        .sm => |value| std.debug.print("in switch sm: {any}\n", .{value}),
        .md => |value| std.debug.print("in switch md: {any}\n", .{value}),
        .lg => |value| std.debug.print("in switch lg: {any}\n", .{value}),
    }
}

```
