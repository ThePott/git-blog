# createLocalStore에서 default와 passed를 섞어서 사용해야 할 때의 팁

## 기존 상황

### 코드

```ts
const createLocalStore = <TPassedProps, TDefaultProps>(
    defaultInitializer: StateCreator<TDefaultProps, [], [], TDefaultProps>,
) => {
    // ...
    const LocalStoreProvider = ({ passedProps, children }: { passedProps: TPassedProps; children: ReactNode }) => {
        const createLocalStore = createStore<TPassedProps & TDefaultProps>((...params) => ({
            ...defaultInitializer(...params),
            ...passedProps,
        }))
        // ...
    }
}
```

### 문제

```ts
const { LocalStoreProvider, useLocalStore } = createLocalStore<
    LocalAutoCompletePassedProps,
    LocalAutoCompleteDefaultProps
>((set, get) => {
    return {
        // ...
        setInputValue: (inputValue) => {
            set({ inputValue }) // NOTE: setInputValue, inputValue는 `defaultProps`
            get().onChange(inputValue) // NOTE: onChange는 `passdedProps`
        },
        // ...
    }
})
```

- defaultInitializer가 defaultProps만 받기 때문에 그 밖의 `onChange`는 인식을 못 함
- 그렇다고 Provider 만들기 전에 passedProps를 미리 받을 순 없음.
    1. 컴포넌트 바깥에서 createLocalStore 함수 호출, Provider 생성
    2. Provider로 감쌀 때 ref 등 만든 다음 passedProps를 Provider.value에 주입해야 함

### 해결책: store type과 return type을 달리 한다

## StateCreator generic breakdown

```ts
StateCreator<TPassedProps & TDefaultProps, [], [], TDefaultProps>
//          ^                              ^   ^   ^
//          |                              |   |   |
//          T: full store type             |   |   U: returns only TDefaultProps
//                                         |   Mos: adds no middleware
//                                         Mis: no existing middleware
```
