## Pick, Omit이 안 되는 상황

- 발생일: 2025-11-28
- 문제: Color 타입에 Pick을 하는데 오류 발생
- 오류

```
Diagnostics:
1. typescript: Type '"green"' does not satisfy the constraint 'number | unique symbol | "toString" | "charAt" | "charCodeAt" | "concat" | "indexOf" | "lastIndexOf" | "localeCompare" | "match" | "replace" | "search" | "slice" | "split" | "substring" | ... 35 more ... | "at"'. [2344]
```

- 원인 파악: Pick은 객체 형태의 타입에서 사용하는 유틸리티 타입인데, Color는 string union type임
- 해결:
    - Pick -> Extract
    - Omit -> Exclude
- 소요 시간: 15분
- 참고
    - https://www.typescriptlang.org/docs/handbook/utility-types.html
