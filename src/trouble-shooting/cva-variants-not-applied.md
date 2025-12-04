## cva에 variants가 적용이 안 됨. 디폴트는 되는데

- 발생일: 2025-12-04
- 문제: cva에 baseStyle 적용은 되는데 variants만 안 됨
- 오류

```
(메시지 없음)
```

- 원인 파악: variants 가 optional boolean 이었는데 초깃값 설정을 안 해 undefined를 받아서 그런 것
- 해결: 초깃값으로 false를 줌
- 소요 시간: 20분
