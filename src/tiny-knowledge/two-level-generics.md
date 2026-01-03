# Factory-level, Call-level generics

- Level 1: Factory-level generics (fixed when creating the factory)
- Level 2: Call-level generics (specified/inferred when calling)

```ts
// NOTE: set `TDrink` when define function
// NOTE: set `Size` when call function -> then return type will be set
interface DrinkMaker<TDrink> {
    <Size extends string>(size: Size): TDrink & { size: Size }
}

type Coffee = {
    what: "coffee"
}
// NOTE: `TDrink` is `Coffee`, so type of params and return is set
// NOTE: however, `Size` is only set when the function is called
const makeCoffee: DrinkMaker<Coffee> = (size) => ({ what: "coffee", size })
// NOTE: `Size` inferred as "small"
const small = makeCoffee("small")
```
