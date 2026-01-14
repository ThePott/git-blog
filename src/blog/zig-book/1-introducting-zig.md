## 1.8 How strings work in Zig?

- https://pedropark99.github.io/zig-book/Chapters/01-zig-weird.html#sec-zig-strings

### buffer? writer?

```zig
const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const string_object = "This is an example of string literal in Zig";
    try stdout.print("{d}\n", .{string_object.len});
    try stdout.flush();
}
```

- `var stdout_buffer: [1024]u8 = undefined;`
    - `u8`: 8bit = 1byte
    - `[1024]u8`
        - array of 1024 byte
        - 1KiB buffer, no initial value has been set (will be overridden later)
- `stdout_writer`: override things by this

### memory of string

```c
#include <stdio.h>
int main() {
    char* array = "An example of string in C";
    int index = 0;
    while (1) {
        if (array[index] == '\0') {
            break;
        }
        index++;
    }
    printf("Number of elements in the array: %d\n", index);
}
```

- length of string: 25
- memory usage: 26 byte = 25 characters + null terminator(`\0`) at the end
- if there is no null terminator at the end, it is not string, but just array
- just array of ASCII character, not string

```zig
const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const bytes = [_]u8{0x48, 0x65, 0x6C, 0x6C, 0x6F};
    try stdout.print("{s}\n", .{bytes});
    try stdout.flush();
}
```

- this shows size of string = 1 + length of string

```zig
pub fn main() !void {
    const string_object = "This is an example of string literal in Zig";
    try stdout.print("{d}\n", .{string_object.len});
    try stdout.print("{any}\n", .{@TypeOf(string_object)});
    try stdout.print("{d}\n", .{@sizeOf(@TypeOf(string_object.*))});
    try stdout.flush();
}
```

```zsh
❯ zig build run
43
*const [43:0]u8
44
```

<!-- ### 1.8.1.2 Slice -->

### `[]u8` vs `[]const u8`

- `[]u8`: mutable string
- `[]const u8`: unmutable string
- why not `[_]u8`?

#### 정리중인 것

- 모든 string은 pointer 객체다 -> value type이 아닌 reference type
- pointer는 reference address를 멋지게 말한 것
- slice는 fat pointer 라는데 이게 무슨 말인지 모르겠다
