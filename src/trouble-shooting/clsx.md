## clsx는 조건부 스타일링이 되는 거 아니야?

- 발생일: 2025-11-27
- 문제: `clsx(3 > 1 ? "bg-gray-300" : "bg-gray-900")`이 안 됨
- 오류

```
Diagnostics:
1. eslint_d: Unexpected constant condition. [no-constant-condition]
```

- 원인 파악: 참 거짓 중 하나만 가능한 조건문은 쓸 수 없기 때문이었음
- 해결: 임시로 boolean prop을 받아 테스트함
- 소요 시간: 3분
