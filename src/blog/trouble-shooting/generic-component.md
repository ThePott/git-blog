## 제네릭 컴포넌트에서 <T>를 쓰자 걷잡을 수 없이 에러가 발생

- 발생일: 2025-12-04
- 문제: 제네릭 컴포넌트를 만들기 위해 interface에서 <T>를 사용하고 컴포넌트에도 props 전에 <T>를 줬는데 온갖 에러가 발생
- 오류

```
Diagnostics:
1. ts: JSX element 'T' has no corresponding closing tag. [17008]
2. ts: Cannot find name 'T'. [2304]
```

- 원인 파악: 정확한 원인은 파악 못 함. 다만 extends 를 쓰면 해결됨
- 해결: `<T extends string | number>`
- 소요 시간: 20분
