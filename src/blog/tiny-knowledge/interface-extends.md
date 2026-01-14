# Why do I need {} when extends interface?

## Conclusion

- because you are extending the type by combining `IRouter` and `{}`

## Problem: Why not just `extends SomeInterface`?

- what is `{}` behind `IRouter`?

```ts
// /node_modules/@types/express/index.d.ts
export interface Router extends IRouter {}
```

## Thinking in `type` version

```ts
// interface version
interface Router extends IRouter {}

// type version
type Router = IRouter & {}
```

## Multiple interface extension

```ts
interface ExtendedInterface extends A, B, C {} // NOTE: `extends A, B, C` is not correct
type ExtendedType = A & B & C // No {} is needed
```
