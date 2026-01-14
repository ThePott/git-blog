## axios에서 body를 못 받는 문제

- 발생일: 2025-12-02
- 문제: axios에서 body가 undefined로만 나옴
- 오류

```
(메시지 없음)
```

- 원인 파악: express.json(), express.text() 미들웨어를 express app이 사용하게 해야 했음
- 해결:

```ts
app.use(express.json())
app.use(express.text())
```

- 소요 시간: 15분
