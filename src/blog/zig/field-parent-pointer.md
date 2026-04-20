# @fieldParentPtr

- https://ziglang.org/documentation/master/#fieldParentPtr

## example code

```zig
test "singly linked list" {
    const NodeU32 = struct { data: u32, node: std.SinglyLinkedList.Node = .{} };

    var singly_linked_list: std.SinglyLinkedList = .{};
    var one: NodeU32 = .{ .data = 1 };
    singly_linked_list.prepend(&one.node);

    var iterating = singly_linked_list.first;
    while (iterating) |node| : (iterating = node.next) {
        const parent: *NodeU32 = @fieldParentPtr("node", node);
        std.debug.print("{any}\n", .{parent.data});
    }
}

```

## how it works

- if struct is specified, you can get offset from parent to child

```zig
const NodeU32 = struct {
    data: u32, // offset 0, size 4 (size is in byte)
    node: std.SinglyLinkedList.Node, // offset 4, size whatever
};
```

- subtract memory offset from parent to child from child

```zig
while (iterating) |node| : (iterating = node.next) {
    const parent: *NodeU32 = @fieldParentPtr("node", node);
    // "node" field is 4 size away from parent in NodeU32
    // access to the memory and check if it is NodeU32 indeed
    // if so, return its pointer
    std.debug.print("{any}\n", .{parent.data});
}
```
