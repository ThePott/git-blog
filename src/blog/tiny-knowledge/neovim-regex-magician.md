# neovim regext magician

## `%s`: find and replace in all lines

- `:%s/pattern/new/flag`
- pattern에서는 escaping 해야 하지만, new에서는 그럴 필요 없음
    - 예: `:%s/\[ \]/- [ ]/g`

## `g`: find and replace in matching lines

- `:g/line-pattern/s/target-pattern/new/flag`

## `\r`: line break

- no content
