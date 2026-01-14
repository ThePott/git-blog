## useEffect 안에서 setter 못 쓰는 문제

- 발생일: 2025-12-04
- 문제: 외부 상태와 내부 상태를 동기화하려고 useEffect 안에서 setter를 쓰는데 이걸 lint가 막음

```tsx
const Select = ({ value, label }: SelectProps) => {
    const [selectedValue, setSelectedValue] = useState<T | null>(null)
    const [selectedLabel, setSelectedLabel] = useState<string | null>(defaultLabel ?? null)

    useEffect(() => {
        if (!value || !label || value === selectedValue) {
            return
        }
        // NOTE: 여기서 경고 발생!!!!
        setSelectedValue(value)
        setSelectedLabel(label)
    }, [value, label])
```

- 오류

```
Diagnostics:
1. eslint_d: Error: Calling setState synchronously within an effect can trigger cascading renders

   Effects are intended to synchronize state between React and external systems such as manually updating the DOM, state management libraries, or other platform APIs. In general, the body of an effect should do one or both of the following:
   * Update external systems with the latest state from React.
   * Subscribe for updates from some external system, calling setState in a callback function when external state changes.

   Calling setState synchronously within an effect body causes cascading renders that can hurt performance, and is not recommended. (https://react.dev/learn/you-might-not-need-an-effect).
```

- 원인 파악: setter를 useEffect 안에서 쓰지 말라는 건 린트가 말해주는데... 그래서 어쩌라는 거지?
- 해결: lint에서 링크를 달아주면 그것을 읽어라!
    - 따라가고 싶은 외부 상태를 key로 받아서 그게 바뀔 때마다 리렌더가 되게 하고 그걸 useState의 초깃값으로 넣는다!

- 소요 시간: 2일
