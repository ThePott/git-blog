# 리팩토링할 때 복잡한 타입을 프롭에 넣기

## 배경

- useMutation의 리턴값을 전달인자로 받고 싶은데, 리턴 타입에 any가 있어서 맞출 수가 없음

## `ReturnType<typeof someFunction>`

- https://www.typescriptlang.org/docs/handbook/utility-types.html#returntypetype
