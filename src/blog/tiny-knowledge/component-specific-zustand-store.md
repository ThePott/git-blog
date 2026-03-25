# component-specific zustand store

## 구조

- warppedComponent
- component
- provider

## provider

- context for store
- params: initialValues, children
- createStore
- useStore inside of useState
- context provider wraps children

## 도대체 어떻게 써야 하냐 << 잘 반영이 된 거: select?

1. componentStore.ts: createLocalStore 사용
2. provider로 다 감쌈
3. provider는 모든 props를 warppedComponent로 넘김
