# Polymorphic this type

- `this` is type of current instance, result of extension

```ts
interface IRouter {
    get: IRouterMatcher<this, "get"> // this = IRouter here
}
interface MyCustomRouter extends IRouter {
    customMethod(): void
    // get: IRouterMatcher<this, "get">  — but now this = MyCustomRouter
}
```
