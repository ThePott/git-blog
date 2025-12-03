## PrismaClient는 도대체 어떻게 쓰는 거냐

- 발생일: 2025-12-03
- 문제: PrismaClient를 이렇게 설정해도 저렇게 설정해도 오류가 났음
- 오류

```ts
import { PrismaClient } from "@/generated/prisma/client.js"
const prismaClient = new PrismaClient()
```

```
Diagnostics:
1. ts: Expected 1 arguments, but got 0. [2554]
```

- 원인 파악: 공식 문서 예제에서는 sqlLite의 adapter를 사용하고 있었음. 하지만 난 PostgreSQL인데?
- 해결:
    - PrismaPg가 존재한다는 걸 ai에게 물어 알아냄
    - https://www.prisma.io/docs/orm/overview/databases/postgresql#2-instantiate-prisma-client-using-the-driver-adapter
- 소요 시간: 10분
