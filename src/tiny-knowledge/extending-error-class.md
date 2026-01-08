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

## 확장 관례

### Why code instead of just name?

#### name (from Error class)

- Meant for JavaScript error type: Error, TypeError, RangeError, etc.
- If you use it for 'NOT_FOUND', it breaks the convention
- Useful for stack traces and debugging, not for API responses
  code (custom field)
- Application-specific error identifier
- Stable, machine-readable string for clients
- Can be used by frontend to show localized messages or handle specific errors

#### What gets sent to the client?

Common pattern:

```ts
// What you store internally
{
name: 'AppError', // JS error type (internal)
code: 'NOT_FOUND', // application error code (sent to client)
message: 'Book not found', // human readable (sent to client)
statusCode: 404, // HTTP status (used in res.status())
stack: '...' // stack trace (NEVER send to client)
}
// What client receives
{
code: 'NOT_FOUND',
message: 'Book not found'
}
// + HTTP status 404
```

#### Why is code useful for clients?

1. Frontend error handling
   // Frontend code
   if (error.code === 'UNAUTHORIZED') {
   redirectToLogin()
   } else if (error.code === 'SUBSCRIPTION_EXPIRED') {
   showUpgradeModal()
   }
2. Localization
   // Frontend can map code to localized message
   const messages = {
   'NOT_FOUND': '찾을 수 없습니다',
   'UNAUTHORIZED': '로그인이 필요합니다',
   }
   showError(messages[error.code])
3. Stable contract

- message might change: "Book not found" → "The requested book was not found"
- code stays the same: "NOT_FOUND"
- Frontend logic won't break

### Security: What NOT to send

| Field            | Send to client? | Reason                                    |
| ---------------- | --------------- | ----------------------------------------- |
| code             | Yes             | Safe, generic identifier                  |
| message          | Yes (careful)   | Keep it user-friendly, not technical      |
| statusCode       | Yes (in HTTP)   | Standard HTTP practice                    |
| stack            | NEVER           | Exposes internal file paths, line numbers |
| Internal details | NEVER           | DB errors, query info, etc.               |

```
// Bad (verbose, unsafe)
{
code: DB_ERROR,
message: SELECT \* FROM users WHERE id = 5 failed: connection refused at 192.168.1.50:5432,
stack: Error at /app/src/db/userDb.ts:45:12...
}
// Good (safe)
{
code: INTERNAL_ERROR,
message: Something went wrong
}
```

### Summary

| Field      | Purpose                                        |
| ---------- | ---------------------------------------------- |
| statusCode | HTTP response status (res.status(404))         |
| code       | Machine-readable identifier for frontend logic |
| message    | Human-readable text for users                  |
| name       | JS error type, keep for internal debugging     |
| stack      | Internal only, never expose                    |
