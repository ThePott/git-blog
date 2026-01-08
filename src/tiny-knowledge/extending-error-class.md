# 에러 클래스 확장하기

## 문제가 된 기존 접근법

```ts
export class AppError extends Error {
    constructor(code: string, message: string) {
        super(code, message)
    }
}
```

```
Diagnostics:
1. ts: Type 'string' has no properties in common with type 'ErrorOptions'. [2559]
```

## `super`는 기존 `constructor`에 대응된다

- `Error`의 `constructor`는 `message` 하나만 옵셔널로 받는다
- 최신 버전에서는 `ErrorOptions`도 받음

## 관련 소스코드

```ts
// lib.es5.d.ts
interface Error {
    name: string
    message: string
    stack?: string
}

interface ErrorConstructor {
    new (message?: string): Error
    (message?: string): Error
    readonly prototype: Error
}
```

```ts
//lib.es2022.error.d.ts
interface ErrorOptions {
    cause?: unknown
}

interface Error {
    cause?: unknown
}

interface ErrorConstructor {
    new (message?: string, options?: ErrorOptions): Error
    (message?: string, options?: ErrorOptions): Error
}
```

## 팁: 파라미터 확인하기 좋은 법

- 별로: 정의 확인하기
- 추천: 실제로 호출식 작성하기
