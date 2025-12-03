## Prisma 모델 이름을 어떻게 해야 하나

- 발생일: 2025-12-03
- 문제: prismaClient에서 모델 이름이 내가 설정한 대로 찾아지지가 않음
- 오류

```ts
prismaClient.User.create(user)
```

```
Diagnostics:
1. ts: Property 'User' does not exist on type 'PrismaClient<never, GlobalOmitConfig | undefined, DefaultArgs>'. Did you mean
'user'? [2551]
```

- 원인 파악: prismaClient에서 모델 이름이 강제로 camelCase로 변경됨
    - 이 때문에 매핑 전 테이블 이름(`users`)도 매핑 후 이름(`User`)도 그대로 사용할 수가 없음
- 해결:
    - 모든 매핑 삭제
    - 모든 이름은 snake_case로 변경
    - users -> app_user
- 소요 시간:
    - 30분
