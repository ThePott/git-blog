# how to use

```ts
const regex = /.../
const match = "some string".match(regex)
```

# match

## `String.match(regex)` Return Array

| Index | Content                            |
| ----- | ---------------------------------- |
| [0]   | Full matched string (entire match) |
| [1]   | First capture group (...)          |
| [2]   | Second capture group (...)         |
| [n]   | Nth capture group                  |

## Example

```ts
const regex = /^(.+)~(\d+)$/
"chapter_one~123".match(regex)
// [0]: "chapter_one~123" ← full match
// [1]: "chapter_one" ← first (...)
// [2]: "123" ← second (...)
```

## Note

- If there's no match, match() returns null (not an empty array).
