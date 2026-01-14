# `type` vs `interface` in TypeScript

## what `type` can but `interface` can't

- type union
- utility types

## what `interface` can but `type` can't

- `type` is immutable by design, `interface` is mutable by design

### interface merging

```ts
interface User {
    name: string
}
interface User {
    age: number
}
interface User {
    email: string
}

// TypeScript merges these into:
// interface User {
//   name: string
//   age: number
//   email: string
// }
```

## conclusion

- use `type` as default
- use `interface` only when declaration merging is needed
