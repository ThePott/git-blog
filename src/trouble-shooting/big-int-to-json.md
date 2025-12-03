## BigInt 타입은 json으로 바로 변환이 안 된다

- 발생일: 2025-12-03
- 문제: 프리즈마에서 BigInt 객체를 받았는데 오류가 발생
- 오류

```
TypeError: Do not know how to serialize a BigInt
    at JSON.stringify (<anonymous>)
    at stringify
(/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/node_modules/express/lib/response.js:1020:12)
    at ServerResponse.json
(/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/node_modules/express/lib/response.js:243:14)
    at <anonymous> (/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/routers/debugRouter.ts:10:21)
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
```

- 원인 파악:
    - `BigInt`가 있는 채로는 `res.status(200).json(result)`를 할 수가 없음
- 해결:

```ts
const result = await prismaClient.app_user.findMany()
const serializable = result.map((user) => ({
    ...user,
    id: user.id.toString(),
    kakao_id: user.kakao_id?.toString(),
}))
return serializable
```

- 소요 시간: 20분
