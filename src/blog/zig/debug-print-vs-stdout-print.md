# `std.debug.print` vs `stdout.print`

## `std.debug.print`

```zig
std.debug.print("Hello {s}\n", .{"world"});
```

- Unbuffered — writes immediately, no flush needed
- Writes to stderr — standard error stream, not stdout
- For debugging only — meant for temporary debug output
- Simple to use — just call it, output appears instantly
- Cannot fail — returns void, not !void stdout.print (buffered writer)
- For developer

## `stdout.print`

```zig
try stdout.print("Hello {s}\n", .{"world"});
try stdout.flush();
```

- Buffered — collects output in memory, requires flush
- Writes to stdout — standard output stream
- For production output — proper program output (e.g., CLI tool results)
- More setup required — need to create buffer and writer
- Can fail — returns !void, needs try
- For end-user
