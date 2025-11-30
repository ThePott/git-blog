## `readonly T[]` vs `Readonly<T>[]`

### `readonly T[]`

- unmutable T[]
    - cannot push, pop
- T is mutable
    - Can: `arr[0] = "new"` (if T is mutable)
    - `readonly User[]`: Can't modify array, can modify user.name

### `Readonly<T>[]`

- muttable array
    - Can: arr.push(), arr.pop()
- unmuttable T
    - Can't: `arr[0] = "new"` (elements are readonly)
    - `Readonly<User>[]` // Can modify array, can't modify user.name
