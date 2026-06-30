# call stack

## how to see: nvim dap view -> Theads

## example

```
1: tid=3709771 
	main.main src/main.zig:10
	start.callMain /usr/local/zig/lib/std/start.zig:751
	start.callMainWithArgs /usr/local/zig/lib/std/start.zig:692
	start.main /usr/local/zig/lib/std/start.zig:717
```

- main.main src/main.zig:10
    - os knows only c, no zig
    - handle c abi
- start.callMain /usr/local/zig/lib/std/start.zig:751
- start.callMainWithArgs /usr/local/zig/lib/std/start.zig:692
- start.main /usr/local/zig/lib/std/start.zig:717
