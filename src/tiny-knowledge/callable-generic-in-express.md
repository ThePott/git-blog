# Callable Interface in Express

## Problem: I don't want to type-assert

```ts
githubRouter.get("/*pathSplat", async (req, res) => {
    const { pathSplat } = req.params as { pathSplat: string[] }
    res.status(200).json(response.data)
})
```

## Solution: use call-level generic

### factory, call level generics of `IRouterMatcher`

```ts
// NOTE: factory-level generic `<T, Method>` is set when defining
export interface IRouterMatcher<T, Method> {
    // NOTE: call-level generic `<Route>` is set when call
    <Route, ... >( path: Route, ...): T
    // ...
}
```

```ts
// /node_modules/@types/express/index.d.ts
export interface IRouter extends RequestHandler {
    // ...
    // NOTE: factory-level generic `<T, Method>` is set when defining
    get: IRouterMatcher<this, "get">
    // ...
}
```

```ts
// NOTE: call-level generic `<Route>` is set when call
myRouter.get<{splat: string[]}>(...)
```

### use-case

```ts
githubRouter.get<{ pathSplat: string[] }>("/content/*pathSplat", async (req, res) => {
    const { pathSplat } = req.params
    res.status(200).json({ pathSplat })
})
```

# Reference

[for the `extends` syntax](./interface-extends.md)
[for `this` type](./polymorphic-this-type.md)
[for factory, call level generics](./two-level-generics.md)
