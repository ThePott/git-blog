# `data-*` 속성

## 값이 있어도 되고, 없어도 되지만 값은 스트링으로만 가능

```tsx
<>
    <div data-dropdown />
    <div data-index="3" />
</>
```

## 접근할 땐 `[]`로 감싼다

```ts
const handleClick = async (event: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    // NOTE: typeof event.target => EventTarget
    // NOTE: closest is method of HTMLElement
    // NOTE: to use data-* attribute, wrapping with square braket is mandatory
    const target = event.target as HTMLElement
    if (target.closest("[data-dropdown]")) {
        return
    }

    console.log("---- good")
}
```
