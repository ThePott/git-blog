# React Callback Ref

- https://react.dev/reference/react-dom/components/common#ref-callback
- `ref` 속성은 `React.RefObject` 뿐만 아니라 `(node) => void` 도 받는다. 이를 이용하면 `myRef.current`에 값이 부여되는
  순간 특정 함수를 호출하는 것이 가능해진다.
- 뿐만 아니라 클린업도 가능해진다

## 배경

- FloatingUI를 Dropdown 컴포넌트에 적용하려고 하는데 이를 위해선 `setReference, setFloating`을 `ref`에 넣어야 함
- triggerRef, ContentRef를 사용해야 하는데 이를 `reference`, `floating`로 대체하자니 이것들의 타입은 너무 복잡함
- `useMergeRefs`의 리턴 타입도 `React.RefObject`가 아니어서 기존 코드와 호환이 안 됨
- 컴포넌트 스토어에 저장되는 ref의 타입을 외부 라이브러리에 한정되는 타입으로 설정하고 싶지 않았음
- `useEffect(()=> setReference(contentRef.current), [])`를 하자니 `current`에 노드가 들어가지 않은 상태에서 함수가
  호출됨

## `ref: React.Ref<T>`

```ts
type Ref<T> = RefCallback<T> | RefObject<T | null> | null
```

```ts
type RefCallback<T> = {
    bivarianceHack(
        instance: T | null,
    ):
        | void
        | (() => VoidOrUndefinedOnly)
        | DO_NOT_USE_OR_YOU_WILL_BE_FIRED_CALLBACK_REF_RETURN_VALUES[keyof DO_NOT_USE_OR_YOU_WILL_BE_FIRED_CALLBACK_REF_RETURN_VALUES]
}["bivarianceHack"]
```

## 예시

```tsx
<div ref={(node: HTMLElement | null) => {
  console.log('Attached', node);

  return () => {
    console.log('Clean up', node)
  }
}}>
```
