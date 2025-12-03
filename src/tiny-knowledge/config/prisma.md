## prisma client

- db에 맞는 adapter를 생성한 후, PrismaClient에 주입해 새 객체를 생성해야 한다
- 공식문서 참고
- https://www.prisma.io/docs/orm/overview/databases/postgresql#2-instantiate-prisma-client-using-the-driver-adapter

## 작업 흐름

- 빈 db 연결 -> edit schema.prisma -> migrate -> generate
- never pull, never push
- never edit sql with sql editor

## model naming: ALWAYS snake_case, never map to another

```ts
prismaClient.User.create(user)
```

- 여기에서 User라고 하면 인식 못 함. user라고만 인식됨. 이는 원래 table 이름 `users`와도 다름
- 그냥 PascalCase -> camelCase
- 내가 원래 설정한 거랑 다르다면 쓸 필요가 없음

## model 만들 때 주의사항

- `@id @default(autoincrement())` for `PRIMARY KEY SERIES`

## never rename migration folder name
