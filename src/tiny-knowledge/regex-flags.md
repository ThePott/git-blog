# Things outside of `/.../` in regex

- These are called regex flags (or modifiers).

## Regex Flags

| Flag | Name             | Meaning                                               |
| ---- | ---------------- | ----------------------------------------------------- |
| g    | Global           | Match all occurrences, not just the first             |
| i    | Case-insensitive | a matches both a and A                                |
| m    | Multiline        | ^ and $ match start/end of each line, not just string |
| s    | Dotall           | . matches newlines too (normally it doesn't)          |
| u    | Unicode          | Enables full Unicode support                          |
| y    | Sticky           | Match only from lastIndex position                    |

## Examples

```ts
  // Global - all matches
  "abab".replace(/a/g, "X") // "XbXb"
  "abab".replace(/a/, "X") // "Xbab" (only first)
  // Case-insensitive
  /hello/i.test("HELLO") // true
  /hello/.test("HELLO") // false
  // Combined flags
  /hello/gi // global + case-insensitive
  // Multiline
  "line1\nline2".match(/^line/gm) // ["line", "line"]
  "line1\nline2".match(/^line/g) // ["line"] (only first line)
  // Unicode (for emojis, special chars)
  /\p{Emoji}/u.test("😀") // true
```

## Most Common Combinations

| Pattern     | Use Case                      |
| ----------- | ----------------------------- |
| /pattern/g  | Replace all                   |
| /pattern/i  | Case-insensitive search       |
| /pattern/gi | Replace all, case-insensitive |
| /pattern/gm | Match across multiple lines   |
