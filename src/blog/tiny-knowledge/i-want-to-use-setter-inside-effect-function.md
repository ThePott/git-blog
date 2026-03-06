# effect function 안에서 세터 함수 쓰고 싶은 경우와 대응 방법

## 배경: 이펙트 함수 안에선 세터 함수를 호출하는 게 안티 패턴이다

```tsx
const LandingPage = () => {
    const [isBigState, setIsBigState] = useState<boolean>(window.matchMedia("(min-width: 700px)").matches)
    const isBig: boolean = window.matchMedia("(min-width: 700px)").matches
    useLayoutEffect(() => {
        debugger
        setIsBigState(isBig)
    }, [isBig])
    return (
        <CenterContainer>
            <ExpandableDiv isDramatic={true}>
                {isBigState && <LandingContentBig />}
                {!isBigState && <LandingContentSmall />}
            </ExpandableDiv>
        </CenterContainer>
    )
}
```

```
Diagnostics:
1. eslint_d: Error: Calling setState synchronously within an effect can trigger cascading renders

   Effects are intended to synchronize state between React and external systems such as manually updating the DOM, state management libraries, or other platform APIs. In general, the body of an effect should do one or both of the following:
   * Update external systems with the latest state from React.
   * Subscribe for updates from some external system, calling setState in a callback function when external state changes.

   Calling setState synchronously within an effect body causes cascading renders that can hurt performance, and is not recommended. (https://react.dev/learn/you-might-not-need-an-effect).
```

## document api의 값에 따라 리렌더 하고 싶을 때

### `window.matchMedia`에 따라 조건부 렌더링하고 싶을 때

#### 코드

```tsx
const LandingPage = () => {
    const [isBigState, setIsBigState] = useState<boolean>(window.matchMedia("(min-width: 700px)").matches)
    const isBig: boolean = window.matchMedia("(min-width: 700px)").matches
    useLayoutEffect(() => {
        debugger
        setIsBigState(isBig)
    }, [isBig])
    return (
        <CenterContainer>
            <ExpandableDiv isDramatic={true}>
                {isBigState && <LandingContentBig />}
                {!isBigState && <LandingContentSmall />}
            </ExpandableDiv>
        </CenterContainer>
    )
}
```

#### 해결법

- onChange eventHandler를 부착한다
- 세터 함수는 eventHandler 안에서 호출한다
- onChange마다 자동으로 세터 함수가 호출된다
- eventListener cleanup을 주의한다

```tsx
const useMediaQuery = () => {
    const query = "(min-width: 700px)"
    const [isBig, setIsBig] = useState(() => window.matchMedia(query).matches)

    useEffect(() => {
        const mediaQuery = window.matchMedia(query)
        const handler = (event: MediaQueryListEvent) => {
            setIsBig(event.matches)
        }

        mediaQuery.addEventListener("change", handler)
        return () => mediaQuery.removeEventListener("change", handler)
    }, [query])

    return { isBig }
}

const LandingPage = () => {
    const { isBig } = useMediaQuery()

    if (isBig) return <LandingContentBig />
    return <LandingContentSmall />
}
```
