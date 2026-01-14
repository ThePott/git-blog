# jwt로 요청자가 누구인지 파악하기

## 로그인하면 user_id를 인코드

## access expired, refresh expired, unauthorized -> all 401, different code

## access, refresh both encode same thing, which is user_id object

## when logout, ignore token invalidation, just delete from client side

## token storage

- access token in memory only (zustand store)
- refresh token in httponly cookie only

### express cookie

```ts
res.cookie(name, value [, options])
```
